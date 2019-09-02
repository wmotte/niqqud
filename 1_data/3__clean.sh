# remove non-hebrew characters except \n and \s
cat all | perl -CS -pe 's/[^\x{0590}-\x{05FF}\x{FB1D}-\x{FB4F}\n\s]+//g' > hebrew_only.txt

# remove empty lines
sed '/^[[:space:]]*$/d' -i hebrew_only.txt

# format sentences from right-to-left [test in gedit]
source activate robotreviewer
./bin/help__print.py -i hebrew_only.txt | rev > hebrew_only_aligned.txt

# overwrite
mv hebrew_only_aligned.txt mixed.txt

# use R-script to evaluate words in sentences
./bin/select_niqqud_ratio.R mixed.txt hebrew_with_niqqud.txt

# remove diacritics
cat hebrew_with_niqqud.txt | perl -CS -pe 's/[\x{0591}-\x{05C7}]+//g' > hebrew_without_niqqud.txt
