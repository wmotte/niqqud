# Niqqud prediction

## Background
For purposes of disambiguation, a system of diacritical signs ([niqqud](https://en.wikipedia.org/wiki/Niqqud)) is used to represent vowels or distinguish between alternative pronunciations of letters of the Hebrew alphabet.
Natural language processing (NLP) methodology, including speech recognition and speech-to-text algorithms would benefit from a model that accurately predicts niqqud.

## Dataset
This repository contains scripts to acquire a dataset of corresponding sentences with and without niqqud. The dataset is devided into a set of training (80%), development (10%) and testing (10%) sentences. This will help to train, optimize and compare NLP models.
Sentences are extracted from [The Sefaria Library](https://www.sefaria.org/), a free and growing library of Jewish texts.
