import decimal
from datetime import datetime, timedelta
from dateutil.relativedelta import relativedelta
from collections import namedtuple
from django.db import connections
from django.db import DatabaseError
import math
import json


def namedtuplefetchall(cursor):
    desc = cursor.description
    nt_result = namedtuple('Result', [col[0] for col in desc])
    return [nt_result(*row) for row in cursor.fetchall()]


def getChooseDate(choose, S_startDate):
    now = datetime.today()
    if choose != '1':
        if choose == 'A':
            now = now + relativedelta(months = -1)
        elif choose == 'B':
            now = now + relativedelta(months = -6)
        elif choose == 'C':
            now = now + relativedelta(years = -1)
        elif choose == 'D':
            now = now + relativedelta(years = -20)
        return now.strftime('%Y-%m-%d')

    else:
        S_startDate = datetime.strptime(S_startDate, '%Y-%m-%d')
        return S_startDate.strftime('%Y-%m-%d')


def getCourseData(course_id):
    output = []
    try:
        cursor = connections['ResultDB'].cursor()  # ResultDB
        cursor.execute("select max(統計日期) as date from course_total_data_v2")
        result = namedtuplefetchall(cursor)

        update = result[-1].date

        cursor.execute(
            "SELECT 註冊人數,course_name,課程代碼 "
            "FROM course_total_data_v2 "
            "WHERE course_id = %s AND 統計日期 = %s",
            [course_id, update]
        )
        result = namedtuplefetchall(cursor)

        output.append(result[-1].課程代碼)
        output.append(result[-1].course_name)
        output.append(result[-1].註冊人數)

    except DatabaseError:
        print('資料獲取失敗')

    return output


def getCourseIDByCourseCode(CourseCode):
    courseID = ''
    with connections['ResultDB'].cursor() as cursor:
        cursor.execute("select 課程代碼,course_id from course_total_data_v2 ")
        result = namedtuplefetchall(cursor)

        for rs in result:
            if rs.課程代碼 == CourseCode:
                courseID = rs.course_id

    return courseID


def getRegisteredPersonsAndCourseCodeByCourseID(courseID):
    output = [None for i in range(2)]
    with connections['ResultDB'].cursor() as cursor:
        cursor.execute("select 註冊人數,course_id,課程代碼 from course_total_data_v2 WHERE course_id = %s", [courseID])
        result = namedtuplefetchall(cursor)

        for rs in result:
            if rs.course_id == courseID:
                output[0] = rs.註冊人數
                output[1] = rs.課程代碼
    return output


def removeExtremum(data):
    absoluteDistance = []
    newData = []
    count = 0

    # 取得中位數
    if len(data) % 2 == 1:
        Median = data[(len(data)+1)/2]
    else:
        Median = (data[len(data)/2] + data[len(data)/2+1]) / 2

    number = []
    # 取得所有資料與中位數的距離絕對值
    for i in range(len(data)):
        number.clear()
        number.append(i)
        number.append(abs(Median - data[i]))
        absoluteDistance.append(number.copy())

    # 排序
    absoluteDistance.sort(key=lambda x: x[1])

    # 取得所有資料與中位數的距離絕對值的中位數
    if len(absoluteDistance) % 2 == 1:
        MAD = absoluteDistance[int((len(absoluteDistance)+1)/2)][1]
    else:
        MAD = (absoluteDistance[int(len(absoluteDistance)/2)][1] + absoluteDistance[int(len(absoluteDistance)/2+1)][1])/2

    # 若MAD為零，抓一個最小的值取代MAD
    if MAD == 0:
        for i in range(len(absoluteDistance)):
            if data[i] != 0:
                MAD = absoluteDistance[i][1]
                break

    # 判斷Z分數，大於2.24移除
    for i in range(len(data)):
        Z = absoluteDistance[i][1] / (MAD/0.6745)
        if Z < 2.24:
            newData.append(data[absoluteDistance[i][0]])
            count = i
            # if count < absoluteDistance[i][0]:
            #    count = absoluteDistance[i][0]

    # 排序
    newData.sort()
    newData.append(count)

    return newData


def getListAvg(data):
    sum_ = 0
    for i in range(len(data) - 1):
        sum_ = sum_ + data[i]

    return sum_/len(data)


def getBoxPlotValue(data):
    if len(data) == 0:
        data.append(0.0)
    # 排序
    data.sort()

    output = [0, 0, 0, 0, 0]
    size = len(data)
    output[0] = float(data[size-1])
    output[1] = float(data[int((size-1) * 0.75)])
    output[2] = float(data[int((size-1) * 0.5)])
    output[3] = float(data[int((size-1) * 0.25)])
    output[4] = float(data[0])

    return output


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
        # 判斷是否在兩個標準差內
        if avg + 2*StandardDeviationDuration > data[i] > avg - 2*StandardDeviationDuration:
            output.append(data[i])  # 將merge加入Output

    return output


def CorrelationCoefficient(xList, yList, xAvg, yAvg):
    size = len(xList)
    sumWithAvgRange_XY = 0
    sumWithAvgRange_X = 0
    sumWithAvgRange_Y = 0

    # 計算各種離均平方
    for i in range(size):
        sumWithAvgRange_XY = sumWithAvgRange_XY + float(xList[i] - xAvg) * float(yList[i] - yAvg)
        sumWithAvgRange_X = sumWithAvgRange_X + float(xList[i] - xAvg) * float(xList[i] - xAvg)
        sumWithAvgRange_Y = sumWithAvgRange_Y + float(yList[i] - yAvg) * float(yList[i] - yAvg)

    # 計算相關係數
    cc = sumWithAvgRange_XY / (math.sqrt(sumWithAvgRange_X) * math.sqrt(sumWithAvgRange_Y))

    return cc


def standardizationForCorrelationCoefficient(data1, data2):
    sumWithAvgRange = 0
    size = len(data1)
    avg = float(getListAvg(data1))
    output = []

    # 計算各資料與平均的差距平方和
    for i in range(size):
        sumWithAvgRange = sumWithAvgRange + (float(data1[i]) - avg) * (float(data1[i]) - avg)

    # 開根號
    StandardDeviationDuration = math.sqrt(sumWithAvgRange / size)

    # 將符合標準的加到輸出的list
    for i in range(size):
        # 判斷是否在兩個標準差內
        if avg + 2 * StandardDeviationDuration > data1[i] > avg - 2 * StandardDeviationDuration:
            merge = [data1[i], data2[i]]
            output.append(merge)

    return output


class DecimalEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, decimal.Decimal):
            return float(o)
        return super(DecimalEncoder, self).default(o)