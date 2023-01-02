# Big bois
alias emerge-empty-system="emerge --ask --verbose --emptytree --usepkg=n --keep-going @system"
alias emerge-empty-world="emerge --ask --verbose --emptytree --usepkg=n --keep-going @world"

# Gentoo 
alias emerge-sync="emaint --auto sync"
alias emerge-system="emerge --ask --verbose --update --newuse --deep --with-bdeps=y @system"
alias emerge-world="emerge --ask --verbose --update --newuse --deep --with-bdeps=y @world"
alias emerge-autosystem="emerge --ask --verbose --update --newuse --deep --autounmask=y --autounmask-unrestricted-atoms --autounmask-use=y --autounmask-license=y --with-bdeps=y @system"
alias emerge-autoworld="emerge --ask --verbose --update --newuse --deep --autounmask=y --autounmask-unrestricted-atoms --autounmask-use=y --autounmask-license=y --with-bdeps=y @world"
alias emerge-install="emerge --ask --verbose"
alias emerge-uninstall="emerge --ask --verbose --depclean"
alias emerge-oneshot="emerge --ask --verbose --oneshot"
alias emerge-autounmask="emerge --ask --verbose --autounmask=y --autounmask-unrestricted-atoms --autounmask-use=y --autounmask-license=y"
alias emerge-newuse="emerge --ask --verbose --newuse --deep --with-bdeps=y @world"
alias emerge-changeuse="emerge --ask --verbose --changed-use --deep --with-bdeps=y @world"
alias emerge-depclean="emerge --ask --depclean"
alias emerge-smart="emerge --ask --verbose @smart-live-rebuild"
alias emerge-noreplace="emerge --noreplace"
alias emerge-deselect="emerge --deselect"
alias emerge-cache="eix-update && eix-remote update"
alias emerge-clang-toolchain="emerge --ask --verbose @clang-toolchain"
alias emerge-clang-rebuild="emerge --ask --verbose @clang-rebuild"
alias emerge-modules="emerge @module-rebuild"

# Kernel
alias make-clang="make CC=clang LD=ld.lld NM=llvm-nm AR=llvm-ar LLVM_IAS=1"
alias make-clang-mods="make CC=clang LD=ld.lld NM=llvm-nm AR=llvm-ar LLVM_IAS=1 -j14 modules_install"

# The Rest
alias grub-install="grub-install --target=x86_64-efi --efi-directory=/boot"
alias grub-update="grub-mkconfig -o /boot/grub/grub.cfg"
alias l="exa -l -a -bhg --color=always --color-scale --group-directories-first --time-style=long-iso --git --extended"
alias b="bat -p"
alias c="clear"
alias e="exit"
alias watch-sensors="watch -n 1 sensors"
alias watch-genlop="watch -cn 3 genlop -ci"
alias watch-free="watch -n 1 free -h"
alias clean-tmpfs="rm -rvf /var/tmp/portage/*"
