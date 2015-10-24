<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
* 
*/
require APPPATH.'/libraries/REST_Controller.php'; 

class Api extends REST_Controller 
{
	
	function events_get(){
				
		$this->load->model("api");
		$events = $this->api->get_all(); 
		if($events){
			$this->response($events , 200); 
		}else {
			$this->response(NULL, 400); 
		}


	}
}

?>