# Find elements of array t that occur exactly two times in a file

BEGIN {
    PROCINFO["sorted_in"] = "@ind_str_asc"
}

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
