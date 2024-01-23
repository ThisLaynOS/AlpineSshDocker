FROM node:18-alpine
LABEL maintainer="Lynx Carpenter Containers"
RUN apk add --update --no-cache openssh curl bash neofetch wget htop
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN adduser -h /home/gusta -s /bin/sh -D gusta
RUN echo -n 'gusta:password' | chpasswd
RUN chown root /bin/su
RUN chmod 4755 /bin/su
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22
EXPOSE 90
EXPOSE 6060
EXPOSE 3030
EXPOSE 5050
EXPOSE 1010
COPY entrypoint.sh /
