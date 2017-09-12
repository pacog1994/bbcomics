<?php

class User extends databaseObject {
  // name of database table
  const DB_TABLE = 'user';

  // database fields
  protected $id;
  protected $username;
  protected $pw;
  protected $first_name;
  protected $last_name;
  protected $email;
  protected $role;
  protected $description;
  protected $gender;

  // constructor
  public function __construct($args = array()) {
      $defaultArgs = array(
          'id' => null,
          'username' => '',
          'pw' => '',
          'email' => null,
          'first_name' => null,
          'last_name' => null,
          'role' => 'user',
          'description' => null,
          'gender' => ''
          );

      $args += $defaultArgs;

      $this->id = $args['id'];
      $this->username = $args['username'];
      $this->pw = $args['pw'];
      $this->email = $args['email'];
      $this->first_name = $args['first_name'];
      $this->last_name = $args['last_name'];
      $this->role = $args['role'];
      $this->description = $args['description'];
      $this->gender = $args['gender'];
  }

  // save changes to object
  public function save() {
      $db = Db::instance();
      // omit id and any timestamps
      $db_properties = array(
          'username' => $this->username,
          'pw' => $this->pw,
          'email' => $this->email,
          'first_name' => $this->first_name,
          'last_name' => $this->last_name,
          'role' => $this->role,
          'description' => $this->description,
          'gender' => $this->gender
          );
      $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
  }

  // load object by ID
  public static function loadById($id) {
      $db = Db::instance();
      $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
      return $obj;
  }

  // load user by username
  public static function loadByUsername($username=null) {
      if($username === null)
          return null;

      $query = sprintf(" SELECT id FROM %s WHERE username = '%s' ",
          self::DB_TABLE,
          $username
          );
      $db = Db::instance();
      $result = $db->lookup($query);
      if(!mysql_num_rows($result))
          return null;
      else {
          $row = mysql_fetch_assoc($result);
          $obj = self::loadById($row['id']);
          return ($obj);
      }
  }
  // load user by username
  public static function loadByPassword($pw=null) {
      if($pw === null)
          return null;

      $query = sprintf(" SELECT id FROM %s WHERE password = '%s' ",
          self::DB_TABLE,
          $pw
          );
      $db = Db::instance();
      $result = $db->lookup($query);
      if(!mysql_num_rows($result))
          return null;
      else {
          $row = mysql_fetch_assoc($result);
          $obj = self::loadById($row['id']);
          return ($obj);
      }
  }

  // given a user ID, return that user's username
  public static function getUsernameById($userID=null) {
    if($userID == null)
    return null;
    $query = sprintf("SELECT username FROM `%s` WHERE id = %d ",
    self::DB_TABLE,
    $userID
  );
  $db = Db::instance();
  $result = $db->lookup($query);
  if(!mysql_num_rows($result))
  return null;
  else {
    $row = mysql_fetch_assoc($result);
    $username = $row['username'];
    return ($username);
  }
}

}
