FROM barbudo/python

ADD . /androguard
RUN /androguard/install.sh

USER app
WORKDIR /home/app/androguard

CMD ["./androlyze.py", "-s"]