{
    for (i=1; i<=NF; i+=2) {
	if (i==1) {
	    print "first", $i
	    print "sed 's/\(", $1 "= .*\);/\1 +/'"
	}
	if (i==NF) {
	    print "last", $i
	}
	if (i!=1 && i!=NF) {
	    print "middle", $i
	}
    }
}
