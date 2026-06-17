# sudo yum install java-21-amazon-corretto-devel -y
sudo yum install git -y
# sudo yum install maven -y
sudo yum install docker -y
sudo service docker start


if [ -d "addressbook-v1" ]
then
  echo "repo is cloned and exists"
  cd /home/ec2-user/addressbook-v1
  git pull origin dev
else
  git clone -b dev https://github.com/menghieng-sorn/addressbook-v1.git
fi

cd /home/ec2-user/addressbook-v1
# mvn compile

sudo docker build -t $1 .