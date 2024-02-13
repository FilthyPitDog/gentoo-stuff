**My Gentoo / Linux Stuff**
   
   
```
 mrturcot  on gentoorig /home/mrturcot 
[ 12:28:55 AM ] ➜ fastfetch
         -/oyddmdhs+:.                 mrturcot@gentoorig
     -odNMMMMMMMMNNmhy+-`              ------------------
   -yNMMMMMMMMMMMNNNmmdhy+-            OS: Gentoo 2.14 x86_64
 `omMMMMMMMMMMMMNmdmmmmddhhy/`         Kernel: 6.7.4-filthy-xanmod1
 omMMMMMMMMMMMNhhyyyohmdddhhhdo`       Uptime: 23 hours, 4 mins
.ydMMMMMMMMMMdhs++so/smdddhhhhdm+`     Packages: 1111 (emerge)
 oyhdmNMMMMMMMNdyooydmddddhhhhyhNd.    Shell: zsh 5.9
  :oyhhdNNMMMMMMMNNNmmdddhhhhhyymMh    Display (MSI4CB0): 2560x1440 @ 170Hz
    .:+sydNMMMMMNNNmmmdddhhhhhhmMmy    DE: Gnome 45.2
       /mMMMMMMNNNmmmdddhhhhhmMNhs:    WM: Mutter (Wayland)
    `oNMMMMMMMNNNmmmddddhhdmMNhs+`     WM Theme: Orchis-Dark
  `sNMMMMMMMMNNNmmmdddddmNMmhs/.       Theme: Orchis-Dark [GTK2/3/4]
 /NMMMMMMMMNNNNmmmdddmNMNdso:`         Icons: Papirus-Dark [GTK2/3/4]
+MMMMMMMNNNNNmmmmdmNMNdso/-            Font: Cantarell (11pt) [GTK2/3/4]
yMMNNNNNNNmmmmmNNMmhs+/-`              Cursor: neonly (24px)
/hMMNNNNNNNNMNdhs++/-`                 Terminal: kitty 0.32.2
`/ohdmmddhys+++/:.`                    Terminal Font: SourceCodePro-Regular (16pt)
  `-//////:--.                         CPU: AMD Ryzen 9 7900X3D (24) @ 5.66 GHz
                                       GPU 1: AMD Radeon RX 7900 XTX
                                       GPU 2: AMD Raphael
                                       Memory: 23.87 GiB / 62.01 GiB (38%)
                                       Swap: 0 B / 64.00 GiB (0%)
                                       Disk (/): 220.60 GiB / 1.76 TiB (12%) - btrfs
                                       Disk (/mnt/Games): 1.64 TiB / 3.64 TiB (45%) - fuseblk
                                       Disk (/mnt/Music): 3.63 TiB / 7.28 TiB (50%) - fuseblk
                                       Disk (/mnt/Shows): 2.41 TiB / 3.64 TiB (66%) - fuseblk
                                       Local IP (wlp13s0): 192.168.1.74/24 *
                                       Locale: en_US.utf8
```
   


  - My in sync Portage directory & Kernel for ~amd64 (testing / unstable) Gentoo x86-64 EFI, OpenRC, Gnome-*Light*, Wayland, Pipewire based system configuration. With optimizations for speed and gaming performance in mind...  

  - /etc/portage files included in this repo, could serve as drop-in replacements for others with similar hardware setups. It should also be noted, the PER-Package build environments are portable and modular, they should work with most Gentoo based systems with LLVM/Clang installed, (upon setting a few values mentioned below)   


 - **Main Features**

```
 PER-Package compiler environments (as defined in portage/env & portage/package.env) for:  
 Clang, Clang-LTO, Clang-Hardended, GCC-LTO, GCC-Fallback, GCC-NO-LTO-Fallback & more
```

Every package currently set in portage/package.env is confirmed working with the specified per-package build environment(s) eg. compiler-clang  

```
 GCC set to compile with Graphite, LTO & PGO optimizations  
 System-wide LLVM_TARGETS="AArch64 AMDGPU" 
 AArch64 CPU target (arm64 in Gentoo) 
 AMDGPU target (supports R600 and GCN GPUs)  
```
```
 Local USE Flags enabled (select packages only eg. GCC)  
 ## Can be overridden using PER-Package env's compiler-$(environment) *not PGO*  
 Clang = Force building using installed clang (rather than the default CC/CXX).  
 LTO = Build using Link Time Optimizations (LTO)  
 PGO = Profile-guided optimizations   
 and more... see portage/make.conf "USE=$(Flags)"  
```  

Hardened Experimental clang Kernel configs
```
➜ cat /proc/version    
Linux version 6.7.4-filthy-xanmod1 (root@gentoorig) (clang version 17.0.6, LLD 17.0.6) #4 SMP PREEMPT_DYNAMIC Mon Feb 12 01:48:53 PST 2024
```   

 - **Use Case**

 One helpful use case scenario could be. Once initially mounted and chrooted into a new Gentoo install environment. Complete the install as normal 

```
 emerge-webrsync
 emerge --sync
 eselect profile set = default/linux/amd64/17.1/desktop/gnome
```

Then before >> **Updating the @world set** (https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Installation#Updating_the_.40world_set) > download this repo as a zip=[https://github.com/FilthyPitDog/gentoo-stuff/archive/refs/heads/master.zip] using wget (we dont have git rn). Extract & add/edit/use/remove the configs you choose *then* >> "emerge --ask --verbose --update --deep --newuse @world" Grab a coffee, save some time? Save some headaches? maybe? Yes, I think so. Nevertheless   
   
 **User needs to set** <sub>(Unless you have znver1 cpu and okay with 12 threads?)</sub>   
 
  - CPU_FLAGS_X86 in package.use/00cpu-flags (see https://wiki.gentoo.org/wiki/CPU_FLAGS_X86)  

  - COMMON_FLAGS="-march=?" option in make.conf & portage/env/compiler-$(environment) (see https://wiki.gentoo.org/wiki/Safe_CFLAGS)  

  - MAKEOPTS="-j?" option in make.conf & portage/env/compiler-$(environment) (see https://wiki.gentoo.org/wiki/MAKEOPTS)   
   
   
- **Untested**  

Furthermore, I do provide my own kernel and .config for current "6.2-gentoo-sources". Running "make menuconfig [https://wiki.gentoo.org/wiki/Kernel/Configuration#Configuration]" in your activily set gentoo kernel sources in "/usr/src/linux" would be very strongly recommened making your own kernel from the kernel.config provided, as other hardware specifications that differ from this would most definitely need to be set for your setup... This is *Untested*...      
   

**Notice**
   - In order to maintain high stability and compatibility across toolchains and libraries etc... ~~It is???~~ I personally HIGHLY recommeded to rebuild @system & @world after most if not all of these changes...  (See this article for steps [not opinions xd] https://wiki.gentoo.org/wiki/Upgrading_GCC#Rebuilding_everything)
   
------------------------------
    
**The Rest**
   
 - mpv: my mpv.conf with a few nice scripts gathered eg. "right click context menu"  

 - scripts: git-repo check/pull/build & auto full gentoo upgrade & other handy things  

 - stuff: random linux config files  

 - rip: :( *we dont talk about that*  
