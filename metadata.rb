name 'dima-repose'
maintainer 'Dimitry Ushakov'
maintainer_email 'repose@dimitryushakov.com'
license 'MIT'
description 'Installs/Configures dima repose'
supports 'ubuntu'
supports 'debian'
chef_version '13.0.118'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.3'
if respond_to?(:issues_url)
  issues_url 'https://github.com/dimtruck/dima-repose-cookbook/issues'
end
if respond_to?(:source_url)
  source_url 'https://github.com/dimtruck/dima-repose-cookbook'
end

depends 'apt'
depends 'java'
depends 'repose'
depends 'poise-python'
depends 'runit'
