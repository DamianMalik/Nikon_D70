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

