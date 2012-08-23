enron-jruby-sinatra-hbase-pig
=============================

Hortonworks demo of Enron emails using Hadoop, Pig, HBase, JRuby, Sinatra

Installing HBase
================

Download HBase: http://www.apache.org/dyn/closer.cgi/hbase/

```bash
wget http://apache.mesi.com.ar/hbase/hbase-0.94.1/hbase-0.94.1.tar.gz
tar -xvzf hbase-0.94.1.tar.gz
sudo mkdir /var/hbase```

Now edit hbase-0.94.1/conf/hbase-site.xml to include:

```xml
<property>
  <name>hbase.rootdir</name>
  <value>file:///var/hbase</value>
</property>```

And launch HBase in local mode:

```bash
./bin/start-hbase.sh```

echo 'export HBASE_HOME=/me/hbase-0.94.1' >> ~/.bash_profile

Installing Pig
==============

You can download Pig here: http://www.apache.org/dyn/closer.cgi/pig

```bash
wget http://apache.mirrors.lucidnetworks.net/pig/pig-0.10.0/pig-0.10.0.tar.gz
tar -xvzf pig-0.10.0.tar.gz```

Installing JRuby
================


JRuby and HBase
===============

```bash
cd $HBASE_HOME_
wget http://central.maven.org/maven2/org/jruby/jruby-complete/1.6.7.2/jruby-complete-1.6.7.2.jar
export CLASSPATH=$CLASSPATH:`java -jar jruby-complete-1.6.7.2.jar -e "puts Dir.glob('{.,build,lib}/*.jar').join(':')"````


