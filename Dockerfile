FROM nfcore/base
LABEL authors="Lorena Pantano" \
      description="Docker image containing all requirements for nf-core/circrna pipeline"

COPY environment/*.yml /
RUN conda env create -f /environment/py3.env.yml && conda clean -a
RUN conda env create -f /environment/py2.env.yml && conda clean -a
RUN conda env create -f /environment/bioc.env.yml && conda clean -a
ENV PATH /opt/conda/envs/py2/bin:$PATH
RUN git clone https://github.com/dieterich-lab/DCC.git
RUN cd DCC && python setup.py install && cd..
RUN git clone https://github.com/dieterich-lab/FUCHS.git
RUN cd FUCHS && python setup.py install && cd..
ENV PATH /opt/conda/envs/py3/bin:$PATH
ENV PATH /opt/conda/envs/bioc/bin:$PATH
# ENV PATH /opt/conda/envs/nf-core-circrna-1.0dev/bin:$PATH

