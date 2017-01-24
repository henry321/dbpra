db2 connect to dbpra > tables.txt
db2 "list tables" > tables.txt
pos= grep "POSTEN_SUMMARY" tables.txt
lis= grep "LIEFERT_SUMMARY" tables.txt
if [ "$pos" == "" ]
	then  db2 "drop table Posten_Summary"
fi
if [ "$lis" == "" ]
	then db2 "drop table Liefert_Summary"
fi

db2batch -d dbpra -f mqt2.sql -r outR,outS

rm tables.txt
cat outS



