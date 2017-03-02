grub_timeout
============

Make GRUB timeout more accomodating to my dual boot desktop setup. Strikes a
good balance between speedy startup and access to GRUB options.

Generating the patch
--------------------

    git diff $ORIGINAL $NEW > etc-default-grub.patch

Applying the patch
------------------

    patch /etc/default/grub etc-default-grub.patch

Reverting the patch
-------------------

Same as applying the patch
