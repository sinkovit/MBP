cp $1 temp1
#awk '{sub(/,/, "", $1); print "sed \047s/a\\[" $3 "\\]/" $1 "/g\047 temp1 > temp2; mv temp2 temp1"}' amatrix > sedcmds
#. sedcmds
