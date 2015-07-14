# -*- coding: utf-8 -*-

# Selenium tests need to run against a live server.
# LiveServerTestCase spins up a live Django server for that.
from selenium import webdriver
from django.test import LiveServerTestCase
from selenium.webdriver.firefox.firefox_binary import FirefoxBinary

# We'll need to reference environment variables.
import os

class Test404(LiveServerTestCase):
    """
    Tests the 404 page.
    """

    def setUp(self):
        self.browser = webdriver.Firefox()
        self.browser.implicitly_wait(3)

    def tearDown(self):
        self.browser.quit()

    def test_get_404(self):

        # Denise mistakenly visits a page that doesn't exist.
        url = self.live_server_url + '/noexistent-page'
        self.browser.get(url)

        # She notices that it tells her the page isn't there.
        assert 'Page not found' in self.browser.page_source
