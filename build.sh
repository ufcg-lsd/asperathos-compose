git clone https://github.com/ufcg-lsd/asperathos-controller ./controller/asperathos-controller
docker build controller/ -t asperathos_controller
git clone https://github.com/ufcg-lsd/asperathos-monitor ./monitor/asperathos-monitor
docker build monitor/ -t asperathos_monitor
git clone https://github.com/ufcg-lsd/asperathos-manager ./manager/asperathos-manager
docker build manager/ -t asperathos_manager
git clone https://github.com/ufcg-lsd/asperathos-visualizer ./visualizer/asperathos-visualizer
docker build visualizer/ -t asperathos_visualizer
