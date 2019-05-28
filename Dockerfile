FROM opensciencegrid/osgvo-tensorflow-gpu

LABEL name="CMS tensorflow-gpu"
LABEL build-date="20190528"
LABEL maintainer="Edgar Fajardo"

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && apt-get upgrade -y --allow-unauthenticated && \

RUN pip3 --no-cache-dir install \
    skopt \
    bayesopt \
    xgboost \
    && \
    python3 -m ipykernel.kernelspec

# Required
# --------
# 
# Experimental
#

# Various directories needed for bind mounts (as overlayfs is not available on RHEL6)

RUN mkdir -p /hdfs \
             /mnt/hadoop \
             /hadoop \
             /cms \
             /etc/cvmfs/SITECONF \
             /lfs_roots