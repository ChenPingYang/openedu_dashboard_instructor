"""
Django settings for openedu_dashboard_instructor project.

Generated by 'django-admin startproject' using Django 2.1.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.1/ref/settings/
"""

import os
import pymysql

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'hlr570c577)i#j%e$#2l_*nkkarl!78z8(j#^5fh(k&zzahgri'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['182.155.160.106', '127.0.0.1']

# Application definition
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'test1',
    'AfterSurvey',
    'AnalysisCourse',
    'AnalysisGroup',
    'AnalysisStudent',
    'AnalysisVideo',
    'BasicCourseData',
    'BeforeSurvey',
    'ChartData',
    'ForumData',
    'index',
    'MovieData',
    'Practive',
    'VideoTimeAnalysis',
    'Glossary'
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'openedu_dashboard_instructor.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'openedu_dashboard_instructor.wsgi.application'

# Database
# https://docs.djangoproject.com/en/2.1/ref/settings/#databases
pymysql.install_as_MySQLdb()
DATABASES = {
    'default': {},

    'LocalDB': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'edxresult',
        'USER': 'root',
        'PASSWORD': 'qqaa8888',
        'HOST': 'localhost',
        'PORT': '3306',

        # 'ENGINE': 'django.db.backends.mysql',
        # 'NAME': 'survey',
        # 'USER': '',
        # 'PASSWORD': '',
        # 'HOST': '127.0.0.1',
        # 'PORT': '3306',
    },

    'OpenEduDB': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'edxapp',
        'USER': 'fcu',
        'PASSWORD': 'hq1EvnJs+v73UybA45Bd5q1fDP2bvl4b7YobLYD7iamJ9dLDY5Qa8fKsyVj59UjF',
        'HOST': 'localhost',
        'PORT': '3307',
        # 'ENGINE': 'django.db.backends.mysql',
        # 'NAME': 'edxapp',
        # 'USER': 'fcu',
        # 'PASSWORD': 'hq1EvnJs+v73UybA45Bd5q1fDP2bvl4b7YobLYD7iamJ9dLDY5Qa8fKsyVj59UjF',
        # 'HOST': '127.0.0.1',
        # 'PORT': '3302',

    },

    'ResultDB': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'edxresult',
        'USER': 'root',
        'PASSWORD': 'selab01',
        'HOST': 'localhost',
        'PORT': '3308',

        # 'ENGINE': 'django.db.backends.mysql',
        # 'NAME': 'edxresult',
        # 'USER': 'student',
        # 'PASSWORD': '264c8c381bf16c982a4e59b0dd4c6f7808c51a05f64c35db42cc78a2a72875bb',
        # 'HOST': '192.168.1.11',
        # 'PORT': '3309',

    },

    'SelabDB': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'edxresult',
        'USER': 'root',
        'PASSWORD': 'qqaa8888',
        'HOST': 'localhost',
        'PORT': '3306',

        # 'ENGINE': 'django.db.backends.mysql',
        # 'NAME': 'ShareCourse',
        # 'USER': 'student',
        # 'PASSWORD': '264c8c381bf16c982a4e59b0dd4c6f7808c51a05f64c35db42cc78a2a72875bb',
        # 'HOST': '140.134.26.84',
        # 'PORT': '3309',
    },

    'SurveyDB': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'edxresult',
        'USER': 'root',
        'PASSWORD': 'selab01',
        'HOST': 'localhost',
        'PORT': '3308',


        # 'ENGINE': 'django.db.backends.mysql',
        # 'NAME': 'survey',
        # 'USER': 'student',
        # 'PASSWORD': '264c8c381bf16c982a4e59b0dd4c6f7808c51a05f64c35db42cc78a2a72875bb',
        # 'HOST': '192.168.1.11',
        # 'PORT': '3309',

    },

    'test1': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'edxresult',
        'USER': 'root',
        'PASSWORD': 'qqaa8888',
        'HOST': 'localhost',
        'PORT': '3306',
    },

}

# Password validation
# https://docs.djangoproject.com/en/2.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Internationalization
# https://docs.djangoproject.com/en/2.1/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.1/howto/static-files/

STATIC_URL = '/static/'

STATICFILES_DIRS = (
    os.path.join("D:/Anley/PyCharm/openedu_dashboard_instructor/static/"),
)

STATICFILES_FINDERS = {
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
}