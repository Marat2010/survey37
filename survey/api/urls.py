from django.urls import path, include
from .views import index, doc_api
from .views import SurveyListView, SurveyDetailView
    # SurveysListView, QuestionsListView, AnswersListView, \
    # SurveyDetailView, SurveyQuestionView, QuestionDetailView, UserAnswersViewSet

# from .views import AnswerViewSet, QuestionViewSet, SurveyViewSet, UserAnswerViewSet,\
#     SurveyListView, SurveyDetailView
from rest_framework.routers import DefaultRouter
# router = DefaultRouter()
# # router.register('answer', AnswerViewSet)
# router.register('question', QuestionViewSet)
# router.register('survey', SurveyViewSet)
# router.register('user_answer', UserAnswerViewSet)
# router = DefaultRouter()
# router.register('survey', SurveyListView)

urlpatterns = [
    path('doc/', index, name='index'),
    path('doc_api/', doc_api, name='doc_api'),

    path('surveys/', SurveyListView.as_view(), name='surveys'),
    path('survey/<int:pk>/', SurveyDetailView.as_view(), name='survey_detail'),

]



# -------------------------------------------------------------
# path('api-auth/', include('rest_framework.urls')),
# path('api-admin/', include(router.urls)),

# -------------------------------------------------------------
# -------------------------------------------------------------
# -------------------------------------------------------------
# -------------------------------------------------------------
    # path('', SurveyListView.as_view()),
    # path('', SurveyListView.as_view({'get': 'list'})),



    # path('', SurveyViewSet.as_view({'get': 'list'})),

    # path('survey/', QuestionsListView.as_view()),

    # path('survey/<int:pk>/questions/answers/', UserAnswerView.as_view()),

    # path('surveys/', SurveysListView.as_view()),
    #
    # path('questions/', QuestionsListView.as_view()),
    #
    # path('answer/', AnswersListView.as_view()),
    #
    # path('survey/<str:pk>/', SurveyDetailView.as_view()),
    #
    # path('question/<str:pk>/', QuestionDetailView.as_view()),
    #
    # path('survey/<str:pk>/questions/', SurveyQuestionView.as_view()),
    #
    # # path('user/<str:pk>/questions/', UserAnswersView.as_view()),



# router.register('survey', SurveyViewSet)

# app_name = 'survey  222 users'


# -----------------------------------------------------------------
# path('accounts/profile/', include(router.urls), { 'next_page' : '/' } ),
# {'get': 'list', 'put': 'update'}
# path('recruits/<int:pk>/', RecruitsDetailView.as_view()),
    # path('recruits/create/', RecruitCreateView.as_view()),
    #
    # path('recruit/<str:slug>/questions/', RecruitQuestionsView.as_view()),
    #
    # path('siths/<int:pk>/', SithsDetailView.as_view()),

