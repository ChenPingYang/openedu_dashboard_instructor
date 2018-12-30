"""openedu_dashboard_instructor URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from test1.views import test1_view
from AfterSurvey.views import after_survey_view
from AnalysisCourse.views import analysis_course_view
from AnalysisGroup.views import analysis_group_view
from AnalysisStudent.views import analysis_student_view
from AnalysisVideo.views import analysis_video_view
from BasicCourseData.views import basic_course_data_view
from BeforeSurvey.views import before_survey_view
from ChartData.views import chart_data_view
from ForumData.views import forum_data_view
from index.views import index_view
from MovieData.views import movie_data_view
from Practive.views import practive_view
from VideoTimeAnalysis.views import video_time_analysis_view
from Glossary.views import glossary_view

urlpatterns = [
    path('admin/', admin.site.urls),
    path('test1/', test1_view),
    path('BasicCourseDataServlet_instructor/', basic_course_data_view, name='BasicCourseDataServlet_instructor'),
    path('MovieDataServlet_instructor/', movie_data_view, name='MovieDataServlet_instructor'),
    path('ForumDataServlet_instructor/', forum_data_view, name='ForumDataServlet_instructor'),
    path('PractiveServlet_instructor/', practive_view, name='PractiveServlet_instructor'),
    path('afterSurveyServlet_instructor/', after_survey_view, name ='AfterSurveyServlet_instructor'),
    path('AnalysisCourseServlet_instructor/', analysis_course_view, name = 'AnalysisCourse_instructor'),
    path('AnalysisGroupServlet_instructor/', analysis_group_view, name ='AnalysisGroup_instructor'),
    path('AnalysisStudentServlet_instructor/', analysis_student_view, name ='AnalysisStudent_instructor'),
    path('AnalysisVideoServlet_instructor/', analysis_video_view, name = 'AnalysisVideo_instructor'),
    path('BeforeSurveyServlet_instructor/', before_survey_view, name = 'BeforeSurveyServlet_instructor'),
    path('ChartDataServlet/', chart_data_view, name = 'detailAndChart_instructor'),
    path('glossary_instructor/', glossary_view, name = 'glossary_instructor'),
    path('index_instructor/', index_view, name = 'index_instructor'),
    path('VideoTimeAnalysis_instructor/', video_time_analysis_view, name = 'VideoTimeAnalysis_instructor')
]
