git clone https://github.com/ufcg-lsd/asperathos-controller ./controller/asperathos-controller -b stable
docker build controller/ -t asperathos_controller
git clone https://github.com/ufcg-lsd/asperathos-monitor ./monitor/asperathos-monitor -b stable
docker build monitor/ -t asperathos_monitor
git clone https://github.com/ufcg-lsd/asperathos-manager ./manager/asperathos-manager -b stable
docker build manager/ -t asperathos_manager
git clone https://github.com/ufcg-lsd/asperathos-visualizer ./visualizer/asperathos-visualizer -b stable
docker build visualizer/ -t asperathos_visualizer
