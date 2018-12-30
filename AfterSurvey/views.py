from django.shortcuts import render
from django.http import HttpResponse
from datetime import datetime, timedelta, date
from use_function import namedtuplefetchall, getChooseDate, getRegisteredPersonsAndCourseCodeByCourseID
from django.db import connections
import cookiegetter
import json

# Create your views here.


def after_survey_view(request):
    request.encoding = 'utf-8'
    to_render = {}

    if request.method == 'GET':
        to_render = doGet(request)

    if request.method == 'POST':
        to_render = doGet(request)

    return render(request, 'afterSurvey.html', to_render)


def doGet(request):
    to_render = {}
    islogin = cookiegetter.isLogined(request)

    if islogin:
        userEmail = cookiegetter.getEmail(request)
        userID = cookiegetter.getUserIDByEmail(userEmail)
        if cookiegetter.isTeacher(userID):
            teachersCourse = cookiegetter.get_Teacher_Courses(userID)

            with connections['SurveyDB'].cursor as cursor:
                # 找出所有課程的id(不重複)
                cursor.execute("SELECT DISTINCT course_id FROM survey.after_class_survey order by course_id asc")
                result = namedtuplefetchall(cursor)

                courseNumber = 0
                for rs in result:
                    for i in range(len(teachersCourse)):
                        if rs.course_id == teachersCourse[i]:
                            courseNumber += 1

                # 宣告陣列長度
                data = [['' for i in range(8)] for i in range(courseNumber)]
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
                                   "from after_class_survey "
                                   "where course_id = %s", [allCourseID[i]])
                    result = namedtuplefetchall(cursor)

                    surveyNumber = result[-1].surveyNumber

                    # 找出所有該課程的問卷資料
                    cursor.execute("select course_name,course_id,selection1,selection2 "
                                   "from after_class_survey "
                                   "where course_id = %s", [allCourseID[i]])
                    result = namedtuplefetchall(cursor)
                    data[count][6] = '0'
                    data[count][7] = '0'
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
                        data[count][6] = str(int(data[count][6]) + (int(rs.selection1) - 5) * (-1))
                        data[count][7] = str(int(data[count][7]) + (int(rs.selection2) - 5) * (-1))

                    data[count][6] = '{:.1f}'.format(float(data[count][6]) / surveyNumber)
                    data[count][7] = '{:.1f}'.format(float(data[count][7]) / surveyNumber)
                    count = count + 1
                    i = i+1

                to_render['data'] = data

            to_render['IsLogin'] = 1
            print('teacher')
            return to_render

        else:
            to_render['IsLogin'] = 2
            print('student')
            return to_render

    else:
        to_render['IsLogin'] = 2
        print('not login')
        return to_render

