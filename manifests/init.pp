# Class: pm_chrony
# ===========================
#
# Full description of class pm_chrony here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'pm_chrony':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class pm_chrony {

	case $operatingsystem {
		centos:{ $service_name = 'chronyd' }
}

	package { 'chrony':
		ensure => installed,
}

	service { 'chronyd':
		name       => $service_name,
		ensure     => running,
		enable     => true,
		subscribe  => File ['chrony.conf'],
}

	 file { 'chrony.conf':
		path       => '/etc/chrony.conf',
		ensure     => file,
		require    => Package['chrony'],
		source     => "puppet:///modules/chrony/chrony.conf",
		# This source file would be located on the Puppet master at
		#   # /etc/puppetlabs/code/modules/ntp/files/ntp.conf


}
