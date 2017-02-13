FROM debian

#Ryan Smith rsmith@genome.wustl.edu
LABEL maintainer "ryan.smith.p@gmail.com"

#after testing, merged all RUNs into one layer
#  this should minimize the final image size.
RUN apt-get update && \
    apt-get -y install \
    g++ \
    make \
    git && \
    apt-get clean && \
    cd /tmp && \
    git clone git://github.com/GregoryFaust/samblaster.git && \
    cd samblaster && \
    make && \
    cp samblaster /usr/local/bin/. && \
    cd .. && rm -rf /tmp/* && \
    apt-get -y --purge autoremove g++ make git

ENTRYPOINT ["sh", "-c"]
CMD ["/usr/local/bin/samblaster"]