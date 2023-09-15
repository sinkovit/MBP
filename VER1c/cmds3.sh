cp poly-3b-v2x-1b-amat.cpp  temp1

awk '/t\[[0-9]*\] = \-?[0-9].[0-9]*e/ {sub(/;/, "", $3); sub(/\[/, "\\[", $1); print "sed \047s/" $1 "/" $3 "/g\047 temp1 > temp2; mv temp2 temp1"}' temp1 > sedcmds
. sedcmds

awk '{temp = $0; sub(/;/, "", $3); if ($1 != $3 || $1 ~ /double/ || temp == "") print temp}' temp1 > temp2

mv temp2 poly-3b-v2x-1b-amat-all.cpp
