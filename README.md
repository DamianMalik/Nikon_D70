![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/DamianMalik/Nikon_D70)


# Die Nikon D70: Cleveres Auslesen der EXIF-Informationen für Deine Bildanalyse.  

*Dieses kleine Bash-Skript vereinfacht die Arbeit mit der Nikon D70, indem es die wichtigsten EXIF-Daten ausliest und an einer zentralen Stelle bündelt. Es extrahiert die wichtigsten Aufnahmeinformationen aus verschiedenen TAGs wie Programmmodus, ISO-Wert, Focuseinstellungen und benutzten Objektiv und konsolidiert sie im Beschreibungs-TAG.*

Die Nikon D70 Kamera speichert die Bildinformationen aus den Programmmodi in unterschiedlichen TAGs. Für die Bildanalyse ist das Herausfinden dieser Informationen zeitaufwändig. 

Das Bash-Skript ermittelt die wichtigsten EXIF-Bildinformationen der NIKON D70 aus den TAGs SceneCaptureType, VariProgram und ExposureProgram etc. und fügt sie im Beschreibungs-TAG zusammen. Die wichtigsten Bildeigenschaften sind somit für den Betrachter auf einen Blick sichtbar. Damit kann der Fotograf alle seine Fotos schneller analysieren. 

Durch die optimierte Darstellung der Bildinformationen können Fotografen:

   * Ihre Aufnahmetechniken schneller evaluieren
   * Konsistenz in ihren Bildserien überprüfen
   * Effizienter große Mengen an Fotos sichten und vergleichen 

Dieses Tool ergänzt die Nikon D70 um ein sinnvolles Feature für ambitionierte Hobbyfotografen, indem es die Analyse von Bildern erheblich vereinfacht und beschleunigt.



**Beispiel:**

Vor dem Skriptdurchlauf werden in einem Bild-Betrachtungsprogramm nur wenige Bild-Details angezeigt: 
![Foto vor dem Skript:](https://private-user-images.githubusercontent.com/31533791/394446242-3577dfe5-4202-4c5e-a834-eed7c26025e2.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzM4NjMzMzEsIm5iZiI6MTczMzg2MzAzMSwicGF0aCI6Ii8zMTUzMzc5MS8zOTQ0NDYyNDItMzU3N2RmZTUtNDIwMi00YzVlLWE4MzQtZWVkN2MyNjAyNWUyLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDEyMTAlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMjEwVDIwMzcxMVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTQyZWE1NGQxYTlkNjI3ZGNjM2I4Y2JiODZjNzg3NDJmZWQyNDU5MDcyODg3Mjk0NjJmNzA2N2FjNTVhYjU1NDMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.CvtGwkBJht_aVUBcmwUBwzwScOhqCUDoz1cx0su-3lE)

Nach dem Skriptdurchlauf werden ergänzende Bildinformationen und wichtige Parameter in der Beschreibung angezeigt: 
![Foto nach dem Skript:](https://private-user-images.githubusercontent.com/31533791/394446367-86f4d3f7-4d3c-446c-9b35-4ae0fe51e54c.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzM4NjMzMzEsIm5iZiI6MTczMzg2MzAzMSwicGF0aCI6Ii8zMTUzMzc5MS8zOTQ0NDYzNjctODZmNGQzZjctNGQzYy00NDZjLTliMzUtNGFlMGZlNTFlNTRjLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDEyMTAlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMjEwVDIwMzcxMVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTQ5Y2MyYTgxMzgyMDFmZDdmMWIyOTkzYmE3NmY3NTM3M2QxNGYyZjE0YmQxYmM3NmMwMDljYTRmMDkyZDI1NjkmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.2ktBhtFGxfHqqcBnmtRojC5xz58_ODjX2WXEd54qmYc)

