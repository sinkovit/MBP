# This script moves all statements of form t[i] = a[j] * x[k] to top
# of polynomial and sort order by the index of x then index of a. This
# allows the elements of x to stay in register and be reused many
# times. Then it renumbers the elements of a to remove the gaps in usage.

# Reordering statements
# x[32] is used more of the t = a * x expresions than any other element of x
# By putting these expressions first, most of array a will be loaded into cache
# since x[82] is multipled by 85% of the elements of a used in these expressions
sed 's/\[/< /g; s/\]/ >/g' bodyf2.cpp > temp1 
awk '/t< [0-9]* > = [ax]< [0-9]* > \* [ax]< [0-9]* >;$/ {print}' temp1 | grep 'x< 32 >' | sort -k10nr -k6n > part1
awk '/t< [0-9]* > = [ax]< [0-9]* > \* [ax]< [0-9]* >;$/ {print}' temp1 | grep -v 'x< 32 >' | sort -k10nr -k6n >> part1
awk '$0 !~ /t< [0-9]* > = [ax]< [0-9]* > \* [ax]< [0-9]* >;$/ {print}' temp1 > part2
cat part1 part2 > temp2

# Renumbering and cleanup
awk 'BEGIN {RS=";\n"} {print "sed \047s/t< " $2 " >/z< " NR " >/g\047 temp2 > temp3; mv temp3 temp2"}' temp2 > sedcmds
. sedcmds
sed 's/< /\[/g; s/ >/\]/g; s/z/t/g' temp2 >  bodyf3.cpp

# Now apply renumbering to bodyp2.cpp and do cleanup
sed 's/\[/< /g; s/\]/ >/g' bodyp2.cpp > temp2
. sedcmds
sed 's/< /\[/g; s/ >/\]/g; s/z/t/g' temp2 >  bodyp3.cpp

# Delete temp files
rm -f temp1 temp2 part1 part2 sedcmds

# Reconstruct poly-3b-v2x
cat top.cpp bodyf3.cpp mid.cpp bodyp3.cpp tail.cpp > poly-3b-v2x-3.cpp
