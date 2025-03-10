# sinhonix
![NixOS](https://a11ybadges.com/badge?logo=nixos)

A `configuration.nix` file made to customize my NixOS system for personal use.

---

## Development APIs and tools

![CMake](https://a11ybadges.com/badge?logo=cmake)


![](https://a11ybadges.com/badge?logo=vulkan)
![Node.js](https://a11ybadges.com/badge?logo=nodedotjs)
![Visual Studio Code](https://a11ybadges.com/badge?logo=visualstudiocode)



---

## TODO

Vulkan dev setup is hell. Try defining:

```cmake
#careful not to override
# To link shared libraries
LD_LIBRARY_PATH="${pkgs.glfw}/lib:${pkgs.wayland}/lib:${pkgs.vulkan-loader}/lib:${pkgs.vulkan-validation-layers}/lib";
VK_LAYER_PATH = "${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d";
```

---

## Setup configuration folder

The following commands will replace the default `/etc/nixos` folder with this repository. After that the original `hardware-configuration.nix` file will be recovered.

```shell
sudo su
mv /etc/nixos /etc/_nixos

git clone https://github.com/mrsinho/sinhonix /etc/nixos
git config --global --add safe.directory /etc/nixos

cp /etc/_nixos/hardware-configuration.nix /etc/nixos/hardware-configuration.nix 
```

---

## Rebuild the system

```shell
nixos-rebuild switch
```
