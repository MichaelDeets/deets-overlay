Various ebuilds I collected together for convenience.

To add this repo to your Gentoo setup:

1: Go into the folder/file `/etc/portage/repos.conf`

2: Append these entries:

    [deets-overlay]
    location = /var/db/repos/deets-overlay`
    sync-type = git
    sync-uri = https://github.com/MichaelDeets/deets-overlay.git

3: Sync portage using

    eix-sync -a
    emerge --sync
