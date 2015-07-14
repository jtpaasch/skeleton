Selenium Tests
==============

Good selenium tests are designed to test features. How do you test a feature? You describe a user story. How would a user use the feature? What steps would they go through, and what should happen at each step?

Start with a User Story
-----------------------

Open a file and, **with comments**, fill out a user story that describes how the feature should function. For instance::

    # A health checker wants to make sure your site is running.
    # To do that, it will visit your site at /helloworld.

    # It gets the response, and checks that it says "Hello World."
    # That means everything is okay.

Next, use the Selenium Webdriver to implement each step.
::

    from selenium import webdriver

    # A health checker wants to make sure your site is running.
    # To do that, it will visit your site at /helloworld.
    browser = webdriver.Firefox()
    browser.get('http://localhost:8000/helloworld')

    # It gets the response, and checks that it says "Hello World."
    # That means everything is okay.
    assert 'Hello World' in browser.page_source

Make it Visible to Django
-------------------------

To make the test visible to Django's test runner, wrap the user story in a method of a proper test class.
::

    from selenium import webdriver
    from django.test import LiveServerTestCase

    class TestHelloWorld(LiveServerTestCase):
        """
        Tests the /helloworld page.
        """

        def test_helloworld(self):
            """
            Tests that a health checker visits the /helloworld
            page and gets a healthy response.
            """

            # A health checker wants to make sure your site is running.
            # To do that, it will visit your site at /helloworld.
            browser = webdriver.Firefox()
            browser.get('http://localhost:8000/helloworld')

            # It gets the response, and checks that it says "Hello World."
            # That means everything is okay.
            assert 'Hello World' in browser.page_source

Save this in a file called ``test_helloworld.py``, and put it in a folder called ``selenium/``. Each app should have its own ``selenium/`` folder, with separate tests for each feature. In this case, it would look like so::

  - helloworld_app/
      - selenium/
          - test_helloworld.py
            |
            |-- TestHelloWorld (class)
