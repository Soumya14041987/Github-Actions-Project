README.md file


## Install the below packages in sonarqube server 

docker
sonarqube 

## Install the below package in runner 

docker 
Github actions runner config 
jq
unzip
maven

docker run -d --name sonar -p 9000:9000 sonarqube:lts-community

Download
# Create a folder
$ mkdir actions-runner && cd actions-runnerCopied!# Download the latest runner package
$ curl -o actions-runner-linux-x64-2.323.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gzCopied!# Optional: Validate the hash
$ echo "0dbc9bf5a58620fc52cb6cc0448abcca964a8d74b5f39773b7afcad9ab691e19  actions-runner-linux-x64-2.323.0.tar.gz" | shasum -a 256 -c# Extract the installer
$ tar xzf ./actions-runner-linux-x64-2.323.0.tar.gzCopied!
Configure
# Create the runner and start the configuration experience
$ ./config.sh --url https://github.com/Soumya14041987/Github-Actions-Project --token AW7NTOK2BQD7KLKI7ICTULTIAVEDMCopied!# Last step, run it!
$ ./run.sh

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install