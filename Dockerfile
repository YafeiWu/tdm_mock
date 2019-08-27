FROM registry.cn-hangzhou.aliyuncs.com/xdl/xdl:ubuntu-cpu-mxnet1.3
ENV WORKPATH=/tdm_mock

RUN apt-get update --fix-missing && \
    apt-get install -y apt-transport-https ca-certificates && \
    apt-get install -y swig && \
    apt-get install -y git

RUN git clone -b yafeiw --recursive https://github.com/YafeiWu/tdm_mock.git /tdm_tmp && \
    cd /tdm_tmp/src && \
    cp -r /tdm_tmp/script/tdm_ub_att_ubuntu/ "$WORKPATH" && \
    mkdir build && cd build && \
    cmake .. && \
    make && \
    cp -r ../python/store/store/ "$WORKPATH" && \
    cp -r ../python/dist_tree/dist_tree/ "$WORKPATH" && \
    cp -r ../python/cluster/ "$WORKPATH" && \
    cp tdm/lib*.so "$WORKPATH"

WORKDIR $WORKPATH