Unit Tests
==========

Good unit tests are designed to test tiny pieces of an implementation. Ideally, each unit test should test a single step in a larger user story (which, in turn, is covered by a Selenium test).

For example, in the previous section on Selenium Tests, we wrote a test which ensures that a health checker can visit ``/helloworld`` and get a response that says "Nothing happens." How would we cover this with unit tests?


Write a Unit Test
-----------------

We first need a view to return a response for ``/helloworld``. But don't build a view first. Write a unit test first.
::

    from django.test import TestCase

    class TestHelloWorld(TestCase):
        """
        Tests the /helloworld page.
        """

        test_get_response_code(self):
            """
            /helloworld returns a 200 response.
            """
            response = self.client.get('/helloworld')
            self.assertEqual(response.status_code, 200)

Save this in a file called ``test_helloworld.py``, and put it in a folder called ``tests`` inside the app. Like this::

  - helloworld_app/
      - tests/
          - test_helloworld.py
            |
            |-- TestHelloWorld (class)


Now build the view. Even something simple will suffice::

    from django.http import HttpResponse

    def get_helloworld(self, request):
        return HttpResponse('')

This will pass the test, because it will return an HTTP response. It might be a response with an empty body, but it will still be a full HTTP response, replete with a 200 status code.

Write Another Unit Test
-----------------------

Next, the user story dictates that the response should say "Hello World." But again, don't implement the copy first. Write a test first.
::

        test_get_response_copy(self):
            """
            /helloworld returns the words "Hello World."
            """
            response = self.client.get('/helloworld')
            self.assertContains(response, "Hello World")

Now implement the copy in the view::

    from django.http import HttpResponse

    def get_helloworld(self, request):
        return HttpResponse('Hello World')

This will pass the test, since not only will the view return a proper HTTP response, but also the body will say "Nothing happens."

Rinse and Repeat
----------------

In this way, inch your way forward, one unit test at a time, until the Selenium user story test passes.

