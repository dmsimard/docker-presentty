FROM fedora:27
MAINTAINER David Moreau-Simard <dmsimard@redhat.com>

ENV ROOT_DIR /usr/local/presentty

COPY setup.sh /tmp/
RUN bash /tmp/setup.sh; rm -f /tmp/setup.sh

VOLUME ["/presentation"]
WORKDIR /presentation

CMD ["bash"]

