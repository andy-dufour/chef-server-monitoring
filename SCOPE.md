# chef-server-monitoring

The purpose of this cookbook is to provide prescriptive guidance and an example implementation of monitoring a Chef server at scale.

Prescriptive Chef Server Monitoring
===

Below I'll outline the work I want to do on creating prescriptive Chef Server monitoring. This will be transposed into JIRA tasks on the CSE JIRA board, [here](https://chefio.atlassian.net/browse/CE-834).

Goal
---

Create a provisioning cookbook that will build a Sensu and Graphite server to monitor a Chef server cluster via AWS, Vagrant or SSH. Also provision the required monitoring via the chef-provisioning SSH driver or via a recipe and having the chef-servers being clients of themselves, the later being preferred. Optional log parsing should also be included using splunk and/or logstash.

In the end, this cookbook may not be used that commonly, but should exist with reference code and examples for Chef server admins to easily setup monitoring with common tools available today.

### Sensu

We should install the open source Sensu server and Sensu client on the monitoring server, as well as the Sensu client on all Chef servers.

### Graphite

We should install and configure Graphite on the Sensu server or a separate server, and configure chef-server to emit its graphite data there, or consume data via Sensu and push it to Graphite.

### Grafana

Since Grafana makes pretty graphs we should look at it.

### Alerting

#### Operating System

We should configure and alert on the following for base OS:

- Disk Space
- CPU
- Load Average
- Free Memory
- DiskIO
- File Handles
- Number of processes
- Network bandwidth usage
- Number of connections (by port?)

#### Chef Server Application

We should configure and alert on the following for the Chef server:

- Procmon (are processes running)
- Erchef Erlang pooler metrics (sqerl, rabbit, chef_authz)
- Nginx stats
- JMX monitoring of Solr
- PostgreSQL stats (pgstats? probably needs its own section)
- RabbitMQ
- Bookshelf
- Time to API_FQDN ssl certificate expiry
- Synthetic user checks (execute a knife cookbook upload, knife node list, knife search?)

#### Log Collection

We should collect request logs from erchef, bifrost, etc, and let them be used for analysis and monitoring. We should collect nginx access logs and report on http status codes, number of requests per minute, etc.

##### App-perf log metadata

Example log line: `2015-12-06T20:54:53Z erchef@127.0.0.1 method=GET; path=/organizations/pedant_testorg_api_5028/containers/clients/_acl; status=200; req_id=g3IAA2QAEGVyY2hlZkAxMjcuMC4wLjEDAAMK3AAAAAAAAAAA; org_name=pedant_testorg_api_5028; couchdb_groups=false; couchdb_organizations=false; couchdb_containers=false; couchdb_acls=false; 503_mode=false; couchdb_associations=false; couchdb_association_requests=false; req_time=28; rdbms_time=1; rdbms_count=3; user=pivotal; req_api_version=0;`

Parse the log line and grok:

- Status
- Request time
- PSQL time (rdbms time)
- # of PSQL queries (rdbms count)
 
##### Nginx log metadata

Example log line: `127.0.0.1 - - [08/Dec/2015:12:47:57 -0500]  "GET /license HTTP/1.1" 200 "0.004" 133 "-" "chef-pedant rspec tests" "127.0.0.1:8000" "200" "0.004" "12.5.1" "algorithm=sha1;version=1.0;" "pivotal" "2015-12-08T17:47:57Z" "2jmj7l5rSw0yVb/vlWAYkK/YBwk=" 879`

Parse the log line and grok:

- Source IP
- Date/time
- HTTP method
- HTTP Response code
- URL
- User-Agent
