sed 's/\[/< /g; s/\]/ >/g' poly-3b-v2x.cpp > temp1
awk 'BEGIN {counter=0} /t< [0-9]* > =/ {print "sed \047s/t< " $2 " >/z< " counter " >/g\047 temp1 > temp2; mv temp2 temp1"; counter++}' temp1 > sedcmds
. sedcmds
sed 's/< /\[/g; s/ >/\]/g; s/z/t/g' temp1 >  poly-3b-v2x-1b.cpp
