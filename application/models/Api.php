<?php

/**
* 
*/
class Api extends CI_Model
{
	public function get_all(){
		$query = $this->db->get("evento");
		if($query->nm_rows()>0){
			return $query->result(); 
		}
	}
}


?>