from django.shortcuts import render
from django.http import HttpResponse
from rest_framework import generics
from .serializers import SurveySerializer, QuestionSerializer, AnswerSerializer
from .models import Survey, Question, Answer
from django.utils import timezone
# from datetime import datetime


def index(request):
    return HttpResponse('<hr><h1>&nbsp; API Опросник</h1><hr>')


class SurveysListView(generics.ListAPIView):
    serializer_class = SurveySerializer
    queryset = Survey.objects.filter(date_end__gt=timezone.now())


class QuestionsListView(generics.ListAPIView):
    serializer_class = QuestionSerializer
    queryset = Question.objects.all()


class AnswersListView(generics.ListAPIView):
    serializer_class = AnswerSerializer
    queryset = Answer.objects.all()


# -----------------------------------------------------------------------
    # queryset = Question.objects.filter(date_end__gt=timezone.now())
# --------------------------
    # queryset = Survey.objects.all()
    # print('tmz==========', timezone.now())
    # print('tmz_localize==========', timezone.get_current_timezone().localize(datetime.now()))
# --------------------------
# queryset = Survey.objects.filter(date_end__lt=datetime.now())
# -------------------------------
# timezone.get_current_timezone().localize(datetime.now())
# datetime.datetime(2021, 3, 5, 3, 5, 53, 898093, tzinfo=<DstTzInfo 'Europe/Moscow' MSK+3:00:00 STD>)
    # return render(request, 'HTML/index.html')


