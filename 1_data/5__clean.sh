# format sentences from right-to-left [test in gedit]
echo "[*** Step ***] Left-right fix"
source activate robotreviewer
./bin/help__print.py -i processed/hebrew_with_niqqud.txt | rev > processed/hebrew_with_niqqud_aligned.txt

