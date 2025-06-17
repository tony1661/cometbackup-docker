
# Comet Backup Docker Image

[Comet Backup](https://cometbackup.com/) is a great cross-platform backup tool. The thing is, it does not contain any docker support. This is a problem when backing up TrueNAS. I built this to solve that issue. This image simplifies deployment and management of Comet Backup Client in containerised environments.



## 🚀 Features

- Ubuntu base image
- Simple configuration
- Easily customizable via environment variables
- Persistent storage support


## 🐳 Getting Started (docker)

### Pull the Image

```bash
docker pull tony1661/cometbackup-docker
```

### Run the Container

```bash
docker run -d \
  --name cometbackup \
  -v /path/to/files-to-backup:/data \
  -e COMET_USERNAME=test-username \
  -e COMET_PASSWORD=test-password \
  tony1661/cometbackup-docker
  ```

### Docker Compose
#### Clone this github repo
```bash
git clone https://github.com/tony1661/cometbackup-docker
```
Edit the comet.env file. Populate your credentials.
Edit the docker-compose.yml file to mount the volume where your files to ba backed up are located so that CometBackup has access to them.

#### Run Docker Compose
```bash
docker compose up -d
```

## 📂 Getting Started (TrueNAS)
If using TrueNAS, you will need to go to *Apps* then *Discover Apps* then *Custom App*.
  

Here are the minimum settings needed:
 - Application Name
 - Repository: meteortony/cometbackup-docker
 - Environment Variables:
   - COMET_USERNAME: enter-comet-username
   - COMET_PASSWORD: enter-comet-password
 - Storage:
   - Type: Host Path
   - Mount Path: where you'd like the host to have the files mounted
   - Host Path: The location of the files on TrueNAS

## 📝 Notes

-   This image is **unofficial** and not affiliated with Comet Backup.

## Steps to publish to dockerhub
 - sudo docker compose -f docker-compose-build.yml build
 - sudo docker login
 - sudo docker push tony1661/cometbackup-docker:latest


## 📎 Resources

-   [Comet Backup Official Site](https://cometbackup.com/)
    
-   [Docker Hub: tony1661/cometbackup-docker](https://hub.docker.com/r/tony1661/cometbackup-docker)
    
-   [GitHub Repository](https://github.com/tony1661/cometbackup-docker)
