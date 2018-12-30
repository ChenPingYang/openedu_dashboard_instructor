from django.shortcuts import render
from datetime import datetime, timedelta, date
from use_function import namedtuplefetchall, getChooseDate, getRegisteredPersonsAndCourseCodeByCourseID
from django.db import connections
import cookiegetter
import json

def before_survey_view(request):
    request.encoding = 'utf-8'

    if request.method == 'GET':
        to_render = {}
        islogin = cookiegetter.isLogined(request)

        if islogin is True:
            userEmail = cookiegetter.getEmail(request)
            userID = cookiegetter.getUserIDByEmail(userEmail)
            if cookiegetter.isTeacher(userID):
                teachersCourse = cookiegetter.get_Teacher_Courses(userID)

                with connections['SurveyDB'].cursor() as cursor:
                    # 找出所有課程的id(不重複)
                    cursor.execute("SELECT DISTINCT course_id FROM survey.before_class_survey order by course_id asc")
                    result = namedtuplefetchall(cursor)

                    courseNumber = 0
                    for rs in result:
                        for i in range(len(teachersCourse)):
                            if rs.course_id == teachersCourse[i]:
                                courseNumber += 1

                    # 宣告陣列長度
                    data = [['' for i in range(11)] for i in range(courseNumber)]
                    allCourseID = []

                    for rs in result:
                        for i in range(len(teachersCourse)):
                            if rs.course_id == teachersCourse[i]:
                                allCourseID.append(rs.course_id)

                    count = 0
                    i = 0
                    surveyNumber = 0
                    while i < courseNumber:
                        cursor.execute("select count(*) as surveyNumber "
                                       "from before_class_survey "
                                       "where course_id = %s", [allCourseID[i]])
                        result = namedtuplefetchall(cursor)
                        surveyNumber = result[-1].surveyNumber

                        # 找出所有該課程的問卷資料
                        cursor.execute("select course_name,course_id,selection1,selection2,selection3 "
                                       "from before_class_survey "
                                       "where course_id = %s", [allCourseID[i]])
                        result = namedtuplefetchall(cursor)
                        data[count][6] = '0'
                        data[count][7] = '0'
                        data[count][8] = '0'
                        data[count][9] = '0'
                        data[count][10] = '0'
                        RegisteredPersonsAndCourseCode = []
                        for rs in result:
                            RegisteredPersonsAndCourseCode = getRegisteredPersonsAndCourseCodeByCourseID(rs.course_id)
                            data[count][0] = RegisteredPersonsAndCourseCode[1]
                            data[count][3] = RegisteredPersonsAndCourseCode[0]
                            break

                        for rs in result:
                            data[count][1] = rs.course_name
                            data[count][2] = rs.course_id
                            data[count][4] = str(surveyNumber)
                            data[count][5] = '{:.1f}'.format(surveyNumber / int(data[count][3]) * 100) + '%'
                            if rs.selection1 == 0:
                                data[count][6] = str(int(data[count][6]) + 1)
                            elif rs.selection1 == 1:
                                data[count][7] = str(int(data[count][7]) + 1)
                            elif rs.selection1 == 2:
                                data[count][8] = str(int(data[count][8]) + 1)

                            data[count][9] = str(int(data[count][9]) + (int(rs.selection2) - 5) * (-1))
                            data[count][10] = str(int(data[count][10]) + (int(rs.selection3) - 5) * (-1))

                        data[count][6] = '{:.1f}'.format(float(data[count][6]) / surveyNumber * 100) + '%'
                        data[count][7] = '{:.1f}'.format(float(data[count][7]) / surveyNumber * 100) + '%'
                        data[count][8] = '{:.1f}'.format(float(data[count][8]) / surveyNumber * 100) + '%'
                        data[count][9] = '{:.1f}'.format(float(data[count][9]) / surveyNumber)
                        data[count][10] = '{:.1f}'.format(float(data[count][10]) / surveyNumber)
                        count = count + 1
                        i = i + 1

                    to_render['data'] = data

                to_render['IsLogin'] = 1
                print('teacher')
                return render(request, 'beforeSurvey.html', to_render)

            else:
                to_render['IsLogin'] = 2
                print('student')
                return render(request, 'beforeSurvey.html', to_render)

        else:
            to_render['IsLogin'] = 2
            print('not login')
            return render(request, 'beforeSurvey.html', to_render)