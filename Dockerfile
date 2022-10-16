FROM eclipse-temurin:11

WORKDIR /app
RUN apt install -y wget
RUN wget -O plantuml.jar https://github.com/plantuml/plantuml/releases/download/v1.2022.8/plantuml-1.2022.8.jar
RUN mkdir input
RUN mkdir output
COPY ./compile.sh ./

CMD ["./compile.sh"]
