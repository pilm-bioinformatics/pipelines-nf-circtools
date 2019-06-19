FROM nfcore/base
LABEL authors="Lorena Pantano" \
      description="Docker image containing all requirements for nf-core/circrna pipeline"

COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/nf-core-circrna-1.0dev/bin:$PATH
