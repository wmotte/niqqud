# format sentences from right-to-left [test in gedit]
# This is a trick to align all sentences.
# Requirements: python (conda) environment with bidi installed (e.g. pip3 install bidi)
echo "[*** Step ***] Left-right fix"
source activate robotreviewer
./bin/help__print.py -i processed/hebrew_with_niqqud.txt | rev > processed/hebrew_with_niqqud_aligned.txt

