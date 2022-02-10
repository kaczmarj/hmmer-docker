# Dockerfile for hmmer and easel

This builds hmmer and easel in a centos 7 docker image.
This image contains glibc version 2.17, which was released in December 2012.

# Build Docker image

```
docker build -t hmmer --build-arg GIT_COMMITISH=develop --build-arg NPROCS=1 - < Dockerfile
```

# Extract a tarball of hmmer

```
docker run --rm -it --volume $(pwd):/work --workdir /opt hmmer tar czf /work/hmmer.tar.gz hmmer
```
