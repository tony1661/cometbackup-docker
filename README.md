# cometbackup-docker

## What is this?
[Comet Backup](https://cometbackup.com/) is a great cross-platform backup tool.

The thing is, it does not contain any docker support. This is a problem when backing up 
TrueNAS. I built this to solve that issue.


## How to deploy
### docker-compose.yml
There is a [docker-compose.yml](https://github.com/tony1661/cometbackup-docker/blob/main/docker-compose.yml) file
provided.

The `volues:` portion will need to be modified to mount the directories that you'd like Comet to have access to.

### TrueNAS
If using TrueNAS, you will need to go to *Apps* then *Discover Apps* then *Custom App*.

Here are the minimum settings needed:
 - Application Name
 - Repository: meteortony/cometbackup-docker
 - Environment Variables:
     - COMET_USERNAME: <enter-comet-username>
     - COMET_PASSWORD: <enter-comet-password>
 - Storage:
      - Type: Host Path
      - Mount Path: <where you'd like the host to have the files mounted>
      - Host Path: <The location of the files on TrueNAS>