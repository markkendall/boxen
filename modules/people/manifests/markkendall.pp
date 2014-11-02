class people::markkendall {
  # OS X settings
  include osx::global::tap_to_click
  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::finder::unhide_library
  include osx::software_update
  include osx::keyboard::capslock_to_control

  class { 'osx::global::key_repeat_delay': delay => 10 }
  class { 'osx::global::key_repeat_rate': rate => 2 }
  class { 'osx::dock::icon_size': size => 48 } 
  class { 'osx::mouse::button_mode': mode => 2 }

  # OS X dock
  include dockutil
  dockutil::item { 'iCal':
    item     => "/Applications/Calendar.app",
    label    => "Calendar",
    action   => "add",
    position => 1,
  }
  dockutil::item { 'Things':
    item     => "/Applications/Things.app",
    label    => "Things",
    action   => "add",
    position => 2,
  }
  dockutil::item { 'Mailbox':
    item     => "/Applications/Mailbox (Beta).app",
    label    => "Mailbox",
    action   => "add",
    position => 3,
  }

  # Alfred
  include alfred

  # Chrome
  include chrome

  # Dropbox
  include dropbox

  # GitX
  include gitx::l

  # Imagemagick
  include imagemagick

  # Iterm
  include iterm2::dev
  include iterm2::colors::solarized_light
  include iterm2::colors::solarized_dark

  # Macvim
  include macvim

  # Mailbox
  include mailbox

  # MySQL
  include mysql

  # 1Password
  include onepassword

  # Postgres
  include postgresql

  # Pow
  class {'pow':
    host_dir => '/opt/boxen/data/pow/hosts',
    log_dir => '/opt/boxen/log/pow',
    dns_port => 30560,
    http_port => 30559,
    dst_port => 1999,
    domains => 'pow',
    ext_domains => undef,     # uses pow default, ""
    timeout => undef,         # uses pow default, 900
    workers => undef,         # uses pow default, 2
    nginx_proxy => true
  }

  # Rdio
  include rdio

  # Things
  include things

  # tmux
  include tmux

  # zsh
  include zsh
  include ohmyzsh
}
