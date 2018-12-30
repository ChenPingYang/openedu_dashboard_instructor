from django.shortcuts import render
from django.db import connections
from use_function import namedtuplefetchall, getCourseIDByCourseCode
import cookiegetter
import json


# Create your views here.
def analysis_student_view(request):
    request.encoding = 'utf-8'

    if request.method == 'GET':
        to_render = {}
        mode = request.GET.get('mode', None)
        course = request.GET.get('course', None)
        optradio = request.GET.get('optradio', None)
        select = int(optradio)
        to_render['course'] = course

        count_pass = 0
        count_pass1 = 0
        count_person = 0

        jsonArray_temp = []
        jsonArray_temp_grade = []
        jsonArray_grade = []
        jsonArray_studentInfo = []

        avgWatch_el = None
        avgWatch_jhs = None
        avgWatch_hs = None
        avgWatch_a = None
        avgWatch_b = None
        avgWatch_m = None
        avgWatch_p = None

        # 四種資料庫語法
        radio = ["and active = 1", "and active = 0", "", "and certificate=1"]

        islogin = cookiegetter.isLogined(request)
        haveThisCourse = False

        if islogin is True:
            userEmail = cookiegetter.getEmail(request)
            userID = cookiegetter.getUserIDByEmail(userEmail)
            if cookiegetter.isTeacher(userID):
                teachersCourse = cookiegetter.get_Teacher_Courses(userID)
                for j in range(len(teachersCourse)):
                    if getCourseIDByCourseCode(course) == teachersCourse[j]:
                        with connections['ResultDB'].cursor() as cursor:
                            cursor.execute(
                                "SELECT 課程代碼  as courseCode,course_id as id,course_name as courseName, 課程影片數目 "
                                "FROM course_total_data_v2 "
                                "WHERE 課程代碼 = %s", [course]
                            )
                            result = namedtuplefetchall(cursor)

                            courseCode = result[-1].courseCode
                            courseId = result[-1].id
                            courseName = result[-1].courseName
                            video = int(result[-1].課程影片數目)

                            gradeIsFind = False
                            totalIsFind = False
                            gradeUseTable = ["student_grade"]
                            totalDataUseTable = [
                                'student_total_data0912', 'student_total_data', 'student_total_data_old',
                                'student_total_data2'
                            ]
                            table = 0
                            totalUse = 0
                            gradeUse = 0
                            runDate = ''
                            runDate_grade = ''

                            while totalIsFind is False and table < len(totalDataUseTable):
                                cursor.execute(
                                    "SELECT max(run_date) as run_date "
                                    "FROM " + totalDataUseTable[table] +
                                    " WHERE course_id='" + courseId + "'"
                                )
                                result = namedtuplefetchall(cursor)

                                for rs in result:
                                    runDate = rs.run_date
                                    if runDate is not None:
                                        totalIsFind = True
                                        totalUse = table
                                table = table + 1

                            i = 0
                            table = 0

                            while gradeIsFind == False and table < len(gradeUseTable):
                                cursor.execute(
                                    "SELECT max(run_date) as runDate_grade "
                                    "FROM " + gradeUseTable[table] + " "
                                    "WHERE course_id='" + courseId + "'"
                                )
                                result = namedtuplefetchall(cursor)

                                for rs in result:
                                    runDate_grade = rs.runDate_grade
                                    if runDate_grade is not None:
                                        gradeIsFind = True
                                        gradeUse = table
                                table = table + 1

                            cursor.execute(
                                "SELECT name,forum_num, complete_rate,c_complete_rate,video_count,watch_count,"
                                "login_count,last_login, level_of_education,total_grade_1st_try_p, total_grade_best_p "
                                "FROM " + totalDataUseTable[totalUse] + " as t_table "
                                "INNER JOIN " + gradeUseTable[gradeUse] + " as g_table on (t_table.user_id=g_table.user_id) "
                                "WHERE t_table.course_id='" + courseId + "'and g_table.course_id='" + courseId + "' and t_table.run_date='" + runDate + "' and g_table.run_date='" + runDate_grade + "' " + radio[select]
                            )
                            result = namedtuplefetchall(cursor)

                            # 顯示資料
                            for rs in result:
                                # 判斷是否該名字是中文，如果是的話以'*'字號來消音保護隱私
                                if len(rs.name.encode()) != len(rs.name):
                                    user_id = rs.name[0:1] + '*' + rs.name[2:]
                                    userName = rs.name[0:1] + '*' + rs.name[2:]
                                else:
                                    user_id = rs.name
                                    userName = rs.name

                                grade_1st_try_p = int(rs.total_grade_1st_try_p * 100)
                                grade_best_p = int(rs.total_grade_best_p * 100)
                                forum_num = rs.forum_num
                                videoCount = rs.video_count

                                login_Count = rs.login_count
                                if rs.last_login is None:
                                    last_Login = '無資料'
                                else:
                                    last_Login = rs.last_login

                                if video == 0:
                                    percentWatch = 0
                                else:
                                    percentWatch = float(videoCount / video)

                                watchCount = rs.watch_count

                                level_of_education = rs.level_of_education
                                if level_of_education is None:
                                    level_of_education = '無資料'
                                elif level_of_education == 'p':
                                    level_of_education = '博士'
                                elif level_of_education == 'm':
                                    level_of_education = '碩士'
                                elif level_of_education == 'b':
                                    level_of_education = '學士'
                                elif level_of_education == 'a':
                                    level_of_education = '副學士'
                                elif level_of_education == 'hs':
                                    level_of_education = '高中'
                                elif level_of_education == 'jhs':
                                    level_of_education = '國中'
                                elif level_of_education == 'el':
                                    level_of_education = '國小'
                                else:
                                    level_of_education = '無資料'

                                c_completeRate = rs.c_complete_rate
                                if c_completeRate >= 0.5:
                                    count_person += 1
                                    count_pass1 += 1

                                if select == 3:
                                    count_pass += 1

                                completeRate = rs.complete_rate

                                jsonArray_temp.clear()
                                jsonArray_temp.append(userName)
                                jsonArray_temp.append(level_of_education)
                                jsonArray_temp.append(videoCount)
                                jsonArray_temp.append(percentWatch)
                                jsonArray_temp.append(watchCount)
                                jsonArray_temp.append(forum_num)
                                jsonArray_temp.append(completeRate)
                                jsonArray_temp.append(c_completeRate)
                                jsonArray_temp.append(login_Count)
                                jsonArray_temp.append(last_Login)

                                jsonArray_studentInfo.append(jsonArray_temp.copy())

                                jsonArray_temp_grade.clear()
                                jsonArray_temp_grade.append(user_id)
                                jsonArray_temp_grade.append(level_of_education)
                                jsonArray_temp_grade.append(grade_1st_try_p)
                                jsonArray_temp_grade.append(grade_best_p)

                                jsonArray_grade.append(jsonArray_temp_grade.copy())

                            cursor.execute(
                                "SELECT 註冊人數+退選人數 as countPerson  "
                                "FROM course_total_data_v2 "
                                "WHERE course_id = %s", [courseId]
                            )
                            result = namedtuplefetchall(cursor)

                            countPerson = result[-1].countPerson

                            if select < 3:
                                noHalfPerson = countPerson - count_person
                            else:
                                count_person = count_pass1
                                noHalfPerson = count_pass - count_pass1

                            cursor.execute(
                                "SELECT video_count "
                                "FROM " + totalDataUseTable[totalUse] + " "
                                "WHERE course_id='" + courseId + "'and run_date='" + runDate + "'" + radio[select]
                            )
                            result = namedtuplefetchall(cursor)

                            videoCount = video
                            video_temp = float(video) / 10

                            # 將學生觀看影片數目分成10等分，數字越少代表觀看越少
                            video_watch_1 = 0
                            video_watch_2 = 0
                            video_watch_3 = 0
                            video_watch_4 = 0
                            video_watch_5 = 0
                            video_watch_6 = 0
                            video_watch_7 = 0
                            video_watch_8 = 0
                            video_watch_9 = 0
                            video_watch_10 = 0

                            for rs in result:
                                video = int(rs.video_count)

                                if 0 <= video <= video_temp:
                                    video_watch_1 += 1
                                elif video_temp < video <= 2*video_temp:
                                    video_watch_2 += 1
                                elif 2*video_temp < video <= 3*video_temp:
                                    video_watch_3 += 1
                                elif 3*video_temp < video <= 4*video_temp:
                                    video_watch_4 += 1
                                elif 4*video_temp < video <= 5*video_temp:
                                    video_watch_5 += 1
                                elif 5*video_temp < video <= 6*video_temp:
                                    video_watch_6 += 1
                                elif 6*video_temp < video <= 7*video_temp:
                                    video_watch_7 += 1
                                elif 7*video_temp < video <= 8*video_temp:
                                    video_watch_8 += 1
                                elif 8*video_temp < video <= 9*video_temp:
                                    video_watch_9 += 1
                                elif 9*video_temp < video <= 10*video_temp:
                                    video_watch_10 += 1

                            str_watch_1 = '0-' + str(int(video_temp))
                            str_watch_2 = str(int(video_temp + 1)) + '-' + str(int(2 * video_temp))
                            str_watch_3 = str(int(2 * video_temp + 1)) + '-' + str(int(3 * video_temp))
                            str_watch_4 = str(int(3 * video_temp + 1)) + '-' + str(int(4 * video_temp))
                            str_watch_5 = str(int(4 * video_temp + 1)) + "-" + str(int(5 * video_temp))
                            str_watch_6 = str(int(5 * video_temp + 1)) + "-" + str(int(6 * video_temp))
                            str_watch_7 = str(int(6 * video_temp + 1)) + "-" + str(int(7 * video_temp))
                            str_watch_8 = str(int(7 * video_temp + 1)) + "-" + str(int(8 * video_temp))
                            str_watch_9 = str(int(8 * video_temp + 1)) + "-" + str(int(9 * video_temp))
                            str_watch_10 = str(int(9 * video_temp + 1)) + "-" + str(videoCount)

                            to_render['courseCode'] = courseCode
                            to_render['courseId'] = courseId
                            to_render['courseName'] = courseName
                            to_render['runDate'] = runDate
                            to_render['count_person'] = count_person
                            to_render['countPerson'] = countPerson
                            to_render['noHalfPerson'] = noHalfPerson
                            to_render['jsonArray_studentInfo'] = json.dumps(jsonArray_studentInfo)
                            to_render['avgWatch_el'] = avgWatch_el
                            to_render['avgWatch_jhs'] = avgWatch_jhs
                            to_render['avgWatch_hs'] = avgWatch_hs
                            to_render['avgWatch_a'] = avgWatch_a
                            to_render['avgWatch_b'] = avgWatch_b
                            to_render['avgWatch_m'] = avgWatch_m
                            to_render['avgWatch_p'] = avgWatch_p
                            to_render['jsonArray_grade'] = json.dumps(jsonArray_grade)
                            to_render['video_watch_1'] = video_watch_1
                            to_render['video_watch_2'] = video_watch_2
                            to_render['video_watch_3'] = video_watch_3
                            to_render['video_watch_4'] = video_watch_4
                            to_render['video_watch_5'] = video_watch_5
                            to_render['video_watch_6'] = video_watch_6
                            to_render['video_watch_7'] = video_watch_7
                            to_render['video_watch_8'] = video_watch_8
                            to_render['video_watch_9'] = video_watch_9
                            to_render['video_watch_10'] = video_watch_10
                            to_render['str_watch_1'] = str_watch_1
                            to_render['str_watch_2'] = str_watch_2
                            to_render['str_watch_3'] = str_watch_3
                            to_render['str_watch_4'] = str_watch_4
                            to_render['str_watch_5'] = str_watch_5
                            to_render['str_watch_6'] = str_watch_6
                            to_render['str_watch_7'] = str_watch_7
                            to_render['str_watch_8'] = str_watch_8
                            to_render['str_watch_9'] = str_watch_9
                            to_render['str_watch_10'] = str_watch_10
                            to_render['mode'] = mode
                            to_render['optradio'] = optradio
                            to_render['courseCode'] = courseCode

                        to_render['IsLogin'] = 1
                        haveThisCourse = True
                        break

                if haveThisCourse is False:
                    to_render['IsLogin'] = 2
                    print('not have')
                    return render(request, 'AnalysisStudent.html', to_render)

            else:
                print('student')
                to_render['IsLogin'] = 2
                return render(request, 'AnalysisStudent.html', to_render)

        else:
            print('no')
            to_render['IsLogin'] = 2
            return render(request, 'AnalysisStudent.html', to_render)

        return render(request, 'AnalysisStudent.html', to_render)








