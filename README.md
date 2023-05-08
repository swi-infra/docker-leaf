Legato Leaf - Docker image
=================================

Docker image based on ubuntu:18.04<br>
Environment configured for legato leaf tool: `https://docs.legato.io/latest/toolsLeaf.html`

Image: `quay.io/swi-infra/leaf`

[![Docker Repository on Quay](https://quay.io/repository/swi-infra/leaf/status "Docker Repository on Quay")](https://quay.io/repository/swi-infra/leaf)

## Usage

Connect to Leaf environment

> It is recommended to pass in your ssh key so that the repo tool can use it when authorizing the github connection.<br>
> You can also pass in a path to a local directory that you would like the leaf workspace to be saved to, 
> just mount the volume to /leaf as seen below.

    docker run -it \
        --volume=/home/$USER/.ssh/id_rsa:/root/.ssh/id_rsa \
        --volume=/home/$USER/leaf_workspace:/leaf \
        --volume=/etc/ssl/certs:/etc/ssl/certs:ro \
	    --volume=/usr/share/ca-certificates:/usr/share/ca-certificates/:ro \
        quay.io/swi-infra/leaf:latest

