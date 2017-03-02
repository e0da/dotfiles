disable_intel_pstate
====================

Disable intel_pstate driver so that my New Dell XPS 13 doesn't set its clock
below the minimum sometimes when resuming from standby.

Source: <http://askubuntu.com/a/789372/1143>

Generating the patch
--------------------

    git diff $ORIGINAL $NEW > etc-default-grub.patch

Applying the patch
------------------

    patch /etc/default/grub etc-default-grub.patch

Reverting the patch
-------------------

Same as applying the patch
