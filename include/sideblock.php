<div class="gca-column one-third">
  <h3 style="text-align:center;">Unsere Empfehlung:</h3>
  <?php $querystring="SELECT blocks.block FROM blocks INNER JOIN blockselector ON blocks.id = blockselector.kblocks INNER JOIN promotion_blocks ON blockselector.kpromotion = promotion_blocks.promotion_id INNER JOIN matrix ON matrix.ergebnis = promotion_blocks.name WHERE matrix.angeboti='".$AngebotI."' AND matrix.angebotd='".$AngebotD."' ORDER BY orderid"; ?>
  <?php $allqueries .= $querystring."\r\n\r\n"; $query=mysql_query($querystring) or die(mysql_error()); ?>
  <link rel="stylesheet" href="/wp-content/themes/hathor/verfuegbarkeit/css/blocks.css" type="text/css">
  <div class="sideblock">
    <?php while ($row = mysql_fetch_array($query, MYSQL_NUM)) {
      echo($row[0]);
    } ?>
  </div>
</div>