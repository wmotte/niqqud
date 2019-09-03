# remove non-hebrew characters except \n and \s
echo "[*** Step ***] Remove non-Hebrew characters and empty lines"
cat processed/all.txt | perl -CS -pe 's/[^\x{0590}-\x{05FF}\x{FB1D}-\x{FB4F}\n\s]+//g' > processed/hebrew_only.txt

# remove empty lines
sed '/^[[:space:]]*$/d' -i processed/hebrew_only.txt
