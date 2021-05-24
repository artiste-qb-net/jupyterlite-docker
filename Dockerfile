
FROM condaforge/mambaforge:latest

RUN git clone https://github.com/jtpio/jupyterlite
WORKDIR jupyterlite

#Installing required tools
RUN mamba env update --file .binder/environment.yml

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "jupyterlite-dev", "/bin/bash", "-c"]

RUN pip install doit
RUN doit
RUN yarn
RUN yarn build
RUN yarn build:prod
RUN doit docs

EXPOSE 5000

CMD yarn serve

# Access at http://localhost:5000/classic/tree/index.html