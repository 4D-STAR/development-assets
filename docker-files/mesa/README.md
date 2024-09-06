# LIBMESAC Test Enviroment
This dockerfile will build a libmesac test enviroment. In order to build it you
will need the proper mesa release zip and mesasdk tarball in your current
directory. Check the docker file for the current version we are building
libmesac against. Alternativly the docker image is on Dockerhub and can simply be
pulled and run.

## Installation
### Building from the Dockerfile
```bash
docker build -t libmesac-env:latest .
```

### From Dockerhub
```bash
docker pull tboudreaux/libmesac-env:latest
```

## Testing
If you build from the docker file
```bash
docker run -it -e BRANCH=feature/ci libmesac-env:latest
```

If you pulled from dockerhub
```bash
docker run -it -e BRANCH=feature/ci tboudreaux/libmesac-env:latest
```

