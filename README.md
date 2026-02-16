## Please do not rely on packages listed here. They will change seemingly "randomly" based on my system.

If you were using Hyprland ebuilds from this overlay; switch to `hyproverlay`, and remove misnamed packages using `emerge -avC` during transitioning.

## net-im/discord-canary-bin
If you want to use Discord Canary, please use something like Vencord, so you can skip updates, as it requires a emerge update every few days. I only update when I have to reopen Discord, which could be 24-78 hours later.

## *deets-overlay* is a personal collection of Gentoo ebuilds, that I have taken from various overlays, official or otherwise.

If you want to add *deets-overlay* to `/etc/portage/repos.conf` so Portage will automatically sync, append the following:

    [deets-overlay]
    location = /var/db/repos/deets-overlay
    sync-type = git
    sync-uri = https://github.com/MichaelDeets/deets-overlay.git

I put these entries into `/etc/portage/repos.conf/deets.conf`. The location `/etc/portage/repos.conf` could either be a file or folder depending on your configuration.

After adding the overlay, sync with Portage (you only need to run one of these commands):

    eix-sync -a

`eix` requires the package `app-portage/eix`

    emaint -a sync
or

    emerge --sync

According to the wiki, `emerge --sync` should essentially just run `emaint -a sync`, so either command does the same thing.

### Notes about `app-admin/deets-lto`:

These are simply files taken from the old [GentooLTO](https://github.com/InBetweenNames/gentooLTO) project, with minor changes and updates to various entries. Entries within the `deets-overlay` file are entirely from my own experiences using the project, not being found in the original GentooLTO project.

The only requirement to use *deets-lto* is the package `app-portage/portage-bashrc-mv` found in the *mv* overlay. This is what enables bashrc.d scripts, including package.cflags.

Please note, do *NOT* edit `legacy/world/other`, please create your own file within `/etc/portage/package.cflags/`. These files are taken directly from my config, and will be updated constantly, which will replace any changes you've made within these files during installation.

