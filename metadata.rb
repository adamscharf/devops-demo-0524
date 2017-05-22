name 'devops-demo-0524'
maintainer 'Adam Scharf'
maintainer_email 'scharfat@gmail.com'
license 'Apache 2.0'
description 'Demo'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

source_url 'https://github.com/adamscharf/devops-demo-0524'
issues_url 'https://github.com/adamscharf/devops-demo-0524/issues'

recipe 'devops-demo-0524::default',
       'Demo'

chef_version '>= 12.5' if respond_to?(:chef_version)

supports 'amazon', '>= 2016.09'
