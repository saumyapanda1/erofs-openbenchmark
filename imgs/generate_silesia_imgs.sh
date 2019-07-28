if [[ ! -f silesia/silesia.tar ]]; then
	tar xvf silesia.tar.xz
fi

[ -z $MKSQUASHFS ] && MKSQUASHFS='./mksquashfs'

# inode compressed
$MKSQUASHFS silesia/silesia.tar silesia_4k.squashfs.img -comp lz4 -Xhc -b 4096 -noappend
$MKSQUASHFS silesia/silesia.tar silesia_8k.squashfs.img -comp lz4 -Xhc -b 8192 -noappend
$MKSQUASHFS silesia/silesia.tar silesia_16k.squashfs.img -comp lz4 -Xhc -b 16384 -noappend
$MKSQUASHFS silesia/silesia.tar silesia_128k.squashfs.img -comp lz4 -Xhc -b 131072 -noappend

# inode uncompressed
$MKSQUASHFS silesia/silesia.tar silesia_4k.noI.squashfs.img -comp lz4 -Xhc -b 4096 -noappend -noI
$MKSQUASHFS silesia/silesia.tar silesia_8k.noI.squashfs.img -comp lz4 -Xhc -b 8192 -noappend -noI
$MKSQUASHFS silesia/silesia.tar silesia_16k.noI.squashfs.img -comp lz4 -Xhc -b 16384 -noappend -noI
$MKSQUASHFS silesia/silesia.tar silesia_128k.noI.squashfs.img -comp lz4 -Xhc -b 131072 -noappend -noI

[ -z $MKFSEROFS] && MKFSEROFS='./mkfs.erofs'
$MKFSEROFS -zlz4hc silesia_4k.erofs.img silesia

