write -card=0 0 50004 10
##通道0,1射频芯片初始化脚本

dmaconf -card=0 -off -dma=0,1,2,3

#4828 sync off
write -card=0 0 20104 0

write -card=0 0 80100 80003002
write -card=0 0 80100 80000800


4828init -card=0 0 0 -f=LMK04828_synclow_1.txt
#4828init -card=0 0 0 -f=LMK04828_tmp_4_synclow.txt
4828init -card=0 0 1 -f=LMK04828_synclow_2.txt
#4828init -card=0 0 1 -f=LMK04828_tmp_4_synclow2.txt

#4828 sync on
write -card=0 0 20104 1
delay -us=500000

#pmu off
write -card=0 0 20038 0
#delay 1000000us
delay -us=1000000
#pmu on
write -card=0 0 20038 3

delay -us=1000000

# tx gain rx bb gain rx rf gain 3个gain全为衰减，值越大功率越小
7500init -card=0 0 0 2350.0 2350.0 10 0 4
#7500init -card=0 0 1 2350.0 2350.0 10 0 4

#antena tx open
write -card=0 0 20014 0x111

#pa gain 0xf--low 0xa--middle 0x0--high
write -card=0 0 20030 0x0

#vga gain set
7210w -card=0 0 0 20
7210w -card=0 0 1 20
7210w -card=0 0 2 20
7210w -card=0 0 3 20

dmaconf -card=0 -on -dma=0,1
