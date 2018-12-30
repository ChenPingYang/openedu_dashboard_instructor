from django.shortcuts import render
from django.http import HttpResponse
from datetime import datetime, timedelta, date
from use_function import namedtuplefetchall
from django.db import connections
import cookiegetter
import json


# Create your views here.
def index_view(request):
    request.encoding = 'utf-8'

    if request.method == 'GET':
        islogin = cookiegetter.isLogined(request)
        to_render = {}
        islogin = True
        if islogin is True:
            # 強制通關
            # userEmail = cookiegetter.getEmail(request)
            # userID = cookiegetter.getUserIDByEmail(userEmail)
            userID = '13'
            #if cookiegetter.isTeacher(userID):
            if True:
                teachersCourse = cookiegetter.get_Teacher_Courses(userID)

                with connections['ResultDB'].cursor() as cursor:
                    cursor.execute("select *  from course_total_data_v2 ")
                    result = namedtuplefetchall(cursor)

                    maxRS = len(result)
                    finalUpdate = result[-1].統計日期

                    cursor.execute("SELECT course_id as id,course_name, 註冊人數 as registeredPeople, start_date, "
                                   "end_date,證書人數 "
                                   "FROM course_total_data_v2 "
                                   "WHERE 統計日期 = %s", [finalUpdate])
                    result = namedtuplefetchall(cursor)
                    totalCourseName = [None for i in range(len(teachersCourse))]

                    jsonArray = []
                    jsonArray2 = []

                    jsonArray.append('課程名稱')
                    jsonArray.append('總人數')
                    jsonArray2.append(jsonArray.copy())

                    count = 0
                    jsonArray_table_temp = []
                    jsonArray_table = []
                    registeredPeople = 0
                    sumRegisteredPeople = 0
                    for rs in result:
                        for j in range(len(teachersCourse)):
                            # print(rs.id, ' ', teachersCourse[j].course_id)
                            if rs.id == teachersCourse[j].course_id:
                                totalCourseName[count] = rs.course_name
                                registeredPeople = rs.registeredPeople
                                sumRegisteredPeople = sumRegisteredPeople + registeredPeople
                                courseStartDate = rs.start_date
                                courseEndDate = rs.end_date
                                passCount = rs.證書人數
                                if passCount is None:
                                    passCount = '0'

                                jsonArray_table_temp.clear()
                                jsonArray_table_temp.append(totalCourseName[count])
                                jsonArray_table_temp.append(registeredPeople)
                                jsonArray_table_temp.append(courseStartDate)
                                jsonArray_table_temp.append(courseEndDate)
                                jsonArray_table_temp.append(passCount)

                                jsonArray_table.append(jsonArray_table_temp.copy())
                                count = count+1

                    now = datetime.today()

                    cursor.execute("SELECT course_id as id "
                                   "FROM course_total_data_v2  "
                                   "WHERE end_date > %s and 統計日期 = %s", [now.strftime("%Y-%m-%d"), finalUpdate])
                    result = namedtuplefetchall(cursor)

                    countStartCourse = 0
                    for rs in result:
                        for i in range(len(teachersCourse)):
                            if rs.id == teachersCourse[i].course_id:
                                countStartCourse += 1

                    cursor.execute("SELECT course_id as id "
                                   "FROM course_total_data_v2  "
                                   "WHERE end_date < %s and 統計日期 = %s", [now.strftime("%Y-%m-%d"), finalUpdate])
                    result = namedtuplefetchall(cursor)

                    endCourse = 0
                    for rs in result:
                        for i in range(len(teachersCourse)):
                            if rs.id == teachersCourse[i].course_id:
                                endCourse += 1

                    print(jsonArray_table)
                    to_render['jsonArray_table'] = json.dumps(jsonArray_table)
                    to_render['jsonArray2'] = json.dumps(jsonArray2)
                    to_render['select'] = 1
                    to_render['teachersCourse_length'] = len(teachersCourse)
                    to_render['finalUpdate'] = '最後資料更新時間 : ' + finalUpdate
                    to_render['totalCourseName'] = totalCourseName
                    to_render['registeredPeople'] = registeredPeople
                    to_render['countStartCourse'] = countStartCourse
                    to_render['endCourse'] = endCourse
                    to_render['sumRegisteredPeople'] = sumRegisteredPeople

                to_render['IsLogin'] = 1
                print('teacher')
                return render(request, 'index.html', to_render)

            else:
                print('student')
                to_render['IsLogin'] = 2
                return render(request, 'index.html', to_render)

        else:
            print('not login')
            to_render['IsLogin'] = 2
            return render(request, 'index.html', to_render)

