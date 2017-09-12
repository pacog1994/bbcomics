<?php

class Cart extends databaseObject {
  // name of database table
  const DB_TABLE = 'cart';

  // database fields
  protected $id;
  protected $buyer_id;
  protected $product_id;
  protected $title;
  protected $img_url;

  // constructor
  public function __construct($args = array()) {
    $defaultArgs = array(
      'id' => null,
      'buyer_id' => 1,
      'product_id' => 0,
      'title' => '',
      'img-url' => null
    );

    $args += $defaultArgs;

    $this->id = $args['id'];
    $this->buyer_id = $args['buyer_id'];
    $this->product_id = $args['product_id'];
    $this->title = $args['title'];
    $this->img_url = $args['img-url'];
  }

  // save changes to object
  public function save() {
    $db = Db::instance();
    // omit id and any timestamps
    $db_properties = array(
      'buyer_id' => $this->buyer_id,
      'product_id' => $this->product_id,
      'title' => $this->title,
      'img-url' => $this->img_url
    );
    $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
  }

  // load object by ID
  public static function loadById($id) {
    $db = Db::instance();
    $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
    return $obj;
  }

  // load all products
  public static function getCartByUserId($userID=null, $limit=null) {
    if($userID==null) {
      return null;
    }

    $query = sprintf("SELECT * FROM cart WHERE buyer_id = '$userID' ;",
    self::DB_TABLE,
    $userID
  );
  $db = Db::instance();
  $result = $db->lookup($query);
  if(!mysql_num_rows($result))
  return null;
  else {
    $objects = array();
    while($row = mysql_fetch_assoc($result)) {
      $objects[] = self::loadById($row['id']);
    }
    return ($objects);
  }
}

}
