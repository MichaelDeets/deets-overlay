*deets-overlay* is a personal collection of Gentoo ebuilds, that I have taken from various overlays, official or otherwise.

If you want to add *deets-overlay* to `/etc/portage/repos.conf` so Portage will automatically sync, append the following:

    [deets-overlay]
    location = /var/db/repos/deets-overlay
    sync-type = git
    sync-uri = https://github.com/MichaelDeets/deets-overlay.git

For my setup, I put these entries into `/etc/portage/repos.conf/deets.conf`. The location `/etc/portage/repos.conf` could either be a file or folder depending on your configuration.

After adding the overlay, sync with Portage (you only need to run one of these commands):

    eix-sync -a

`eix` requires the package `app-portage/eix`

    emaint -a sync
or

    emerge --sync

According to the wiki, `emerge --sync` should essentially just run `emaint -a sync`, so either command does the same thing.
