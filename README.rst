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

Configuration
~~~~~~~~~~~~~~~~~~~~~~~

**Note**: this pack embeds the ``check_nrpe`` binary from the Nagios plugins, this to avoid to have a complete Nagios installation on your Alignak server!

The embedded version of ``check_nrpe`` is only compatible with Linux distros. For Unix (FreeBSD), you can simply install the NRPE plugin:
::
   # Simple NRPE
   pkg install nrpe

   # NRPE with SSL
   pkg install nrpe-ssl

If you wish to use the Nagios ``check_nrpe`` plugin, you must install from your system repository:
::
   # Install local NRPE plugin
   apt-get install nagios-nrpe-plugin
   # Note: This installs all the Nagios stuff on your machine ...


Prepare monitored hosts
~~~~~~~~~~~~~~~~~~~~~~~
Some operations are necessary on the monitored hosts if NRPE remote access is not yet activated.
::
   # Install local NRPE server
   su -
   apt-get update
   apt-get install nagios-nrpe-server
   apt-get install nagios-plugins

   # Allow Alignak as a remote host
   vi /etc/nagios/nrpe.cfg
   =>
      allowed_hosts = X.X.X.X

   # Restart NRPE daemon
   /etc/init.d/nagios-nrpe-server start

Test remote access with the plugins files:
::
   /usr/local/var/lib/alignak/libexec/check_nrpe -H 127.0.0.1 -t 9 -u -c check_load


Alignak configuration
~~~~~~~~~~~~~~~~~~~~~~~

You simply have to tag the concerned hosts with the template ``linux-nrpe``.

The main ``linux-nrpe`` template only declares the default NRPE commands configured on the server. You can easily adapt the configuration defined in the ``services.cfg`` and ``commands.cfg.parse`` files.


Bugs, issues and contributing
----------------------------------------

Contributions to this project are welcome and encouraged ... issues in the project repository are the common way to raise an information.

License
----------------------------------------

Alignak Pack EXAMPLE is available under the `GPL version 3 license`_.

.. _GPL version 3 license: http://opensource.org/licenses/GPL-3.0