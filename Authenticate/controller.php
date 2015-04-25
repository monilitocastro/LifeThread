<?php
class Controller
{
    private $model;
 
    public function __construct(&$model){
        $this->model = $model;
    }
    public function postBack(){
     
     $arr['Username'] = $_POST['Username'];
     $arr['Password'] = $_POST['Password'];

     $model->connectToDB("localhost", $arr['Username'], $arr['Password']);
     $arr['UserID']=$model->getUserIDFromDB();
     
     if(!$arr['UserID']){
      print "<h2 style='text-align:center;'> Sorry User does not exist</h2>";
     }else{
      foreach($arr as $key => $value){
       $model->toCookie($key, $value);
      }
     }
    }
}
?>
