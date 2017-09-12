<footer id="footer">
<div id="map">
</div>
  <table>
    <tr>
      <th>Special Thanks:</th>
      <th>Navigation:</th>
      <th>Contact Us:</th>
    </tr>
    <tr>
      <td>All Rights Reserved</td>
      <td><a href="<?= BASE_URL ?>/Browse/">Browse</a></td>
      <td>Phone Number:</td>
    </tr>
    <tr>
      <td>to the site references</td>
      <td><a href="#">Comics</a></td>
      <td>571-338-0067</td>
    </tr>
    <tr>
      <td> in the html/css pages.</td>
      <td><a href="#">Movies</a></td>
      <td>Email:</td>
    </tr>
    <tr>
      <td></td>
      <td><a href="#">TV/Shows</a></td>
      <td>pacog94@vt.edu</td>
    </tr>
    <tr>
      <td></td>
      <td><a href="<?= BASE_URL ?>/Sell/">Sell</a></td>
      <td></td>
    </tr>
  </table>
  <br/><p>&copy Carlos "Paco" Gallegos</p>
</footer>

</div>
<script>
    function initMap() {
      var uluru = {lat:  37.229838, lng:  -80.420269};
      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 4,
        center: uluru
      });
      var marker = new google.maps.Marker({
        position: uluru,
        map: map
      });
    }
  </script>
  <script async defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnjkdW9xymdBw_598HlEQKNuw-xnmJrZE&callback=initMap">
  </script>

</body>
</html>
