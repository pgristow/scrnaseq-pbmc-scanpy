# Reproducible single-cell environment. Build: docker build -t scpbmc .
# Run:   docker run --rm -v "$PWD":/work scpbmc make all
FROM condaforge/miniforge3:latest

WORKDIR /work
COPY environment.yml /tmp/environment.yml
RUN mamba env update -n base -f /tmp/environment.yml && mamba clean -afy

# Quarto needs a writable home for its cache when run as root in CI/containers.
ENV XDG_CACHE_HOME=/tmp/.cache HOME=/tmp

COPY . /work
CMD ["make", "all"]
