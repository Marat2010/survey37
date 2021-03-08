from django.shortcuts import render
from django.http import HttpResponse
from rest_framework import generics
from rest_framework.permissions import IsAuthenticated
from .serializers import SurveySerializer, QuestionSerializer, AnswerSerializer, \
    SurveyDetailSerializer, QuestionDetailSerializer, UserAnswersSerializer
from .models import Survey, Question, Answer, User, UserAnswer
from django.utils import timezone
# from datetime import datetime
from django.shortcuts import get_object_or_404
from django.db.models import Q
from rest_framework.viewsets import ModelViewSet


def index(request):
    return HttpResponse('<hr><h1>&nbsp; API Опросник</h1><hr>')


class SurveysListView(generics.ListAPIView):
    serializer_class = SurveySerializer
    queryset = Survey.objects.filter(date_end__gt=timezone.now())


# class SurveyDetailView(generics.RetrieveUpdateDestroyAPIView):
#  Детальная инофрмация обопроснике
class SurveyDetailView(generics.RetrieveAPIView):
    serializer_class = SurveyDetailSerializer
    queryset = Survey.objects.filter(date_end__gt=timezone.now())


class QuestionsListView(generics.ListAPIView):
    serializer_class = QuestionSerializer
    queryset = Question.objects.all()
    # permission_classes = (IsAuthenticated,)


class QuestionDetailView(generics.RetrieveAPIView):
    serializer_class = QuestionDetailSerializer
    queryset = Question.objects.all()


class AnswersListView(generics.ListAPIView):
    serializer_class = AnswerSerializer
    queryset = Answer.objects.all()
    # permission_classes = (IsAuthenticated,)


# Список вопросов в опроснике
# class SurveyQuestionView(generics.RetrieveAPIView):
# class SurveyQuestionView(generics.RetrieveUpdateAPIView):
class SurveyQuestionView(generics.ListAPIView):
    # serializer_class = SurveyDetailSerializer
    # queryset = Question.objects.all()
    serializer_class = QuestionSerializer
    # fields = ['question_text', 'answers']

    def get_queryset(self, *args, **kwargs):
        print('>>11>>>>>>>>>>> ', self.kwargs['pk'])
        queryset_list = Question.objects.all()
        print('>>>>>>>.. 222 >>>>>', self.queryset, queryset_list)

        query = self.kwargs['pk']
        queryset_list = queryset_list.filter(surveys=query)


        print('>>>>>>>.. 333 >>>>>', queryset_list)

        return queryset_list


# class UserAnswersView(generics.ListCreateAPIView):
# class UserAnswersView(generics.RetrieveUpdateAPIView):
# class UserAnswersView(ModelViewSet):
class UserAnswersViewSet(ModelViewSet):
    # queryset = UserAnswer.objects.all()
    # queryset = Question.objects.all()
    queryset = Survey.objects.all()
    # serializer_class = UserAnswersSerializer
    serializer_class = SurveySerializer

    # def get_queryset(self, *args, **kwargs):
    #     # queryset_list = Survey.objects.all()
    #     # print('>>>>>>>.. 222 >>>>>', self.queryset, queryset_list)
    #
    #     query = self.kwargs['pk']
    #     # queryset_list = queryset_list.filter(surveys=query)
    #
    #     queryset_list = super(UserAnswersViewSet, self).get_queryset(*args, **kwargs)
    #     # queryset_list = super(UserAnswersViewSet, self).get_queryset(surveys=query)
    #     print('>>>>>>>.. 333 >>>>>', queryset_list)
    #     for q in queryset_list:
    #         print('----- ', q.questions.all())
    #         for i in q.questions.all():
    #             print(i.question_text)
    #             # i.self.pk = i.question_text
    #         # print(q.questions.question_text)
    #
    #     return queryset_list


# ---------------------
    # def get_object(self):
    #     return object



# -------------------------------------------------------
# -------------------------------------------------------
# -------------------------------------------------------
# # query = self.request.GET.get("q")
# if query:
#     queryset_list = queryset_list.filter(Q(surveys=query))
# -------------------------------------------------------
        # queryset = self.get_queryset().surveys.filter(self.kwargs['pk'])
        # queryset = super(SurveyQuestionView, self).get_queryset(*args, **kwargs)
# -------------------------------------------------------
    # print('``````=== ', serializer_class.data)
    # serializer_class = QuestionSerializer
    # queryset = Question.survey_objects.all()
    # queryset = Survey.objects.filter(date_end__gt=timezone.now())
    # dd = serializer_class.get_fields()

    # @staticmethod
    # def get_question(self):
    #     queryset = Question.objects.filter(surveys=self.kwargs['pk'])
    #     return queryset
# -------------------------------------------------------
        # assert self.queryset is not None, (
        #     "'%s' should either include a `queryset` attribute, "
        #     "or override the `get_queryset()` method."
        #     % self.__class__.__name__
        # )

        # queryset = self.queryset
        # if isinstance(queryset, QuerySet):
        #     # Ensure queryset is re-evaluated on each request.
        #     queryset = queryset.all()

    # get_serializer(instance)
    # print('++++++++', serializer_class.__dir__(object))

    # def get_object(self):
    #     queryset = self.get_queryset()
    # #     filter = {}
    # #     # for field in self.multiple_lookup_fields:
    # #     #     filter[field] = self.kwargs[field]
    # #     # alook = self.__dir__()
    # #     alook = self.get_view_name()
    # #     print('````````````',  self.request.__dict__, '\n======-----', type(self.request.__dict__))
    # #     print('>>>>>>>>>>>>> ', self.__getattribute__('kwargs'))
    # #     print('>>>>>>>>>>>>> ', self.__getattribute__('kwargs')['pk'])
    # #     print('>>11>>>>>>>>>>> ', self.kwargs['pk'])
    #     print('>>>333>>>>>>>>>> ', queryset)
    # #     obj = get_object_or_404(queryset, **filter)
    #     obj = queryset
    # #     self.check_object_permissions(self.request, obj)
    #     return obj
# -------------
    # def filter_queryset(self, queryset):
    #     filter_backends = [CategoryFilter]
    #
    #     if 'geo_route' in self.request.query_params:
    #         filter_backends = [GeoRouteFilter, CategoryFilter]
    #     elif 'geo_point' in self.request.query_params:
    #         filter_backends = [GeoPointFilter, CategoryFilter]
    #
    #     for backend in list(filter_backends):
    #         queryset = backend().filter_queryset(self.request, queryset, view=self)
    #
    #     return queryset



# -----------------------------------------------------------------------
# ----------------------------------------------------------
# ----------------------------------------------------------
# ----------------------------------------------------------
    # queryset = Survey.objects.all()
    # queryset = Survey.objects.filter(pk=5)
    # queryset = Survey.objects.filter(pk=serializer_class.validated_data)
# ----------------------------------------------------------
    # queryset = Question.objects.filter(date_end__gt=timezone.now())
# -----------------------------------------------------------
    # def __init__(self, *args, **kwargs):
    #     super(SurveysListView, self).__init__(*args, **kwargs)
    #     print(self.queryset)  # request.session)
    #     print(self.get_serializer())  # request.session)
    #     print('==========', self.get_object.__dir__())  # request.session)
        # print(self.serializer_class.data.__dir__()) # request.session)
    #     self.fields['answer'].label = self.instance.question  # change required label ... and answers
    #     self.fields['answer'].queryset = Test.objects.get(question=self.instance.question).answers.all()
    #     self.fields['answer'].empty_label = None
# -----------------------------------------------------------
    # queryset = Survey.objects.all()
    # print('tmz==========', timezone.now())
    # print('tmz_localize==========', timezone.get_current_timezone().localize(datetime.now()))
# --------------------------
# queryset = Survey.objects.filter(date_end__lt=datetime.now())
# -------------------------------
# timezone.get_current_timezone().localize(datetime.now())
# datetime.datetime(2021, 3, 5, 3, 5, 53, 898093, tzinfo=<DstTzInfo 'Europe/Moscow' MSK+3:00:00 STD>)
    # return render(request, 'HTML/index.html')


