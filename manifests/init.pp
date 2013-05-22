package { 'vim':
  ensure   => 'installed',
}

package { 'git':
  ensure   => 'installed',
}

package { 'rake':
  ensure   => 'installed',
  provider => 'gem',
}

package { 'puppet':
  ensure   => 'installed',
  provider => 'gem',
}

package { 'rspec-puppet':
  ensure   => 'installed',
  provider => 'gem',
}

package { 'puppet-lint':
  ensure   => 'installed',
  provider => 'gem',
}

package { 'puppetlabs-spec-helper':
  ensure   => 'installed',
  provider => 'gem',
  source   => "/vagrant/puppetlabs_spec_helper-0.4.1.3.gem"
}
