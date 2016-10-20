name             "copperegg"
maintainer       "IDERA"
maintainer_email "support-uptimecm@idera.com"
license          "MIT"
description      "Installs and configures Uptime Cloud Monitor services"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

# depends 'chef_handler', '> 1.0.0'
depends 'curl'
depends 'apt', '= 3.0.0'

recipe "copperegg::default", "Installs Uptime Cloud Monitor collector binary"

supports 'linux', ">= 2.6.9"
supports 'ubuntu', ">= 8.04"
supports 'debian', ">= 5.0"
supports 'vyatta'
supports 'redhat', ">= 5.0"
supports 'centos', ">= 5.0"
supports 'fedora', ">= 14.0"
supports 'amazon', ">= 2011.02.1"
supports 'suse', ">= 11.0"
supports 'opensuse', ">= 11.0"
supports 'gentoo', ">= 1.12"
supports 'windows'
