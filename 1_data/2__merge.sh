# make copy of Sefaria data and remove white spaces
cp -purv Sefaria-Export/txt .

# Remove Targum data (because of potential overlap with Tanakh)
# TODO rm -rf txt/Tanakh/Targum/

# output
mkdir processed

# Remove whitespaces in name
detox -r -v txt/*
detox -r -v txt/*/*
detox -r -v txt/*/*/*
detox -r -v txt/*/*/*/*
detox -r -v txt/*/*/*/*/*
detox -r -v txt/*/*/*/*/*/*
detox -r -v txt/*/*/*/*/*/*/*

# Remove problematic dirs
rename 's/ /__/g' ./txt/Tanakh/Commentary/Rashi/Prophets/Rashi_on_Jonah/Hebrew/*.txt
rename 's/ /__/g' ./txt/Tanakh/Commentary/Malbim/Prophets/Malbim_on_Obadiah/Hebrew/*.txt
rename 's/ /__/g' ./txt/Tanakh/Commentary/Malbim/Prophets/Malbim_on_Joel/Hebrew/*.txt
rename 's/ /__/g' ./txt/Tanakh/Commentary/Malbim/Prophets/Malbim_on_Jonah/Hebrew/*.txt
rename 's/ /__/g' ./txt/Tanakh/Commentary/Malbim/Prophets/Malbim_on_Amos/Hebrew/*.txt
rename 's/ /__/g' ./txt/Tanakh/Commentary/Malbim/Prophets/Malbim_on_Habakkuk/Hebrew/*.txt
rename 's/ /__/g' ./txt/Tanakh/Commentary/Malbim/Prophets/Malbim_on_Haggai/Hebrew/*.txt
rename 's/ /__/g' ./txt/Tanakh/Commentary/Malbim/Prophets/Malbim_on_Micah/Hebrew/*.txt
rename 's/ /__/g' ./txt/Tanakh/Commentary/Malbim/Prophets/Malbim_on_Nahum/Hebrew/*.txt
rename 's/ /__/g' ./txt/Tanakh/Commentary/Malbim/Writings/Malbim_on_Ruth/Hebrew/*.txt
rename 's/ /__/g' ./txt/Tanakh/Writings/Daniel/Hebrew/*.txt
rename 's/ /__/g' ./txt/Halakhah/Hilchos_Talmud_Torah/Hebrew/*.txt 
rename 's/ /__/g' ./txt/Kabbalah/Da_at_Tevunoth/Hebrew/*.txt
rename 's/ /__/g' ./txt/Midrash/Aggadic_Midrash/Midrash_Rabbah/Bereishit_Rabbah/Hebrew/*.txt
rename 's/ /__/g' ./txt/Liturgy/Siddur/Siddur_Edot_HaMizrach/Hebrew/*.txt

# Merge all Hebrew into one file
cat `find ./txt -name \*.txt|grep Hebrew` > processed/raw.txt

# remove doubles
awk '!seen[$0]++' processed/raw.txt > processed/all.txt
