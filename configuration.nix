# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Deepin Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.deepin.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "it";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "it2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sinho = {
    isNormalUser = true;
    description = "Anas";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;


  # Setup for hardware acceleration
  hardware.graphics.enable = true;  
  hardware.graphics.enable32Bit = true;

  # Allow packages with unfree licenses
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget

    pkgs.nix-index  # to locate files just do nix-locate filename
	pkgs.pkg-config # allows finding other packages in the system

	pkgs.dconf
  
	pkgs.neofetch
	pkgs.tree
	pkgs.htop

	pkgs.microsoft-edge
	
	pkgs.git
	pkgs.gh
	pkgs.micro
	pkgs.vscode

	pkgs.gcc_multi
	pkgs.cmake
	pkgs.gnumake
	pkgs.gdb
	pkgs.gcc-arm-embedded
	pkgs.doxygen

	pkgs.python3Full
	pkgs.nodePackages.nodejs

	pkgs.openssh
	pkgs.docker

	pkgs.libGL

	pkgs.vulkan-tools
	pkgs.vulkan-loader
	pkgs.vulkan-helper
	pkgs.vulkan-headers
	pkgs.vulkan-tools-lunarg
	pkgs.vulkan-extension-layer
	pkgs.vulkan-validation-layers
	pkgs.vulkan-utility-libraries

	pkgs.deepin.dwayland
	pkgs.waylandpp
	pkgs.wayland-utils
	pkgs.wayland-scanner
	pkgs.egl-wayland
	pkgs.xwayland
	
	pkgs.libxkbcommon

	pkgs.mesa
	pkgs.mesa-demos

	pkgs.xorg.libX11
	pkgs.xorg.libXi
	pkgs.xorg.libXrandr
	pkgs.xorg.libXcursor

	pkgs.shaderc
	pkgs.renderdoc
	
	pkgs.glfw
	
  ];

  environment.variables = {
    Vulkan_INCLUDE_DIR = "${pkgs.vulkan-headers}/include";
    Vulkan_LIBRARY = "${pkgs.vulkan-loader}/lib/libvulkan.so";

    PATH = "${pkgs.wayland}/lib:${pkgs.vulkan-loader}/lib:$PATH/run/wrappers/bin:/home/sinho/.nix-profile/bin:/nix/profile/bin:/home/sinho/.local/state/nix/profile/bin:/etc/profiles/per-user/sinho/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin";

	# Somewhere /nix/store/...wayland-1.23.1-dev/lib/pkgconfig
    #PKG_CONFIG_PATH = ''
#${pkgs.wayland}/lib/pkgconfig:
#
#${pkgs.xorg.libXcursor-dev}/lib/pkgconfig:
#
#${pkgs.libxkbcommon}/lib/pkgconfig:
#${pkgs.egl-wayland}/lib/pkgconfig:
#$PKG_CONFIG_PATH"
#'';
  };
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
