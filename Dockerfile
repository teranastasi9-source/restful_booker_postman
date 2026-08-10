FROM postman/newman:alpine

RUN npm install -g newman-reporter-htmlextra

WORKDIR /etc/newman

COPY RESTful_Booker.IntegrationWorkflows_07.json .
COPY RESTful_Booker.Individual_collections_01_06.json .

# The base image's own ENTRYPOINT is `newman`, which only allows a single CMD invocation -
# overridden here so both collections can run sequentially in one container, matching what
# CI and the two .ps1 scripts do locally.
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["newman run RESTful_Booker.IntegrationWorkflows_07.json -r htmlextra --reporter-htmlextra-export test_reports/report_IntegrationWorkflows_07.html --timeout 15000 --delay-request 200 && newman run RESTful_Booker.Individual_collections_01_06.json -r htmlextra --reporter-htmlextra-export test_reports/report_Individual_collections_01_06.html --timeout 15000 --delay-request 200"]
