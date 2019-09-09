### How to deploy an Asperathos instance?

#### I. Install Docker and Docker Compose
```bash
curl https://get.docker.com/ | bash
sudo apt-get install docker-compose
```
#### II. Clone Asperathos Compose repository
```bash
git clone https://git.lsd.ufcg.edu.br/asperathos/asperathos-compose
cd asperathos-compose
```
#### III. Set your KUBECONFIG env var
```bash
export KUBECONFIG=/path/to/your/kube/config
```
#### IV. Build the images
```bash
./build.sh
```
#### V. Run compose
```bash
docker-compose up
```
