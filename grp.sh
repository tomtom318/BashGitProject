#!/bin/bash

cd ../'fiches de lecture'/'à ajouter'
ls > nom.txt
grep '.odt' 'nom.txt' > nom2.txt

rm chapitres.csv

#variable du fichier
fichier="nom2.txt"
     
     
while IFS= read -r ligne; 

do

	echo "$ligne"
	odt2txt "$ligne" --width=-1 --output="$ligne".txt
	#grep -H '~' "$ligne".txt >> citation.csv 
	grep -H -e Chapitre....: -e Chapitre...: "$ligne".txt | grep -v '~' >> chapitres.csv
	rm "$ligne".txt
	# !! récupérer le nom du chapitre et le revoyer dans la colonne chapitre
     
done < "$fichier"

sed -i 's/.odt.txt:/~/g' chapitres.csv
rm nom.txt
rm nom2.txt


#grep -H -e Chapitre....: -e Chapitre...: 'test.txt' | grep -v '~' > test3.txt