{
  disko.devices = {
    disk = {
      my-disk = {
        device = "/dev/sda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "500M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = ["-f"];
                subvolumes = {
                    "@/" =
                    {
                      mountpoint = "/";
                      mountOptions = ["noatime" "compress=zstd:1" "discard=async"];
                    };
                    "@/home" =
                    {
                      mountpoint = "/home";
                      mountOptions = ["noatime" "compress=zstd:1" "discard=async"];
                    };
                    "@/dev" =
                    {
                      mountpoint = "/opt/dev";
                      mountOptions = ["noatime" "compress=zstd:1" "discard=async"];
                    };
                    "@/games" =
                    {
                      mountpoint = "/opt/games";
                      mountOptions = ["noatime" "compress=zstd:1" "discard=async"];
                    };
                    "@/nix" =
                    {
                      mountpoint = "/nix";
                      mountOptions = ["noatime" "compress=zstd:1" "discard=async"];
                    };
                 };
              };
            };
          };
        };
      };
    };
  };
}