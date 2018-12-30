from django.shortcuts import render
from django.db import connections
import json
from use_function import namedtuplefetchall, getCourseIDByCourseCode
import cookiegetter
import math


def analysis_group_view(request):
    request.encoding = 'utf-8'

    if request.method == 'GET':
        to_render = {}
        select = request.GET.get('select', None)
        course = request.GET.get('course', None)
        to_render['course'] = course

        analysisBy = [
            "and year_of_birth != '' and year_of_birth IS NOT NULL order by year_of_birth",
            "and level_of_education != '' and level_of_education IS NOT NULL order by level_of_education",
            ""
        ]
        column = [
            ['<=15', '16-19', '20-23', '24-27', '28-31', '32-35', '>35'],
            ['國小', '國中', '高中', '副學士', '學士', '碩士', '博士']
        ]
        jsonArray_temp = []
        jsonArray_grade_count_scatter = []
        Standard_gradeWatch = []
        Standard_gradeForum = []
        jsonArray_tempForum = []
        jsonArray_grade_Forum_scatter = []

        # 影片觀看次數
        WatchCount = [0, 0, 0, 0, 0, 0, 0]
        WatchCount_output = ['' for i in range(7)]
        WatchCount_c = [0, 0, 0, 0, 0, 0, 0]

        # 討論區發文數
        forumNumber = [0, 0, 0, 0, 0, 0, 0]
        forumNumber_output = ['' for i in range(7)]
        forumNumber_c = [0, 0, 0, 0, 0, 0, 0]

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
                                "SELECT 課程代碼  as courseCode,course_id as id,course_name as courseName "
                                "FROM course_total_data_v2 "
                                "WHERE 課程代碼 = %s", [course]
                            )
                            result = namedtuplefetchall(cursor)

                            courseId = result[-1].id
                            courseName = result[-1].courseName

                            cursor.execute(
                                "SELECT max(run_date) as run_date "
                                "FROM student_total_data "
                                "WHERE course_id = %s", [courseId]
                            )
                            result = namedtuplefetchall(cursor)

                            runDate_studentTotalData = result[-1].run_date

                            # 影片觀看次數
                            cursor.execute(
                                "SELECT watch_count,year_of_birth,level_of_education "
                                "FROM student_total_data "
                                "WHERE course_id = %s and run_date = %s" + analysisBy[int(select)],
                                [courseId, runDate_studentTotalData]
                            )
                            result = namedtuplefetchall(cursor)

                            for rs in result:
                                if int(select) == 0:
                                    temp = rs.year_of_birth
                                    index = int((2017 - int(temp)) / 4 - 3)
                                    if index < 0:
                                        index = 0
                                    if index > 6:
                                        index = 6

                                    WatchCount[index] = WatchCount[index] + int(rs.watch_count)
                                    WatchCount_c[index] = WatchCount_c[index] + 1

                                elif int(select) == 1:
                                    if rs.level_of_education == 'p':
                                        WatchCount[0] = WatchCount[0] + int(rs.watch_count)
                                        WatchCount_c[0] = WatchCount_c[0] + 1
                                    elif rs.level_of_education == 'j':
                                        WatchCount[1] = WatchCount[1] + int(rs.watch_count)
                                        WatchCount_c[1] = WatchCount_c[1] + 1
                                    elif rs.level_of_education == 'hs':
                                        WatchCount[2] = WatchCount[2] + int(rs.watch_count)
                                        WatchCount_c[2] = WatchCount_c[2] + 1
                                    elif rs.level_of_education == 'a':
                                        WatchCount[3] = WatchCount[3] + int(rs.watch_count)
                                        WatchCount_c[3] = WatchCount_c[3] + 1
                                    elif rs.level_of_education == 'b':  # jhs
                                        WatchCount[4] = WatchCount[4] + int(rs.watch_count)
                                        WatchCount_c[4] = WatchCount_c[4] + 1
                                    elif rs.level_of_education == 'm':
                                        WatchCount[5] = WatchCount[5] + int(rs.watch_count)
                                        WatchCount_c[5] = WatchCount_c[5] + 1
                                    elif rs.level_of_education == 'd':
                                        WatchCount[6] = WatchCount[6] + int(rs.watch_count)
                                        WatchCount_c[6] = WatchCount_c[6] + 1

                            for i in range(len(WatchCount)):
                                if WatchCount_c[i] != 0:
                                    WatchCount_output[i] = '{:,.2f}'.format(WatchCount[i] / WatchCount_c[i])
                                else:
                                    WatchCount_output[i] = '0'

                            # 討論區發文數
                            cursor.execute(
                                "SELECT forum_num,year_of_birth,level_of_education "
                                "FROM student_total_data "
                                "WHERE course_id='" + courseId + "' and run_date='" + runDate_studentTotalData + "' " + analysisBy[int(select)]
                            )
                            result = namedtuplefetchall(cursor)

                            for rs in result:
                                if int(select) == 0:
                                    temp = rs.year_of_birth
                                    index = int((2017 - int(temp)) / 4 - 3)
                                    if index < 0:
                                        index = 0
                                    if index > 6:
                                        index = 6

                                    forumNumber[index] = forumNumber[index] + int(rs.forum_num)
                                    forumNumber_c[index] = forumNumber_c[index] + 1

                                elif int(select) == 1:
                                    if rs.level_of_education == 'p':
                                        forumNumber[0] = forumNumber[0] + int(rs.forum_num)
                                        forumNumber_c[0] = forumNumber_c[0] + 1
                                    elif rs.level_of_education == 'jhs':
                                        forumNumber[1] = forumNumber[1] + int(rs.forum_num)
                                        forumNumber_c[1] = forumNumber_c[1] + 1
                                    elif rs.level_of_education == 'hs':
                                        forumNumber[2] = forumNumber[2] + int(rs.forum_num)
                                        forumNumber_c[2] = forumNumber_c[2] + 1
                                    elif rs.level_of_education == 'a':
                                        forumNumber[3] = forumNumber[3] + int(rs.forum_num)
                                        forumNumber_c[3] = forumNumber_c[3] + 1
                                    elif rs.level_of_education == 'b':
                                        forumNumber[4] = forumNumber[4] + int(rs.forum_num)
                                        forumNumber_c[4] = forumNumber_c[4] + 1
                                    elif rs.level_of_education == 'm':
                                        forumNumber[5] = forumNumber[5] + int(rs.forum_num)
                                        forumNumber_c[5] = forumNumber_c[5] + 1
                                    elif rs.level_of_education == 'd':
                                        forumNumber[6] = forumNumber[6] + int(rs.forum_num)
                                        forumNumber_c[6] = forumNumber_c[6] + 1

                            for i in range(len(forumNumber)):
                                if forumNumber_c[i] != 0:
                                    forumNumber_output[i] = '{:,.2f}'.format(forumNumber[i] / forumNumber_c[i])
                                else:
                                    forumNumber_output[i] = '0'

                            # scatter chart 最佳成績與影片觀看數
                            gradeIsFind = False
                            totalIsFind = False
                            gradeUseTable = ['student_grade', 'student_grade_hack']
                            totalDataUseTable = ['student_total_data', 'student_total_data2', 'student_total_data_old']
                            table = 0
                            totalUse = 0
                            gradeUse = 0
                            runDate = ''
                            runDate_grade = ''

                            while totalIsFind == False and table < len(totalDataUseTable):
                                cursor.execute(
                                    "SELECT max(run_date) as run_date "
                                    "FROM " + totalDataUseTable[table] + " "
                                    "where course_id='" + courseId + "' "
                                )
                                result = namedtuplefetchall(cursor)
                                for rs in result:
                                    runDate = rs.run_date
                                    if runDate is not None:
                                        totalIsFind = True
                                        totalUse = table
                                    table += 1

                            table = 0
                            while gradeIsFind == False and table < len(gradeUseTable):
                                cursor.execute(
                                    "SELECT max(run_date) as runDate_grade "
                                    "FROM " + gradeUseTable[table] + " " +
                                    "WHERE course_id='" + courseId + "'"
                                )
                                result = namedtuplefetchall(cursor)

                                for rs in result:
                                    runDate_grade = rs.runDate_grade
                                    if runDate_grade is not None:
                                        gradeIsFind = True
                                        gradeUse = table
                                    table += 1

                            cursor.execute(
                                "SELECT avg(total_grade_best_p) as avgTotal_grade_best_p_scatter ,avg(forum_num) as avg_forum_num, avg(watch_count) as avgWatch_count_scatter "
                                "FROM " + totalDataUseTable[totalUse] + " as t_table INNER JOIN " + gradeUseTable[gradeUse] + " as g_table on (t_table.user_id=g_table.user_id) "
                                "WHERE t_table.course_id='" + courseId + "' and g_table.course_id='" + courseId + "' and t_table.run_date='" + runDate + "' and g_table.run_date='" + runDate_grade + "'"
                            )
                            result = namedtuplefetchall(cursor)

                            avgTotal_grade_best = float(result[-1].avgTotal_grade_best_p_scatter) * 100
                            avgWatch_count_scatter = result[-1].avgWatch_count_scatter
                            avgForum_num = result[-1].avg_forum_num
                            # --------------------------------

                            cursor.execute(
                                "SELECT total_grade_best_p as total_grade_best_p_scatter ,forum_num, watch_count as watch_count_scatter "
                                "FROM " + totalDataUseTable[totalUse] + " as t_table INNER JOIN " + gradeUseTable[gradeUse] + " as g_table on (t_table.user_id=g_table.user_id) "
                                "WHERE t_table.course_id='" + courseId + "'and g_table.course_id='" + courseId +
                                "' and t_table.run_date='" + runDate + "' and g_table.run_date='" + runDate_grade + "'"
                            )
                            result = namedtuplefetchall(cursor)

                            jsonArray_temp = ["觀看影片數目", "成績"]
                            jsonArray_grade_count_scatter.append(jsonArray_temp.copy())
                            Standard_gradeWatch.append(jsonArray_temp.copy())

                            jsonArray_tempForum = ['討論區發文數', '成績']
                            jsonArray_grade_Forum_scatter.append(jsonArray_tempForum.copy())
                            Standard_gradeForum.append(jsonArray_tempForum.copy())
                            count = 0
                            StandardWatch = 0
                            StandardGrade = 0
                            gradeWatch = 0

                            for rs in result:
                                wacth_count_scatter = rs.watch_count_scatter
                                total_grade_best_p_scatter = int(rs.total_grade_best_p_scatter * 100)
                                StandardWatch = StandardWatch + preStandard(wacth_count_scatter, avgWatch_count_scatter)
                                StandardGrade = StandardGrade + preStandard(total_grade_best_p_scatter, avgTotal_grade_best)
                                gradeWatch = gradeWatch + Correlation_X(
                                    wacth_count_scatter, total_grade_best_p_scatter, avgWatch_count_scatter, avgTotal_grade_best
                                )
                                count += 1

                                jsonArray_temp.clear()
                                jsonArray_temp.append(wacth_count_scatter)
                                jsonArray_temp.append(total_grade_best_p_scatter)
                                jsonArray_grade_count_scatter.append(jsonArray_temp.copy())

                            gradeWatch = gradeWatch / (math.sqrt(StandardWatch) * math.sqrt(StandardGrade))

                            degree_WatchGrade = degree(gradeWatch)
                            StandardWatch = math.sqrt(StandardWatch / count)
                            StandardGrade = math.sqrt(StandardGrade / count)

                            avgWatch_count_scatter_Correlation = 0
                            avgTotal_grade_best_Correlation = 0
                            count = 0
                            for rs in result:
                                wacth_count_scatter = rs.watch_count_scatter
                                total_grade_best_p_scatter = int(rs.total_grade_best_p_scatter * 100)

                                if avgWatch_count_scatter + 2*StandardWatch > wacth_count_scatter > avgWatch_count_scatter - 2*StandardWatch and avgTotal_grade_best + 2 * StandardGrade > total_grade_best_p_scatter > avgTotal_grade_best - 2 * StandardGrade:
                                    jsonArray_temp.clear()

                                    jsonArray_temp.append(wacth_count_scatter)
                                    jsonArray_temp.append(total_grade_best_p_scatter)
                                    Standard_gradeWatch.append(jsonArray_temp.copy())
                                    avgWatch_count_scatter_Correlation = avgWatch_count_scatter_Correlation + wacth_count_scatter
                                    avgTotal_grade_best_Correlation = avgTotal_grade_best_Correlation + total_grade_best_p_scatter
                                    count += 1

                            avgTotal_grade_best_Correlation = avgTotal_grade_best_Correlation / count
                            avgWatch_count_scatter_Correlation = avgWatch_count_scatter_Correlation / count

                            StandardCorrelation_WatchGrade = 0
                            StandardCorrelation_Watch = 0
                            StandardCorrelation_Grade = 0

                            for rs in result:
                                wacth_count_scatter = rs.watch_count_scatter
                                total_grade_best_p_scatter = int(rs.total_grade_best_p_scatter * 100)

                                if avgWatch_count_scatter_Correlation + 2*StandardWatch > wacth_count_scatter > avgWatch_count_scatter_Correlation - 2*StandardWatch and avgTotal_grade_best_Correlation + 2 * StandardGrade > total_grade_best_p_scatter > avgTotal_grade_best_Correlation - 2 * StandardGrade:
                                    StandardCorrelation_WatchGrade = StandardCorrelation_WatchGrade + Correlation_X(
                                        wacth_count_scatter, total_grade_best_p_scatter, avgWatch_count_scatter_Correlation, avgTotal_grade_best_Correlation
                                    )
                                    StandardCorrelation_Watch = StandardCorrelation_Watch + preStandard(
                                        wacth_count_scatter, avgWatch_count_scatter_Correlation
                                    )
                                    StandardCorrelation_Grade = StandardCorrelation_Grade + preStandard(
                                        total_grade_best_p_scatter, avgTotal_grade_best_Correlation
                                    )

                            StandardCorrelation_WatchGrade = Correlation(
                                StandardCorrelation_WatchGrade, StandardCorrelation_Watch, StandardCorrelation_Grade
                            )
                            degree_StandardWatchGrade = degree(StandardCorrelation_WatchGrade)

                            count = 0
                            cursor.execute(
                                "SELECT total_grade_best_p as total_grade_best_p_scatter ,forum_num, watch_count as watch_count_scatter "
                                "FROM " + totalDataUseTable[totalUse] + " as t_table INNER JOIN " + gradeUseTable[gradeUse] + "as g_table on (t_table.user_id=g_table.user_id) "
                                "WHERE t_table.course_id='" + courseId + "'and g_table.course_id='" + courseId +
                                "' and t_table.run_date='" + runDate + "' and g_table.run_date='" + runDate_grade + "'"
                            )
                            result = namedtuplefetchall(cursor)

                            StandardForum = 0
                            StandardGrade_Forum = 0
                            gradeForum = 0
                            for rs in result:
                                forum_num_scatter = rs.forum_num
                                total_grade_best_p_scatter = int(rs.total_grade_best_p_scatter * 100)

                                jsonArray_tempForum.clear()
                                jsonArray_tempForum.append(forum_num_scatter)
                                jsonArray_tempForum.append(total_grade_best_p_scatter)
                                jsonArray_grade_Forum_scatter.append(jsonArray_tempForum.copy())

                                StandardForum = StandardForum + preStandard(forum_num_scatter, avgForum_num)
                                StandardGrade_Forum = StandardGrade_Forum + preStandard(total_grade_best_p_scatter, avgTotal_grade_best)
                                gradeForum = gradeForum + Correlation_X(forum_num_scatter, total_grade_best_p_scatter, avgForum_num, avgTotal_grade_best)
                                count += 1

                            gradeForum = gradeForum / (math.sqrt(StandardForum) * math.sqrt(StandardGrade_Forum))
                            degree_ForumGrade = degree(gradeForum)

                            StandardGrade_Forum = math.sqrt(StandardGrade_Forum / count)
                            StandardForum = math.sqrt(StandardForum / count)

                            count = 0
                            avgForum_num_Correlation = 0
                            avgTotal_grade_Forum_Correlation = 0
                            for rs in result:
                                forum_num_scatter = rs.forum_num
                                total_grade_best_p_scatter = int(rs.total_grade_best_p_scatter * 100)

                                if avgForum_num + 2 * StandardForum > forum_num_scatter > avgForum_num - 2 * StandardForum and avgTotal_grade_best + 2 * StandardGrade_Forum > total_grade_best_p_scatter > avgTotal_grade_best - 2 * StandardGrade_Forum:
                                    jsonArray_temp.clear()
                                    jsonArray_temp.append(forum_num_scatter)
                                    jsonArray_temp.append(total_grade_best_p_scatter)
                                    Standard_gradeForum.append(jsonArray_temp.copy())
                                    avgForum_num_Correlation = avgForum_num_Correlation + forum_num_scatter
                                    avgTotal_grade_Forum_Correlation = avgTotal_grade_Forum_Correlation + total_grade_best_p_scatter
                                    count += 1

                            avgTotal_grade_Forum_Correlation = avgTotal_grade_Forum_Correlation / count
                            avgForum_num_Correlation = avgForum_num_Correlation / count

                            cursor.execute(
                                "SELECT total_grade_best_p as total_grade_best_p_scatter ,forum_num, watch_count as watch_count_scatter "
                                "FROM " + totalDataUseTable[totalUse] + " as t_table "
                                "INNER JOIN " + gradeUseTable[gradeUse] + " as g_table on (t_table.user_id=g_table.user_id) "
                                "WHERE t_table.course_id='" + courseId + "'and g_table.course_id='" + courseId +
                                "' and t_table.run_date='" + runDate + "' and g_table.run_date='" + runDate_grade + "'"
                            )
                            result = namedtuplefetchall(cursor)

                            StandardCorrelation_ForumGrade = 0
                            StandardCorrelation_Forum = 0
                            StandardCorrelation_Grade_Forum = 0

                            for rs in result:
                                forum_num_scatter = rs.forum_num
                                total_grade_best_p_scatter = int(rs.total_grade_best_p_scatter * 100)
                                if avgForum_num_Correlation + 2 * StandardForum > forum_num_scatter > avgForum_num_Correlation - 2 * StandardForum and avgTotal_grade_Forum_Correlation + 2 * StandardGrade_Forum > total_grade_best_p_scatter > avgTotal_grade_Forum_Correlation - 2 * StandardGrade_Forum:
                                    StandardCorrelation_ForumGrade = StandardCorrelation_ForumGrade + Correlation_X(
                                        forum_num_scatter, total_grade_best_p_scatter, avgForum_num_Correlation, avgTotal_grade_Forum_Correlation
                                    )
                                    StandardCorrelation_Forum = StandardCorrelation_Forum + preStandard(
                                        forum_num_scatter, avgForum_num_Correlation
                                    )
                                    StandardCorrelation_Grade_Forum = StandardCorrelation_Grade_Forum + preStandard(
                                        total_grade_best_p_scatter, avgTotal_grade_Forum_Correlation
                                    )

                            StandardCorrelation_ForumGrade = Correlation(
                                StandardCorrelation_ForumGrade, StandardCorrelation_Forum, StandardCorrelation_Grade_Forum
                            )
                            degree_StandardForumGrade = degree(StandardCorrelation_ForumGrade)

                            cursor.execute(
                                "SELECT max(watch_count) as max_watchCount "
                                "FROM " + totalDataUseTable[totalUse] + " as t_table "
                                "INNER JOIN " + gradeUseTable[gradeUse] + "as g_table on (t_table.user_id=g_table.user_id) "
                                "WHERE t_table.course_id='" + courseId + "'and g_table.course_id='" + courseId +
                                "' and t_table.run_date='" + runDate + "' and g_table.run_date='" + runDate_grade + "'"
                            )
                            result = namedtuplefetchall(cursor)

                            max_watchCount = result[-1].max_watchCount

                            to_render['forumNumber'] = forumNumber_output
                            to_render['avgWatch_count_scatter'] = '{:,.2f}'.format(avgWatch_count_scatter)  # 平均觀看數量
                            to_render['avgTotal_grade_best'] = '{:,.2f}'.format(avgTotal_grade_best)  # 平均成績
                            to_render['jsonArray_grade_count_scatter'] = json.dumps(jsonArray_grade_count_scatter)  # 影片及分數分布圖
                            to_render['degree_WatchGrade'] = degree_WatchGrade  # 相關程度(中文)
                            to_render['gradeWatch'] = '{:,.2f}'.format(gradeWatch)  # 相關係數

                            to_render['avgWatch_count_scatter_Correlation'] = '{:,.2f}'.format(avgWatch_count_scatter_Correlation)  # 平均觀看數量極大值
                            to_render['avgTotal_grade_best_Correlation'] = '{:,.2f}'.format(avgTotal_grade_best_Correlation)  # 平均成績移除極大值
                            to_render['degree_StandardWatchGrade'] = degree_StandardWatchGrade  # 相關程度(中文)
                            to_render['Standard_gradeWatch'] = json.dumps(Standard_gradeWatch)  # 影片及分數移除及大值後的圖
                            to_render['StandardCorrelation_WatchGrade'] = '{:,.2f}'.format(StandardCorrelation_WatchGrade)  # 相關係數移除大值

                            # 發文術語成績分布圖
                            to_render['avgForum_num'] = '{:,.2f}'.format(avgForum_num)  # 平均發文數
                            to_render['avgTotal_grade_best'] = '{:,.2f}'.format(avgTotal_grade_best)  # 平均成績
                            to_render['degree_ForumGrade'] = degree_ForumGrade  # 相關程度(中文)
                            to_render['jsonArray_grade_Forum_scatter'] = json.dumps(jsonArray_grade_Forum_scatter)  # 發文次數與成績圖
                            to_render['gradeForum'] = '{:,.2f}'.format(gradeForum)  # 相關係數

                            to_render['avgForum_num_Correlation'] = '{:,.2f}'.format(avgForum_num_Correlation)  # 平均發文移除極大值
                            to_render['avgTotal_grade_Forum_Correlation'] = '{:,.2f}'.format(avgTotal_grade_Forum_Correlation)  # 平均成績移除極大值
                            to_render['degree_StandardForumGrade'] = degree_StandardForumGrade  # 相關程度(中文)
                            to_render['Standard_gradeForum'] = json.dumps(Standard_gradeForum)  # 發文次數與成績移除極大值後的圖
                            to_render['StandardCorrelation_ForumGrade'] = '{:,.2f}'.format(StandardCorrelation_ForumGrade)  # 相關係數移除大值

                            to_render['WatchCount'] = WatchCount_output
                            to_render['courseName'] = courseName
                            to_render['select'] = select
                            to_render['max_watchCount'] = max_watchCount
                            to_render['colume'] = column[int(select)]

                        to_render['IsLogin'] = 1
                        haveThisCourse = True
                        break

                if haveThisCourse is False:
                    to_render['IsLogin'] = 2
                    print('not have')
                    return render(request, 'analysisGroup.html', to_render)

            else:
                print('student')
                to_render['IsLogin'] = 2
                return render(request, 'analysisGroup.html', to_render)
        else:
            print('no')
            to_render['IsLogin'] = 2
            return render(request, 'analysisGroup.html', to_render)

        return render(request, 'analysisGroup.html', to_render)


def Correlation_X(x, y, avg_x, avg_y):
    Correlation_x = 0
    Correlation_x = Correlation_x + ((x - avg_x) * (y - avg_y))
    return Correlation_x


def preStandard(x, avg_x):
    return (x - avg_x) * (x - avg_x)


def Correlation(x, y, z):
    return x / (math.sqrt(y) * math.sqrt(z))


def degree(x):
    if x > 0.7:
        return '高度正相關'
    elif x >= 0.3:
        return '中度正相關'
    elif x >= 0:
        return '低度正相關'
    elif x <= -0.7:
        return '高度負相關'
    elif x <= -0.3:
        return '中度負相關'
    else:
        return '低度負相關'
