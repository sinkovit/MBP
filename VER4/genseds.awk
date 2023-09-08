# Awk script to substitute rhs for lhs

BEGIN {
    FS="="; RS=";\n"
}

{
    gsub(/^\s*/, "", $1)
    gsub(/\s*$/, "", $1)
    gsub(/^\s*/, "", $2)
    gsub(/\s*$/, "", $2)
    gsub(/\n/, "", $2)
    gsub(/\+\s*/, "+ ", $2)
    print "sed \047s/" $1"/(" $2 ")/\047 temp2 > temp3; mv temp2 temp2"
}
