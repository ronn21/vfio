# VM1
# 1. 0000:0e NVIDIA
grep vfio /proc/interrupts | grep 0000:0e | cut -d ":" -f 1 | while read -r i; do
        echo $i vm1 nvidia 0e
        MASK=0f000f00
        echo $MASK > /proc/irq/$i/smp_affinity
done
# 2. 0000:0f:00:3  USB3
grep vfio /proc/interrupts | grep 0000:10 | cut -d ":" -f 1 | while read -r i; do
        echo $i vm1 USB3 10.3
        MASK=0f000f00
        echo $MASK > /proc/irq/$i/smp_affinity
done

# 3. 0000:04:00.0  NVME
grep vfio /proc/interrupts | grep 0000:04 | cut -d ":" -f 1 | while read -r i; do
        echo $i vm1 NVME 04
        MASK=0f000f00
        echo $MASK > /proc/irq/$i/smp_affinity
done

# VM2
# 1. 0000:0d NVIDIA
grep vfio /proc/interrupts | grep 0000:0d | cut -d ":" -f 1 | while read -r i; do
        echo $i vm2 nvidia 0d
        MASK=f000f000
        echo $MASK > /proc/irq/$i/smp_affinity
done
# 2. 0000:05 NVME
grep vfio /proc/interrupts | grep 0000:05 | cut -d ":" -f 1 | while read -r i; do
        echo $i vm2 nvme 05
        MASK=f000f000
        echo $MASK > /proc/irq/$i/smp_affinity
done
# 3. 0000:09 USB
grep vfio /proc/interrupts | grep 0000:09 | cut -d ":" -f 1 | while read -r i; do
        echo $i vm2 usb asmedia 09
        MASK=f000f000
        echo $MASK > /proc/irq/$i/smp_affinity
done
echo exit
exit

