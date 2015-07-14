# -*- coding: utf-8 -*-

# We'll use Django's tools to define URLs/Routes.
from django.conf.urls import url

# We'll use our simple view.
from apps.helloworld.views.simple import Simple

# Now we can define our URLs/Routes.
urlpatterns = [
    url(r'^$', Simple.as_view(), name='helloworld')
]
