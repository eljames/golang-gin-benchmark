FROM debian:bookworm-slim

RUN apt-get update
RUN apt-get install wget -y


## Installing Go
RUN wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz
# Will extract on folder /go. Inside the compressed file already exists that folder.
RUN tar -xf go1.21.5.linux-amd64.tar.gz
ENV GOBIN=/go/bin
ENV PATH=$PATH:$GOBIN

## Preraping environment
WORKDIR /app/go/src
COPY ./src .
RUN mkdir ../bin
RUN go build -o ../bin

## Executing app
WORKDIR /app/go/bin
CMD ["./gin-app"]

#ENTRYPOINT ["tail"]
#CMD ["-f","/dev/null"]