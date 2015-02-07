JDB 11-Dec-2014: Command to build:
mvn clean eclipse:clean eclipse:eclipse
mvn clean compile package -o -Dmaven.test.skip=true


JDB 11-Dec-2014: You need to add the following repository in pom.xml to resolve the issue "Could not find artifact javax.jms:jms:jar:1.1 in central"

	<repositories>
		<repository>
			<id>repository.jboss.org-public</id>
			<name>JBoss.org Maven repository</name>
			<url>https://repository.jboss.org/nexus/content/groups/public</url>
		</repository>
	</repositories>
	
Reference: http://stackoverflow.com/questions/4908651/the-following-artifacts-could-not-be-resolved-javax-jmsjmsjar1-1


JDB 11-Dec-2014
Error encountered: "The following artifacts could not be resolved: org.codehaus.plexus:plexus-utils:jar:2.0.5"
customern: Instead type command one after the other. mvn clean, then mvn compile, then mvn install
Reference: 
http://stackoverflow.com/questions/14842974/error-in-converted-maven-project-in-eclipse


JDB 11-Dec-2014
Error encountered: "[WARNING] bad version number found aspectjrt-1.6.12.jar expected 1.6.11 found 1.6.12"
customern: Add the dependency:
<dependency>
<groupId>org.aspectj</groupId>
<artifactId>aspectjtools</artifactId>
<version>1.6.12</version>
</dependency>

Reference: http://jira.codehaus.org/browse/MASPECTJ-106


JDB 11-Dec-2014
Error encountered: "[WARNING] Workspace defines a VM that does not contain a valid jre/lib/rt.jar"
customern:
http://stackoverflow.com/questions/11473488/workspace-defines-a-vm-that-does-not-contain-a-valid-jre-lib-rt-jar-c-program


JDB 11-Dec-2014
I had to change log4j.xml files to have com.customer and check that they are set to DEBUG




===========================================================================================
UNRESOLVED ISSUES:

JDB 11-Dec-2014: Upgrading com.sun.jersey dependencies.
Working combination: 
jersey-spring - 1.8
jersey-server - 1.8
jersey-client - 1.17.1
jersey-json - 1.8

Not working: Error Message using Advanced Rest Client: "Response does not contain any data"
jersey-spring - 1.18.3
jersey-server - 1.18.3
jersey-client - 1.18.3
jersey-json - 1.18.3

Not working: Error Message using Advanced Rest Client: "Response does not contain any data"
jersey-spring - 1.17.1
jersey-server - 1.17.1
jersey-client - 1.17.1
jersey-json - 1.17.1

