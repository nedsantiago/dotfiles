# Nvidia-related configurations
{ pkgs }:

{
    # hardware.opengl.enable = true;

    # # Ensure NVIDIA is properly configured
    # hardware.nvidia = {
    #     modesetting.enable = true;
    #     package = pkgs.nvidiaPackages.stable;
    # };
    # boot.kernelModules = [
    #     "nvidia"
    #     "nvidia_modeset"
    #     "nvidia_uvm"
    #     "nvidia_drm"
    # ];
}
