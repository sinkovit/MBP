# Find elements of array t that occur exactly two times in a file

# Get word counts
{
    for (i=1; i<=NF; i++) {
	w[$i]++
    }
}

# Loop over array and print out elements that occur twice
END {
    for (x in w) {
	if (w[x] == 2 && x ~ /^t/) {
	    gsub(/\[/, "<", x)
            gsub(/\]/, ">", x)
	    print x
	}
    }
}
