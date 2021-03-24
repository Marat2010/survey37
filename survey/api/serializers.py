from rest_framework import serializers
from .models import Survey, Question, Answer, User, UserAnswer
from rest_framework.fields import ChoiceField
from drf_writable_nested.serializers import WritableNestedModelSerializer


# -------------   SECTION FOR SURVEY   -----------------

class SurveyListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Survey
        fields = ('id', 'name', 'date_start', 'date_end', 'description')


# ---------------------------------------
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'name')


class AnswerListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        fields = ('id', 'answer')


# class QuestionsListSerializer(WritableNestedModelSerializer):
class QuestionsListSerializer(serializers.ModelSerializer):
    # answers = serializers.StringRelatedField(many=True, read_only=False)
    answers = AnswerListSerializer(many=True)

    class Meta:
        model = Question
        fields = ('question_text', 'type_answer', 'answers')


# class SurveySerializer(WritableNestedModelSerializer):
class SurveySerializer(serializers.ModelSerializer):
    # answer = AnswerListSerializer(many=True, read_only=False)
    questions = QuestionsListSerializer(many=True)

    class Meta:
        model = Survey
        fields = ('id', 'name', 'date_start', 'date_end', 'description', 'questions',)


class UserAnswerSerializer(WritableNestedModelSerializer):
    user = UserSerializer(allow_null=True)
    survey = SurveySerializer(allow_null=True)
    question = QuestionsListSerializer(allow_null=True)
    answer = AnswerListSerializer(many=True)

    class Meta:
        # model = Survey
        model = UserAnswer
        fields = ('pk', 'user', 'survey', 'question', 'answer')
        # fields = ('pk', 'user', 'questions')

    def to_representation(self, obj):
        data = super(UserAnswerSerializer, self).to_representation(obj)
        data['question'] = obj.answer.username
        # data['upvoted_by'] = instance.upvote_by.all().values_list('username', flat=True)
        return data

    # ------------------------------------------------------------
# class SurveyDetailSerializer(serializers.ModelSerializer):
#     questions = QuestionsListSerializer(many=True, read_only=True)
#
#     class Meta:
#         model = Survey
#         fields = ('questions',)
#         # validators = [queryset=Event.ob]
#
#     # def create(self, validated_data):
#     def update(self, instance, validated_data):
#         instance.questions.set = validated_data.get('questions', instance.questions.set)
#         print(f"===1===: {instance.questions.set}")
#         print(f"===1.1 ===: {instance.questions.set.__dict__}")
#         print(f"===2===: {self.data.pop('questions')}")
#         print(f"===3===: {validated_data}")
#         return ques



# ------------- END SECTION FOR SURVEY -----------------


# # -------------- User section --------------------------------------
#
#
# class AnswerListSerializer(serializers.ModelSerializer):
#     """ Displaying a list of answer """
#     class Meta:
#         model = Answer
#         fields = ('id', 'answer')
#
#
# class AnswerDetailSerializer(serializers.ModelSerializer):
#     """ Displaying a list of answer """
#     class Meta:
#         model = Answer
#         fields = ('answer',)
#
#
# class QuestionsListSerializer(serializers.ModelSerializer):
#     """ Displaying a list of questions """
#     answers = AnswerListSerializer(many=True, read_only=True)
#     # type_answer_id = serializers.CharField(source='type_answer', read_only=True)
#     type_answer = serializers.CharField(source='get_type_answer_display', read_only=True)
#
#     class Meta:
#         model = Question
#         fields = ('id', 'question_text', 'type_answer', 'answers')
#         # fields = ('id', 'question_text', 'type_answer', 'type_answer_id', 'answers')
#
#
# class QuestionDetailSerializer(serializers.ModelSerializer):
#     """ Displaying a list of questions """
#     # answers = AnswerListSerializer(many=True, read_only=True)
#     # answers = serializers.CharField(source='get_answer_display', read_only=True)
#
#     answers = serializers.StringRelatedField(many=True, read_only=False)
#
#     # answers = AnswerDetailSerializer(read_only=True)
#     # type_answer_id = serializers.CharField(source='type_answer', read_only=True)
#     type_answer = serializers.CharField(source='get_type_answer_display', read_only=True)
#
#     class Meta:
#         model = Question
#         fields = ('id', 'question_text', 'type_answer', 'answers')
#         # fields = ('id', 'question_text', 'type_answer')
#         # fields = ('id', 'question_text', 'type_answer', 'type_answer_id', 'answers')
#
#
# class SurveyListSerializer(serializers.ModelSerializer):
#     """ Displaying a list of surveys"""
#     questions = QuestionsListSerializer(read_only=True, many=True)
#
#     class Meta:
#         model = Survey
#         fields = ('id', 'name', 'date_start', 'date_end', 'description', 'questions')
#
#
# class SurveyDetailSerializer(serializers.ModelSerializer):
#     questions = QuestionsListSerializer(read_only=True, many=True)
#
#     class Meta:
#         model = Survey
#         fields = ('questions',)
#
#
# class UserAnswerDetailSerializer(serializers.ModelSerializer):
#     user = serializers.StringRelatedField(read_only=False)
#     survey = serializers.StringRelatedField(read_only=False)
#     question = QuestionDetailSerializer(read_only=True)
#     answer = serializers.StringRelatedField(many=True, read_only=False)
#     # question = QuestionsListSerializer(read_only=True, many=True)
#     # answer = AnswerDetailSerializer(read_only=True, many=True)
#
#     class Meta:
#         model = UserAnswer
#         fields = ('user', 'survey', 'question', 'answer')
#
# # -------------- User section  END--------------------------------------

# # -------------- Admin section --------------------------------------
# class AnswerSerializer(serializers.PrimaryKeyRelatedField, serializers.ModelSerializer):
#
#     class Meta:
#         model = Answer
#         fields = ('id', 'answer')
#
#
# class QuestionSerializer(serializers.ModelSerializer):
#     answers = AnswerSerializer(many=True, queryset=Answer.objects.all())
#
#     class Meta:
#         model = Question
#         fields = ('id', 'url', 'question_text', 'type_answer', 'answers')
#
#
# class SurveySerializer(serializers.ModelSerializer):
#     questions = QuestionSerializer(many=True, read_only=True)
#
#     class Meta:
#         model = Survey
#         fields = ('id', 'url', 'name', 'date_start', 'date_end', 'description', 'questions')
#
#
# class UserAnswerSerializer(serializers.ModelSerializer):
#     user = serializers.StringRelatedField(read_only=False)
#     survey = serializers.StringRelatedField(read_only=False)
#     question = serializers.StringRelatedField(read_only=False)
#     answer = AnswerSerializer(many=True, queryset=Answer.objects.all())
#     # answer = serializers.StringRelatedField(read_only=False)
#     # question = QuestionSerializer(many=True, read_only=True)
#
#     class Meta:
#         model = UserAnswer
#         fields = ('id', 'url', 'user', 'survey', 'question', 'answer')
#
# # ------------------ Admin section END ----------------------------------


# -----------------------------------------------------------------------
# -----------------------------------------------------------------------

# -------------- Admin section end-----------------------------------


# ---------------------------------------------------------
# class QuestionSerializer(serializers.PrimaryKeyRelatedField, serializers.ModelSerializer):
    # questions = QuestionSerializer(many=True, queryset=Question.objects.all())
    # answers = AnswerSerializer(many=True)
    # answers = AnswerSerializer(many=True, read_only=False, allow_empty=False)
    # answers = serializers.PrimaryKeyRelatedField(many=True, read_only=True, allow_null=True)
    # answers = serializers.PrimaryKeyRelatedField(many=True, read_only=True)
    # answer = serializers.PrimaryKeyRelatedField(many=True, read_only=True)

# ---------------------------------------------------------
    # answers = serializers.StringRelatedField(many=True, read_only=False)
    # answers = ChoiceDisplayField
    # type_answer = serializers.ChoiceField(choices=Question.TYPE_QUESTION )
    # type_answer = serializers.CharField(source='get_type_answer_display')
    # type_answer = ChoiceDisplayField
# ---------------------------------------------------------
# class QuestionSerializer(DefaultModelSerializer):
# class QuestionsListSerializer(DefaultModelSerializer):
# ----------------------------------------------------------------
# -------------- Section for Choice a type_answer. ---------
# class ChoiceDisplayField(ChoiceField):
#     def __init__(self, *args, **kwargs):
#         super(ChoiceDisplayField, self).__init__(*args, **kwargs)
#         self.choice_strings_to_display = {
#             # six.text_type(key): value for key, value in self.choices.items()
#             six.text_type(key): value for key, value in self.choices.items()
#         }
#
#     def to_representation(self, value):
#         if value is None:
#             return value
#         return {
#             'value': self.choice_strings_to_values.get(six.text_type(value), value),
#             'display': self.choice_strings_to_display.get(six.text_type(value), value),
#         }
#
#
# class DefaultModelSerializer(serializers.ModelSerializer):
#     serializer_choice_field = ChoiceDisplayField

# class ChoiceDisplayField(serializers.ChoiceField):
#     class Meta:
#         # model = Answer
#         # # fields = ('id', 'url', 'answer',)
#         fields = ('type_answer', 'get_type_answer_display')

# ---------------------------------------------------------
    # answers = serializers.StringRelatedField(many=True)
    # type_answer = ChoiceDisplayField
    # type_answer = serializers.CharField(source='get_type_answer_display')
    # type_answer = ('Male', 'Female')
    # type_answer1 = Question.TYPE_ANSWER


#     def update(self, instance, validated_data):
#         # print(f'-------instance----- {instance} \n=== {self.context}')
#         print(f'-------instance----- {instance} \n=== {self.data}')
#         print(f'-------VALI----- {self.data["questions"]}')
#         for i in self.data["questions"]:
#             print(f'+++++ {i["id"]}')
#             print(f'+++++ {i["type_answer"]}')
#             print(f'+++++ {i["question_text"]}')
#             print(f'+++++ {i["answers"]}')
#         useranswer, _ = UserAnswer.objects.update_or_create(
#             # user='qqq',
#             survey=validated_data.get('survey', None),
#             question=validated_data.get('question', None),
#             answer=validated_data.get('answer', None)
#         )
#         return useranswer
#
# # -----------------
#     def to_representation(self, instance):
#         ret = super().to_representation(instance)
#         # ret['username'] = ret['username'].lower()
#         # print(f'======== {type(ret)}')
#         print(f'===Repres 1 === {ret}')
#         print(f'===Repres 2 === {ret.get("questions")}')
#         # print(f'===Instance 1 === {instance.questions}')
#         ret = ret.get("questions")
#         ret = self.get_value(ret)
#         return ret
#         # return ret


# ---------------------------------------------------------------
    # def perform_update(self, serializer):
    #     instance = serializer.save()
    #     send_email_confirmation(user=self.request.user, modified=instance)

# --------------------------------------
# --------------------------------------
# --------------------------------------
# --------------------------------------
# --------------------------------------
        # fields = ('id', 'name', 'date_start', 'date_end', 'description', 'questions')
        # fields = ('id', 'user', 'survey', 'question', 'answer')
        # fields = ('question', 'answer')
# ---------------------------------------------------------------
    # answers = AnswerListSerializer(many=True, read_only=True)
    # answers = serializers.StringRelatedField(many=True)
    # answers = AnswerListSerializer(many=True, read_only=True)
# ---------------------------------------------------------------
# class AnswerSerializer(serializers.HyperlinkedModelSerializer):
# class QuestionSerializer(serializers.HyperlinkedModelSerializer):
# class SurveySerializer(serializers.HyperlinkedModelSerializer):

# ---------------------------------------------------------------
# class AnswerSerializer(serializers.ModelSerializer):
# class QuestionSerializer(serializers.ModelSerializer):
    # answers = serializers.StringRelatedField(many=True)
# -----------------------------------------

# # -----------------------------------------------------------
#
#
# class SurveySerializer1(serializers.ModelSerializer):
#     questions = QuestionSerializer(many=True)
#     # questions = serializers.StringRelatedField(many=True)
#     # questions.answers = serializers.StringRelatedField(many=True)
#     # questions = serializers.HyperlinkedRelatedField(many=True, read_only=True, view_name='question-detail')
#
#     class Meta:
#         model = Survey
#         fields = ('id', 'name', 'date_start', 'date_end', 'description', 'questions')
#         # fields = ('id', 'name', 'date_start', 'date_end', 'description', 'questions', 'answers')
#
#
# class SurveyDetailSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Survey
#         fields = ('id', 'name', 'date_start', 'date_end', 'description', 'questions')
#
#
# class QuestionDetailSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Question
#         fields = ('id', 'question_text', 'type_answer', 'answers')
#
#
# class UserAnswersSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Survey
#         fields = ('id', 'name', 'date_start', 'date_end', 'description', 'questions')
#         # fields = ('id', 'user', 'survey', 'question', 'answer')
#         # fields = ('question', 'answer')
#
# # ----------------------------------------------------------------------------



# ----------------------------------------------------------------------------
# class SurveySerializer(serializers.ModelSerializer):
    # questions = QuestionSerializer(many=True)
    # questions = serializers.StringRelatedField(many=True)
    # questions.answers = serializers.StringRelatedField(many=True)
    # questions = serializers.HyperlinkedRelatedField(many=True, read_only=True, view_name='question-detail')
# ----------------------------------------------------------------------------
        # fields = ('id', 'url', 'name', 'date_start', 'date_end', 'description', 'questions')

        # fields = ('question_text', 'answers')
        # depth = 1
# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------