The Secret Key
==============

The ``SECRET_KEY`` setting is deeply important. Django uses it to cryptographically sign sensitive data that it sends out to users. This includes CSRF tokens, sessions, password reset tokens, and the like. 

When users send their information back, Django checks the data sent back with this key. If the data can't be re-signed, Django returns a ``403 Forbidden`` response.

For this reason, the ``SECRET_KEY`` absolutely must be kept a secret. If you feel it is ever compromised, you must change it, immediately. 

This will affect users only marginally. In practice, it will only mean that users who are signed in will suddenly feel "signed out." But as soon as they sign in again, everything will return to normal.