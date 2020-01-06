<div class="gca-column two-thirds first">
  <h5>
    <b>
      <img src="https://schott.tv/wp-content/uploads/2015/06/home.png" alt="" width="40" height="40" style="margin-right:5px;margin-bottom:20px; float:left;">
      <span style='color:#014c93'>Sie suchten nach folgender Anschrift:<br /></span>
    </b>
  </h5>
  <h5>
    <b style='clear:both'><span style='color:#014c93'>
      <?php echo $_GET['Straße']." ".$_GET['Hausnummer'].$_GET['Zusatz'].", ".$_GET['Ort']; ?>
    </b>
  </h5>
  </span>
  <hr>
  <br />
  <span style='color:#014c93; margin-top:10px'>
    Diese Anschrift haben wir in unserer Datenbank gefunden:<br /><br />
    <?php echo $searchaddress; ?>
  </span>
  <hr>