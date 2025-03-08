# sinhonix
Just some configuration stuff for my nixos

```shell
sudo su
mv /etc/nixos /etc/_nixos

git clone https://github.com/mrsinho/sinhonix /etc/nixos
git config --global --add safe.directory /etc/nixos

cp /etc/_nixos/hardware-configuration.nix /etc/nixos/hardware-configuration.nix 
```

Build

```shell
nixos-rebuild switch
```
