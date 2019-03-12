<?php
$filePath = 'orariXml.xml';
$dom = new DOMDocument('1.0', 'utf-8'); 
$root = $dom->createElement('school');
$xslt = $dom->createProcessingInstruction('xml-stylesheet', 'type="text/xsl" href="orari.xslt"');
$dom->appendChild($xslt);
$mysqli = new mysqli("localhost", "root", "", "orari_tik");


if(isset($_POST['degree'])){

	$degree = $_POST["degree"];
}
if(isset($_POST['year'])){

	$year = $_POST["year"];
}

if(isset($_POST['paraleli'])){

	$paraleli = $_POST["paraleli"];
}

$params = $dom->createElement("params");
$paraleli = $dom->createElement("paramParaleli", $paraleli);
$year = $dom->createElement("paramViti", $year);

$params->appendChild($paraleli);
$params->appendChild($year);

$root->appendChild($params);

for($i = 1; $i < 13; $i++){

	$query = "SELECT * FROM `orari` WHERE radha = ".$i;
	$query = $query." ORDER BY radha_ditet";
// echo $query;
// 	$hours = array("8:00-9:00","9:00-10:00","10:00-11:00", "11:00-12:00", "12:00-13:00","13:00-14:00","14:00-15:00", "15:00-16:00","16:00-17:00", "17:00-18:00","18:00-19:00", "19:00-20:00");
// 	$days = array("E Hene","E Marte","E Merkure","E Enjte","E Premte");
// // echo $query;
	$orari = array();


	if ($result = $mysqli->query($query)) {

		$oraret = $dom->createElement('oraret');
		$oraret->setAttribute('ora',  $result->fetch_assoc()["ora"]);

		while ($row = $result->fetch_assoc()) {
			array_push($orari, $row);
			$orariXml = createXMLfile($orari, $dom);
			$oraret->appendChild($orariXml);
		}


	}

	$root->appendChild($oraret);
}
$dom->appendChild($root); 
$dom->save($filePath); 

$mysqli->close();


function createXMLfile($orari, $dom){




	for($i=0; $i < count($orari); $i++){

		$id        =  $orari[$i]['id'];  
		$dega     =   htmlspecialchars($orari[$i]['dega']);
		$viti    =  $orari[$i]['viti']; 
		$paraleli    =  $orari[$i]['paraleli']; 
		$lenda    =  $orari[$i]['lenda']; 
		$tipi    =  $orari[$i]['tipi']; 
		$pedagog    =  $orari[$i]['pedagog'];
		$dita    =  $orari[$i]['dita'];
		$klasa    =  $orari[$i]['klasa']; 
		$ora    =  $orari[$i]['ora']; 

		$orariXml = $dom->createElement("orari");

		$orariXml->setAttribute("dita", $orari[$i]['dita']);


		$dega     = $dom->createElement('dega', $dega); 
		$orariXml->appendChild($dega); 
		$viti     = $dom->createElement('viti', $viti); 
		$orariXml->appendChild($viti); 
		$paraleli     = $dom->createElement('paraleli', $paraleli); 
		$orariXml->appendChild($paraleli); 
		$lenda     = $dom->createElement('lenda', $lenda); 
		$orariXml->appendChild($lenda); 
		$tipi     = $dom->createElement('tipi', $tipi); 
		$orariXml->appendChild($tipi); 
		$pedagog     = $dom->createElement('pedagog', $pedagog); 
		$orariXml->appendChild($pedagog); 
		$dita     = $dom->createElement('dita', $dita); 
		$orariXml->appendChild($dita); 
		$klasa     = $dom->createElement('klasa', $klasa); 
		$orariXml->appendChild($klasa); 
		$ora     = $dom->createElement('ora', $ora); 
		$orariXml->appendChild($ora); 



	}

	return $orariXml;


} 

header('Location: http://localhost/Orari/orariXml.xml');
?>