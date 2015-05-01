FROM barbudo/python

ADD . /androguard
RUN /androguard/install.sh

USER app
WORKDIR /home/app/androguard

ENTRYPOINT ["androlyze.py", "-s"]