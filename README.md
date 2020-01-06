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


## Test der Funktion

Die Funktion kann auf der Seite des Anbieters unter https://schott.tv/verfuegbarkeitscheck/ getestet werden.


## Umsetzung der einzelnen Punkte
### Ähnlichkeitssuche

In ersten Versionen des Verfügbarkeitschecks hat sich gezeigt, dass gerade bei den Straßennamen häufig Schreibfehler zu finden waren und der Nutzer folglich kein Ergebnis erhalten hat. Somit sollte eine einfache Ähnlichkeitssuche eingebaut werden, welche in Verbindung mit Hausnummer und Ort jeweils ein einzelnes Ergebnis liefern soll. Es ist nicht vorgesehen, eine Auswahlliste bei der Entsprechung mehrerer Straßennamen anzubieten.

In der Haupttabelle werden die Daten zu den einzelnen Anschriften gespeichert. Neben den spezifischen Daten zu den Objekten werden der Straßenname (bspw. Großenhainer Str.), die Hausnummer mit einem eventuellen Zusatz in einer separaten Spalte und der Ort gespeichert.

Weiterhin existieren drei Spalten für die Ähnlichkeitssuche. Als erstes werden im Straßennamen deutsche Umlaute wie ä,ö und ü sowie einige Sonderzeichen und das ß umbenannt oder entfernt. Diese Spalte wird für eine RegEx-Suche verwendet, bei welcher die Benutzereingabe nach dem gleichen Muster transformiert wird. 

Gibt es bei dieser Suche keinen Treffer, dann wird die nächste Spalte überprüft. Hier ist der Code der [Kölner Phonetik](https://de.wikipedia.org/wiki/K%C3%B6lner_Phonetik) des jeweiligen Namens gespeichert. Für die Speicherung und für die Suche kommt die im php-Manual veröffentlichte [Funktion von Nicolas Zimmer](https://www.php.net/manual/de/function.soundex.php#84881) zum Einsatz. Diese findet sich in der Datei [colognephon.php](include/colognephon.php).

Wird auch hier keine Entsprechung gefunden, dann wird als letztes versucht, über den in der dritten Spalte gespeicherten [Soundex-Code](https://de.wikipedia.org/wiki/Soundex) mittels der php-eigenen Soundex-Funktion eine Entsprechung zu finden. Wird kein Ergebnis gefunden, dann wird eine Fehlermeldung aus der Datenbank mit zusätzlichen Hinweisen, was fehlerhaft sein könnte, geladen. Andernfalls wird das Ergebnis geladen und entsprechend angezeigt.


### Verfügbarkeit der einzelnen Produkte
