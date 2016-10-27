Alignak package for notifications
=================================

Alignak package for notifications (simple mail, HTML mail, XMPP)


Installation
------------

From PyPI
~~~~~~~~~
To install the package from PyPI:
::
   pip install alignak-notifications


From source files
~~~~~~~~~~~~~~~~~~~~~~~
To install the package from the source files:
::
   git clone https://github.com/Alignak-monitoring-contrib/alignak-notifications
   cd alignak-notifications
   pip install -r requirements.txt
   sudo python setup.py install


Documentation
-------------

This pack embeds several scripts that can be used to send notifications from Alignak:

- simple printf sent to sendmail
- python script to send HTML mail
- python script to send XMPP notifications


Configuration
~~~~~~~~~~~~~

Edit the */usr/local/etc/alignak/arbiter/packs/resource.d/notifications.cfg* file and configure
the SMTP server address, user name and password.
::

    #-- SMTP server configuration
    $SMTP_SERVER$=your_smtp_server_address
    $SMTP_LOGIN$=your_smtp_login
    $SMTP_PASSWORD$=your_smtp_password


**Note:** The python scripts assume that you have a direct `python` runnable ... if you need to use
`python2.7` or something else to run python, you should::

    cd /usr/local/bin
    ln -s python2.7 python



Bugs, issues and contributing
-----------------------------

Contributions to this project are welcome and encouraged ... issues in the project repository are
the common way to raise an information.

License
-------

Alignak Pack Checks NRPE is available under the `GPL version 3 license`_.

.. _GPL version 3 license: http://opensource.org/licenses/GPL-3.0