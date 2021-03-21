"""survey URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/

"""
from django.contrib import admin
from django.urls import path, include
from .views import redirect_to
# from .yasg import urlpatterns as doc_urls
# from survey.api.urls import router
# from api.urls import router


urlpatterns = [
    path('', redirect_to),
    path('api/v1/', include('api.urls')),
    path('admin/', admin.site.urls),
]

# urlpatterns += doc_urls

# ---------------------------------------------------
# ---------------------------------------------------
# path('accounts/profile/', include('router.urls')),
# path('accounts/profile/', include(router.urls), { 'next_page' : '/' } ),

# path('', include('api.urls')),
