### How to deploy an Asperathos instance?

#### I. Install Docker and Docker Compose
```bash
curl https://get.docker.com/ | bash
apt-get install docker-compose
```
#### II. Clone Asperathos Compose repository
```bash
git clone https://github.com/ufcg-lsd/asperathos-compose
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
For more information about the build script:
```bash
./build.sh -h
```
#### V. Run compose
```bash
docker-compose up
```
