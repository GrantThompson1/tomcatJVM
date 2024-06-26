# From Tomcat 9.0 JDK8 OpenJDK 
FROM tomcat:9.0-jdk8-openjdk 

RUN mkdir -p /opt/jmx_exporter

COPY ./jmx_prometheus_javaagent-0.12.0.jar /opt/jmx_exporter
COPY ./config.yaml /opt/jmx_exporter
COPY ./setenv.sh /usr/local/tomcat/bin 
COPY CounterWebApp.war /usr/local/tomcat/webapps/

RUN chmod  o+x /usr/local/tomcat/bin/setenv.sh

EXPOSE 8080
EXPOSE 9404

ENTRYPOINT ["catalina.sh", "run"]
