# first term
awk '/^\s*t\[848\]/ {sub(/;/, " +"); print}' poly-3b-v2x-1b.cpp

# middle term
awk '/^\s*t\[848\]/ {sub(/;/, " +"); sub(/t\[848\] = /, ""); print}' poly-3b-v2x-1b.cpp

# final term
awk '/^\s*t\[848\]/ {sub(/t\[848\] = /, "  "); print}' poly-3b-v2x-1b.cpp
