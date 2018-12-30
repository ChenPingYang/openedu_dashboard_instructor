from django.shortcuts import render
import json
from use_function import namedtuplefetchall
from django.db import connections


# Create your views here.
def analysis_video_view(request):
    request.encoding = 'utf-8'

    if request.method == 'GET':
        to_render = {}
        course = request.GET.get('course', None)

        with connections['ResultDB'].cursor() as cursor:
            # 顯示資料
            cursor.execute(
                "SELECT max(統計日期) as max_update FROM course_total_data_v2"
            )
            result = namedtuplefetchall(cursor)

            maxUpdate = result[-1].max_update

            cursor.execute(
                "SELECT course_id FROM course_total_data_v2 where 課程代碼 = %s and 統計日期 = %s", [course, maxUpdate]
            )
            result = namedtuplefetchall(cursor)

            course_id = result[-1].course_id

            cursor.execute(
                "SELECT chapter_name,video_name,video,count(distinct(user_id)) as c_uid"
                "FROM  video_activity as t_table INNER JOIN course_material_data as c_table on  (t_table.module_id=c_table.video ) "
                "WHERE t_table.course_id= %s and c_table.course_id = %s and event='play' group by video,video_name ,chapter_name",
                [course_id, course_id]
            )
            result = namedtuplefetchall(cursor)

            jsonArray_temp_1 = []
            jsonArray_sequential_name = []

            for rs in result:
                chapter_name = rs.chapter_name
                video_name = rs.video_name
                countSequential = rs.c_uid
                jsonArray_temp_1.clear()
                jsonArray_temp_1.append(chapter_name)
                jsonArray_temp_1.append(video_name)
                jsonArray_temp_1.append("VideoTimeAnalysis?video=" + rs.video)
                jsonArray_temp_1.append(countSequential)
                jsonArray_sequential_name.append(jsonArray_temp_1.copy())

        to_render['jsonArray_sequential_name'] = jsonArray_sequential_name

        return render(request, 'analysisVideo.html', to_render)

