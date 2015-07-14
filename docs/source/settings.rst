Settings
========

Project settings should be defined inside the main ``project/settings.py`` file. 

However, always keep **application** and **environment** configuration STRICTLY separated. 

The rule of thumb is: anything that applies to **every** environment can be configured in ``project/settings.py``, but everything else should be defined with environment variables. [#]_

.. [#] The environment variables for each environment are set 
       in an ``environments/<ENVIRONMENT>/.env`` file.