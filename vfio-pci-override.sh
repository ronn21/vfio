#!/bin/sh
DEVS="0000:10:00.3 0000:09:00.0 0000:05:00.0 0000:04:00.0 0000:0e:00.0 0000:0d:00.0 "
if [ -z "$(ls -A /sys/class/iommu)" ]; then
    exit 0
fi
for DEV in $DEVS; do
    echo "vfio-pci" > "/sys/bus/pci/devices/$DEV/driver_override"
done
