FROM python:2.7
COPY ./asperathos-visualizer /asperathos-visualizer
WORKDIR /asperathos-visualizer
COPY ./visualizer.cfg ./visualizer.cfg
COPY ./dashboard-job-influxdb-kubejobs.template /asperathos-visualizer/visualizer/utils/templates/dashboard-job-influxdb-kubejobs.template
RUN pip install setuptools tox flake8
ENTRYPOINT ./run.sh
