<h5>
  <b>
    Klicken Sie auf "Check wiederholen", um den Verfügbarkeitscheck zu wiederholen, oder klicken Sie auf "erweiterte Anfrage", um zusätzliche Informationen zu dem angefragten Objekt anzufordern:
  </b>
</h5>
<table>
  <tbody>
    <tr>
      <td>
        <form action="<?php echo $_SERVER['HTTP_REFERER']; ?>">
          <input class="button" style="border-radius: 4px; padding: 8px 20px; margin: 20px 0 0 0;" type="submit" value="Check wiederholen" />
        </form>
      </td>
      <td>
        <form action="https://schott.tv/anfrage-verfuegbarkeitscheck/" method="Post">
          <input class="button" style="border-radius: 4px; padding: 8px 20px; margin: 20px 0 0 0;" type="submit" value="erweiterte Anfrage" />
          <input name="Strasse" type="hidden" value="<?php echo str_replace('%',' ',htmlspecialchars($strasse)); ?>" />
          <input name="Ort" type="hidden" value="<?php echo str_replace('%',' ',htmlspecialchars($ort)); ?>" />
          <input name="Hausnummer" type="hidden" value="<?php echo htmlspecialchars($hausnummer).htmlspecialchars($zusatz); ?>" />
        </form>
      </td>
      <td>
        <form action="https://schott.tv/downloads" method="GET">
          <input class="button" style="border-radius: 4px; padding: 8px 20px; margin: 20px 0 0 0;" type="submit" value="Downloads" />
        </form>
      </td>
    </tr>
  </tbody>
</table>
</div>