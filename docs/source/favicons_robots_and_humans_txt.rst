Favicons, Humans.txt, and Robots.txt
====================================

Many web browsers, web crawlers, and other clients look at a website and check for three specific files:

* ``/favicon.ico``
* ``/humans.txt``
* ``/robots.txt``

The problem is that these are static files, and Django won't serve static files. That means you must create these files on your own (manually), and put them on the webserver that servers your static files (e.g., the CDN). 

How you do that is up to you and your particular deployment system. But whatever your situation, you need to do it.

To be safe, you will run some selenium (or similar) tests to ensure that these files are served with the right (i) content, and (ii) status codes.