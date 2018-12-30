from django.shortcuts import render
import math
from use_function import getListAvg, namedtuplefetchall
from django.db import connections
import json

# Create your views here.


def course_statistics_view(request):
    request.encoding = 'utf-8'
    to_render = {}

    if request.method == 'GET':
        to_render = doGet(request)
    if request.method == 'POST':
        to_render = doGet(request)

    return render(request, 'courseStatistics.html', to_render)


def doGet(request):
    to_render = {}

    with connections['ResultDB'].cursor() as cursor:
        cursor.execute("SELECT max(統計日期) as date FROM course_total_data_v2")
        result = namedtuplefetchall(cursor)
        update_course_total_data = result[-1].date

        to_render['update_course_total_data'] = update_course_total_data

        # 取得所有課程資料
        cursor.execute("SELECT * FROM course_total_data_v2 WHERE 統計日期 = %s", [update_course_total_data])
        result = namedtuplefetchall(cursor)

        c1 = []
        c2 = []
        c3_v = []
        c3_q = []
        c3_f = []
        c3 = []
        registeredPersons = []
        courseNumberOfVideos = []
        numberOfTestQuestions = []
        numbersOfPostInForum = []
        courseLoginCount = []
        timesOfVideosViewed =[]
        totalTestAnswerNumber = []
        numberOfForumAreas = []
        Participation = []

        for rs in result:
            registeredPersons.append(rs.註冊人數)
            courseNumberOfVideos.append(rs.課程影片數目)
            numberOfTestQuestions.append(rs.測驗題數量)
            numbersOfPostInForum.append(rs.討論區發文數)
            courseLoginCount.append(rs.login_count)
            timesOfVideosViewed.append(rs.影片觀看人次_台灣 + rs.影片觀看人次_非台灣)
            totalTestAnswerNumber.append(rs.總作答數)
            numberOfForumAreas.append(rs.討論區回應數)
            c1.append(rs.c1)
            c2.append(rs.c2)
            c3_v.append(rs.c_v)
            c3_q.append(rs.c_q)
            c3_f.append(rs.c_f)
            c3.append(rs.c3)
            Participation.append(rs.熱門參與度)

        # 取得未標準化資料的區間
        interval_value_registeredPersons = getInterval(registeredPersons)
        interval_value_courseNumberOfVideos = getInterval(courseNumberOfVideos)
        interval_value_numberOfTestQuestions = getInterval(numberOfTestQuestions)
        interval_value_numbersOfPostInForum = getInterval(numbersOfPostInForum)
        interval_value_courseLoginCount = getInterval(courseLoginCount)
        interval_value_timesOfVideosViewed = getInterval(timesOfVideosViewed)
        interval_value_totalTestAnswerNumber = getInterval(totalTestAnswerNumber)
        interval_value_numberOfForumAreas = getInterval(numberOfForumAreas)

        # 將未標準化數據以區間統計
        length = 10
        interval_registeredPersons = interval(registeredPersons, interval_value_registeredPersons, length)
        interval_courseNumberOfVideos = interval(courseNumberOfVideos, interval_value_courseNumberOfVideos, length)
        interval_numberOfTestQuestions = interval(numberOfTestQuestions, interval_value_numberOfTestQuestions, length)
        interval_numbersOfPostInForum = interval(numbersOfPostInForum, interval_value_numbersOfPostInForum, length)
        interval_courseLoginCount = interval(courseLoginCount, interval_value_courseLoginCount, length)
        interval_timesOfVideosViewed = interval(timesOfVideosViewed, interval_value_timesOfVideosViewed, length)
        interval_totalTestAnswerNumber = interval(totalTestAnswerNumber, interval_value_totalTestAnswerNumber, length)
        interval_numberOfForumAreas = interval(numberOfForumAreas, interval_value_numberOfForumAreas, length)
        interval_c1 = interval(c1, 10, length)
        interval_c2 = interval(c2, 10, length)
        interval_c3_v = interval(c3_v, 10, length)
        interval_c3_q = interval(c3_q, 10, length)
        interval_c3_f = interval(c3_f, 10, length)
        interval_c3 = interval(c3, 10, length)
        interval_Participation = interval(Participation, 10, length)

        # 將未標準化數據區間轉為Json
        jsonObject = {'category': 0}
        Json_registeredPersons = [jsonObject.copy()]
        Json_courseNumberOfVideos = [jsonObject.copy()]
        Json_numberOfTestQuestions = [jsonObject.copy()]
        Json_numbersOfPostInForum = [jsonObject.copy()]
        Json_courseLoginCount = [jsonObject.copy()]
        Json_timesOfVideosViewed = [jsonObject.copy()]
        Json_totalTestAnswerNumber = [jsonObject.copy()]
        Json_numberOfForumAreas = [jsonObject.copy()]
        Json_c1 = [jsonObject.copy()]
        Json_c2 = [jsonObject.copy()]
        Json_c3_v = [jsonObject.copy()]
        Json_c3_q = [jsonObject.copy()]
        Json_c3_f = [jsonObject.copy()]
        Json_c3 = [jsonObject.copy()]
        Json_Participation = [jsonObject.copy()]

        for i in range(10):
            jsonObject.clear()
            jsonObject['category'] = str(interval_value_registeredPersons*i) + '~' + str(interval_value_registeredPersons*(i+1)-1)
            jsonObject['count'] = interval_registeredPersons[i]
            Json_registeredPersons.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = str(interval_value_courseNumberOfVideos*i) + '~' + str(interval_value_courseNumberOfVideos*(i+1)-1)
            jsonObject['count'] = interval_courseNumberOfVideos[i]
            Json_courseNumberOfVideos.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = str(interval_value_numberOfTestQuestions*i) + '~' + str(interval_value_numberOfTestQuestions*(i+1)-1)
            jsonObject['count'] = interval_numberOfTestQuestions[i]
            Json_numberOfTestQuestions.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = str(interval_value_numbersOfPostInForum*i) + '~' + str(interval_value_numbersOfPostInForum*(i+1)-1)
            jsonObject['count'] = interval_numbersOfPostInForum[i]
            Json_numbersOfPostInForum.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = str(interval_value_courseLoginCount*i) + '~' + str(interval_value_courseLoginCount*(i+1)-1)
            jsonObject['count'] = interval_courseLoginCount[i]
            Json_courseLoginCount.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = str(interval_value_timesOfVideosViewed*i) + '~' + str(interval_value_timesOfVideosViewed*(i+1)-1)
            jsonObject['count'] = interval_timesOfVideosViewed[i]
            Json_timesOfVideosViewed.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = str(interval_value_totalTestAnswerNumber*i) + '~' + str(interval_value_totalTestAnswerNumber*(i+1)-1)
            jsonObject['count'] = interval_totalTestAnswerNumber[i]
            Json_totalTestAnswerNumber.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = str(interval_value_numberOfForumAreas) + '~' + str(interval_value_numberOfForumAreas*(i+1)-1)
            jsonObject['count'] = interval_numberOfForumAreas[i]
            Json_numberOfForumAreas.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = str(5*i) + '~' + str(5*(i+1)-1)
            jsonObject['count'] = interval_c1[i]
            Json_c1.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = str(5*i) + '~' + str(5*(i+1)-1)
            jsonObject['count'] = interval_c2[i]
            Json_c2.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = str(5*i) + '~' + str(5*(i+1)-1)
            jsonObject['count'] = interval_c3_v[i]
            Json_c3_v.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = str(5*i) + '~' + str(5*(i+1)-1)
            jsonObject['count'] = interval_c3_q[i]
            Json_c3_q.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = str(5*i) + '~' + str(5*(i+1)-1)
            jsonObject['count'] = interval_c3_f[i]
            Json_c3_f.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = str(5*i) + '~' + str(5*(i+1)-1)
            jsonObject['count'] = interval_c3[i]
            Json_c3.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = str(5*i) + '~' + str(5*(i+1)-1)
            jsonObject['count'] = interval_Participation[i]
            Json_Participation.append(jsonObject.copy())

        jsonObject.clear()
        jsonObject['category'] = 'unlimit'
        Json_registeredPersons.append(jsonObject.copy())
        Json_courseNumberOfVideos.append(jsonObject.copy())
        Json_numberOfTestQuestions.append(jsonObject.copy())
        Json_numbersOfPostInForum.append(jsonObject.copy())
        Json_courseLoginCount.append(jsonObject.copy())
        Json_timesOfVideosViewed.append(jsonObject.copy())
        Json_totalTestAnswerNumber.append(jsonObject.copy())
        Json_numberOfForumAreas.append(jsonObject.copy())
        Json_c1.append(jsonObject.copy())
        Json_c2.append(jsonObject.copy())
        Json_c3_v.append(jsonObject.copy())
        Json_c3_q.append(jsonObject.copy())
        Json_c3_f.append(jsonObject.copy())
        Json_c3.append(jsonObject.copy())
        Json_Participation.append(jsonObject.copy())

        to_render['Json_registeredPersons'] = json.dumps(Json_registeredPersons)
        to_render['Json_courseNumberOfVideos'] = json.dumps(Json_courseNumberOfVideos)
        to_render['Json_numberOfTestQuestions'] = json.dumps(Json_numberOfTestQuestions)
        to_render['Json_numbersOfPostInForum'] = json.dumps(Json_numbersOfPostInForum)
        to_render['Json_courseLoginCount'] = json.dumps(Json_courseLoginCount)
        to_render['Json_timesOfVideosViewed'] = json.dumps(Json_timesOfVideosViewed)
        to_render['Json_totalTestAnswerNumber'] = json.dumps(Json_totalTestAnswerNumber)
        to_render['Json_numberOfForumAreas'] = json.dumps(Json_numberOfForumAreas)
        to_render['Json_c1'] = json.dumps(Json_c1)
        to_render['Json_c2'] = json.dumps(Json_c2)
        to_render['Json_c3_v'] = json.dumps(Json_c3_v)
        to_render['Json_c3_q'] = json.dumps(Json_c3_q)
        to_render['Json_c3_f'] = json.dumps(Json_c3_f)
        to_render['Json_c3'] = json.dumps(Json_c3)
        to_render['Json_Participation'] = json.dumps(Json_Participation)

        # 將數據標準化
        registeredPersons = standardization(registeredPersons)
        courseNumberOfVideos = standardization(courseNumberOfVideos)
        numberOfTestQuestions = standardization(numberOfTestQuestions)
        numbersOfPostInForum = standardization(numbersOfPostInForum)
        courseLoginCount = standardization(courseLoginCount)
        timesOfVideosViewed = standardization(timesOfVideosViewed)
        totalTestAnswerNumber = standardization(totalTestAnswerNumber)
        numberOfForumAreas = standardization(numberOfForumAreas)
        c1 = standardization(c1)
        c2 = standardization(c2)
        c3_v = standardization(c3_v)
        c3_q = standardization(c3_q)
        c3_f = standardization(c3_f)
        c3 = standardization(c3)
        Participation = standardization(Participation)

        registeredPersons.pop()
        registeredPersons.pop()
        courseNumberOfVideos.pop()
        courseNumberOfVideos.pop()
        numberOfTestQuestions.pop()
        numberOfTestQuestions.pop()
        numbersOfPostInForum.pop()
        numbersOfPostInForum.pop()
        courseLoginCount.pop()
        courseLoginCount.pop()
        timesOfVideosViewed.pop()
        timesOfVideosViewed.pop()
        totalTestAnswerNumber.pop()
        totalTestAnswerNumber.pop()
        numberOfForumAreas.pop()
        numberOfForumAreas.pop()
        c1.pop()
        c1.pop()
        c2.pop()
        c2.pop()
        c3_v.pop()
        c3_v.pop()
        c3_q.pop()
        c3_q.pop()
        c3_f.pop()
        c3_f.pop()
        c3.pop()
        c3.pop()
        Participation.pop()
        Participation.pop()

        registeredPersons = standardization(registeredPersons)
        courseNumberOfVideos = standardization(courseNumberOfVideos)
        numberOfTestQuestions = standardization(numberOfTestQuestions)
        numbersOfPostInForum = standardization(numbersOfPostInForum)
        courseLoginCount = standardization(courseLoginCount)
        timesOfVideosViewed = standardization(timesOfVideosViewed)
        totalTestAnswerNumber = standardization(totalTestAnswerNumber)
        numberOfForumAreas = standardization(numberOfForumAreas)
        c1 = standardization(c1)
        c2 = standardization(c2)
        c3_v = standardization(c3_v)
        c3_q = standardization(c3_q)
        c3_f = standardization(c3_f)
        c3 = standardization(c3)
        Participation= standardization(Participation)

        # 取得標準差
        sdd_registeredPersons = registeredPersons[-1]
        registeredPersons.pop()
        sdd_courseNumberOfVideos = courseNumberOfVideos[-1]
        courseNumberOfVideos.pop()
        sdd_numberOfTestQuestions = numberOfTestQuestions[-1]
        numberOfTestQuestions.pop()
        sdd_numbersOfPostInForum = numbersOfPostInForum[-1]
        numbersOfPostInForum.pop()
        sdd_courseLoginCount = courseLoginCount[-1]
        courseLoginCount.pop()
        sdd_timesOfVideosViewed = timesOfVideosViewed[-1]
        timesOfVideosViewed.pop()
        sdd_totalTestAnswerNumber = totalTestAnswerNumber[-1]
        totalTestAnswerNumber.pop()
        sdd_numberOfForumAreas = numberOfForumAreas[-1]
        numberOfForumAreas.pop()
        sdd_c1 = c1[-1]
        c1.pop()
        sdd_c2 = c2[-1]
        c2.pop()
        sdd_c3_v = c3_v[-1]
        c3_v.pop()
        sdd_c3_q = c3_q[-1]
        c3_q.pop()
        sdd_c3_f = c3_f[-1]
        c3_f.pop()
        sdd_c3 = c3[-1]
        c3.pop()
        sdd_Participation = Participation[-1]
        Participation.pop()

        # 取得平均
        avg_registeredPersons = registeredPersons[-1]
        registeredPersons.pop()
        avg_courseNumberOfVideos = courseNumberOfVideos[-1]
        courseNumberOfVideos.pop()
        avg_numberOfTestQuestions = numberOfTestQuestions[-1]
        numberOfTestQuestions.pop()
        avg_numbersOfPostInForum = numbersOfPostInForum[-1]
        numbersOfPostInForum.pop()
        avg_courseLoginCount = courseLoginCount[-1]
        courseLoginCount.pop()
        avg_timesOfVideosViewed = timesOfVideosViewed[-1]
        timesOfVideosViewed.pop()
        avg_totalTestAnswerNumber = totalTestAnswerNumber[-1]
        totalTestAnswerNumber.pop()
        avg_numberOfForumAreas = numberOfForumAreas[-1]
        numberOfForumAreas.pop()
        avg_c1 = c1[-1]
        c1.pop()
        avg_c2 = c2[-1]
        c2.pop()
        avg_c3_v = c3_v[-1]
        c3_v.pop()
        avg_c3_q = c3_q[-1]
        c3_q.pop()
        avg_c3_f = c3_f[-1]
        c3_f.pop()
        avg_c3 = c3[-1]
        c3.pop()
        avg_Participation = Participation[-1]
        Participation.pop()

        # 將標準化後數據以標準差為區間統計
        sd_interval_registeredPersons = standardization_interval(registeredPersons, sdd_registeredPersons, avg_registeredPersons)
        sd_interval_courseNumberOfVideos = standardization_interval(courseNumberOfVideos, sdd_courseNumberOfVideos, avg_courseNumberOfVideos)
        sd_interval_numberOfTestQuestions = standardization_interval(numberOfTestQuestions, sdd_numberOfTestQuestions, avg_numberOfTestQuestions)
        sd_interval_numbersOfPostInForum = standardization_interval(numbersOfPostInForum, sdd_numbersOfPostInForum, avg_numbersOfPostInForum)
        sd_interval_courseLoginCount = standardization_interval(courseLoginCount, sdd_courseLoginCount, avg_courseLoginCount)
        sd_interval_timesOfVideosViewed = standardization_interval(timesOfVideosViewed, sdd_timesOfVideosViewed, avg_timesOfVideosViewed)
        sd_interval_totalTestAnswerNumber = standardization_interval(totalTestAnswerNumber, sdd_totalTestAnswerNumber, avg_totalTestAnswerNumber)
        sd_interval_numberOfForumAreas = standardization_interval(numberOfForumAreas, sdd_numberOfForumAreas, avg_numberOfForumAreas)
        sd_interval_c1 = standardization_interval(c1, sdd_c1, avg_c1)
        sd_interval_c2 = standardization_interval(c2, sdd_c2, avg_c2)
        sd_interval_c3_v = standardization_interval(c3_v, sdd_c3_v, avg_c3_v)
        sd_interval_c3_q = standardization_interval(c3_q, sdd_c3_q, avg_c3_q)
        sd_interval_c3_f = standardization_interval(c3_f, sdd_c3_f, avg_c3_f)
        sd_interval_c3 = standardization_interval(c3, sdd_c3, avg_c3)
        sd_interval_Participation = standardization_interval(Participation, sdd_Participation, avg_Participation)

        # 將標準化後數據區間轉為Json
        jsonObject = {'category': 0}
        Json_sd_registeredPersons = [jsonObject.copy()]
        Json_sd_courseNumberOfVideos = [jsonObject.copy()]
        Json_sd_numberOfTestQuestions = [jsonObject.copy()]
        Json_sd_numbersOfPostInForum = [jsonObject.copy()]
        Json_sd_courseLoginCount = [jsonObject.copy()]
        Json_sd_timesOfVideosViewed = [jsonObject.copy()]
        Json_sd_totalTestAnswerNumber = [jsonObject.copy()]
        Json_sd_numberOfForumAreas = [jsonObject.copy()]
        Json_sd_c1 = [jsonObject.copy()]
        Json_sd_c2 = [jsonObject.copy()]
        Json_sd_c3_v = [jsonObject.copy()]
        Json_sd_c3_q = [jsonObject.copy()]
        Json_sd_c3_f = [jsonObject.copy()]
        Json_sd_c3 = [jsonObject.copy()]
        Json_sd_Participation = [jsonObject.copy()]

        for i in range(12):
            jsonObject.clear()
            jsonObject['category'] = magic(avg_registeredPersons, i)
            jsonObject['count'] = sd_interval_registeredPersons[i]
            Json_sd_registeredPersons.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = magic(avg_courseNumberOfVideos, i)
            jsonObject['count'] = sd_interval_courseNumberOfVideos[i]
            Json_sd_courseNumberOfVideos.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = magic(avg_numberOfTestQuestions, i)
            jsonObject['count'] = sd_interval_numberOfTestQuestions[i]
            Json_sd_numberOfTestQuestions.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = magic(avg_numbersOfPostInForum, i)
            jsonObject['count'] = sd_interval_numbersOfPostInForum[i]
            Json_sd_numbersOfPostInForum.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = magic(avg_courseLoginCount, i)
            jsonObject['count'] = sd_interval_courseLoginCount[i]
            Json_sd_courseLoginCount.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = magic(avg_timesOfVideosViewed, i)
            jsonObject['count'] = sd_interval_timesOfVideosViewed[i]
            Json_sd_timesOfVideosViewed.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = magic(avg_totalTestAnswerNumber, i)
            jsonObject['count'] = sd_interval_totalTestAnswerNumber[i]
            Json_sd_totalTestAnswerNumber.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = magic(avg_numberOfForumAreas, i)
            jsonObject['count'] = sd_interval_numberOfForumAreas[i]
            Json_sd_numberOfForumAreas.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = magic(avg_c1, i)
            jsonObject['count'] = sd_interval_c1[i]
            Json_sd_c1.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = magic(avg_c2, i)
            jsonObject['count'] = sd_interval_c2[i]
            Json_sd_c2.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = magic(avg_c3_v, i)
            jsonObject['count'] = sd_interval_c3_v[i]
            Json_sd_c3_v.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = magic(avg_c3_q, i)
            jsonObject['count'] = sd_interval_c3_q[i]
            Json_sd_c3_q.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = magic(avg_c3_f, i)
            jsonObject['count'] = sd_interval_c3_f[i]
            Json_sd_c3_f.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = magic(avg_c3, i)
            jsonObject['count'] = sd_interval_c3[i]
            Json_sd_c3.append(jsonObject.copy())

            jsonObject.clear()
            jsonObject['category'] = magic(avg_Participation, i)
            jsonObject['count'] = sd_interval_Participation[i]
            Json_sd_Participation.append(jsonObject.copy())

        jsonObject.clear()
        jsonObject['category'] = 'unlimit'
        Json_sd_registeredPersons.append(jsonObject.copy())
        Json_sd_courseNumberOfVideos.append(jsonObject.copy())
        Json_sd_numberOfTestQuestions.append(jsonObject.copy())
        Json_sd_numbersOfPostInForum.append(jsonObject.copy())
        Json_sd_courseLoginCount.append(jsonObject.copy())
        Json_sd_timesOfVideosViewed.append(jsonObject.copy())
        Json_sd_totalTestAnswerNumber.append(jsonObject.copy())
        Json_sd_numberOfForumAreas.append(jsonObject.copy())
        Json_sd_c1.append(jsonObject.copy())
        Json_sd_c2.append(jsonObject.copy())
        Json_sd_c3_v.append(jsonObject.copy())
        Json_sd_c3_q.append(jsonObject.copy())
        Json_sd_c3_f.append(jsonObject.copy())
        Json_sd_c3.append(jsonObject.copy())
        Json_sd_Participation.append(jsonObject.copy())

        to_render['Json_sd_registeredPersons'] = json.dumps(Json_sd_registeredPersons)
        to_render['Json_sd_courseNumberOfVideos'] = json.dumps(Json_sd_courseNumberOfVideos)
        to_render['Json_sd_numberOfTestQuestions'] = json.dumps(Json_sd_numberOfTestQuestions)
        to_render['Json_sd_numbersOfPostInForum'] = json.dumps(Json_sd_numbersOfPostInForum)
        to_render['Json_sd_courseLoginCount'] = json.dumps(Json_sd_courseLoginCount)
        to_render['Json_sd_timesOfVideosViewed'] = json.dumps(Json_sd_timesOfVideosViewed)
        to_render['Json_sd_totalTestAnswerNumber'] = json.dumps(Json_sd_totalTestAnswerNumber)
        to_render['Json_sd_numberOfForumAreas'] = json.dumps(Json_sd_numberOfForumAreas)
        to_render['Json_sd_c1'] = json.dumps(Json_sd_c1)
        to_render['Json_sd_c2'] = json.dumps(Json_sd_c2)
        to_render['Json_sd_c3_v'] = json.dumps(Json_sd_c3_v)
        to_render['Json_sd_c3_q'] = json.dumps(Json_sd_c3_q)
        to_render['Json_sd_c3_f'] = json.dumps(Json_sd_c3_f)
        to_render['Json_sd_c3'] = json.dumps(Json_sd_c3)
        to_render['Json_sd_Participation'] = json.dumps(Json_sd_Participation)

        to_render['sdd_registeredPersons'] = '{:,.1f}'.format(sdd_registeredPersons)
        to_render['sdd_courseNumberOfVideos'] = '{:,.1f}'.format(sdd_courseNumberOfVideos)
        to_render['sdd_numberOfTestQuestions'] = '{:,.1f}'.format(sdd_numberOfTestQuestions)
        to_render['sdd_numbersOfPostInForum'] = '{:,.1f}'.format(sdd_numbersOfPostInForum)
        to_render['sdd_courseLoginCount'] = '{:,.1f}'.format(sdd_courseLoginCount)
        to_render['sdd_timesOfVideosViewed'] = '{:,.1f}'.format(sdd_timesOfVideosViewed)
        to_render['sdd_totalTestAnswerNumber'] = '{:,.1f}'.format(sdd_totalTestAnswerNumber)
        to_render['sdd_numberOfForumAreas'] = '{:,.1f}'.format(sdd_numberOfForumAreas)
        to_render['sdd_c1'] = '{:,.1f}'.format(sdd_c1)
        to_render['sdd_c2'] = '{:,.1f}'.format(sdd_c2)
        to_render['sdd_c3_v'] = '{:,.1f}'.format(sdd_c3_v)
        to_render['sdd_c3_q'] = '{:,.1f}'.format(sdd_c3_q)
        to_render['sdd_c3_f'] = '{:,.1f}'.format(sdd_c3_f)
        to_render['sdd_c3'] = '{:,.1f}'.format(sdd_c3)
        to_render['sdd_Participation'] = '{:,.1f}'.format(sdd_Participation)

        to_render['avg_registeredPersons'] = '{:,.1f}'.format(avg_registeredPersons)
        to_render['avg_courseNumberOfVideos'] = '{:,.1f}'.format(avg_courseNumberOfVideos)
        to_render['avg_numberOfTestQuestions'] = '{:,.1f}'.format(avg_numberOfTestQuestions)
        to_render['avg_numbersOfPostInForum'] = '{:,.1f}'.format(avg_numbersOfPostInForum)
        to_render['avg_courseLoginCount'] = '{:,.1f}'.format(avg_courseLoginCount)
        to_render['avg_timesOfVideosViewed'] = '{:,.1f}'.format(avg_timesOfVideosViewed)
        to_render['avg_totalTestAnswerNumber'] = '{:,.1f}'.format(avg_totalTestAnswerNumber)
        to_render['avg_numberOfForumAreas'] = '{:,.1f}'.format(avg_numberOfForumAreas)
        to_render['avg_c1'] = '{:,.1f}'.format(avg_c1)
        to_render['avg_c2'] = '{:,.1f}'.format(avg_c2)
        to_render['avg_c3_v'] = '{:,.1f}'.format(avg_c3_v)
        to_render['avg_c3_q'] = '{:,.1f}'.format(avg_c3_q)
        to_render['avg_c3_f'] = '{:,.1f}'.format(avg_c3_f)
        to_render['avg_c3'] = '{:,.1f}'.format(avg_c3)
        to_render['avg_Participation'] = '{:,.1f}'.format(avg_Participation)

    return to_render


def interval(data, interval_num, length):
    max = 0
    output = [0 for i in range(length)]
    index = 0

    for i in range(len(data)):
        index = math.ceil(data[i] - 1) / interval_num
        if index < 0:
            index = 0
        elif index > 19:
            index = 19

        output[index] += 1

    return output


def getInterval(data):
    max_num = 0
    for i in range(len(data)):
        if max_num < data[i]:
            max_num = data[i]

    return math.ceil(max_num/10)


def standardization(data):
    output = []
    sumWithAvgRange = 0
    many = len(data)
    avg = float(getListAvg(data))

    # 計算各資料與平均的差距平方和
    for i in range(many):
        sumWithAvgRange = sumWithAvgRange + (float(data[i]) - avg) * (float(data[i]) - avg)

    # 開根號
    StandardDeviationDuration = math.sqrt(sumWithAvgRange / many)

    # 將符合標準的相加
    for i in range(many):
        # 判斷是否在四個標準差內
        if avg + 3 * StandardDeviationDuration > data[i] > avg - 3 * StandardDeviationDuration:
            output.append(data[i])  # 將merge加入Output

    output.append(avg)
    output.append(StandardDeviationDuration)
    return output


def standardization_interval(data, StandardDeviationDuration, avg):
    output = [0 for i in range(12)]
    index = 0
    avg = float('{:.2f}'.format(avg))

    for i in range(len(data)):
        index = int((data[i] - avg) / (StandardDeviationDuration / 2) + 6)
        if index < 0:
            index = 0
        elif index > 11:
            index = 11

        output[index] += 1

    return output


def magic(avg, number):
    s_avg = '{:,.1f}'.format(avg)

    if number == 0:
        return "-3*sd ~"
    elif number == 1:
        return "-2.5*sd ~"
    elif number == 2:
        return "-2*sd ~"
    elif number == 3:
        return "-1.5*sd ~"
    elif number == 4:
        return "-1*sd ~"
    elif number == 5:
        return "-0.5*sd ~ "
    elif number == 6:
        return "~ +0.5*sd"
    elif number == 7:
        return "~ +1*sd"
    elif number == 8:
        return "~ +1.5*sd"
    elif number == 9:
        return "~ +2*sd"
    elif number == 10:
        return "~ +2.5*sd"
    else:
        return "~ +3*sd"


def printData(data, data_i, avg, sd):
    print('___________________________________\n')

    for i in range(len(data)):
        index = int((data[i]-avg) / (sd/2) + 6)

        if index < 0:
            index = 0
        elif index > 11:
            index = 11
        print(str(i) + "\t" + '{:,.2f}'.format(data.get(i))+"\t" + magic(avg, index))

    print("平均\t"+avg)
    print("標準差\t"+sd)
