from django.shortcuts import render
from django.http import HttpResponse
from datetime import datetime, timedelta, date
from use_function import namedtuplefetchall, getChooseDate
from django.db import connections
import cookiegetter
import json


def movie_data_view(request):
    request.encoding = 'utf-8'

    if request.method == "GET":
        to_render = {}
        islogin = cookiegetter.isLogined(request)
        list_ = []

        islogin = True
        if islogin is True:
            # userEmail = cookiegetter.getEmail(request)
            # userID = cookiegetter.getUserIDByEmail(userEmail)
            userID = '13'
            if cookiegetter.isTeacher(userID):
                teachersCourse = cookiegetter.get_Teacher_Courses(userID)

                with connections['ResultDB'].cursor() as cursor:
                    # 取得最新統計日期
                    cursor.execute("SELECT 統計日期 "
                                   "FROM edxresult.course_total_data_v2 ORDER BY 統計日期 DESC LIMIT 1")
                    result = namedtuplefetchall(cursor)
                    finalUpdate = result[-1].統計日期

                    # 取得老師擁有的課程資料
                    cursor.execute("SELECT * "
                                   "FROM edxresult.course_total_data_v2 "
                                   "WHERE 統計日期 = %s order by course_id", [finalUpdate])
                    result = namedtuplefetchall(cursor)
                    temp_site = 0
                    data = []
                    for rs in result:
                        for i in range(len(teachersCourse)):
                            if rs.course_id == teachersCourse[i].course_id:
                                data.clear()
                                data.append(rs.課程代碼)
                                data.append(rs.course_id)
                                data.append(rs.course_name)
                                data.append(rs.課程影片數目)
                                data.append(rs.影片平均長度)
                                data.append(rs.影片觀看人數台灣)
                                data.append(rs.影片觀看人數_非台灣)
                                list_.append(data.copy())

                    # 回傳要呈現的資料
                    to_render['result'] = list_
                    # 預設日期範圍的下拉式選單，預設值為1:-請選擇-
                    to_render['select'] = 1
                    to_render['finalUpdate'] = "最後資料更新時間 : " + finalUpdate

                to_render['IsLogin'] = 1
                print('teacher')
                return render(request, '2_MovieData.html', to_render)

            else:
                print("student")
                to_render['IsLogin'] = 2
                return render(request, '2_MovieData.html', to_render)

        else:
            print('not login')
            to_render['IsLogin'] = 2
            return render(request, '2_MovieData.html', to_render)

    if request.method == 'POST':
        list_ = []
        to_render = {}

        # 資料庫最後更新時間
        finalUpdate = None

        # 經由判斷後取得的使用者選擇的開課日期，從介面中的開課日期及日期範圍的值取得
        D_userChooseStartDate = None

        # 日期範圍
        select = request.POST.get('select', None)

        # 開課日期
        S_startDate = request.POST.get('startDate', None)

        # radio： 開課中、即將開課、已結束、全部課程，之後簡稱為radio
        optradio = request.POST.get('optradio', None)

        # 開課日期相關的資料庫語法
        date_ = None

        # 當日期範圍值不是1(-請選擇-)或開課日期不是空字串，代表使用者有使用日期的搜尋
        if select != '1' or S_startDate != '':
            # 將值傳入function取得資料庫語法需要的值，因為開課日期跟日期範圍，其實意義相同，只是設定方式不同
            D_userChooseStartDate = getChooseDate(select, S_startDate)

            # 若日期範圍的值是1(-請選擇-)，代表使用者選擇的日期條件是開課日期，這兩個條件一定是二選一的，不可能共存
            if select == '1':
                # 設定值為1，為了回傳到html後使用者所輸入的值不會被初始化
                to_render['select'] = 1
                to_render['selectStartDate'] = S_startDate

                # 僅提供給DownloadServlet，因為DownloadServlet是透過網址，取得介面上的值較為麻煩，所以在此設定
                for_download = datetime.strptime(S_startDate, '%Y-%m-%d')
                to_render['selectStartDate_forDownload'] = for_download.strftime('%Y%m%d')
            else:
                to_render['select'] = select
                to_render['selectStartDate'] = '年/月/日'
                to_render['selectStartDate_forDownload'] = 'no'

            date_ = "AND start_date > '" + D_userChooseStartDate + "'"

        # 進入else代表使用者沒有使用日期搜尋
        else:
            date_ = ''
            to_render['select'] = 1
            to_render['selectStartDate'] = '年/月/日'
            to_render['selectStartDate_forDownload'] = 'no'

        # 若使用者選擇已結束或是即將開課，即將日期語法清除，因為已結束或即將開課都不適用日期搜尋
        if (optradio == '2') or (optradio == '3'):
            date_ = ''
            to_render['select'] = 1
            to_render['selectStartDate'] = '年/月/日'
            to_render['selectStartDate_forDownload'] = 'no'

        now = datetime.today().strftime('%Y-%m-%d')
        to_render['optradio'] = optradio

        # 老師的信箱、ID、擁有的課程
        userEmail = cookiegetter.getEmail(request)
        userID = cookiegetter.getUserIDByEmail(userEmail)
        teachersCourse = cookiegetter.get_Teacher_Courses(userID)

        # radio的四種資料庫語法
        radio = []
        now = datetime.today().strftime("%Y-%m-%d")
        radio.append("AND (start_date < '" + now + "' AND (end_date > '" + now + "' OR end_date = 'NA'))")
        radio.append("")
        radio.append("AND (start_date > '" + now + "' AND start_date != '2030-01-01')")
        radio.append("AND (start_date < '" + now + "' AND end_date < '" + now + "')")

        with connections['ResultDB'].cursor() as cursor:
            # 取得最新統計日期
            cursor.execute("SELECT 統計日期 "
                           "FROM edxresult.course_total_data_v2 ORDER BY 統計日期 DESC LIMIT 1")
            result = namedtuplefetchall(cursor)
            finalUpdate = result[-1].統計日期

            # 依據使用者選擇的條件，取得資料
            cursor.execute("select * "
                           "from course_total_data_v2 "
                           "where 統計日期 = %s" + date_ + radio[int(optradio)], [finalUpdate])
            result = namedtuplefetchall(cursor)

            data = []
            list_ = []
            for rs in result:
                for i in range(len(teachersCourse)):
                    if rs.course_id == teachersCourse[i].course_id:
                        data.clear()
                        data.append(rs.課程代碼)
                        data.append(rs.course_id)
                        data.append(rs.course_name)
                        data.append(rs.課程影片數目)
                        data.append(rs.影片平均長度)
                        data.append(rs.影片觀看人數台灣)
                        data.append(rs.影片觀看人數_非台灣)
                        list_.append(data.copy())

            to_render['result'] = list_
            to_render['finalUpdate'] = "最後資料更新時間 : " + finalUpdate
            for_download = datetime.strptime(finalUpdate, '%Y-%m-%d')
            to_render['finalUpdate_forDownload'] = for_download.strftime('%Y%m%d')

        return render(request, '2_MovieData.html', to_render)
