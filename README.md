# bubblewrap build.zig

https://github.com/containers/bubblewrap/releases

[v0.8.0](https://github.com/containers/bubblewrap/releases/download/v0.8.0/bubblewrap-0.8.0.tar.xz) (2023-02-27)

`config.h` generated with:

```
# in alpine:3.18.4
# apk add gcc musl-dev libcap-dev
./configure \
  --disable-selinux \
  --enable-require-userns=yes
```
