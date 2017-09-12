<div id="content" style="height: 500px"> <!-- content containter -->
  <br><br><br><form name="checkout" id="checkout" method="POST" accep-charset="utf-8"> <!-- Credit to Hongkiat.com for teaching me how to make a login form-->
    <label style="font-size: 64px; color: white; text-align: center;">CHECKOUT?</label>
    <ul id="editable">
      <li style="margin-bottom: 20px"><input style="width: 150px; height: 50px; font-size: 16px" formaction="<?= BASE_URL ?>/cart/checkoutProcess/" type="submit" name="submit" value="YES"></li>
      <li style="margin: 0;"><input style="width: 150px; height: 50px; font-size: 16px" formaction="<?= BASE_URL ?>/cart/" type="submit" name="submit" value="NO, bring me back!"></li>
    </ul>
  </form>
</div>
