# Remove semicolons and parentheses
sed 's/;//g; s/(//g; s/)//g' bodyf3.cpp  > temp1

# Find elements of array t that are only used once after being defined
awk -f findtwos.awk temp1 > twos

# Convert [] to <>
sed 's/\[/</g; s/\]/>/g' bodyf3.cpp > temp2

# Convert multiline expressions to single line
awk 'BEGIN {RS=";\n"; ORS=";\n"} {gsub(/\n/, "", $0); gsub(/\+\s*/, "+ ", $0); gsub(/\*\s*/, "* ", $0); gsub(/=\s*/, "= ", $0); print}' temp2 > x
mv x temp2

# Generate sed commands to do substitutions
awk -f genseds.awk temp2 > sedcmds.sh
awk '{print "grep \047/" $1 "/\047 sedcmds.sh"}' twos > filter-sedcmds.sh
. filter-sedcmds.sh > filtered-sedcmds.sh

# Strip out lines that assign values to elements used only once after being defined
awk '{print "grep -v \047" $1 " =\047 temp2 > temp3; mv temp3 temp2"}' twos > strip.sh
. strip.sh

# Execute sed commands
. filtered-sedcmds.sh

# Renumbering and cleanup
sed 's/</< /g; s/>/ >/g' temp2 > temp3
awk 'BEGIN {RS=";\n"} {print "sed \047s/t< " $2 " >/z< " NR " >/g\047 temp3 > temp4; mv temp4 temp3"}' temp3 > sedcmds
. sedcmds
sed 's/< /\[/g; s/ >/\]/g; s/z/t/g' temp3 >  bodyf4.cpp

# Delete temp files
rm -f temp1 temp2 temp3 twos strip.sh sedcmds.sh filter-sedcmds.sh filtered-sedcmds.sh

# Reconstruct poly-3b-v2x
cp bodyp3.cpp bodyp4.cpp
cat top.cpp bodyf4.cpp mid.cpp bodyp4.cpp tail.cpp > poly-3b-v2x-4.cpp

