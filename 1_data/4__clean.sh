# use R-script to evaluate words in sentences
# if too many words have no diacritic characters, delete sentence
echo "[*** Step ***] Remove sentences without niqqud"
./bin/select_niqqud_ratio.R processed/hebrew_only.txt processed/hebrew_with_niqqud.txt
