# Verfügbarkeitscheck
## Dient der Prüfung der Verfügbarkeit verschiedener Dienste eines lokalen Kabelnetzbetreibers durch Integration in eine Wordpress-Seite

Die Kunden eines lokalen Kabelnetzbetreibers mit unterschiedlichsten Anlagentypen sollen die Möglichkeit haben, auf der Internetseite des Betreibers die Verfügbarkeit von Kabelinternetanschlüssen, digitalen Zusatzprodukten und Kabelanschlüssen allgemein zu prüfen.

Die Seite verwendet ein Wordpress-CMS zur Erstellung der Inhalte. Da dieses nur bedingt tauglich für eine solche Abfrage ist, wurde nach einer Möglichkeit gesucht, dies über eine externe Datenbankabfrage zu lösen.

Folgende Anforderungen gelten hierbei:

- die Suche nach Straßen soll eine einfache Ähnlichkeitssuche bieten
- es können nur feste Orte aus dem Verbreitungsgebiet des Kabelbetreibers ausgewählt werden
- das Ergebnis soll die Verfügbarkeit von Kabelanschluss, digitaler Zusatzangebote und Internet/Telefon über den Kabelanschluss aufzeigen
- in Abhängigkeit vom Ergebnis soll auf der rechten Seite ein passender Produktvorschlag erscheinen
- für das Monitoring soll bei einer Verfügbarkeitsabfrage eine Email mit den Abfragedaten und den internen Ablaufdaten der Suchanfrage an den Seitenbetreiber gesendet werden
- die Abfrage muss sich in das Design der Homepage integrieren lassen
- Änderungen an den Produktvorschlägen, der Verknüpfungsmatrix oder den Suchergebnissen sollen sich in der Datenbank ändern lassen, der Code der Abfrage soll hierbei nicht angefasst werden


## Umsetzung der einzelnen Punkte
### Ähnlichkeitssuche

In der Haupttabelle werden die Daten zu den einzelnen Anschriften gespeichert. Neben den spezifischen Daten zu den Objekten werden der Straßenname (bspw. Großenhainer Str.), die Hausnummer mit einem eventuellen Zusatz in einer separaten Spalte und der Ort gespeichert.

Weiterhin existieren drei Spalten für die Ähnlichkeitssuche. Als erstes werden im Straßennamen deutsche Umlaute wie ä,ö und ü sowie einige Sonderzeichen und das ß umbenannt oder entfernt. Diese Spalte wird für eine RegEx-Suche verwendet, bei welcher die Benutzereingabe nach dem gleichen Muster transformiert wird. 

Gibt es bei dieser Suche keinen Treffer, dann wird die nächste Spalte überprüft. Hier ist der Code der [Kölner Phonetik](https://de.wikipedia.org/wiki/K%C3%B6lner_Phonetik) des jeweiligen Namens gespeichert. Für die Speicherung und für die Suche kommt die im php-Manual veröffentlichte [Funktion von Nicolas Zimmer](https://www.php.net/manual/de/function.soundex.php#84881) zum Einsatz. Diese findet sich in der Datei [colognephon.php](include/colognephon.php)
