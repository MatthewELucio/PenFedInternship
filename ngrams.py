import nltk
import string
from nltk.collocations import ngrams
#words = nltk.word_tokenize(my_text)
#my_bigrams = nltk.bigrams(words)
#my_trigrams = nltk.trigrams(words)

bigramslist = []
trigramslist = []

with open("Penfed_updated.txt", encoding = "utf-8") as file:
    for line in file.readlines():
        #print(line)
        words = nltk.word_tokenize(line)
        words = [''.join(c for c in s if c not in string.punctuation) for s in words]
        words = [s for s in words if s]
        #print(words)
        my_bigrams = list(ngrams(words, 2))
        my_trigrams = list(ngrams(words, 3))
        bigramslist.append(my_bigrams)
        trigramslist.append(my_trigrams)

for i in bigramslist:
    print(i)
for j in  trigramslist:
    print(j)
