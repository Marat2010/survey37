from django.urls import path
from .views import index, SurveysListView, QuestionsListView, AnswersListView

app_name = 'survey users'
urlpatterns = [
    path('', index, name='index'),

    path('surveys/', SurveysListView.as_view()),

    path('questions/', QuestionsListView.as_view()),

    path('answer/', AnswersListView.as_view()),

]


# -----------------------------------------------------------------
    # path('recruits/<int:pk>/', RecruitsDetailView.as_view()),
    # path('recruits/create/', RecruitCreateView.as_view()),
    #
    # path('recruit/<str:slug>/questions/', RecruitQuestionsView.as_view()),
    #
    # path('siths/<int:pk>/', SithsDetailView.as_view()),

