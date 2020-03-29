#FROM tomcat:8.0-alpine
#LABEL maintainer="hemant.pati@gmail.com"
#ADD sample.war /usr/local/tomcat/webapps/
#EXPOSE 8080
#CMD ["catalina.sh", "run"]
###################################################################################################
FROM ubuntu
MAINTAINER hemant.pati@gmail.com
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y wget
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN wget -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
WORKDIR /opt/tomcat/webapps
#RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
