#!/bin/bash

# Description: Write 4g for i/o test over NFS.

# More info: https://nfs.sourceforge.net/nfs-howto/ar01s05.html

readonly OUT='fio-test'
readonly WORKDIR="$1"

# Test
fio --name=${OUT} --rw=read --direct=1 --ioengine=libaio --bs=32k --numjobs=4 --iodepth=4 --size=1G --runtime=30 --group_reporting --directory="${WORKDIR}"

# Cleanup
rm "${WORKDIR}/${OUT}"*
