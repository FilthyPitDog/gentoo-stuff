**My Gentoo / Linux Stuff**
   
   
```
 mrturcot  on GentooRig /home/mrturcot/github/gentoo-stuff on   master took 7s
[ 05:07:34 PM ] ➜ neofetch
         -/oyddmdhs+:.                mrturcot@GentooRig 
     -odNMMMMMMMMNNmhy+-`             ------------------ 
   -yNMMMMMMMMMMMNNNmmdhy+-           OS: Gentoo Linux x86_64 
 `omMMMMMMMMMMMMNmdmmmmddhhy/`        Host: X470 AORUS GAMING 7 WIFI 
 omMMMMMMMMMMMNhhyyyohmdddhhhdo`      Kernel: 6.0.8-gentoo 
.ydMMMMMMMMMMdhs++so/smdddhhhhdm+`    Uptime: 4 hours, 41 mins 
 oyhdmNMMMMMMMNdyooydmddddhhhhyhNd.   Packages: 1062 (emerge) 
  :oyhhdNNMMMMMMMNNNmmdddhhhhhyymMh   Shell: zsh 5.9 
    .:+sydNMMMMMNNNmmmdddhhhhhhmMmy   Resolution: 3840x2160 
       /mMMMMMMNNNmmmdddhhhhhmMNhs:   DE: GNOME 42.5 
    `oNMMMMMMMNNNmmmddddhhdmMNhs+`    WM: Mutter 
  `sNMMMMMMMMNNNmmmdddddmNMmhs/.      WM Theme: Equilux 
 /NMMMMMMMMNNNNmmmdddmNMNdso:`        Theme: Equilux [GTK2/3] 
+MMMMMMMNNNNNmmmmdmNMNdso/-           Icons: Papirus [GTK2/3] 
yMMNNNNNNNmmmmmNNMmhs+/-`             Terminal: kitty 
/hMMNNNNNNNNMNdhs++/-`                CPU: AMD Ryzen 7 2700 (16) @ 3.800GHz 
`/ohdmmddhys+++/:.`                   GPU: AMD ATI Radeon RX 470/480/570/570X/580/580X/590 
  `-//////:--.                        Memory: 829MiB / 32032MiB 
```
   
   
  - Portage & Kernel setup for a Stable Gentoo x86-64 EFI, Ryzen Zen-Ver.1, AMDGPU, OpenRC, Gnome-*Light*, X11, Pipewire based system. Configured with optimizations for speed and gaming performance in mind...  
   
   
 /etc/portage files included in this repo, could serve as drop-in replacements for others with similar hardware setups. One helpful use case scenario could be. Once initially mounted and chrooted into a new Gentoo install environment, download this repo as a zip=[https://github.com/mrturcot/Gentoo-Stuff/archive/refs/heads/master.zip] using wget (we dont have git rn). Then extract & edit/use/rm any configs you choose to get you going way ahead of schedule :)
   
   
   
**User needs to set** <sub>(Unless you have znver1 cpu and okay with 12 threads?)</sub>   
 
  - CPU_FLAGS_X86 in package.use/00cpu-flags (see https://wiki.gentoo.org/wiki/CPU_FLAGS_X86)  

  - COMMON_FLAGS="-march=?" option in make.conf & portage/env/compiler-$(environment) (see https://wiki.gentoo.org/wiki/Safe_CFLAGS)  

  - MAKEOPTS="-j?" option in make.conf & portage/env/compiler-$(environment) (see https://wiki.gentoo.org/wiki/MAKEOPTS)   
   
   
   
Further edit the configs to your liking if you so choose && emerge @everything!  
<sub>~~kernel not included~~, however you could possibly use a kernel.bin [*not recommended as thats pretty lame*] eg. sys-kernel/
gentoo-kernel-bin</sub>   
   
  
 - **Untested**  
  
Furthermore, I do provide my own kernel (LOL if someone actually boots this) and .config for current "6.0-gentoo-sources" trimmed down (10MB) shared in /kernel. This is for a basic AMD Ryzen 2700 x470 znver1 & AMDGPU Arctic Islands - POLARIS10/11/12, VEGAM setup with support for NVMe and SATA HDD. Basically enough to boot and thats it (all this stuff here works https://www.gigabyte.com/Motherboard/X470-AORUS-ULTRA-GAMING-rev-10/sp#sp). I guess it would work for others with same chipsets? not sure but maybe? I dont know... Completely UNTESTED.    

Running "make menuconfig [https://wiki.gentoo.org/wiki/Kernel/Configuration#Configuration]" in your activily set gentoo kernel sources in "/usr/src/linux" would be very strongly recommened making your own kernel from the kernel.config provided, as other hardware specifications from this would probably need to be set for your setup...) This is *Untested*...     
   
   
   
```
mrturcot on GentooRig /home/mrturcot/github/gentoo-stuff on   master [!1 ]
[ 04:10:05 PM ] ➜ l /boot
Permissions Size User Date Modified Name
.rwxr-xr-x  144k root  7 Nov 03:37  config-6.0.7-gentoo
.rwxr-xr-x  144k root 10 Nov 15:06  config-6.0.8-gentoo
.rwxr-xr-x  5.6M root  7 Nov 03:37  System.map-6.0.7-gentoo
.rwxr-xr-x  5.6M root 10 Nov 15:06  System.map-6.0.8-gentoo
.rwxr-xr-x   10M root  7 Nov 03:37  vmlinuz-6.0.7-gentoo
.rwxr-xr-x   10M root 10 Nov 15:06  vmlinuz-6.0.8-gentoo
```
 - **Main Features**
```
 System-wide GCC-LTO with Graphite  
 System-wide Profile-guided optimizations  
 System-wide LLVM_TARGETS="AArch64 AMDGPU" 
 AArch64 CPU target (arm64 in Gentoo) 
 AMDGPU target (supports R600 and GCN GPUs)  
 System-wide Clang & Clang-LTO
 Also per-package compiler environment configurations for:  
 Clang, Clang-LTO, GCC-LTO, GCC Fallback & GCC-NO-LTO Fallback  
```  
   
Every package currently set in portage/package.env is confirmed working with the specified per-package build environment(s) eg. compiler-clang   
   
**Notice**
   - In order to maintain high stability and compatibility across toolchains and libraries etc... ~~It is???~~ I personally HIGHLY recommeded to rebuild @system & @world after most if not all of these changes...  (See this article for steps [not opinions xd] https://wiki.gentoo.org/wiki/Upgrading_GCC#Rebuilding_everything)
   
   
------------------------------
    
   
 - mpv: my mpv.conf with a few nice scripts gathered eg. "right click context menu"  

 - scripts: git-repo check/pull/build & auto full gentoo upgrade & other handy things  

 - stuff: random linux config files  

 - rip: :( *we dont talk about that*  
