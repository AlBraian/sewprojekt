#!/bin/bash
echo 'Backup script'  #Die Name von der Script
read -p "1)Backup 2)Recovery 3)EXIT : " answ  #Der benutzer schreibt eine von die folgende Worten und das word wird gespeichert
echo $answ	# $answ ist die Wort die der Benutzer geschrieben hat
	if [ $answ = "EXIT"  ]	#Wenn das Wort EXIT ist dan wird dieses Code ausgefuhrt
	 then	
		clear	#wird alles was in screen ist geloescht
		exit
	elif [ $answ = "Backup" ]	#Wenn der Wort Backup ist dan wird dieses Code Ausgefuhrt
	 then
		read -p 'What folder would you like to save: ' verch 	#Der Benutzer wahlt welche Datei er speichern woll un es wird in $verch gespeichert
		echo $verch	#Hier ist die Name von der Ordner
		echo Inhalt	#Hier ist Inhalt gezeight und dan wird mit ein lswas drinen steht
		ls $verch
		read -p 'Choose file:' unter	#Der Benutzer wahlt die File die er speichern will
		echo $unter
		cp -r ./$verch/$unter ./backup1	#Dann wird die datei die Der Benutzer gewahlt hat in 'backup1' Folder gespeichert
	elif [ $answ = "Recovery" ]	#Vergleicht die Wort und dan wird dieses Teil von code augefuhrt
	then
		echo "Warning: Everything in work File will be deleted"  #Ob der Benutzer recovery in 'work' Ordner speichern voll es werden alle Dateien die Da sind geloescht
		echo "Recovery"
		read -p 'Where you want to recover it: ' rest #Der Benutzer wahlt wo er das File speichern woll
		echo $rest
		echo Inhalt	#Die inhalt von diese ordner
		ls backup1
		read -p 'Choose File: ' unres #wahlt die file Die in diesem Ordner ist
		echo $unres				
			if [ $rest = "work" ]	#Hier vergleichen wir ob die speicherplatz Ordner ist
				then
				rm ./work/*	#loscht alles was drinen work folder steht
				cp -r  ./backup1/$unres ./work	#copiert dieses Datei in work Ordner
				echo "Backup Sucesfully Work folder"
			else 
				cp -r ./backup1/$unres ./$rest	#Wenn Der Benutzer ein andere Ordner wahlt dan wird die Datei in die anderen ordner copiert
				echo "Backup Sucessfully in " +$rest 
			fi 
	else 
		echo 'Wrong  Option'
		echo 'Write Backup, Recovery or EXIT'
		echo '--------------------------------------------'
	
	fi

