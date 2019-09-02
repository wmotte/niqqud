# use R-script to evaluate words in sentences
echo "[*** Step ***] Remove dagesh"
./bin/select_dagesh_cleaner.R processed/hebrew_with_niqqud_aligned.txt processed/dagesh_cleaned.txt

# remove other diacritics
echo "[*** Step ***] Remove diacritics"
cat processed/dagesh_cleaned.txt | perl -CS -pe 's/[\x{0591}-\x{05C7}]+//g' > processed/hebrew_without_niqqud_aligned.txt
