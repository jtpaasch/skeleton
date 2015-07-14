# -*- coding: utf-8 -*-  

# We'll extend the basic TestCase.
from django.test import TestCase

# We'll need to look up some URLs.
from django.core.urlresolvers import reverse

# We'll test the headers with this tool:
from apps.tests.headers import HeaderTests

class TestHelloWorld(TestCase):
    """
    Test the hello world page.
    """

    def test_headers(self):
        """
        Make sure the right headers are present.
        """

        # Instantiate the header tests tool.
        header_tests = HeaderTests()

        # Load the helloworld page.
        url = reverse('helloworld')
        response = self.client.get(url)

        # Test the content type header.
        header_tests.check_content_type_header(response)

        # Test the security headers.
        header_tests.check_security_headers(response)

    def test_response_code(self):
        """
        Make sure the response code is 200.
        """

        # Load the helloworld page.
        url = reverse('helloworld')
        response = self.client.get(url)

        # Does it 200?
        self.assertEqual(response.status_code, 200)

    def test_response_copy(self):
        """
        Make sure the copy is correct.
        """

        # Load the helloworld page.
        url = reverse('helloworld')
        response = self.client.get(url)

        # Is the copy correct?
        expected = 'Hello World'
        self.assertContains(response, expected)
