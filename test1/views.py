from django.shortcuts import render
from django.db import connections, DatabaseError
from collections import namedtuple


def namedtuplefetchall(cursor):
    desc = cursor.description
    nt_result = namedtuple('Result', [col[0] for col in desc])
    return [nt_result(*row) for row in cursor.fetchall()]


# Create your views here.
def test1_view(request):
    to_render = {}

    with connections['test1'].cursor() as cursor:
        sql = 'course_total_data_v2'
        radio = 2016
        wildcard = "and duration_week is not NULL"

        cursor.execute(
            "select * "
            "from course_total_data "
            "where 課程代碼 = 'C01' ")
        result = namedtuplefetchall(cursor)

        to_render['ttt'] = result

    return render(request, 'test1.html', to_render)



