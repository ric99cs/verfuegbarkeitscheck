-- --------------------------------------------------------
-- Host:                         xxxxxxx
-- Server Version:               5.7.23 - MySQL Community Server (GPL)
-- Server Betriebssystem:        Linux
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Exportiere Daten aus Tabelle usr_web430_3.blocks: ~35 rows (ungefähr)
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
REPLACE INTO `blocks` (`id`, `name`, `block`) VALUES
	(1, 'head_ip500', '<h3 class="h3">Red Internet & Phone 500</h3>'),
	(2, 'button_bestellformular', '<form action="https://schott.tv/downloads" method="GET">\r\n    <input class="button" type="submit" value="Bestellformular*">\r\n</form>'),
	(3, 'block_download_ip500', '<div class="element">Download mit bis zu <strong>500 MBit/s</strong></div>'),
	(4, 'footnote_bestellformular', '<p style="font-size: 9px; text-align: left;">* Sie werden auf unsere Downloadseite weitergeleitet, dort finden Sie alle notwendigen Formulare, um das gewünschte Produkt bei uns zu bestellen.</p>'),
	(5, 'block_upload_ip500', '<div class="element">Upload mit bis zu <strong>50 MBit/s</strong></div>'),
	(6, 'block_free_wifi', '<div class="element"><strong>Internetflatrate inklusive kostenfreier WLAN-Option</strong></div>'),
	(7, 'block_festnetzflat', '<div class="element">Telefonanschluss <strong>mit</strong> Festnetzflatrate</div>'),
	(8, 'block_free_installation', '<div class="element"><strong>kostenfreie Bereitstellung</strong></div>'),
	(9, 'block_100euro', '<div class="element"><strong>100€ Einmalgutschrift</strong></div>'),
	(10, 'block_free_tarifchange', '<div class="element"><strong>kostenloser</strong> Wechsel in einen kleineren Tarif nach 12 Monaten möglich</div>'),
	(11, 'block_price_ip500', '<div class="element">\r\n    In den ersten 12 Monaten<br /><br />\r\n    <span style="font-size: x-large;">\r\n        <strong>19,99€</strong>\r\n    </span>/Monat<sup class="footnoteref">3,4</sup><br />\r\n    <br>danach<br /><br />\r\n    <span style="font-size: large;">\r\n        <strong>49,99€</strong>\r\n    </span>/Monat<sup class="footnoteref">3,4</sup>\r\n<hr>\r\n</div>'),
	(12, 'footnote_3', '<p style="font-size: 9px; text-align: left"><sup class="footnoteref">3</sup>Mindestvertragslaufzeit 24 Monate, Voraussetzung: gültiger Kabelanschlussvertrag mit der Fa. Schott GbR, Multimediazugangsgebühr 1,50€/Monat, außer Gebiete der WG Aufbau und Objekte mit Sondervereinbarung</p>'),
	(13, 'footnote_4', '<p style="font-size: 9px; text-align: left"><sup class="footnoteref">4</sup>inkl. Sicherheitspaket, 2 Monate gratis, danach	3,99€/Monat, jederzeit mit 4 Wochen Frist kündbar</p>'),
	(14, 'footnote_5', '<p style="font-size: 9px; text-align: left"><sup class="footnoteref">5</sup>Mit Vodafone Red GB-Tarifen besteht eine Berechtigung, eine Gutschrift von 10€/Monat für die Dauer der Laufzeit des Mobilfunk- oder Internet/Telefonvertrages zu nutzen</p>'),
	(15, 'head_hdplus', '<h3 class="h3">HD-Programme mit HD+</h3>'),
	(16, 'block_ciplus_79', '<div class="element">inkl. Sat-CI+-Modul für einmalig <strong>79,00€</strong></div>'),
	(17, 'block_hdplus_6mon', '<div class="element">inkl. 6 Monate HD+-Freischaltung</div>'),
	(18, 'block_hdplus_12mon', '<div class="element">jede weitere Freischaltung für 12 Monate kostet <strong>70,00€</strong></div>'),
	(19, 'block_dsl_möglich', '<div class="element">\r\n	<h5><strong><span style="color: #014c93;">Die Buchung von Internet & Telefon über Vodafone-DSL ist möglich.</h5></span><br>Bitte fragen Sie uns zu unseren Internet- & Telefonangeboten von Vodafone-DSL. Vorbehaltlich einer genaueren Prüfung künnen wir Ihnen an dem angefragten Objekt auch entsprechende Pakete von Vodafone anbieten.</strong>\r\n</div>'),
	(20, 'button_erweiterte_Anfrage', '        <form action="https://schott.tv/anfrage-verfuegbarkeitscheck/" method="Post">\r\n          <input class="button" style="border-radius: 4px; padding: 8px 20px; margin: 20px 0 0 0;" type="submit" value="erweiterte Anfrage" />\r\n          <input name="Strasse" type="hidden" value="<?php echo str_replace(\'%\',\' \',htmlspecialchars($strasse)); ?>" />\r\n          <input name="Ort" type="hidden" value="<?php echo str_replace(\'%\',\' \',htmlspecialchars($ort)); ?>" />\r\n          <input name="Hausnummer" type="hidden" value="<?php echo htmlspecialchars($hausnummer).htmlspecialchars($zusatz); ?>" />\r\n        </form>'),
	(21, 'head_gigatv', '<h3 class="h3">Giga TV</h3>'),
	(22, 'block_inkl_basictv', '<div class="element">inkl. HD Basic TV</div>'),
	(23, 'block_hdpremium', '<div class="element">inkl. 2 Monate HD Premium kostenlos<sup>12</sup><br />danach 9,99€ monatlich</div>'),
	(24, 'block_price_gigatv', '<div class="element">\r\n    In den ersten 12 Monaten<br /><br />\r\n    <span style="font-size: x-large;">\r\n        <strong>9,99€</strong>\r\n    </span>/Monat<sup class="footnoteref">27</sup><br />\r\n    <br>danach<br /><br />\r\n    <span style="font-size: large;">\r\n        <strong>14,99€</strong>\r\n    </span>/Monat<sup class="footnoteref">27</sup>\r\n<hr>\r\n</div>'),
	(25, 'block_bereitstellung_gigatv', '<div class="element">Bereitstellungskosten einmalig <strong>49,99€</strong></div>'),
	(26, 'footnote_12', '<p style="font-size: 9px; text-align: left"><sup class="footnoteref">12</sup>HD Premium Cable für 2 Monate kostenfrei zum Testen – nach Ablauf der kostenlosen Testmonate automatischer Übergang in ein kostenpflichtiges Abonnement (in den ersten 4 Wochen jederzeit kündbar) – Kündigungsformular kann angefordert werden</p>'),
	(27, 'footnote_27', '<p style="font-size: 9px; text-align: left"><sup class="footnoteref">27</sup>Aktion gültig bis Aktionsende seitens Vodafone - Änderungen vorbehalten</p>'),
	(28, 'footnote_11', '<p style="font-size: 9px; text-align: left"><sup class="footnoteref">11</sup>wird von Vodafone zugesandt</p>'),
	(29, 'block_4krec_gigatv', '<div class="element"><strong>4K-Festplattenrecorder<sup>11</sup></strong> mit 1TB Festplatte und Giga TV-App</div> '),
	(30, 'block_multiroom_gigatv', '<div class="element">Bis zu zwei "Giga TV Net Box" können zur Nutzung in weiteren Räumen zusätzlich gebucht werden<br />Kosten pro Gerät & Monat <strong>5,00€</strong></div>'),
	(31, 'head_unk', '<h3 class="h3">DSL fast immer möglich</h3>'),
	(32, 'block_dslgehtimmer', '<div class="element">Wir können für das angefragte Objekt zwar keine direkte Produktempfehlung abgeben, aber ein Vodafone-DSL-Anschluss lässt sich fasst immer in einer Variante realisieren.<br /></div>'),
	(33, 'head_dsl100', '<h3 class="h3">Red Internet & Phone 100</h3>'),
	(34, 'block_download_dsl100', '<div class="element">Download mit bis zu <strong>100 MBit/s</strong></div>'),
	(35, 'block_upload_dsl100', '<div class="element">Upload mit bis zu <strong>40 MBit/s</strong></div>'),
	(36, 'block_vodafoneflat', '<div class="element">Vodafone-Flat für Gespräche ins Vodafone Mobilfunknetz</div>'),
	(37, 'footnote_dsl_keinverkauf', '<p style="font-size: 9px; text-align: left">* Das hier gezeigte Beispiel ist ein unverbindliches Modellbeispiel. Nicht jeder DSL-Tarif ist in jedem Objekt verfügbar und wir haben keinen direkten Zugriff auf die Abfrageschnittstelle von Vodafone. Daher können wir genaue Preise und Konditionen erst nach einer erweiterten Anfrage an uns benennen.</p>'),
	(38, 'block_price_dsl100', '<div class="element">\r\n    In den ersten 12 Monaten<br /><br />\r\n    <span style="font-size: x-large;">\r\n        <strong>19,99€</strong>\r\n    </span>/Monat<br />\r\n    <br>danach<br /><br />\r\n    <span style="font-size: large;">\r\n        <strong>39,99€</strong>\r\n    </span>/Monat<sup class="footnoteref">*</sup>\r\n<hr>\r\n</div>'),
	(39, 'block_hardware_dsl100', '<div class="element">Miethardware 12 Monate lang kostenfrei, danach beispielsweise <strong>2,99€/Monat</strong> für eine FRITZ!Box 7530. Eigene Hardware kann alternativ auch verwendet werden</div>'),
	(40, 'block_50euro', '<div class="element"><strong>100€ Einmalgutschrift</strong></div>');
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;

-- Exportiere Daten aus Tabelle usr_web430_3.blockselector: ~40 rows (ungefähr)
/*!40000 ALTER TABLE `blockselector` DISABLE KEYS */;
REPLACE INTO `blockselector` (`id`, `kblocks`, `kpromotion`, `orderid`) VALUES
	(1, 1, 1, 1),
	(2, 2, 1, 12),
	(3, 3, 1, 2),
	(4, 4, 1, 13),
	(5, 5, 1, 3),
	(6, 6, 1, 4),
	(7, 7, 1, 5),
	(8, 8, 1, 6),
	(9, 9, 1, 7),
	(10, 10, 1, 8),
	(11, 11, 1, 9),
	(12, 12, 1, 10),
	(13, 13, 1, 11),
	(14, 15, 2, 1),
	(15, 16, 2, 2),
	(16, 17, 2, 3),
	(17, 18, 2, 4),
	(18, 19, 2, 5),
	(19, 20, 2, 6),
	(20, 21, 3, 1),
	(21, 22, 3, 2),
	(22, 23, 3, 3),
	(23, 25, 3, 4),
	(24, 24, 3, 7),
	(25, 2, 3, 11),
	(26, 4, 3, 12),
	(27, 29, 3, 5),
	(28, 30, 3, 6),
	(29, 28, 3, 8),
	(30, 26, 3, 9),
	(31, 27, 3, 10),
	(32, 31, 4, 1),
	(34, 20, 4, 3),
	(35, 19, 4, 2),
	(36, 33, 5, 1),
	(37, 34, 5, 2),
	(38, 35, 5, 3),
	(39, 7, 5, 4),
	(40, 36, 5, 5),
	(41, 39, 5, 6),
	(42, 10, 5, 7),
	(43, 40, 5, 8),
	(44, 38, 5, 9),
	(45, 20, 5, 10),
	(46, 37, 5, 11);
/*!40000 ALTER TABLE `blockselector` ENABLE KEYS */;

-- Exportiere Daten aus Tabelle usr_web430_3.matrix: ~10 rows (ungefähr)
/*!40000 ALTER TABLE `matrix` DISABLE KEYS */;
REPLACE INTO `matrix` (`id`, `angeboti`, `angebotd`, `ergebnis`) VALUES
	(1, 'KDG', 'JA', 'ip500'),
	(2, 'KDG', 'SAT', 'ip500'),
	(3, 'KDG', 'NEIN', 'ip500'),
	(4, 'KDG', 'SOLO', 'ip500'),
	(5, 'VDF', 'JA', 'giga'),
	(6, 'VDF', 'SAT', 'hdplus'),
	(7, 'VDF', 'NEIN', 'dsl100'),
	(8, 'VDF', 'SOLO', 'dsl100'),
	(9, 'NEIN', 'SAT', 'hdplus'),
	(10, 'NEIN', 'JA', 'giga'),
	(11, 'NEIN', 'NEIN', 'unk'),
	(12, 'NEIN', 'SOLO', 'unk');
/*!40000 ALTER TABLE `matrix` ENABLE KEYS */;

-- Exportiere Daten aus Tabelle usr_web430_3.promotion_blocks: ~5 rows (ungefähr)
/*!40000 ALTER TABLE `promotion_blocks` DISABLE KEYS */;
REPLACE INTO `promotion_blocks` (`id`, `promotion_id`, `name`) VALUES
	(1, 1, 'ip500'),
	(12, 2, 'hdplus'),
	(13, 3, 'giga'),
	(14, 4, 'unk'),
	(15, 5, 'dsl100');
/*!40000 ALTER TABLE `promotion_blocks` ENABLE KEYS */;

-- Exportiere Daten aus Tabelle usr_web430_3.resultblocks: ~14 rows (ungefähr)
/*!40000 ALTER TABLE `resultblocks` DISABLE KEYS */;
REPLACE INTO `resultblocks` (`id`, `versorgung`, `wert`, `result`, `angebot`) VALUES
	(1, 'KAA', 'P', '<br />\r\n	<h5 style="clear:both;">\r\n	<b>\r\n		<img src="https://schott.tv/wp-content/uploads/2015/06/ja.png" alt="" width="40" height="40" style="margin-right:5px;margin-bottom:20px; float:left;" />\r\n		Sie verfügen über einen aktiven Kabelanschluss.\r\n	</b>\r\n	</h5>\r\n	<p style="clear:both">\r\n		<span>Der Kabelanschluss ist bereits freigeschaltet. Die Abrechnung erfolgt über die Mietnebenkosten Ihrer Wohnung.</span>\r\n	</p>\r\n<br /><br />', NULL),
	(2, 'KAA', 'V', '<br />\r\n	<h5 style="clear:both;">\r\n		<b>\r\n			<img src="https://schott.tv/wp-content/uploads/2015/06/vllt.png" alt="" width="40" height="40" style="margin-right:5px;margin-bottom:20px; float:left;" />\r\n			Ein Kabelanschluss ist vorhanden, aber möglicherweise nicht aktiv\r\n		</b>\r\n	</h5>\r\n	<p style=\'clear:both\'>\r\n		<span>Zur Aktivierung ist ein Vertrag mit uns notwendig. Sollte der Kabelanschluss in Ihrer Wohnung nicht funktionieren, dann setzen Sie sich bitte mit uns in Verbindung, um einen Termin für die Freischaltung zu vereinbaren.</span>\r\n	</p>\r\n<br /><br />', NULL),
	(3, 'KAA', 'S', '<br />\r\n<h5 style="clear:both;">\r\n	<b>\r\n		<img src="https://schott.tv/wp-content/uploads/2015/06/vllt.png" alt="" width="40" height="40" style="margin-right:5px;margin-bottom:20px; float:left;" />\r\n		Ein Satellitenanschluss ist vorhanden, aber möglicherweise nicht aktiv.\r\n	</b>\r\n</h5>\r\n<p style=\'clear:both\'>\r\n	<span>Zur Aktivierung ist ein Vertrag mit uns notwendig. Sollte der Satellitenanschluss in Ihrer Wohnung nicht funktionieren, dann setzen Sie sich bitte mit uns in Verbindung, um einen Termin für die Freischaltung zu vereinbaren.</span>\r\n</p>\r\n<br /><br />\r\n', NULL),
	(4, 'KAA', 'O', '<br />\r\n<h5 style="clear:both;">\r\n	<b>\r\n		<img src="https://schott.tv/wp-content/uploads/2015/06/ja.png" alt="" width="40" height="40" style="margin-right:5px;margin-bottom:20px; float:left;" />\r\n		Sie verfügen über einen aktiven Satellitenanschluss.\r\n	</b>\r\n</h5>\r\n<p style=\'clear:both\'>\r\n	<span>Der Satellitenanschluss ist bereits freigeschaltet. Die Abrechnung erfolgt über die Mietnebenkosten Ihrer Wohnung.</span>\r\n</p>\r\n<br /><br />', NULL),
	(5, 'KAA', 'K', '<br />\r\n<h5 style="clear:both;">\r\n	<b>\r\n		<img src="https://schott.tv/wp-content/uploads/2015/06/vllt.png" alt="" width="40" height="40" style="margin-right:5px;margin-bottom:20px; float:left;" />\r\n		Sie verfügen über einen aktiven, aber eingeschränkten Kabelanschluss.\r\n	</b>\r\n</h5>\r\n<p style=\'clear:both\'>\r\n	<span>Eingeschränkt bedeutet, dass es sich zwar um einen Kabelanschluss handelt, dieser jedoch im Senderumfang eingeschränkt ist. Bitte erfragen Sie weitere Details bei uns.</span>\r\n</p>\r\n<br /><br />', NULL),
	(6, 'KAA', 'U', '<br />\r\n<h5 style="clear:both;">\r\n	<b>\r\n		<img src="https://schott.tv/wp-content/uploads/2015/06/nein.png" alt="" width="40" height="40" style="margin-right:5px;margin-bottom:10px; float:left;" />\r\n		Die Versorgungsart des gesuchten Objektes ist nicht bekannt.\r\n	</b>\r\n</h5>\r\n<p style=\'clear:both\'>\r\n	<span>Dies bedeutet nicht, dass wir keine Versorgung anbieten können. Zur Überprüfung sind aber weitere Details notwendig. Bitte setzen Sie sich daher direkt mit uns in Verbindung.</span>\r\n</p>\r\n<br /><br />', NULL),
	(7, 'KAD', 'J', '<br />\r\n<h5 style="clear:both;">\r\n	<b>\r\n		<img src="https://schott.tv/wp-content/uploads/2015/06/ja.png" alt="" width="40" height="40" style="margin-right:5px;margin-bottom:20px; float:left; " />\r\n		Es sind zusätzliche Digitalprogramme verfügbar.\r\n	</b>\r\n</h5>\r\n<p style=\'clear:both\'>\r\n	<span>Sie können viele neue Sender in hochauflösender Qualität zusätzlich zu Ihrem bestehenden Anschluss abonnieren. Gerne unterbreiten wir Ihnen ein persönliches Angebot.</span>\r\n</p>\r\n<br /><br />', 'JA'),
	(8, 'KAD', 'S', '<br />\r\n<h5 style="clear:both;">\r\n	<b>\r\n		<img src="https://schott.tv/wp-content/uploads/2015/06/ja.png" alt="" width="40" height="40" style="margin-right:5px;margin-bottom:20px; float:left; " />\r\n		Es sind zusätzliche Digitalprogramme verfügbar.\r\n	</b>\r\n</h5>\r\n<p style=\'clear:both\'>\r\n	<span>Sie können viele neue Sender in hochauflösender Qualität zusätzlich zu Ihrem bestehenden Anschluss abonnieren. Gerne unterbreiten wir Ihnen ein persönliches Angebot.</span>\r\n</p>\r\n<br /><br />', 'SAT'),
	(9, 'KAD', 'N', '<br />\r\n<h5 style="clear:both;">\r\n	<b>\r\n		<img src="https://schott.tv/wp-content/uploads/2015/06/nein.png" alt="" width="40" height="40" style="margin-right:5px;margin-bottom:20px; float:left; " />\r\n		Digitale Zusatzprogramme sind nicht verfügbar.\r\n	</b>\r\n</h5>\r\n<p style=\'clear:both\'>\r\n	<span>Durch die Art des Anschlusses ist es leider nicht möglich, zusätzliche Digitalprogramme zu buchen.</span>\r\n</p>\r\n<br /><br />', 'NEIN'),
	(10, 'KAD', 'E', '<br />\r\n<h5 style="clear:both;">\r\n	<b>\r\n		<img src="https://schott.tv/wp-content/uploads/2015/06/ja.png" alt="" width="40" height="40" style="margin-right:5px;margin-bottom:20px; float:left; " />\r\n		Digitale Zusatzprogramme sind eingeschränkt verfügbar.\r\n	</b>\r\n</h5>\r\n<p style=\'clear:both\'>\r\n	<span>Sie können viele neue Sender in hochauflösender Qualität zusätzlich zu Ihrem bestehenden Anschluss abonnieren. Allerdings sind nicht alle Pakete oder alle Sender verfügbar. Gerne unterbreiten wir Ihnen ein persönliches Angebot und informieren Sie über die empfangbaren Sender.</span>\r\n</p>\r\n<br /><br />', 'SOLO'),
	(11, 'KAD', 'P', '<br />\r\n<h5 style="clear:both;">\r\n	<b>\r\n		<img src="https://schott.tv/wp-content/uploads/2015/06/vllt.png" alt="" width="40" height="40" style="margin-right:5px;margin-bottom:20px; float:left; " />\r\n		Die Versorgung mit zusätzlichen Digitalprogrammen muss durch uns geprüft werden.\r\n	</b>\r\n</h5>\r\n<p style=\'clear:both\'>\r\n	<span>Bitte setzen Sie sich direkt oder über unser Kontaktformular mit uns in Verbindung, damit wir prüfen können, ob an dem angefragten Objekt zusätzliche Digitalprogramme bereitgestellt werden können.</span>\r\n</p>\r\n<br /><br />', 'NEIN'),
	(12, 'KAI', 'J', '<br />\r\n<h5 style="clear:both;">\r\n	<b>\r\n		<img src="https://schott.tv/wp-content/uploads/2015/06/ja.png" alt="" width="40" height="40" style="margin-right:5px;margin-bottom:20px; float:left; " />\r\n		Internet und Telefon über den Fernsehanschluss sind verfügbar.\r\n	</b>\r\n</h5>\r\n<p style=\'clear:both\'>\r\n	<span>Am Anschluss sind schnelles Internet mit bis zu 1000 MBit/S sowie Telefon verfügbar.</span>\r\n</p>\r\n<br /><br />', 'KDG'),
	(13, 'KAI', 'N', '<br />\r\n<h5 style="clear:both;">\r\n	<b>\r\n		<img src="https://schott.tv/wp-content/uploads/2015/06/nein.png" alt="" width="40" height="40" style="margin-right:5px;margin-bottom:20px; float:left; " />\r\n		Internet und Telefon über den Fernsehanschluss sind nicht verfügbar.\r\n	</b>\r\n</h5>\r\n<p style=\'clear:both\'>\r\n	<span>An dem angefragten Objekt wird derzeit kein schnelles Internet oder Telefon über den Fernsehanschluss bereitgestellt. Viele Gebiete werden aber aktuell überbaut und hochgerüstet, schauen Sie daher öfter auf dieser Seite nach, ob es Neuigkeiten zur Versorgung gibt. Gern prüfen wir für Sie auch alternative Internet- und Telefonangebote für dieses Objekt.</span>\r\n</p>\r\n<br /><br />\r\n', 'VDF'),
	(14, 'KAI', 'P', '<br />\r\n<h5 style="clear:both;">\r\n	<b>\r\n		<img src="https://schott.tv/wp-content/uploads/2015/06/vllt.png" alt="" width="40" height="40" style="margin-right:5px;margin-bottom:20px; float:left; " />\r\n		Die Versorgung mit Internet und Telefon über den Fernsehanschluss muss durch uns erst geprüft werden.\r\n	</b>\r\n</h5>\r\n<p style=\'clear:both\'>\r\n	<span>Der Stand der Versorgung ist derzeit nicht bekannt. Bitte setzen Sie sich direkt oder über unser Kontaktformular mit uns in Verbindung, damit wir prüfen können, ob an dem angefragten Objekt Internet und Telefon über den Fernsehanschluss bereitgestellt werden können.</span>\r\n</p>\r\n<br /><br />', 'NEIN');
/*!40000 ALTER TABLE `resultblocks` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
