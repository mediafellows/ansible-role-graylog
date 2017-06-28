[![Build Status](https://travis-ci.org/mediapeers/ansible-role-graylog.svg?branch=master)](https://travis-ci.org/mediapeers/ansible-role-graylog)

# Graylog role

Ansible role to install and setup Graylog 2 server. Also installs dependencies such as ElasticSearch and MongoDB.

Uses [Mediapeers' ElasticSearch role](https://github.com/mediapeers/ansible-role-elasticsearch) to install ElasticSearch.

## Requirements

Server running Ubuntu Linux, or other debiand based distro.


## Role Variables

Those variables have to be set for thing to work:
- `graylog_password_salt: abc123123123` - Set your own PW salt for Graylog PWs/seccrets
- `graylog_root_username: graylog` - Set your own dmin username for Graylog login
- `graylog_root_password_sha2: asdccsd3123` - Set your own admin PW for Graylog login
- `graylog_public_api_endpoint: 'https://my-dummy-domin.com:9000/api/'` - Set this to the publicly reachable API endpoint
- `elasticsearch_heap_size: 2g` - Set this to half the amount of the instaces RAM size. If this value is to high Elasticsearch might fail to start (runing out of Memory)!

Those variables can be overriden optionally (come with acceptable defaults):
- `elasticsearch_cluster_name: graylog` - Change to your prefered ES cluster name
- `graylog_root_user_email: graylog@email.com` - Set admin users email
- `graylog_major_version: 2.3` - Major graylog version to install
- `elasticsearch_version: 2.3.3` - ElasticSearch version to install (make sure it's compatible with the Graylog version).
- `graylog_custom_plugins: []` - List of Graylog plugins to install (in addition to default ones)
- `elasticsearch_plugins: []` - List of ElasticSearch plugins to install

## Dependencies

Depends on the ElasticSearch Ansible role `mediapeers.elasticsearch`. Make sure that role installed in your Ansible project first.

## Example Playbook

Example Playbook with minimal set of required parameters:

    - hosts: servers
      vars:
        graylog_password_salt: abc123123123
        graylog_root_username: graylog
        graylog_root_password_sha2: asdccsd3123
        graylog_root_user_email: graylog@email.com
        graylog_public_hostname: 'https://dummy-hostname.com'
      roles:
         - mediapeers.graylog

## License

BSD

## Author Information

Stefan Horning <horning@mediapeers.com>
