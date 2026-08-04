FROM postman/newman:alpine

RUN npm install -g newman-reporter-htmlextra

WORKDIR /etc/newman

COPY RESTful_Booker.IntegrationWorkflows_07.json .

CMD ["run", "RESTful_Booker.IntegrationWorkflows_07.json", "-r", "htmlextra", "--reporter-htmlextra-export", "test_reports/report_IntegrationWorkflows_07.html", "--timeout", "15000", "--delay-request", "200"]
