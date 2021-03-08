from rest_framework import serializers
from .models import Survey, Question, Answer, UserAnswer


class QuestionSerializer(serializers.ModelSerializer):
    answers = serializers.StringRelatedField(many=True)

    class Meta:
        model = Question
        fields = ('id', 'question_text', 'type_question', 'answers')


class SurveySerializer(serializers.ModelSerializer):
    questions = QuestionSerializer(many=True)
    # questions = serializers.StringRelatedField(many=True)
    # questions.answers = serializers.StringRelatedField(many=True)
    # questions = serializers.HyperlinkedRelatedField(many=True, read_only=True, view_name='question-detail')

    class Meta:
        model = Survey
        fields = ('id', 'name', 'date_start', 'date_end', 'description', 'questions')
        # fields = ('id', 'name', 'date_start', 'date_end', 'description', 'questions', 'answers')


class SurveyDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Survey
        fields = ('id', 'name', 'date_start', 'date_end', 'description', 'questions')


class QuestionDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = ('id', 'question_text', 'type_question', 'answers')


class AnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        fields = ('id', 'answer')


class UserAnswersSerializer(serializers.ModelSerializer):
    class Meta:
        model = Survey
        fields = ('id', 'name', 'date_start', 'date_end', 'description', 'questions')
        # fields = ('id', 'user', 'survey', 'question', 'answer')
        # fields = ('question', 'answer')
