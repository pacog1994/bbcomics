<?php

class Product extends databaseObject {
    // name of database table
    const DB_TABLE = 'product';

    // database fields
    protected $id;
    protected $title;
    protected $description;
    protected $ptype;
    protected $category;
    protected $price;
    protected $quantity;
    protected $img_url;
    protected $creator_id;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'title' => '',
            'ptype' => '',
            'category' => '',
            'description' => null,
            'price' => 0,
            'quantity' => '',
            'img-url' => null,
            'creator_id' => 0,
            'date_created' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->title = $args['title'];
        $this->ptype = $args['ptype'];
        $this->category = $args['category'];
        $this->description = $args['description'];
        $this->price = $args['price'];
        $this->quantity = $args['quantity'];
        $this->img_url = $args['img-url'];
        $this->creator_id = $args['creator_id'];
        $this->date_created = $args['date_created'];
    }



    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'title' => $this->title,
            'description' => $this->description,
            'ptype' => $this->ptype,
            'category' => $this->category,
            'price' => $this->price,
            'quantity' => $this->quantity,
            'img-url' => $this->img_url,
            'creator_id' => $this->creator_id
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
    public static function getAllProducts($limit=null) {
        $query = sprintf(" SELECT id FROM %s ORDER BY date_created DESC ",
            self::DB_TABLE
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
