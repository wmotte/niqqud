# Remove Targum data (because of large overlap with Tanakh)
rm -rf txt/Tanakh/Targum/

# Remove whitespaces in name
detox -r -v txt/*
detox -r -v txt/*/*
detox -r -v txt/*/*/*
detox -r -v txt/*/*/*/*
detox -r -v txt/*/*/*/*/*

# Merge all Hebrew into one file
cat `find ./txt -name *.txt|grep Hebrew` > all

# remove doubles
awk '!seen[$0]++' all > all_no_doubles

# replace
mv all_no_doubles all
