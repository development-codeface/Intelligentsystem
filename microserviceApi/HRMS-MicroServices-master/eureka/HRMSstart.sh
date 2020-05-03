#start euroku
mvn spring-boot:run

#start zuul
cd ../gateway
mvn spring-boot:run

#start auth
cd ../auth
mvn spring-boot:run

#start debservice
cd ../db-service
mvn spring-boot:run

#start job
cd ../recruitment
mvn spring-boot:run



