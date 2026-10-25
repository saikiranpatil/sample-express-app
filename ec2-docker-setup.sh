# ssh the ec2 instance
ssh -i "srp-root.pem" ec2-user@ec2-16-112-88-159.ap-south-2.compute.amazonaws.com

# install git and docker
sudo dnf update -y

sudo dnf install git -y
sudo dnf install -y docker

# enable docker
sudo systemctl start docker
sudo systemctl enable docker

git clone https://github.com/saikiranpatil/sample-express-app.git

# build image of current project
sudo docker build -t phase-6 .

# start the docker container
sudo docker run -it -p 5000:5000 phase-6