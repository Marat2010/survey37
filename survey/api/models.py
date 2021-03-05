from django.db import models
# from django.utils import timezone


class Survey(models.Model):
    name = models.CharField(max_length=50, verbose_name='Название опроса')
    date_start = models.DateTimeField(db_index=True, verbose_name='Дата старта опроса')
    date_end = models.DateTimeField(blank=True, null=True, db_index=True, verbose_name='Дата окончания опроса')
    description = models.TextField(blank=True, null=True, verbose_name='Описание опроса')
    questions = models.ManyToManyField('Question', related_name='surveys', verbose_name='Вопросы')

    def __str__(self):
        return self.name

    def get_questions(self):
        return ';  '.join(['{} '.format(str(question.question_text)) for question in self.questions.all()])

    class Meta:
        verbose_name_plural = 'Опросы'
        verbose_name = 'Опрос'
        ordering = ['name']


class Question(models.Model):
    question_text = models.TextField(blank=True, null=True, verbose_name='Текст вопроса')
    type_question = models.BooleanField(blank=True, null=True,
                                        verbose_name='Тип вопроса(None-вручную, '
                                                     'False-один ответ, True-несколько ответов')
    answers = models.ManyToManyField('Answer', related_name='questions', verbose_name='Ответы')

    def __str__(self):
        return self.question_text

    def get_answers(self):
        return ';  '.join(['{} '.format(str(answer.answer)) for answer in self.answers.all()])

    class Meta:
        verbose_name_plural = 'Вопросы'
        verbose_name = 'Вопрос'
        ordering = ['question_text']


class Answer(models.Model):
    answer = models.TextField(blank=True, null=True, verbose_name='Ответ')

    def __str__(self):
        return self.answer

    class Meta:
        verbose_name_plural = 'Ответы'
        verbose_name = 'Ответ'
        ordering = ['answer']


class User(models.Model):
    name = models.CharField(max_length=50, blank=True, verbose_name='Имя пользователя', default='')

    def __str__(self):
        return str(self.pk)

    class Meta:
        verbose_name_plural = 'Пользователи'
        verbose_name = 'Пользователь'
        ordering = ['pk']


class UserAnswer(models.Model):
    user = models.ForeignKey(User, related_name='user_answers', on_delete=models.CASCADE, verbose_name='ID Пользователя')
    survey = models.ForeignKey(Survey, related_name='user_answers', on_delete=models.PROTECT, verbose_name='Опросник')
    question = models.ForeignKey(Question, related_name='user_answers', on_delete=models.PROTECT, verbose_name='Вопрос')
    answer = models.ForeignKey(Answer, related_name='user_answers', on_delete=models.PROTECT, verbose_name='Ответ',
                               blank=True, null=True)

    class Meta:
        verbose_name_plural = 'Ответы Пользователей'
        verbose_name = 'Ответ Пользователя'
        ordering = ['pk']


#
#     def get_surveys(self):
#         # return ';  '.join(['{} ({})'.format(str(recr.name), recr.email) for recr in self.recruits.all()])
#         return ';  '.join(['{} '.format(str(survey.name)) for survey in self.surveys.all()])
#
#     def get_answers(self):
#         # return ';  '.join(['{} ({})'.format(str(recr.name), recr.email) for recr in self.recruits.all()])
#         return ';  '.join(['{} '.format(str(answer.answer)) for answer in self.answers.all()])
#
#
#     # def get_questions(self):
#     #     return ';  '.join(['{} '.format(str(question.question_text)) for question in self.questions.all()])
#
#     def __str__(self):
#         return self.pk
#
#     class Meta:
#         verbose_name_plural = 'Ответы пользователей'
#         verbose_name = 'Ответ пользователя'
#         ordering = ['pk']

# ------------------------------------------------
# ------------------------------------------------
    # surveys = models.ManyToManyField(Survey, blank=True, null=True, related_name='users', verbose_name='Опросы')
# ------------------------------------------------
    # date_start = models.DateTimeField(db_index=True, verbose_name='Дата старта опроса', default=timezone.now)
    # date_end = models.DateTimeField(blank=True, null=True, db_index=True, verbose_name='Дата окончания опроса', default=timezone.now)
# ------------------------------------------------
#     # surveys = models.ForeignKey(Survey, blank=True, null=True, related_name='users', on_delete=models.CASCADE, verbose_name='Опросы')
#     questions = models.ManyToManyField(Question, related_name='users', verbose_name='Вопросы')
#     # questions = models.ForeignKey(Question, related_name='users', on_delete=models.CASCADE, verbose_name='Вопросы')
#     answers = models.ManyToManyField(Answer, related_name='users', verbose_name='Ответы')
# ------------------------------------------------
    # surveys = models.ManyToManyField(Survey, related_name='questions', verbose_name='Опросы')
    # answers = models.ManyToManyField('Answer', blank=True, null=True, related_name='questions', verbose_name='Ответ, ответы')

