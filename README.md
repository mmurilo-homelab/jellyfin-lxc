# jellyfin-lxc

Fix for intel opencl `intel-opencl-icd` on Debian 13 trixie and newer ubuntu

## Install intel-opencl

as root:

```bash
apt install curl
cd /tmp
curl https:// | bash
```

## Install jellyfin

as root:

```bash
curl https://repo.jellyfin.org/install-debuntu.sh | bash
```

##

## Sources

<https://www.reddit.com/r/debian/comments/1mm7cjm/so_what_happened_to_intelopenclicd_in_trixie/>

<https://github.com/intel/compute-runtime/releases>
