# checksum
Bash script to compare checksums of Linux iso images (or other files) with checksums listed in the corresponding SHA*SUMS file.

This script can be used to compare two checksums, one grepped from a checksum file, e.g. like a "SHA256SUMS" file provided on debian.org, containing information such as:

9a4822fe07ed2f91893221db9bf5af3452b16a9760c22e520295601533962f75  debian-live-12.2.0-amd64-cinnamon.iso
84e058f6a47794fbd3077b21ac47722ab07f9ef4e26a729b6e400b30596ff58c  debian-live-12.2.0-amd64-cinnamon.iso.contents
b7fca78e64c8ea70de6e4a24c3d1d2653908d0bcd644580c58fb1aca4d9f9dce  debian-live-12.2.0-amd64-cinnamon.iso.log
...

The script grabs the checksum corresponding to the file. 
Checksum type (either 256-bit or 512-bit), checksum file filename and ios filename are input parameters of the script. 

Use the script (executable) as follows in your working directory: 

./checksum.sh <sumtype> <isofile> <checksumfile>

Example:

./checksum.sh 256 SHA256SUMS debian-live-12.2.0-amd64-xfce.iso
