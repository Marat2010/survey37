from django.urls import path, include
from .views import index, SurveysListView, QuestionsListView, AnswersListView, \
    SurveyDetailView, SurveyQuestionView, QuestionDetailView, UserAnswersViewSet
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('user', UserAnswersViewSet)

app_name = 'survey users'
urlpatterns = [
    path('', index, name='index'),

    path('surveys/', SurveysListView.as_view()),

    path('questions/', QuestionsListView.as_view()),

    path('answer/', AnswersListView.as_view()),

    path('survey/<str:pk>/', SurveyDetailView.as_view()),

    path('question/<str:pk>/', QuestionDetailView.as_view()),

    path('survey/<str:pk>/questions/', SurveyQuestionView.as_view()),

    # path('user/<str:pk>/questions/', UserAnswersView.as_view()),
    path('surv/', include(router.urls)),

]


# -----------------------------------------------------------------
    # path('recruits/<int:pk>/', RecruitsDetailView.as_view()),
    # path('recruits/create/', RecruitCreateView.as_view()),
    #
    # path('recruit/<str:slug>/questions/', RecruitQuestionsView.as_view()),
    #
    # path('siths/<int:pk>/', SithsDetailView.as_view()),

