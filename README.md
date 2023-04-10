**My Gentoo / Linux Stuff**
   
   
```
 mrturcot  on GentooRig /home/mrturcot/github/gentoo-stuff on   master took 7s
[ 05:07:34 PM ] ➜ neofetch
         -/oyddmdhs+:.                mrturcot@gl55vw 
     -odNMMMMMMMMNNmhy+-`             --------------- 
   -yNMMMMMMMMMMMNNNmmdhy+-           OS: Gentoo Linux x86_64 
 `omMMMMMMMMMMMMNmdmmmmddhhy/`        Host: ASUSTeK COMPUTER INC. GL552VW 
 omMMMMMMMMMMMNhhyyyohmdddhhhdo`      Kernel: 6.2.10-gentoo-filthy 
.ydMMMMMMMMMMdhs++so/smdddhhhhdm+`    Uptime: 4 hours, 20 mins 
 oyhdmNMMMMMMMNdyooydmddddhhhhyhNd.   Packages: 1085 (emerge) 
  :oyhhdNNMMMMMMMNNNmmdddhhhhhyymMh   Shell: zsh 5.9 
    .:+sydNMMMMMNNNmmmdddhhhhhhmMmy   Resolution: 1920x1080 
       /mMMMMMMNNNmmmdddhhhhhmMNhs:   DE: GNOME 44.0 
    `oNMMMMMMMNNNmmmddddhhdmMNhs+`    WM: Mutter 
  `sNMMMMMMMMNNNmmmdddddmNMmhs/.      WM Theme: Orchis-Dark 
 /NMMMMMMMMNNNNmmmdddmNMNdso:`        Theme: Orchis-Dark [GTK2/3] 
+MMMMMMMNNNNNmmmmdmNMNdso/-           Icons: Papirus-Dark [GTK2/3] 
yMMNNNNNNNmmmmmNNMmhs+/-`             Terminal: kitty 
/hMMNNNNNNNNMNdhs++/-`                Terminal Font: source-code-pro 16.0 
`/ohdmmddhys+++/:.`                   CPU: Intel i7-6700HQ (8) @ 3.500GHz 
  `-//////:--.                        GPU: Intel HD Graphics 530 
                                      GPU: NVIDIA GeForce GTX 960M 
                                      Memory: 69MiB / 15425MiB
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

Hardened Experimental GCC13 Kernel (gentoo-sources)
```
➜ cat /proc/version
Linux version 6.2.10-gentoo-filthy (root@gl55vw) (gcc (Gentoo Hardened 13.0.1_pre20230402-r1 p9) 13.0.1 20230402 (experimental), GNU ld (Gentoo 2.40 p4) 2.40.0) #1 SMP Fri Apr  7 04:32:57 PDT 2023
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
