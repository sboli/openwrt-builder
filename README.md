# openwrt-builder

A docker container to build openwrt images from the buildroot.

Following the steps described in OpenWRT wiki: https://openwrt.org/docs/guide-developer/quickstart-build-images

# How to build an image

Jump into a new folder and run your buildroot shell

```bash
docker run -it -v $(pwd):/home/builder/openwrt/bin/ openwrt-builder bash
```

From that point, just run `make menuconfig` in order to customize your build then `make -j1` to build the images.

The compiled images will be placed in the newly created _./targets_ folder in your current working directory.

# How to embed files

Create a **files** directory. Everything inside this directory will be placed at **/** in the image.

Inside this directory, place your custom openwrt files. For example your would create a _files/etc/config/wireless_ file in order to change the default wireless configuration.

Then, when running the container, specify the location for this directory. (Let's say its in the `$FILES` variable).

```bash
docker run -it -v $(pwd):/home/builder/openwrt/bin/ -v ${FILES}:/home/builder/openwrt/files openwrt-builder bash
```
