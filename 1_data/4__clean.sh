# use R-script to evaluate words in sentences
echo "[*** Step 2 ***] Remove sentences without niqqud"
./bin/select_niqqud_ratio.R processed/hebrew_only.txt processed/hebrew_with_niqqud.txt
