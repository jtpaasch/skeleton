# -*- coding: utf-8 -*-  

# We'll use Django's tools for parsing URLs/Routes.
from django.conf.urls import include, url

# Define the URLs/Routes for the project.
urlpatterns = [

    # This pulls in the URLs for the `helloworld` app.
    # It will prefix all URLs from that app with /helloworld
    url(r'^helloworld$', include('apps.helloworld.urls')),

]

