# Niqqud prediction
[![DOI](https://zenodo.org/badge/205441433.svg)](https://zenodo.org/badge/latestdoi/205441433)

## Background
For purposes of disambiguation, a system of diacritical signs ([niqqud](https://en.wikipedia.org/wiki/Niqqud)) is used to represent vowels or distinguish between alternative pronunciations of letters of the Hebrew alphabet.
Natural language processing (NLP) methodology, including speech recognition and speech-to-text algorithms would benefit from a model that accurately predicts niqqud.

## Dataset
This repository contains scripts to acquire a dataset of corresponding sentences with and without niqqud. The dataset is devided into a set of training (90%), development (5%) and testing (5%) sentences. This will help to train, optimize and compare NLP models.
Sentences are extracted from [The Sefaria Library](https://www.sefaria.org/), a free and growing library of Jewish texts.

* Total sentences in training set: 211,638
* Total sentences in test set: 11,758
* Total sentences in dev set: 11,758
