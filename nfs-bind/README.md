# NFS Mount Bind on Proxmox


## Proxmox

### Systemd automount

#### systemd path

```bash
systemd-escape -p --suffix=mount /mnt/nas_media
systemd-escape -p --suffix=automount /mnt/nas_media
```

/etc/systemd/system/mnt-nas_media.mount
/etc/systemd/system/mnt-nas_media.automount

#### start

```bash
systemctl daemon-reload
systemctl enable --now  mnt-nas_media.automount
```

### add bind mount to LXC

```bash
pct set <lxc_id> -mp0 /mnt/nas_media,mp=/mnt/media
```
