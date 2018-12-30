from django.shortcuts import render
from datetime import datetime, timedelta, date
from use_function import namedtuplefetchall, getCourseIDByCourseCode, removeExtremum, getListAvg
from django.db import connections
import cookiegetter
import DefinitionString
import ast


def chart_data_view(request):
    request.encoding = 'utf-8'
    to_render = {}

    if request.method == 'GET':
        to_render = doGet(request)
    if request.method == 'POST':
        to_render = doGet(request)

    return render(request, 'detailAndChart.html', to_render)


def doGet(request):
    to_render = {}
    mode = request.GET.get('mode', None)
    course = request.GET.get('course', None)
    haveThisCourse = False
    beforeSurveyData = ['0', '0', '0', '0', '0']
    afterSurveyData = ['0', '0']
    beforeSurveyAdvice = []
    afterSurveyAdvice = []
    islogin = cookiegetter.isLogined(request)

    islogin = True
    if islogin:
        # userEmail = cookiegetter.getEmail(request)
        # userID = cookiegetter.getUserIDByEmail(userEmail)
        userID = '13'
        if cookiegetter.isTeacher(userID):
            teachersCourse = cookiegetter.get_Teacher_Courses(userID)
            for i in range(len(teachersCourse)):
                if getCourseIDByCourseCode(course) == teachersCourse[i].course_id:
                    checkAfter = False
                    checkBefore = False

                    with connections['ResultDB'].cursor() as cursor:
                        # course_total_data_v2 更新日期
                        cursor.execute("SELECT max(統計日期) as date "
                                       "FROM course_total_data_v2 "
                                       "WHERE 課程代碼 = %s", [course])
                        result = namedtuplefetchall(cursor)

                        update_course_total_data = result[-1].date

                        cursor.execute("SELECT * "
                                       "FROM course_total_data_v2 "
                                       "WHERE 課程代碼 = %s and 統計日期 = %s", [course, update_course_total_data])
                        result = namedtuplefetchall(cursor)

                        # ------顯示資料------

                        courseCode = result[-1].課程代碼
                        courseId = result[-1].course_id
                        courseName = result[-1].course_name
                        startDate = result[-1].start_date
                        endDate = result[-1].end_date
                        totalRegisteredPersons = result[-1].註冊人數
                        duration_week = str(result[-1].duration_week)

                        if duration_week == 'NA' or duration_week == '' or duration_week == '0':
                            today = datetime.today()
                            day = (today-datetime.strptime(startDate, '%Y-%m-%d')).days / 7
                            duration_week = str(day)

                        registeredPersons_Taiwan = result[-1].註冊人數_台灣
                        registeredPersons_Foreign = result[-1].註冊人數_非台灣
                        withdrawnPersons = result[-1].退選人數
                        age_17 = result[-1].age_17
                        age_18_25 = result[-1].age_18_25
                        age_26_ = result[-1].age_26_
                        Participation = '{:,.2f}'.format(result[-1].熱門參與度)
                        c1 = '{:,.2f}'.format(result[-1].c1)
                        c2 = '{:,.2f}'.format(result[-1].c2)
                        c3 = '{:,.2f}'.format(result[-1].c3)
                        certificate = result[-1].證書人數
                        if certificate is None:
                            certificate = '0'

                        courseNumberOfVideos = '{:,.2f}'.format(result[-1].課程影片數目)
                        averageLengthOfVideos = '{:,.2f}'.format(float(result[-1].影片平均長度) / 60)
                        numberOfVideosViewed = '{:,.2f}'.format(int(result[-1].影片觀看人數台灣) + int(result[-1].影片觀看人數_非台灣))
                        NOVV_moreThanHalf = '{:,.2f}'.format(int(result[-1].影片觀看過半人數_台灣) + int(result[-1].影片觀看過半人數_非台灣))
                        timesOfVideosViewed = '{:,.2f}'.format(int(result[-1].影片觀看人次_台灣) + int(result[-1].影片觀看人次_非台灣))
                        totalTestAnswerNumber = '{:,.2f}'.format(result[-1].總作答數)

                        numberOfTestQuestions = '{:,.2f}'.format(result[-1].測驗題數量)
                        answerRatio = '{:,.2f}'.format(float(result[-1].練習題作答率) * 100) + '%'
                        answerRate = '{:,.2f}'.format(float(result[-1].練習題答對率) * 100) + '%'
                        answerHalfAmount = '{:,.2f}'.format(result[-1].作答過半人數)

                        numbersOfPostInForum = '{:,.2f}'.format(result[-1].討論區發文數)
                        forumParticiPationRates = '{:,.2f}'.format(float(result[-1].討論區參與度) * 100) + '%'
                        numbersOfForum = '{:,.2f}'.format(result[-1].討論區討論次數)
                        numberOfForumAreas = str(result[-1].討論區回應數)

                        education_doctor = result[-1].博士
                        education_master = result[-1].碩士
                        education_Bachelo = result[-1].學士
                        education_Associate = result[-1].副學士
                        education_senior = result[-1].高中
                        education_junior = result[-1].國中
                        education_primary = result[-1].國小
                        male = result[-1].男性
                        female = result[-1].女性

                        cursor.execute("SELECT * "
                                       "FROM course_total_data_v2 "
                                       "WHERE 統計日期 = %s", [update_course_total_data])
                        result = namedtuplefetchall(cursor)

                        allCourse = []
                        for rs in result:
                            allCourse.append(str(rs.課程代碼) + "#\t" + str(rs.course_name))

                        cursor.execute(
                            "SELECT a.*,b.name "
                            "FROM course_country_total_data as a ,edxresult.country as b "
                            "WHERE a.country = b.ab and a.C = %s and run_date = %s order by a.user_count desc",
                            [course, update_course_total_data]
                        )
                        result = namedtuplefetchall(cursor)

                        countryDataList = []
                        countryDataTotal = [0, 0, 0]
                        countryData = [None, None, None, None]
                        for rs in result:
                            user_count = rs.user_count
                            watch_count = rs.watch_count
                            certificate_count = rs.certificate

                            countryData[0] = str(rs.name)
                            countryData[1] = str(user_count)
                            countryData[2] = str(watch_count)
                            countryData[3] = str(certificate_count)
                            countryDataList.append(countryData.copy())

                            countryDataTotal[0] += user_count
                            countryDataTotal[1] += watch_count
                            countryDataTotal[2] += certificate_count

                        to_render['countryDataList'] = countryDataList
                        to_render['countryDataTotal'] = countryDataTotal
                        to_render['courseCode'] = courseCode
                        to_render['courseId'] = courseId
                        to_render['courseName'] = courseName
                        to_render['startDate'] = startDate
                        to_render['endDate'] = endDate
                        to_render['registeredPersons_Taiwan'] = registeredPersons_Taiwan
                        to_render['registeredPersons_Foreign'] = registeredPersons_Foreign
                        to_render['withdrawnPersons'] = withdrawnPersons
                        to_render['Participation'] = Participation
                        to_render['c1'] = c1
                        to_render['c2'] = c2
                        to_render['c3'] = c3

                        to_render['certificate'] = certificate
                        to_render['age_17'] = age_17
                        to_render['age_18_25'] = age_18_25
                        to_render['age_26_'] = age_26_

                        to_render['courseNumberOfVideos'] = courseNumberOfVideos
                        to_render['averageLengthOfVideos'] = averageLengthOfVideos
                        to_render['numberOfVideosViewed'] = numberOfVideosViewed
                        to_render['NOVV_moreThanHalf'] = NOVV_moreThanHalf
                        to_render['timesOfVideosViewed'] = timesOfVideosViewed

                        to_render['numberOfTestQuestions'] = numberOfTestQuestions
                        to_render['answerRatio'] = answerRatio
                        to_render['totalTestAnswerNumber'] = totalTestAnswerNumber
                        to_render['answerRate'] = answerRate
                        to_render['answerHalfAmount'] = answerHalfAmount

                        to_render['numbersOfForum'] = numbersOfForum
                        to_render['numbersOfPostInForum'] = numbersOfPostInForum
                        to_render['forumParticiPationRates'] = forumParticiPationRates
                        to_render['numberOfForumAreas'] = numberOfForumAreas

                        to_render['education_doctor'] = education_doctor
                        to_render['education_master'] = education_master
                        to_render['education_Bachelo'] = education_Bachelo
                        to_render['education_Associate'] = education_Associate
                        to_render['education_senior'] = education_senior
                        to_render['education_junior'] = education_junior
                        to_render['education_primary'] = education_primary
                        to_render['duration_week'] = duration_week

                        to_render['totalRegisteredPersons'] = totalRegisteredPersons
                        to_render['allCourse'] = allCourse
                        to_render['mode'] = mode
                        to_render['update_course_total_data'] = update_course_total_data
                        to_render['male'] = male
                        to_render['female'] = female

                    with connections['SurveyDB'].cursor() as cursor:
                        # 課前問卷
                        beforeCourseSatisfaction = []
                        beforePlatformSatisfaction = []

                        cursor.execute(
                            "SELECT * "
                            "FROM survey.recent_report "
                            "WHERE course_id = %s and survey_id = '15'", [courseId]
                        )
                        result = namedtuplefetchall(cursor)

                        checkBefore = False
                        j = []
                        maxRS = 0
                        for rs in result:
                            checkBefore = True
                            selection1 = 0
                            selection2 = 0
                            selection3 = 0
                            answer4 = None

                            json = result[i].questions
                            json = json[1:-1]
                            json = json.replace('false', 'False')
                            json = json.replace('true', 'True')
                            jsonFirstArray = ast.literal_eval(json)
                            jsonProblem = jsonFirstArray['problems']

                            jsonQuestionOne = jsonProblem[0]
                            selection1 = int(jsonQuestionOne['select'])

                            jsonQuestionTwo = jsonProblem[1]
                            selection2 = int(jsonQuestionTwo['select'])

                            jsonQuestionThree = jsonProblem[2]
                            selection3 = int(jsonQuestionThree['select'])

                            jsonQuestionFour = jsonProblem[3]
                            answer4 = str(jsonQuestionFour['answer'])

                            beforeSurveyData[0 + selection1] = str(int(beforeSurveyData[0 + selection1]) + 1)
                            beforeSurveyData[3] = str(int(beforeSurveyData[3]) + (selection2 - 5) * (-1))
                            beforeSurveyData[4] = str(int(beforeSurveyData[4]) + (selection3 - 5) * (-1))

                            beforeCourseSatisfaction.append((selection2 - 5) * (-1))
                            beforePlatformSatisfaction.append((selection3 - 5) * (-1))

                            if answer4 != '':
                                beforeSurveyAdvice.append(answer4)

                            maxRS += 1

                        if maxRS == 0:
                            maxRS = 1

                        beforeSurveyData[3] = '{:,.2f}'.format(float(beforeSurveyData[3]) / maxRS)
                        beforeSurveyData[4] = '{:,.2f}'.format(float(beforeSurveyData[4]) / maxRS)

                        to_render['beforeSurveyAdvice'] = beforeSurveyAdvice
                        to_render['beforeSurveyData'] = beforeSurveyData
                        to_render['checkBefore'] = checkBefore
                        to_render['beforeCourseSatisfaction'] = beforeCourseSatisfaction
                        to_render['beforePlatformSatisfaction'] = beforePlatformSatisfaction

                        # 課後問卷
                        cursor.execute(
                            "SELECT * "
                            "FROM survey.recent_report "
                            "WHERE course_id = %s and survey_id = '16'", [courseId]
                        )
                        result = namedtuplefetchall(cursor)

                        afterCourseSatisfaction = []
                        afterPlatformSatisfaction = []
                        maxRS = 0
                        checkAfter = False
                        j = []

                        for rs in result:
                            checkAfter = True
                            selection1 = 0
                            selection2 = 0
                            answer3 = None

                            json = result[i].questions
                            json = json[1:-1]
                            json = json.replace('false', 'False')
                            json = json.replace('true', 'True')
                            jsonFirstArray = ast.literal_eval(json)
                            jsonProblem = jsonFirstArray['problems']

                            jsonQuestionOne = jsonProblem[0]
                            selection1 = int(jsonQuestionOne['select'])

                            jsonQuestionTwo = jsonProblem[1]
                            selection2 = int(jsonQuestionTwo['select'])

                            jsonQuestionThree = jsonProblem[2]
                            answer3 = int(jsonQuestionThree['answer'])

                            afterSurveyData[0] = str(int(afterSurveyData[0]) + (selection1 - 5) * (-1))
                            afterSurveyData[1] = str(int(afterSurveyData[1]) + (selection2 - 5) * (-1))

                            afterCourseSatisfaction.append((selection1 - 5) * (-1))
                            afterPlatformSatisfaction.append((selection2 - 5) * (-1))

                            if answer3 != '':
                                afterSurveyAdvice.append(answer3)

                            maxRS += 1

                        if maxRS == 0:
                            maxRS = 1

                        afterSurveyData[0] = '{:,.2f}'.format(float(afterSurveyData[0]) / maxRS)
                        afterSurveyData[1] = '{:,.2f}'.format(float(afterSurveyData[1]) / maxRS)

                        to_render['afterSurveyAdvice'] = afterSurveyAdvice
                        to_render['afterSurveyData'] = afterSurveyData
                        to_render['checkAfter'] = checkAfter
                        to_render['afterCourseSatisfaction'] = afterCourseSatisfaction
                        to_render['afterPlatformSatisfaction'] = afterPlatformSatisfaction

                    to_render['beforeSurveyAdvice'] = beforeSurveyAdvice
                    to_render['beforeSurveyData'] = beforeSurveyData
                    to_render['checkBefore'] = checkBefore
                    to_render['afterSurveyAdvice'] = afterSurveyAdvice
                    to_render['afterSurveyData'] = afterSurveyData
                    to_render['checkAfter'] = checkAfter
                    to_render['definition'] = DefinitionString.DefinitionString().getDefinitionList()
                    to_render['calculation'] = DefinitionString.DefinitionString().getCalculation()

                    haveThisCourse = True
                    break

            if haveThisCourse is False:
                print('not have')
                to_render['IsLogin'] = 2

        else:
            print('student')
            to_render['IsLogin'] = 2
    else:
        print('not login')
        to_render['IsLogin'] = 2

    return to_render
