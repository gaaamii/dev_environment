Development Environment
---

## Requirement
- Virtualbox
- Vagrant

## Usage

### Setup Host OS
```
vagrant up 
```

`vagrant up` starts and provisions the vagrant environment.

### Setup Docker container
```
docker build -t [image_name] ./
```

Build the image from Dockerfile put on current directory.

### Run Docker container
```
docker run -v /vagrant:host -it [image_name] bash
```

## Policies
- Less steps
- Keep procedures visible as possible
    
## TODO: 
- Use [Docker for Mac](https://forums.docker.com/c/docker-for-mac)
- Manage Mac OS setting by [Homebrew Cask](https://caskroom.github.io/)
