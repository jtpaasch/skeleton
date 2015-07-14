# -*- coding: utf-8 -*-

# Selenium tests need to run against a live server.
# LiveServerTestCase spins up a live Django server for that.
from selenium import webdriver
from django.test import LiveServerTestCase
from selenium.webdriver.firefox.firefox_binary import FirefoxBinary

# We'll need to reference environment variables.
import os

class TestHelloWorld(LiveServerTestCase):
    """
    Tests the helloworld page.
    """

    def setUp(self):
        self.browser = webdriver.Firefox()
        self.browser.implicitly_wait(3)

    def tearDown(self):
        self.browser.quit()

    def test_get_xyzzy(self):

        # A health checker visits /helloworld to see if the site is healthy.
        url = self.live_server_url + '/helloworld'
        self.browser.get(url)

        # It receives the text 'Hello World', which
        # indicates that the site is indeed healthy.
        assert 'Hello World' in self.browser.page_source
