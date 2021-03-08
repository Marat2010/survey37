from django.contrib import admin

from .models import Survey, Question, Answer, User, UserAnswer


class SurveyAdmin(admin.ModelAdmin):
    list_display = ('pk', 'name', 'date_start', 'date_end', 'description', 'get_questions')
    list_display_links = ('name', 'description')
    search_fields = ('name', 'date_start', 'date_end', 'description')


class QuestionAdmin(admin.ModelAdmin):
    # list_display = ('question_text', 'type_question', 'surveys', 'answers')
    list_display = ('pk', 'question_text', 'type_question', 'get_answers')
    list_display_links = ('question_text', 'type_question')
    search_fields = ('question_text', 'type_question')


class AnswerAdmin(admin.ModelAdmin):
    list_display = ('pk', 'answer',)
    list_display_links = ('pk', 'answer',)
    search_fields = ('answer',)


class UserAdmin(admin.ModelAdmin):
    list_display = ('pk', 'name')
    list_display_links = ('pk', 'name')
    search_fields = ('pk', 'name')


class UserAnswerAdmin(admin.ModelAdmin):
    list_display = ('pk', 'user', 'survey', 'question', 'answer')
    list_display_links = ('pk','survey', 'question')
    search_fields = ('pk', 'user', 'survey', 'question')


admin.site.register(Survey, SurveyAdmin)
admin.site.register(Question, QuestionAdmin)
admin.site.register(Answer, AnswerAdmin)
admin.site.register(User, UserAdmin)
admin.site.register(UserAnswer, UserAnswerAdmin)

