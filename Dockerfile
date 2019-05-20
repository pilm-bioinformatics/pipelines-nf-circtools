FROM nfcore/base
LABEL authors="lorena.pantano@gmail.com" \
      description="Docker image containing all requirements for the pilmbc-circtools pipeline"

COPY environment/*.yml /
RUN conda env create -f /py3.env.yml && conda clean -a
RUN conda env create -f /py2.env.yml && conda clean -a
RUN conda env create -f /bioc.env.yml && conda clean -a
ENV PATH /opt/conda/envs/py3/bin:$PATH
ENV PATH /opt/conda/envs/py2/bin:$PATH
ENV PATH /opt/conda/envs/bioc/bin:$PATH
