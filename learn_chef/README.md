PS C:\Users\mason\learn-chef-infra\learn_chef> kitchen converge
-----> Starting Test Kitchen (v2.5.1)
-----> Converging <default-centos-7>...
       Preparing files for transfer
       Installing cookbooks for Policyfile C:/Users/mason/learn-chef-infra/learn_chef/Policyfile.rb using `chef install`
       Installing cookbooks from lock
       Using      apt           7.3.0
       Using      ark           5.0.0
       Using      chef-sugar    5.1.8
       Using      elasticsearch 4.3.0
       Using      java          8.2.1
       Installing learn_chef    0.1.0
       Using      line          2.8.1
       Using      seven_zip     3.1.2
       Using      windows       7.0.0
       Using      yum           5.1.0
       Preparing dna.json
       Exporting cookbook dependencies from Policyfile C:/Users/mason/AppData/Local/Temp/default-centos-7-sandbox-20200617-3776-s7x9ae...
       Exported policy 'learn_chef' to C:/Users/mason/AppData/Local/Temp/default-centos-7-sandbox-20200617-3776-s7x9ae

       To converge this system with the exported policy, run:
         cd C:/Users/mason/AppData/Local/Temp/default-centos-7-sandbox-20200617-3776-s7x9ae
         chef-client -z
       Removing non-cookbook files before transfer
       Preparing validation.pem
       Preparing client.rb
-----> Chef installation detected (install only if missing)
       Transferring files to <default-centos-7>
       Starting Chef Infra Client, version 16.1.16
       Using policy 'learn_chef' at revision 'c50938b232009fa76f77cdddc0f2a3d1a262f9bf9a83fb9f2797fc50905dbd74'
       resolving cookbooks for run list: ["learn_chef::default@0.1.0 (bca81ab)"]
       Synchronizing Cookbooks:
         - apt (7.3.0)
         - ark (5.0.0)
         - chef-sugar (5.1.8)
         - elasticsearch (4.3.0)
         - java (8.2.1)
         - learn_chef (0.1.0)
         - line (2.8.1)
         - seven_zip (3.1.2)
         - windows (7.0.0)
         - yum (5.1.0)
       Installing Cookbook Gems:
       Compiling Cookbooks...
       [2020-06-17T09:03:30+00:00] WARN: Resource windows_user_privilege from the client is overriding the resource from a cookbook. Please upgrade your cookbook or remove the cookbook from your run_list.
       Converging 4 resources
       Recipe: learn_chef::default
         * elasticsearch_user[elasticsearch] action create
           * group[elasticsearch] action create (up to date)
           * linux_user[elasticsearch] action create (up to date)
            (up to date)
         * group[elasticsearch] action nothing (skipped due to action :nothing)
         * linux_user[elasticsearch] action nothing (skipped due to action :nothing)
         * elasticsearch_install[my_es_installation] action install
           * remote_file[/tmp/kitchen/cache/elasticsearch-7.4.2-x86_64.rpm] action create
             - create new file /tmp/kitchen/cache/elasticsearch-7.4.2-x86_64.rpm
             - update content in file /tmp/kitchen/cache/elasticsearch-7.4.2-x86_64.rpm from none to af616e
             (file sizes exceed 10000000 bytes, diff output suppressed)
             - change mode from '' to '0644'
             - restore selinux security context
           * yum_package[/tmp/kitchen/cache/elasticsearch-7.4.2-x86_64.rpm] action install
             - install version 0:7.4.2-1.x86_64 of package /tmp/kitchen/cache/elasticsearch-7.4.2-x86_64.rpm

         * remote_file[/tmp/kitchen/cache/elasticsearch-7.4.2-x86_64.rpm] action nothing (skipped due to action :nothing)
         * yum_package[/tmp/kitchen/cache/elasticsearch-7.4.2-x86_64.rpm] action nothing (skipped due to action :nothing)
         * elasticsearch_configure[elasticsearch] action manage
           * directory[/etc/elasticsearch] action create
             - change mode from '02750' to '0750'
             - change owner from 'root' to 'elasticsearch'
             - restore selinux security context
           * directory[/etc/elasticsearch/scripts] action create
             - create new directory /etc/elasticsearch/scripts
             - change mode from '' to '0750'
             - change owner from '' to 'elasticsearch'
             - change group from '' to 'elasticsearch'
             - restore selinux security context
           * directory[/var/lib/elasticsearch] action create
             - change mode from '02750' to '0755'
             - restore selinux security context
           * directory[/var/log/elasticsearch] action create
             - change mode from '02750' to '0755'
             - restore selinux security context
           * template[elasticsearch.in.sh-elasticsearch] action create
             - update content in file /etc/sysconfig/elasticsearch from d239d2 to dcc323
             --- /etc/sysconfig/elasticsearch   2019-10-28 20:55:59.000000000 +0000
             +++ /etc/sysconfig/.chef-elasticsearch20200617-3302-eagf5u 2020-06-17 09:05:12.029027900 +0000
             @@ -1,52 +1,19 @@
       ################################
             +# THIS FILE IS MANAGED BY CHEF
             +################################
       # Elasticsearch
       ################################
             -
             -# Elasticsearch home directory
             -#ES_HOME=/usr/share/elasticsearch
             -
             -# Elasticsearch Java path
             -#JAVA_HOME=
             -
             -# Elasticsearch configuration directory
             -ES_PATH_CONF=/etc/elasticsearch
             -
             -# Elasticsearch PID directory
             -#PID_DIR=/var/run/elasticsearch
             -
             -# Additional Java OPTS
             -#ES_JAVA_OPTS=
             -
             -# Configure restart on package upgrade (true, every other setting will lead to not restarting)
             -#RESTART_ON_UPGRADE=true
             -
             +#  CHANGES MAY BE OVERWRITTEN
       ################################
             -# Elasticsearch service
             -################################

             -# SysV init.d
             -#
             -# The number of seconds to wait before checking if Elasticsearch started successfully as a daemon process
             +DATA_DIR=/var/lib/elasticsearch
             +ES_HOME=/usr/share/elasticsearch
             +ES_PATH_CONF=/etc/elasticsearch
       ES_STARTUP_SLEEP_TIME=5
             -
             -################################
             -# System properties
             -################################
             -
             -# Specifies the maximum file descriptor number that can be opened by this process
             -# When using Systemd, this setting is ignored and the LimitNOFILE defined in
             -# /usr/lib/systemd/system/elasticsearch.service takes precedence
             -#MAX_OPEN_FILES=65535
             -
             -# The maximum number of bytes of memory that may be locked into RAM
             -# Set to "unlimited" if you use the 'bootstrap.memory_lock: true' option
             -# in elasticsearch.yml.
             -# When using systemd, LimitMEMLOCK must be set in a unit file such as
             -# /etc/systemd/system/elasticsearch.service.d/override.conf.
             -#MAX_LOCKED_MEMORY=unlimited
             -
             -# Maximum number of VMA (Virtual Memory Areas) a process can own
             -# When using Systemd, this setting is ignored and the 'vm.max_map_count'
             -# property is set at boot time in /usr/lib/sysctl.d/elasticsearch.conf
             -#MAX_MAP_COUNT=262144
             +LOG_DIR=/var/log/elasticsearch
             +MAX_LOCKED_MEMORY=unlimited
             +MAX_MAP_COUNT=262144
             +MAX_OPEN_FILES=65536
             +PID_DIR=/var/run/elasticsearch
             +RESTART_ON_UPGRADE=false
             - change mode from '0660' to '0644'
             - restore selinux security context
           * template[jvm_options-elasticsearch] action create
             - update content in file /etc/elasticsearch/jvm.options from 28e361 to f9a5fa
             --- /etc/elasticsearch/jvm.options 2019-10-28 20:55:59.000000000 +0000
             +++ /etc/elasticsearch/.chef-jvm20200617-3302-caiewf.options       2020-06-17 09:05:12.060444610 +0000
             @@ -1,122 +1,21 @@
       ## JVM configuration

             -################################################################
             -## IMPORTANT: JVM heap size
             -################################################################
             -##
             -## You should always set the min and max JVM heap
             -## size to the same value. For example, to set
             -## the heap to 4 GB, set:
             -##
             -## -Xms4g
             -## -Xmx4g
             -##
             -## See https://www.elastic.co/guide/en/elasticsearch/reference/current/heap-size.html
             -## for more information
             -##
             -################################################################
             -
             -# Xms represents the initial size of total heap space
             -# Xmx represents the maximum size of total heap space
             -
             --Xms1g
             --Xmx1g
             -
             -################################################################
             -## Expert settings
             -################################################################
             -##
             -## All settings below this section are considered
             -## expert settings. Don't tamper with them unless
             -## you understand what you are doing
             -##
             -################################################################
             -
             -## GC configuration
             +-Xms495m
             +-Xmx495m
       -XX:+UseConcMarkSweepGC
       -XX:CMSInitiatingOccupancyFraction=75
       -XX:+UseCMSInitiatingOccupancyOnly
             -
             -## G1GC Configuration
             -# NOTE: G1GC is only supported on JDK version 10 or later.
             -# To use G1GC uncomment the lines below.
             -# 10-:-XX:-UseConcMarkSweepGC
             -# 10-:-XX:-UseCMSInitiatingOccupancyOnly
             -# 10-:-XX:+UseG1GC
             -# 10-:-XX:G1ReservePercent=25
             -# 10-:-XX:InitiatingHeapOccupancyPercent=30
             -
             -## DNS cache policy
             -# cache ttl in seconds for positive DNS lookups noting that this overrides the
             -# JDK security property networkaddress.cache.ttl; set to -1 to cache forever
             --Des.networkaddress.cache.ttl=60
             -# cache ttl in seconds for negative DNS lookups noting that this overrides the
             -# JDK security property networkaddress.cache.negative ttl; set to -1 to cache
             -# forever
             --Des.networkaddress.cache.negative.ttl=10
             -
             -## optimizations
             -
             -# pre-touch memory pages used by the JVM during initialization
       -XX:+AlwaysPreTouch
             -
             -## basic
             -
             -# explicitly set the stack size
             +-server
       -Xss1m
             -
             -# set to headless, just in case
       -Djava.awt.headless=true
             -
             -# ensure UTF-8 encoding by default (e.g. filenames)
       -Dfile.encoding=UTF-8
             -
             -# use our provided JNA always versus the system one
       -Djna.nosys=true
             -
             -# turn off a JDK optimization that throws away stack traces for common
             -# exceptions because stack traces are important for debugging
       -XX:-OmitStackTraceInFastThrow
             -
             -# flags to configure Netty
       -Dio.netty.noUnsafe=true
       -Dio.netty.noKeySetOptimization=true
       -Dio.netty.recycler.maxCapacityPerThread=0
             --Dio.netty.allocator.numDirectArenas=0
             -
             -# log4j 2
       -Dlog4j.shutdownHookEnabled=false
       -Dlog4j2.disable.jmx=true
             -
             --Djava.io.tmpdir=${ES_TMPDIR}
             -
             -## heap dumps
             -
             -# generate a heap dump when an allocation from the Java heap fails
             -# heap dumps are created in the working directory of the JVM
       -XX:+HeapDumpOnOutOfMemoryError
             -
             -# specify an alternative path for heap dumps; ensure the directory exists and
             -# has sufficient space
             --XX:HeapDumpPath=/var/lib/elasticsearch
             -
             -# specify an alternative path for JVM fatal error logs
             --XX:ErrorFile=/var/log/elasticsearch/hs_err_pid%p.log
             -
             -## JDK 8 GC logging
             -
             -8:-XX:+PrintGCDetails
             -8:-XX:+PrintGCDateStamps
             -8:-XX:+PrintTenuringDistribution
             -8:-XX:+PrintGCApplicationStoppedTime
             -8:-Xloggc:/var/log/elasticsearch/gc.log
             -8:-XX:+UseGCLogFileRotation
             -8:-XX:NumberOfGCLogFiles=32
             -8:-XX:GCLogFileSize=64m
             -
             -# JDK 9+ GC logging
             -9-:-Xlog:gc*,gc+age=trace,safepoint:file=/var/log/elasticsearch/gc.log:utctime,pid,tags:filecount=32,filesize=64m
             -# due to internationalization enhancements in JDK 9 Elasticsearch need to set the provider to COMPAT otherwise
             -# time/date parsing will break in an incompatible way for some date patterns and locals
             -9-:-Djava.locale.providers=COMPAT
             - change mode from '0660' to '0644'
             - change owner from 'root' to 'elasticsearch'
             - restore selinux security context
           * template[log4j2_properties-elasticsearch] action create
             - update content in file /etc/elasticsearch/log4j2.properties from cbd4e3 to 054218
             --- /etc/elasticsearch/log4j2.properties   2019-10-28 20:55:59.000000000 +0000
             +++ /etc/elasticsearch/.chef-log4j220200617-3302-y5p46j.properties 2020-06-17 09:05:12.095111323 +0000
             @@ -7,16 +7,14 @@
       appender.console.type = Console
       appender.console.name = console
       appender.console.layout.type = PatternLayout
             -appender.console.layout.pattern = [%d{ISO8601}][%-5p][%-25c{1.}] [%node_name]%marker %m%n
             +appender.console.layout.pattern = [%d{ISO8601}][%-5p][%-25c{1.}] %marker%m%n

             -######## Server JSON ############################
       appender.rolling.type = RollingFile
       appender.rolling.name = rolling
             -appender.rolling.fileName = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}_server.json
             -appender.rolling.layout.type = ESJsonLayout
             -appender.rolling.layout.type_name = server
             -
             -appender.rolling.filePattern = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}-%d{yyyy-MM-dd}-%i.json.gz
             +appender.rolling.fileName = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}.log
             +appender.rolling.layout.type = PatternLayout
             +appender.rolling.layout.pattern = [%d{ISO8601}][%-5p][%-25c{1.}] %marker%.-10000m%n
             +appender.rolling.filePattern = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}-%d{yyyy-MM-dd}-%i.log.gz
       appender.rolling.policies.type = Policies
       appender.rolling.policies.time.type = TimeBasedTriggeringPolicy
       appender.rolling.policies.time.interval = 1
             @@ -31,234 +29,58 @@
       appender.rolling.strategy.action.condition.glob = ${sys:es.logs.cluster_name}-*
       appender.rolling.strategy.action.condition.nested_condition.type = IfAccumulatedFileSize
       appender.rolling.strategy.action.condition.nested_condition.exceeds = 2GB
             -################################################
             -######## Server -  old style pattern ###########
             -appender.rolling_old.type = RollingFile
             -appender.rolling_old.name = rolling_old
             -appender.rolling_old.fileName = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}.log
             -appender.rolling_old.layout.type = PatternLayout
             -appender.rolling_old.layout.pattern = [%d{ISO8601}][%-5p][%-25c{1.}] [%node_name]%marker %m%n

             -appender.rolling_old.filePattern = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}-%d{yyyy-MM-dd}-%i.log.gz
             -appender.rolling_old.policies.type = Policies
             -appender.rolling_old.policies.time.type = TimeBasedTriggeringPolicy
             -appender.rolling_old.policies.time.interval = 1
             -appender.rolling_old.policies.time.modulate = true
             -appender.rolling_old.policies.size.type = SizeBasedTriggeringPolicy
             -appender.rolling_old.policies.size.size = 128MB
             -appender.rolling_old.strategy.type = DefaultRolloverStrategy
             -appender.rolling_old.strategy.fileIndex = nomax
             -appender.rolling_old.strategy.action.type = Delete
             -appender.rolling_old.strategy.action.basepath = ${sys:es.logs.base_path}
             -appender.rolling_old.strategy.action.condition.type = IfFileName
             -appender.rolling_old.strategy.action.condition.glob = ${sys:es.logs.cluster_name}-*
             -appender.rolling_old.strategy.action.condition.nested_condition.type = IfAccumulatedFileSize
             -appender.rolling_old.strategy.action.condition.nested_condition.exceeds = 2GB
             -################################################
             -
       rootLogger.level = info
       rootLogger.appenderRef.console.ref = console
       rootLogger.appenderRef.rolling.ref = rolling
             -rootLogger.appenderRef.rolling_old.ref = rolling_old

             -######## Deprecation JSON #######################
       appender.deprecation_rolling.type = RollingFile
       appender.deprecation_rolling.name = deprecation_rolling
             -appender.deprecation_rolling.fileName = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}_deprecation.json
             -appender.deprecation_rolling.layout.type = ESJsonLayout
             -appender.deprecation_rolling.layout.type_name = deprecation
             -appender.deprecation_rolling.layout.esmessagefields=x-opaque-id
             -
             -appender.deprecation_rolling.filePattern = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}_deprecation-%i.json.gz
             +appender.deprecation_rolling.fileName = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}_deprecation.log
             +appender.deprecation_rolling.layout.type = PatternLayout
             +appender.deprecation_rolling.layout.pattern = [%d{ISO8601}][%-5p][%-25c{1.}] %marker%.-10000m%n
             +appender.deprecation_rolling.filePattern = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}_deprecation-%i.log.gz
       appender.deprecation_rolling.policies.type = Policies
       appender.deprecation_rolling.policies.size.type = SizeBasedTriggeringPolicy
       appender.deprecation_rolling.policies.size.size = 1GB
       appender.deprecation_rolling.strategy.type = DefaultRolloverStrategy
       appender.deprecation_rolling.strategy.max = 4
             -#################################################
             -######## Deprecation -  old style pattern #######
             -appender.deprecation_rolling_old.type = RollingFile
             -appender.deprecation_rolling_old.name = deprecation_rolling_old
             -appender.deprecation_rolling_old.fileName = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}_deprecation.log
             -appender.deprecation_rolling_old.layout.type = PatternLayout
             -appender.deprecation_rolling_old.layout.pattern = [%d{ISO8601}][%-5p][%-25c{1.}] [%node_name]%marker %m%n

             -appender.deprecation_rolling_old.filePattern = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}\
             -  _deprecation-%i.log.gz
             -appender.deprecation_rolling_old.policies.type = Policies
             -appender.deprecation_rolling_old.policies.size.type = SizeBasedTriggeringPolicy
             -appender.deprecation_rolling_old.policies.size.size = 1GB
             -appender.deprecation_rolling_old.strategy.type = DefaultRolloverStrategy
             -appender.deprecation_rolling_old.strategy.max = 4
             -#################################################
       logger.deprecation.name = org.elasticsearch.deprecation
       logger.deprecation.level = warn
       logger.deprecation.appenderRef.deprecation_rolling.ref = deprecation_rolling
             -logger.deprecation.appenderRef.deprecation_rolling_old.ref = deprecation_rolling_old
       logger.deprecation.additivity = false

             -######## Search slowlog JSON ####################
       appender.index_search_slowlog_rolling.type = RollingFile
       appender.index_search_slowlog_rolling.name = index_search_slowlog_rolling
             -appender.index_search_slowlog_rolling.fileName = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs\
             -  .cluster_name}_index_search_slowlog.json
             -appender.index_search_slowlog_rolling.layout.type = ESJsonLayout
             -appender.index_search_slowlog_rolling.layout.type_name = index_search_slowlog
             -appender.index_search_slowlog_rolling.layout.esmessagefields=message,took,took_millis,total_hits,types,stats,search_type,total_shards,source,id
             -
             -appender.index_search_slowlog_rolling.filePattern = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs\
             -  .cluster_name}_index_search_slowlog-%i.json.gz
             +appender.index_search_slowlog_rolling.fileName = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}_index_search_slowlog.log
             +appender.index_search_slowlog_rolling.layout.type = PatternLayout
             +appender.index_search_slowlog_rolling.layout.pattern = [%d{ISO8601}][%-5p][%-25c] %marker%.-10000m%n
             +appender.index_search_slowlog_rolling.filePattern = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}_index_search_slowlog-%d{yyyy-MM-dd}.log
       appender.index_search_slowlog_rolling.policies.type = Policies
             -appender.index_search_slowlog_rolling.policies.size.type = SizeBasedTriggeringPolicy
             -appender.index_search_slowlog_rolling.policies.size.size = 1GB
             -appender.index_search_slowlog_rolling.strategy.type = DefaultRolloverStrategy
             -appender.index_search_slowlog_rolling.strategy.max = 4
             -#################################################
             -######## Search slowlog -  old style pattern ####
             -appender.index_search_slowlog_rolling_old.type = RollingFile
             -appender.index_search_slowlog_rolling_old.name = index_search_slowlog_rolling_old
             -appender.index_search_slowlog_rolling_old.fileName = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}\
             -  _index_search_slowlog.log
             -appender.index_search_slowlog_rolling_old.layout.type = PatternLayout
             -appender.index_search_slowlog_rolling_old.layout.pattern = [%d{ISO8601}][%-5p][%-25c{1.}] [%node_name]%marker %m%n
             +appender.index_search_slowlog_rolling.policies.time.type = TimeBasedTriggeringPolicy
             +appender.index_search_slowlog_rolling.policies.time.interval = 1
             +appender.index_search_slowlog_rolling.policies.time.modulate = true

             -appender.index_search_slowlog_rolling_old.filePattern = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}\
             -  _index_search_slowlog-%i.log.gz
             -appender.index_search_slowlog_rolling_old.policies.type = Policies
             -appender.index_search_slowlog_rolling_old.policies.size.type = SizeBasedTriggeringPolicy
             -appender.index_search_slowlog_rolling_old.policies.size.size = 1GB
             -appender.index_search_slowlog_rolling_old.strategy.type = DefaultRolloverStrategy
             -appender.index_search_slowlog_rolling_old.strategy.max = 4
             -#################################################
       logger.index_search_slowlog_rolling.name = index.search.slowlog
       logger.index_search_slowlog_rolling.level = trace
       logger.index_search_slowlog_rolling.appenderRef.index_search_slowlog_rolling.ref = index_search_slowlog_rolling
             -logger.index_search_slowlog_rolling.appenderRef.index_search_slowlog_rolling_old.ref = index_search_slowlog_rolling_old
       logger.index_search_slowlog_rolling.additivity = false

             -######## Indexing slowlog JSON ##################
       appender.index_indexing_slowlog_rolling.type = RollingFile
       appender.index_indexing_slowlog_rolling.name = index_indexing_slowlog_rolling
             -appender.index_indexing_slowlog_rolling.fileName = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}\
             -  _index_indexing_slowlog.json
             -appender.index_indexing_slowlog_rolling.layout.type = ESJsonLayout
             -appender.index_indexing_slowlog_rolling.layout.type_name = index_indexing_slowlog
             -appender.index_indexing_slowlog_rolling.layout.esmessagefields=message,took,took_millis,doc_type,id,routing,source
             -
             -appender.index_indexing_slowlog_rolling.filePattern = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}\
             -  _index_indexing_slowlog-%i.json.gz
             +appender.index_indexing_slowlog_rolling.fileName = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}_index_indexing_slowlog.log
             +appender.index_indexing_slowlog_rolling.layout.type = PatternLayout
             +appender.index_indexing_slowlog_rolling.layout.pattern = [%d{ISO8601}][%-5p][%-25c] %marker%.-10000m%n
             +appender.index_indexing_slowlog_rolling.filePattern = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}_index_indexing_slowlog-%d{yyyy-MM-dd}.log
       appender.index_indexing_slowlog_rolling.policies.type = Policies
             -appender.index_indexing_slowlog_rolling.policies.size.type = SizeBasedTriggeringPolicy
             -appender.index_indexing_slowlog_rolling.policies.size.size = 1GB
             -appender.index_indexing_slowlog_rolling.strategy.type = DefaultRolloverStrategy
             -appender.index_indexing_slowlog_rolling.strategy.max = 4
             -#################################################
             -######## Indexing slowlog -  old style pattern ##
             -appender.index_indexing_slowlog_rolling_old.type = RollingFile
             -appender.index_indexing_slowlog_rolling_old.name = index_indexing_slowlog_rolling_old
             -appender.index_indexing_slowlog_rolling_old.fileName = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}\
             -  _index_indexing_slowlog.log
             -appender.index_indexing_slowlog_rolling_old.layout.type = PatternLayout
             -appender.index_indexing_slowlog_rolling_old.layout.pattern = [%d{ISO8601}][%-5p][%-25c{1.}] [%node_name]%marker %m%n
             +appender.index_indexing_slowlog_rolling.policies.time.type = TimeBasedTriggeringPolicy
             +appender.index_indexing_slowlog_rolling.policies.time.interval = 1
             +appender.index_indexing_slowlog_rolling.policies.time.modulate = true

             -appender.index_indexing_slowlog_rolling_old.filePattern = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}\
             -  _index_indexing_slowlog-%i.log.gz
             -appender.index_indexing_slowlog_rolling_old.policies.type = Policies
             -appender.index_indexing_slowlog_rolling_old.policies.size.type = SizeBasedTriggeringPolicy
             -appender.index_indexing_slowlog_rolling_old.policies.size.size = 1GB
             -appender.index_indexing_slowlog_rolling_old.strategy.type = DefaultRolloverStrategy
             -appender.index_indexing_slowlog_rolling_old.strategy.max = 4
             -#################################################
             -
       logger.index_indexing_slowlog.name = index.indexing.slowlog.index
       logger.index_indexing_slowlog.level = trace
       logger.index_indexing_slowlog.appenderRef.index_indexing_slowlog_rolling.ref = index_indexing_slowlog_rolling
             -logger.index_indexing_slowlog.appenderRef.index_indexing_slowlog_rolling_old.ref = index_indexing_slowlog_rolling_old
       logger.index_indexing_slowlog.additivity = false

             -
             -appender.audit_rolling.type = RollingFile
             -appender.audit_rolling.name = audit_rolling
             -appender.audit_rolling.fileName = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}_audit.json
             -appender.audit_rolling.layout.type = PatternLayout
             -appender.audit_rolling.layout.pattern = {\
             -                "type":"audit", \
             -                "timestamp":"%d{yyyy-MM-dd'T'HH:mm:ss,SSSZ}"\
             -                %varsNotEmpty{, "node.name":"%enc{%map{node.name}}{JSON}"}\
             -                %varsNotEmpty{, "node.id":"%enc{%map{node.id}}{JSON}"}\
             -                %varsNotEmpty{, "host.name":"%enc{%map{host.name}}{JSON}"}\
             -                %varsNotEmpty{, "host.ip":"%enc{%map{host.ip}}{JSON}"}\
             -                %varsNotEmpty{, "event.type":"%enc{%map{event.type}}{JSON}"}\
             -                %varsNotEmpty{, "event.action":"%enc{%map{event.action}}{JSON}"}\
             -                %varsNotEmpty{, "user.name":"%enc{%map{user.name}}{JSON}"}\
             -                %varsNotEmpty{, "user.run_by.name":"%enc{%map{user.run_by.name}}{JSON}"}\
             -                %varsNotEmpty{, "user.run_as.name":"%enc{%map{user.run_as.name}}{JSON}"}\
             -                %varsNotEmpty{, "user.realm":"%enc{%map{user.realm}}{JSON}"}\
             -                %varsNotEmpty{, "user.run_by.realm":"%enc{%map{user.run_by.realm}}{JSON}"}\
             -                %varsNotEmpty{, "user.run_as.realm":"%enc{%map{user.run_as.realm}}{JSON}"}\
             -                %varsNotEmpty{, "user.roles":%map{user.roles}}\
             -                %varsNotEmpty{, "origin.type":"%enc{%map{origin.type}}{JSON}"}\
             -                %varsNotEmpty{, "origin.address":"%enc{%map{origin.address}}{JSON}"}\
             -                %varsNotEmpty{, "realm":"%enc{%map{realm}}{JSON}"}\
             -                %varsNotEmpty{, "url.path":"%enc{%map{url.path}}{JSON}"}\
             -                %varsNotEmpty{, "url.query":"%enc{%map{url.query}}{JSON}"}\
             -                %varsNotEmpty{, "request.method":"%enc{%map{request.method}}{JSON}"}\
             -                %varsNotEmpty{, "request.body":"%enc{%map{request.body}}{JSON}"}\
             -                %varsNotEmpty{, "request.id":"%enc{%map{request.id}}{JSON}"}\
             -                %varsNotEmpty{, "action":"%enc{%map{action}}{JSON}"}\
             -                %varsNotEmpty{, "request.name":"%enc{%map{request.name}}{JSON}"}\
             -                %varsNotEmpty{, "indices":%map{indices}}\
             -                %varsNotEmpty{, "opaque_id":"%enc{%map{opaque_id}}{JSON}"}\
             -                %varsNotEmpty{, "x_forwarded_for":"%enc{%map{x_forwarded_for}}{JSON}"}\
             -                %varsNotEmpty{, "transport.profile":"%enc{%map{transport.profile}}{JSON}"}\
             -                %varsNotEmpty{, "rule":"%enc{%map{rule}}{JSON}"}\
             -                %varsNotEmpty{, "event.category":"%enc{%map{event.category}}{JSON}"}\
             -                }%n
             -# "node.name" node name from the `elasticsearch.yml` settings
             -# "node.id" node id which should not change between cluster restarts
             -# "host.name" unresolved hostname of the local node
             -# "host.ip" the local bound ip (i.e. the ip listening for connections)
             -# "event.type" a received REST request is translated into one or more transport requests. This indicates which processing layer generated the event "rest" or "transport" (internal)
             -# "event.action" the name of the audited event, eg. "authentication_failed", "access_granted", "run_as_granted", etc.
             -# "user.name" the subject name as authenticated by a realm
             -# "user.run_by.name" the original authenticated subject name that is impersonating another one.
             -# "user.run_as.name" if this "event.action" is of a run_as type, this is the subject name to be impersonated as.
             -# "user.realm" the name of the realm that authenticated "user.name"
             -# "user.run_by.realm" the realm name of the impersonating subject ("user.run_by.name")
             -# "user.run_as.realm" if this "event.action" is of a run_as type, this is the realm name the impersonated user is looked up from
             -# "user.roles" the roles array of the user; these are the roles that are granting privileges
             -# "origin.type" it is "rest" if the event is originating (is in relation to) a REST request; possible other values are "transport" and "ip_filter"
             -# "origin.address" the remote address and port of the first network hop, i.e. a REST proxy or another cluster node
             -# "realm" name of a realm that has generated an "authentication_failed" or an "authentication_successful"; the subject is not yet authenticated
             -# "url.path" the URI component between the port and the query string; it is percent (URL) encoded
             -# "url.query" the URI component after the path and before the fragment; it is percent (URL) encoded
             -# "request.method" the method of the HTTP request, i.e. one of GET, POST, PUT, DELETE, OPTIONS, HEAD, PATCH, TRACE, CONNECT
             -# "request.body" the content of the request body entity, JSON escaped
             -# "request.id" a synthentic identifier for the incoming request, this is unique per incoming request, and consistent across all audit events generated by that request
             -# "action" an action is the most granular operation that is authorized and this identifies it in a namespaced way (internal)
             -# "request.name" if the event is in connection to a transport message this is the name of the request class, similar to how rest requests are identified by the url path (internal)
             -# "indices" the array of indices that the "action" is acting upon
             -# "opaque_id" opaque value conveyed by the "X-Opaque-Id" request header
             -# "x_forwarded_for" the addresses from the "X-Forwarded-For" request header, as a verbatim string value (not an array)
             -# "transport.profile" name of the transport profile in case this is a "connection_granted" or "connection_denied" event
             -# "rule" name of the applied rulee if the "origin.type" is "ip_filter"
             -# "event.category" fixed value "elasticsearch-audit"
             -
             -appender.audit_rolling.filePattern = ${sys:es.logs.base_path}${sys:file.separator}${sys:es.logs.cluster_name}_audit-%d{yyyy-MM-dd}.json
             -appender.audit_rolling.policies.type = Policies
             -appender.audit_rolling.policies.time.type = TimeBasedTriggeringPolicy
             -appender.audit_rolling.policies.time.interval = 1
             -appender.audit_rolling.policies.time.modulate = true
             -
             -logger.xpack_security_audit_logfile.name = org.elasticsearch.xpack.security.audit.logfile.LoggingAuditTrail
             -logger.xpack_security_audit_logfile.level = info
             -logger.xpack_security_audit_logfile.appenderRef.audit_rolling.ref = audit_rolling
             -logger.xpack_security_audit_logfile.additivity = false
             -
             -logger.xmlsig.name = org.apache.xml.security.signature.XMLSignature
             -logger.xmlsig.level = error
             -logger.samlxml_decrypt.name = org.opensaml.xmlsec.encryption.support.Decrypter
             -logger.samlxml_decrypt.level = fatal
             -logger.saml2_decrypt.name = org.opensaml.saml.saml2.encryption.Decrypter
             -logger.saml2_decrypt.level = fatal
             - change mode from '0660' to '0640'
             - change owner from 'root' to 'elasticsearch'
             - restore selinux security context
           * template[elasticsearch.yml-elasticsearch] action create
             - update content in file /etc/elasticsearch/elasticsearch.yml from 2640ef to 652899
             --- /etc/elasticsearch/elasticsearch.yml   2019-10-28 20:55:59.000000000 +0000
             +++ /etc/elasticsearch/.chef-elasticsearch20200617-3302-194ndx2.yml        2020-06-17 09:05:12.141694720 +0000
             @@ -1,89 +1,15 @@
             -# ======================== Elasticsearch Configuration =========================
             +# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             +# THIS FILE IS MANAGED BY CHEF, DO NOT EDIT MANUALLY, YOUR CHANGES WILL BE OVERWRITTEN!
       #
             -# NOTE: Elasticsearch comes with reasonable defaults for most settings.
             -#       Before you set out to tweak and tune the configuration, make sure you
             -#       understand what are you trying to accomplish and the consequences.
             +# Please see the documentation for further information on configuration options:
             +# <https://www.elastic.co/guide/en/elasticsearch/reference/current/settings.html>
       #
             -# The primary way of configuring a node is via this file. This template lists
             -# the most important settings you may want to configure for a production cluster.
             -#
             -# Please consult the documentation for further information on configuration options:
             -# https://www.elastic.co/guide/en/elasticsearch/reference/index.html
             -#
             -# ---------------------------------- Cluster -----------------------------------
             -#
             -# Use a descriptive name for your cluster:
             -#
             -#cluster.name: my-application
             -#
             -# ------------------------------------ Node ------------------------------------
             -#
             -# Use a descriptive name for the node:
             -#
             -#node.name: node-1
             -#
             -# Add custom attributes to the node:
             -#
             -#node.attr.rack: r1
             -#
             -# ----------------------------------- Paths ------------------------------------
             -#
             -# Path to directory where to store the data (separate multiple locations by comma):
             -#
             -path.data: /var/lib/elasticsearch
             -#
             -# Path to log files:
             -#
             -path.logs: /var/log/elasticsearch
             -#
             -# ----------------------------------- Memory -----------------------------------
             -#
             -# Lock the memory on startup:
             -#
             -#bootstrap.memory_lock: true
             -#
             -# Make sure that the heap size is set to about half the memory available
             -# on the system and that the owner of the process is allowed to use this
             -# limit.
             -#
             -# Elasticsearch performs poorly when the system is swapping the memory.
             -#
             -# ---------------------------------- Network -----------------------------------
             -#
             -# Set the bind address to a specific IP (IPv4 or IPv6):
             -#
             -#network.host: 192.168.0.1
             -#
             -# Set a custom port for HTTP:
             -#
             -#http.port: 9200
             -#
             -# For more information, consult the network module documentation.
             -#
             -# --------------------------------- Discovery ----------------------------------
             -#
             -# Pass an initial list of hosts to perform discovery when this node is started:
             -# The default list of hosts is ["127.0.0.1", "[::1]"]
             -#
             -#discovery.seed_hosts: ["host1", "host2"]
             -#
             -# Bootstrap the cluster using an initial set of master-eligible nodes:
             -#
             -#cluster.initial_master_nodes: ["node-1", "node-2"]
             -#
             -# For more information, consult the discovery and cluster formation module documentation.
             -#
             -# ---------------------------------- Gateway -----------------------------------
             -#
             -# Block initial recovery after a full cluster restart until N nodes are started:
             -#
             -#gateway.recover_after_nodes: 3
             -#
             -# For more information, consult the gateway module documentation.
             -#
             -# ---------------------------------- Various -----------------------------------
             -#
             -# Require explicit names when deleting indices:
             -#
             -#action.destructive_requires_name: true
             +---
             +cluster.name: elasticsearch
             +node.name: default-centos-7
             +path.data: "/var/lib/elasticsearch"
             +path.logs: "/var/log/elasticsearch"
             +network.host: 0.0.0.0
             +http.port: 9200
             +
             - change mode from '0660' to '0640'
             - change owner from 'root' to 'elasticsearch'
             - restore selinux security context

         * directory[/etc/elasticsearch] action nothing (skipped due to action :nothing)
         * directory[/etc/elasticsearch/scripts] action nothing (skipped due to action :nothing)
         * directory[/var/lib/elasticsearch] action nothing (skipped due to action :nothing)
         * directory[/var/log/elasticsearch] action nothing (skipped due to action :nothing)
         * template[elasticsearch.in.sh-elasticsearch] action nothing (skipped due to action :nothing)
         * template[jvm_options-elasticsearch] action nothing (skipped due to action :nothing)
         * template[log4j2_properties-elasticsearch] action nothing (skipped due to action :nothing)
         * template[elasticsearch.yml-elasticsearch] action nothing (skipped due to action :nothing)
         * elasticsearch_service[elasticsearch] action configure
           * directory[/var/run/elasticsearch-elasticsearch] action create
             - create new directory /var/run/elasticsearch
             - change mode from '' to '0755'
             - change owner from '' to 'elasticsearch'
             - change group from '' to 'elasticsearch'
             - restore selinux security context
           * template[/etc/init.d/elasticsearch] action create
             - update content in file /etc/init.d/elasticsearch from c2ecd2 to 91013b
             --- /etc/init.d/elasticsearch      2019-10-28 20:55:59.000000000 +0000
             +++ /etc/init.d/.chef-elasticsearch20200617-3302-fylnyh    2020-06-17 09:05:12.203444804 +0000
             @@ -33,7 +33,7 @@

       # Sets the default values for elasticsearch variables used in this script
       ES_HOME="/usr/share/elasticsearch"
             -MAX_OPEN_FILES=65535
             +MAX_OPEN_FILES=65536
       MAX_MAP_COUNT=262144
       ES_PATH_CONF="/etc/elasticsearch"

             @@ -67,7 +67,21 @@
           exit 1
       fi

             +checkJava() {
             +    if [ -x "$JAVA_HOME/bin/java" ]; then
             +        JAVA="$JAVA_HOME/bin/java"
             +    else
             +        JAVA=`which java`
             +    fi
             +
             +    if [ ! -x "$JAVA" ]; then
             +        echo "Could not find any executable java binary. Please install java in your PATH or set JAVA_HOME"
             +        exit 1
             +    fi
             +}
             +
       start() {
             +    checkJava
           [ -x $exec ] || exit 5

           if [ -n "$MAX_OPEN_FILES" ]; then
             @@ -76,7 +90,7 @@
           if [ -n "$MAX_LOCKED_MEMORY" ]; then
               ulimit -l $MAX_LOCKED_MEMORY
           fi
             -    if [ -n "$MAX_MAP_COUNT" -a -f /proc/sys/vm/max_map_count ] && [ "$MAX_MAP_COUNT" -gt $(cat /proc/sys/vm/max_map_count) ]; then
             +    if [ -n "$MAX_MAP_COUNT" -a -f /proc/sys/vm/max_map_count ]; then
               sysctl -q -w vm.max_map_count=$MAX_MAP_COUNT
           fi

             - change mode from '0750' to '0755'
             - restore selinux security context
           * directory[/usr/lib/systemd/system-elasticsearch] action create (up to date)
           * template[/usr/lib/systemd/system/elasticsearch.service] action create
             - update content in file /usr/lib/systemd/system/elasticsearch.service from 453b37 to 039884
             --- /usr/lib/systemd/system/elasticsearch.service  2019-10-28 20:55:59.000000000 +0000
             +++ /usr/lib/systemd/system/.chef-elasticsearch20200617-3302-lfegi.service 2020-06-17 09:05:12.253278205 +0000
             @@ -5,13 +5,10 @@
       After=network-online.target

       [Service]
             -Type=notify
       RuntimeDirectory=elasticsearch
             -PrivateTmp=true
       Environment=ES_HOME=/usr/share/elasticsearch
       Environment=ES_PATH_CONF=/etc/elasticsearch
       Environment=PID_DIR=/var/run/elasticsearch
             -Environment=ES_SD_NOTIFY=true
       EnvironmentFile=-/etc/sysconfig/elasticsearch

       WorkingDirectory=/usr/share/elasticsearch
             @@ -31,7 +28,7 @@
       StandardError=inherit

       # Specifies the maximum file descriptor number that can be opened by this process
             -LimitNOFILE=65535
             +LimitNOFILE=65536

       # Specifies the maximum number of processes
       LimitNPROC=4096
             @@ -60,5 +57,5 @@
       [Install]
       WantedBy=multi-user.target

             -# Built for packages-7.4.2 (packages)
             +# Built for distribution-6.0.0 (distribution)
             - restore selinux security context
           * execute[reload-systemd-elasticsearch] action run
             - execute systemctl daemon-reload
           * service[elasticsearch] action enable
             - enable service service[elasticsearch]
           * service[elasticsearch] action start
             - start service service[elasticsearch]

         * directory[/var/run/elasticsearch-elasticsearch] action nothing (skipped due to action :nothing)
         * template[/etc/init.d/elasticsearch] action nothing (skipped due to action :nothing)
         * directory[/usr/lib/systemd/system-elasticsearch] action nothing (skipped due to action :nothing)
         * template[/usr/lib/systemd/system/elasticsearch.service] action nothing (skipped due to action :nothing)
         * execute[reload-systemd-elasticsearch] action nothing (skipped due to action :nothing)
         * service[elasticsearch] action nothing (skipped due to action :nothing)

       Running handlers:
       Running handlers complete
       Chef Infra Client finished, 19/41 resources updated in 01 minutes 45 seconds
       Downloading files from <default-centos-7>
       Finished converging <default-centos-7> (1m55.39s).
-----> Test Kitchen is finished. (1m58.89s)
PS C:\Users\mason\learn-chef-infra\learn_chef> kitchen login centos
Last login: Wed Jun 17 09:03:25 2020 from 10.0.2.2

This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento
[vagrant@default-centos-7 ~]$ curl localhost:9200
curl: (7) Failed connect to localhost:9200; Connection refused

