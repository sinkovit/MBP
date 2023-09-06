# This script does the follow processing steps the polynomial code
# Gets rid of simple assignments of form "t[1] = a[2];" and "t[3] = x[4];"
# Replaces usage of elements of t with corresponding elements of a and x 

# Convert [..] to <..> for clarity and save in temp1
sed 's/\[/</'g body1.cpp | sed 's/\]/>/'g > temp1

# Strip out lines that are simple substitutions (e.g., "t<1> = a<11>;") and save in temp2
awk '$0 !~ /t<[0-9]*> = [ax]<[0-9]*>;/' temp1 > temp2

# Generate sed commands to do substitutions (e.g., globally replace t<1> with a<11>, t<2> with a<204>, etc.)
awk '/t<[0-9]*> = [ax]<[0-9]*>;/ {print "sed \047s/" $1 "/" $3 "/g\047 temp2 > temp3; mv temp3 temp2"}' temp1 | sed 's/>;/>/' > sedcmds

# Execute sed commands
. sedcmds

# Convert <..> back to [..]
sed 's/</\[/'g temp2 | sed 's/>/\]/'g  > body2.cpp

# Cleanup work
rm -f temp1 temp2 sedcmds
