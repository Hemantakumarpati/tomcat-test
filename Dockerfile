#FROM tomcat:8.0-alpine
#LABEL maintainer="hemant.pati@gmail.com"
#ADD sample.war /usr/local/tomcat/webapps/
#EXPOSE 8080
#CMD ["catalina.sh", "run"]
###################################################################################################
FROM ubuntu
MAINTAINER hemant.pati@gmail.com
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y wget && apt-get install -y curl
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN curl -O https://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.33/bin/apache-tomcat-9.0.33.tar.gz
RUN tar xvfz apache*.tar.gz
#RUN mv apache-tomcat-9.0.33/* /opt/tomcat/.
RUN apt-get install default-jdk -y
RUN java -version
WORKDIR /opt/tomcat/apache-tomcat-9.0.33
RUN cp sample.war /opt/tomcat/apache-tomcat-9.0.33/webapps

#RUN curl -O -L https://github.com/Hemantakumarpati/tomcat-test/sample.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
