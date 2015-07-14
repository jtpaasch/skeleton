# -*- coding: utf-8 -*-  

# We'll extend the basic TestCase.
from django.test import TestCase

# We'll test the headers with this tool:
from apps.tests.headers import HeaderTests

class Test404(TestCase):
    """
    Test the 404 page.
    """

    def test_headers(self):
        """
        Make sure the right headers are present.
        """

        # Instantiate the header tests tool.
        header_tests = HeaderTests()

        # Load a non-existent page.
        response = self.client.get('nonexistent-page')

        # Test the content type header.
        header_tests.check_content_type_header(response)

        # Test the security headers.
        header_tests.check_security_headers(response)

    def test_response_code(self):
        """
        Make sure the response code is 404.
        """

        # Load a non-existent page.
        response = self.client.get('nonexistent-page')

        # Does it 404?
        self.assertEqual(response.status_code, 404)

    def test_response_copy(self):
        """
        Make sure the copy is correct.
        """

        # Load a non-existent page.
        response = self.client.get('nonexistent-page')

        # Is the copy correct?
        expected = 'Page not found'
        self.assertContains(response, expected, status_code=404)
