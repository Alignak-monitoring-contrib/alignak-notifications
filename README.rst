Alignak package for notifications
======================================

Alignak package for notifications (simple mail, HTML mail, XMPP)


Installation
----------------------------------------

From PyPI
~~~~~~~~~~~~~~~~~~~~~~~
To install the package from PyPI:
::
   pip install alignak-notifications


From source files
~~~~~~~~~~~~~~~~~~~~~~~
To install the package from the source files:
::
   git clone https://github.com/Alignak-monitoring-contrib/alignak-notifications
   cd alignak-notifications
   mkdir /usr/local/etc/alignak/arbiter_cfg/objects/packs/notifications
   # Copy configuration files
   cp -R alignak_notifications/*.cfg /usr/local/etc/alignak/arbiter_cfg/objects/packs/notifications
   # Copy plugin files
   cp -R alignak_notifications/plugins/* /usr/local/libexec/alignak


Documentation
----------------------------------------

This pack embeds several scripts that can be used to send notifications from Alignak:

- simple printf sent to sendmail
- python script to send HTML mail
- python script to send XMPP notifications


Alignak configuration
~~~~~~~~~~~~~~~~~~~~~~~

... TO BE COMPLETED ...


Bugs, issues and contributing
----------------------------------------

Contributions to this project are welcome and encouraged ... issues in the project repository are the common way to raise an information.

License
----------------------------------------

Alignak Pack EXAMPLE is available under the `GPL version 3 license`_.

.. _GPL version 3 license: http://opensource.org/licenses/GPL-3.0