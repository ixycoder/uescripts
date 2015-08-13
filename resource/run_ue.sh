#!/bin/sh
ue_id=30
numactl --cpubind=2 --interleave=0,1,2,3 ./TestUE main $ue_id 2
