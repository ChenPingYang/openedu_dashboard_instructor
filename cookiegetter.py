# coding=utf-8

from django.shortcuts import render
import pymysql
from django.conf import settings
from django.db import DatabaseError, connections
from use_function import namedtuplefetchall
import json

# Create your views here.

_COOKIE_NAME_OPENEDU_USER_INFO = 'openedu-user-info'
_COOKIE_NAME_EDX_USER_INFO = 'edx-user-info'


def get_connection():
    with connections['OpenEduDB'].cursor() as cursor:
        return cursor


# 取得Email，有則回傳Email；否則回傳None
def getEmail(request):
    email = None
    if request.COOKIES is not None:
        for key, value in request.COOKIES.items():
            cookie_name = key
            if cookie_name == _COOKIE_NAME_OPENEDU_USER_INFO or cookie_name == _COOKIE_NAME_EDX_USER_INFO:
                username = value
                username = username.replace('054 ', ', ')
                dict_ = dict(username)
                email = getUserEmailByUserName(dict_['username'])

    return email


# 確認是否已經登入
def isLogined(request):
    if request.COOKIES is not None:
        for key in request.COOKIES.keys():
            cookiename = key
            if cookiename == _COOKIE_NAME_OPENEDU_USER_INFO or cookiename == _COOKIE_NAME_EDX_USER_INFO:
                return True
    return False


# 透過Userid取得Email
def getUserEmailById(userid):
    sql = 'SELECT email FROM edxapp.auth_user WHERE id = %s'
    connection = None
    email = None
    with connections['OpenEduDB'].cursor() as cursor:
        cursor.execute(sql, userid)
        email = cursor.fetchone()
        return email


# 透過UserName來取得email
def getUserEmailByUserName(username):
    sql = 'SELECT email FROM edxapp.auth_user WHERE username = %s'
    connection = None
    email = None
    with connections['OpenEduDB'].cursor() as cursor:
        cursor.execute(sql, username)
        email = cursor.fetchone()
        return email


# 透過Email取得UserID
def getUserIDByEmail(email):
    connection = None
    sql = 'SELECT id FROM edxapp.auth_user WHERE email = %s'

    userid = None
    with connections['OpenEduDB'].cursor() as cursor:
        cursor.execute(sql, email)
        userid = cursor.fetchone()
        return userid


# 判斷是否是老師
def isTeacher(userid):
    connection = None
    sql = 'SELECT id FROM edxapp.student_courseaccessrole WHERE role = "instructor" AND user_id = %s'

    isteacher = False
    with connections['OpenEduDB'].cursor() as cursor:
        cursor.execute(sql, userid)
        if cursor.fetchone():
            isteacher = True
            return isteacher


# 取得老師開的課
def get_Teacher_Courses(userid):
    connection = None
    sql = 'SELECT course_id FROM edxapp.student_courseaccessrole WHERE role = "instructor" AND user_id = %s'
    with connections['OpenEduDB'].cursor() as cursor:
        cursor.execute(sql, userid)
        courses = namedtuplefetchall(cursor)
        return courses

