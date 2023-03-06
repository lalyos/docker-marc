FROM ubuntu
RUN apt-get update -qq \
  && apt-get install -y curl \
  && apt-get install -y nginx
COPY start.sh /
RUN chmod +x /start.sh
CMD [ "/start.sh" ]