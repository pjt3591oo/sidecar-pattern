echo "I'm Streaming"

apt-get update -y

apt-get install -y wget
apt-get install -y openjdk-8-jdk

cd /

wget https://artifacts.elastic.co/downloads/logstash/logstash-7.9.1.tar.gz
tar -xvzf logstash-7.9.1.tar.gz
ln -s logstash-7.9.1 logstash

/logstash-7.9.1/bin/logstash -e '
input { 
  file {
    path => "/home/log/access.log"
    type => nginx
    codec => json
  }
} 

output { 
  stdout { 
    codec => rubydebug 
  } 
}
' 