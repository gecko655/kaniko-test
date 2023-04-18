FROM bash:5.1-alpine3.17

RUN apk add tree

COPY files/1.txt /workspace/
RUN echo '===1===' && tree /workspace && echo '===1==='
COPY files/2.txt /workspace/nested/
RUN echo '===2===' && tree /workspace && echo '===2==='
COPY files/3.txt /app/
RUN echo '===3===' && tree /workspace && tree /app && echo '===3==='
COPY files/4.txt /app/nested/
RUN echo '===4===' && tree /workspace && tree /app && echo '===4==='

CMD ["sh", "-c", "tree /workspace && tree /app"]
