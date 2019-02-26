FROM frolvlad/alpine-python3
MAINTAINER Dani Welter "dwelter@ebi.ac.uk"

RUN mkdir /app
COPY ontology-mapper /app/ontology-mapper
COPY ontology-mapper/templates /app/templates
COPY ontology-mapper/static /app/static
COPY ontology-mapper/ontology_mappings_app.py requirements.txt /app/
WORKDIR /app/ontology-mapper

RUN pip install -r /app/requirements.txt

ENV INGEST_API=http://localhost:8080

EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["ontology_mappings_app.py"]