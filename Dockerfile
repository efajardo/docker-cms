FROM opensciencegrid/osgvo-tensorflow-gpu

LABEL name="CMS tensorflow-gpu"
LABEL build-date="20190528"
LABEL maintainer="Edgar Fajardo"

RUN pip3 install --upgrade \
    scikit-optimize \
    bayesopt \
    xgboost 

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