FROM 746334784415.dkr.ecr.us-east-1.amazonaws.com/base-img-fluentd:latest
WORKDIR /app
COPY . .
RUN mvn clean install
EXPOSE 8080
ENTRYPOINT ["sh","entrypoint.sh"]


