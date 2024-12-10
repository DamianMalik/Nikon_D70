# Es wird in die Beschreibung zunächst in allen Bildern das ExposureProgramm gesetzt, in denen das Nikon:VariProgramm nicht gesetzt ist 
echo "Belichtungsprogramm ermitteln"
exiftool -overwrite_original -lang de '-description<• Modus: $ExposureProgram' -if 'not $Nikon:VariProgram' -if '$model eq "NIKON D70"' *.JPG

# Es wird in die Beschreibung überall „Automatik“ eingefügt, wenn im Nikon:VariProgramm ein „Auto“ steht
echo "Automatikprogramm ermitteln"
echo "(1/7)"
exiftool -overwrite_original '-description=• Modus: Automatik' -if '$Nikon:VariProgram eq "Auto"' -if '$model eq "NIKON D70"' *.JPG
echo "(2/7)"
exiftool -overwrite_original '-description=• Modus: Porträt' -if '$Nikon:VariProgram eq "Portrait"' -if '$model eq "NIKON D70"' *.JPG
echo "(3/7)"
exiftool -overwrite_original '-description=• Modus: Landschaft' -if '$Nikon:VariProgram eq "Land Scape"' -if '$model eq "NIKON D70"' *.JPG
echo "(4/7)"
exiftool -overwrite_original '-description=• Modus: Nahaufnahme' -if '$Nikon:VariProgram eq "Close Up"' -if '$model eq "NIKON D70"' *.JPG
echo "(5/7)"
exiftool -overwrite_original '-description=• Modus: Sport und Action' -if '$Nikon:VariProgram eq "Sport"' -if '$model eq "NIKON D70"' *.JPG
echo "(6/7)"
exiftool -overwrite_original '-description=• Modus: Nachtszene' -if '$Nikon:VariProgram eq "Night Scene"' -if '$model eq "NIKON D70"' *.JPG
echo "(7/7)"
exiftool -overwrite_original '-description=• Modus: Nachtporträt' -if '$Nikon:VariProgram eq "Night Portrait"' -if '$model eq "NIKON D70"' *.JPG

# Name Objektiv in die Beschreibung hinzufügen
echo "Objektiv ermitteln"
exiftool -overwrite_original -lang de -E '-description<$description&#xD;• Objektiv: $LensID' -if '$model eq "NIKON D70"' *.JPG


# AF Area Mode / Messfeldsteuerung
echo "Messfeldsteuerung ermitteln"
exiftool -overwrite_original -lang de -E '-description<$description&#xD;• Messfeldsteuerung: $Nikon:AFAreaMode' -if '$model eq "NIKON D70"' *.JPG

# AF Point / gewählter AF-Punkt
echo "AF-Punkt ermitteln"
exiftool -overwrite_original -lang de -E '-description<$description&#xD;• AF-Punkt: $Nikon:AFpoint' -if '$model eq "NIKON D70"' *.JPG

# Blitz-Belichtungskorrektur 
echo "Blitz-Belichtungskorrektur ermitteln"
for file in *.JPG; do
echo "$file"
if [ "$(exiftool -n -p '$model' $file)" == "NIKON D70" ]; then
	echo "Nikon D70 gefunden"
	if [ "$(exiftool -n -p '$Nikon:FlashMode' $file)" == "9" ]; then 
		echo "FlashMode Blitz =9 gefunden" 
		if [ "$(exiftool -n -p '$Nikon:FlashExposureComp' $file)" == "1" ]; then
			echo 'Schreibe "+1,0" in die Beschreibung der Datei, wenn Blitz ausgelöst hat' 
			exiftool -overwrite_original -lang de -E '-description<$description&#xD;• Blitz-Belichtungskorrektur: +1,0' "$file" 
		fi
		
		if [ "$(exiftool -n -p '$Nikon:FlashExposureComp' $file)" == "0.666666666666667" ]; then
			echo 'Schreibe "+0,7" in die Beschreibung der Datei, wenn Blitz ausgelöst hat' 
			exiftool -overwrite_original -lang de -E '-description<$description&#xD;• Blitz-Belichtungskorrektur: +0,7' "$file" 
		fi
		if [ "$(exiftool -n -p '$Nikon:FlashExposureComp' $file)" == "0.333333333333333" ]; then
			echo 'Schreibe "+0,3" in die Beschreibung der Datei, wenn Blitz ausgelöst hat'
			exiftool -overwrite_original -lang de -E '-description<$description&#xD;• Blitz-Belichtungskorrektur: +0,3' "$file" 
		fi
		if [ "$(exiftool -n -p '$Nikon:FlashExposureComp' $file)" == "0" ]; then
			echo 'Schreibe "+/-0" in die Beschreibung der Datei, wenn Blitz ausgelöst hat'
			exiftool -overwrite_original -lang de -E '-description<$description&#xD;• Blitz-Belichtungskorrektur: +/- 0' "$file" 
		fi
		if [ "$(exiftool -n -p '$Nikon:FlashExposureComp' $file)" == "-0.333333333333333" ]; then
			echo 'Schreibe "-0,3" in die Beschreibung der Datei, wenn Blitz ausgelöst hat' 
			exiftool -overwrite_original -lang de -E '-description<$description&#xD;• Blitz-Belichtungskorrektur: -0,3' "$file" 
		fi
		if [ "$(exiftool -n -p '$Nikon:FlashExposureComp' $file)" == "-0.666666666666667" ]; then
			echo 'Schreibe "-0,7" in die Beschreibung der Datei, wenn Blitz ausgelöst hat' 
			exiftool -overwrite_original -lang de -E '-description<$description&#xD;• Blitz-Belichtungskorrektur: -0,7' "$file" 
		fi
		if [ "$(exiftool -n -p '$Nikon:FlashExposureComp' $file)" == "-1" ]; then
			echo 'Schreibe "-1,0" in die Beschreibung der Datei, wenn Blitz ausgelöst hat' 
			exiftool -overwrite_original -lang de -E '-description<$description&#xD;• Blitz-Belichtungskorrektur: -1,0' "$file" 
		fi
		if [ "$(exiftool -n -p '$Nikon:FlashExposureComp' $file)" == "-1.33333333333333" ]; then
			echo 'Schreibe "-1,3" in die Beschreibung der Datei, wenn Blitz ausgelöst hat' 
			exiftool -overwrite_original -lang de -E '-description<$description&#xD;• Blitz-Belichtungskorrektur: -1,3' "$file" 
		fi
		if [ "$(exiftool -n -p '$Nikon:FlashExposureComp' $file)" == "-1.66666666666667" ]; then
			echo 'Schreibe "-1,7" in die Beschreibung der Datei, wenn Blitz ausgelöst hat' 
			exiftool -overwrite_original -lang de -E '-description<$description&#xD;• Blitz-Belichtungskorrektur: -1,7' "$file" 
		fi
		if [ "$(exiftool -n -p '$Nikon:FlashExposureComp' $file)" == "-2" ]; then
			echo 'Schreibe "-2,0" in die Beschreibung der Datei, wenn Blitz ausgelöst hat' 
			exiftool -overwrite_original -lang de -E '-description<$description&#xD;• Blitz-Belichtungskorrektur: -2,0' "$file" 
		fi
		if [ "$(exiftool -n -p '$Nikon:FlashExposureComp' $file)" == "-2.33333333333333" ]; then
			echo 'Schreibe "-2,3" in die Beschreibung der Datei, wenn Blitz ausgelöst hat' 
			exiftool -overwrite_original -lang de -E '-description<$description&#xD;• Blitz-Belichtungskorrektur: -2,3' "$file" 
		fi
		if [ "$(exiftool -n -p '$Nikon:FlashExposureComp' $file)" == "-2.66666666666667" ]; then
			echo 'Schreibe "-2,7" in die Beschreibung der Datei, wenn Blitz ausgelöst hat' 
			exiftool -overwrite_original -lang de -E '-description<$description&#xD;• Blitz-Belichtungskorrektur: -2,7' "$file" 
		fi
		if [ "$(exiftool -n -p '$Nikon:FlashExposureComp' $file)" == "-3" ]; then
			echo 'Schreibe "-3,0" in die Beschreibung der Datei, wenn Blitz ausgelöst hat' 
			exiftool -overwrite_original -lang de -E '-description<$description&#xD;• Blitz-Belichtungskorrektur: -3,0' "$file" 
		fi
	fi
fi
done


# ISO Wert ermitteln und in neuen TAG schreiben 
echo "ISO Wert in anderen TAG eintragen"
exiftool -overwrite_original '-iso<$ISO' -if '$model eq "NIKON D70"' *.JPG 


# Name des Autors einfügen
echo "Name des Autors einfügen"
exiftool -overwrite_original '-author=Dein Name' -if '$model eq "NIKON D70"' *.JPG

# Copyright hinzufügen (muss in zwei TAGs eingefügt werden): 
echo "Copyright Name einfügen"
exiftool -overwrite_original '-copyright=Dein Name'  *.JPG
exiftool -overwrite_original '-rights=Dein Name'  *.JPG
