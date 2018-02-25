Alignak package for notifications
=================================

*Alignak package for notifications (simple mail, HTML mail, XMPP)*

.. image:: https://badge.fury.io/py/alignak_notifications.svg
    :target: https://badge.fury.io/py/alignak_notifications
    :alt: Most recent PyPi version

.. image:: https://img.shields.io/badge/IRC-%23alignak-1e72ff.svg?style=flat
    :target: http://webchat.freenode.net/?channels=%23alignak
    :alt: Join the chat #alignak on freenode.net

.. image:: https://img.shields.io/badge/License-AGPL%20v3-blue.svg
    :target: http://www.gnu.org/licenses/agpl-3.0
    :alt: License AGPL v3

Installation
------------

The installation of this package will copy some configuration files in the Alignak default configuration directory (eg. */usr/local/etc/alignak*). The copied files are located in the default sub-directory used for the packs (eg. *arbiter/packs*).

It will also copy some JSON files in the */usr/local/etc/alignak/backend-json* directory. These files are usable to import all the commands tinto the Alignak backend with the `alignak-backend-cli` script installed with the backend client library.

You can update the sipped files to make the default commands suit your needs or use the default commands configuration that is defined to be as complete as possible.


**Note:** The python scripts assume that you have a direct `python` runnable ... if you need to use `python2.7` or something else to run python, you should::

    cd /usr/local/bin
    ln -s python2.7 python


From PyPI
~~~~~~~~~
To install the package from PyPI:
::

   sudo pip install alignak-notifications


From source files
~~~~~~~~~~~~~~~~~
To install the package from the source files:
::

   git clone https://github.com/Alignak-monitoring-contrib/alignak-notifications
   cd alignak-checks-notifications
   sudo pip install .

**Note:** *using `sudo python setup.py install` will not correctly manage the package configuration files! The recommended way is really to use `pip`;)*


Documentation
-------------

This pack embeds several scripts that can be used to send notifications from Alignak:

- simple printf sent to sendmail
- python script to send HTML mail
- python script to post messages to a Slack channel

**Important:** The HTML mail and Slack scripts are using Alignak logo images in the message composition. The default used files are located in the main directory of the project repository. Alternative images URL can be specified in the notification command parameters.



Configuration (Slack notifications)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A Slack API token is mandatory to post messages to a slack channel. The token can be provided on the command line of the notification script or defined in an environment variable (ALIGNAK_SLACK_API_TOKEN).

The Slack channel that will receive the messages must ne named as the configured contact name. Let's say that you want to send the notifications message to a channel named `#my_alignak`, the contact configured but be named as `my-alignak`.


Configuration (mail notifications)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Edit the */usr/local/etc/alignak/arbiter/packs/resource.d/notifications.cfg* file and configure
the SMTP server address, port, user name and password.
::

    #-- SMTP server configuration
    $SMTP_SERVER$=your_smtp_server_address
    $SMTP_PORT$=25
    $SMTP_LOGIN$=your_smtp_login
    $SMTP_PASSWORD$=your_smtp_password



Bugs, issues and contributing
-----------------------------

Contributions to this project are welcome and encouraged ... `issues in the project repository <https://github.com/alignak-monitoring-contrib/alignak-notifications/issues>`_ are the common way to raise an information.
