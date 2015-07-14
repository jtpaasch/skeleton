# -*- coding: utf-8 -*-

# We'll extend Django's base generic view.
from django.views.generic.base import View

# We need to render templates.
from django.shortcuts import render

class Simple(View):
    """
    A very simple generic view that renders a template.
    """

    def get(self, request):
        """
        Handles requests for GET /helloworld.
        """

        # What template should we use?
        template = 'helloworld/default.html'

        # What data should we send to the template?
        template_data = {
            'message': 'Hello World',
        }

        # Now render the data and the template.
        return render(request, template, template_data)
