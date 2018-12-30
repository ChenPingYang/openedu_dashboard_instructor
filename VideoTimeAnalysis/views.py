from django.shortcuts import render
import json
from use_function import namedtuplefetchall
from django.db import connections


# Create your views here.
def video_time_analysis_view(request):
    request.encoding = 'utf-8'
    to_render = {}

    if request.method == 'GET':
        to_render = doGet(request)
    if request.method == 'POST':
        to_render = doGet(request)

    return render(request, 'VideoTimeAnalysis.html', to_render)


def doGet(request):
    to_render = {}
    video = request.GET.get('video', False)

    with connections['ResultDB'].cursor() as cursor:
        cursor.execute("SELECT video_time FROM course_material_data WHERE video = %s", [video])
        result = namedtuplefetchall(cursor)

        videoLong = int(result[0].video_time) - 1

        viewTimes = [0 for i in range(videoLong+1)]
        startTimes = [0 for i in range(videoLong+1)]
        endTimes = [0 for i in range(videoLong+1)]

        cursor.execute("SELECT start_video_time,end_video_time "
                       "FROM video_watch_activity "
                       "WHERE module_id = %s and event = 'play' and end_video_time > 0", [video])
        result = namedtuplefetchall(cursor)

        for rs in result:
            startTime = int(rs.start_video_time)
            endTime = int(rs.end_video_time)

            if startTime > videoLong:
                startTime = videoLong

            if endTime > videoLong:
                endTime = videoLong

            if startTime > endTime:
                startTime = 0

            startTimes[startTime] = startTimes[startTime] + 1
            endTimes[endTime] = endTimes[endTime] + 1
            for i in range(startTime, endTime+1):
                viewTimes[i] = viewTimes[i] + 1

        jsonObject = {}
        json_viewRecord = []
        for i in range(len(viewTimes)):
            jsonObject.clear()
            jsonObject['int'] = i
            jsonObject['value'] = viewTimes[i]
            jsonObject['start'] = startTimes[i]
            jsonObject['end'] = endTimes[i]
            json_viewRecord.append(jsonObject.copy())

        to_render['viewRecord'] = json.dumps(json_viewRecord)
        to_render['haveData'] = 1

    return to_render



