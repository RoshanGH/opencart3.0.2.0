<div>
  <?php if ($heading_title) { ?>
  <h3><?php echo $heading_title; ?></h3>
  <?php } ?>
  <a class="twitter-timeline" href="https://twitter.com" data-widget-id="<?php echo $widget_id; ?>"
    width="<?php echo $width; ?>"
    height="<?php echo $height; ?>"
    data-theme="<?php echo $theme; ?>"
    data-show-replies="<?php echo $show_replies; ?>"
    data-chrome="nofooter noheader noborders transparent noscrollbar"
    <?php if ($limit) { ?>data-tweet-limit="<?php echo $limit; ?>"<?php } ?>
    <?php if ($related_users) { ?>data-related="<?php echo $related_users; ?>"<?php } ?>
  >Tweets</a>
  <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
</div>