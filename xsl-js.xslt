<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt">

 <msxsl:script language="JScript">
   
	
	$( document ).ready(function(){
		
		let xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {

			if (this.readyState == 4 && this.status == 200) {
				getDegree(this);
			}
		};
			xhttp.open("GET", "orariXml.xml", true);
			xhttp.send();
		// console.log(xhttp.responseXML);
	});
	

	function getDegree(xml){
		
		let xmlDoc = xml.responseXML;
		let degree = xmlDoc.getElementsByTagName("dega");
		let unique_degree = [];


		for(let i = 0; i <degree.length; i++ ){
			// console.log(degree[i].childNodes[0].nodeValue )
			if(degree[i].childNodes[0] != null){
				
				if(unique_degree.indexOf(degree[i].childNodes[0].nodeValue) == -1){

		            unique_degree.push(degree[i].childNodes[0].nodeValue);
		    	}
	    	}
		}

		$('#degree').empty();
		$('#degree').append($('<option></option>').val("").html("Zgjidh programin"));
		$.each(unique_degree.sort(), function(i, p) {

		    $('#degree').append($('<option></option>').val(p).html(p));
		});
	}

	function showYears(){

		let xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {

			if (this.readyState == 4 && this.status == 200) {
				getYear(this);
			}
		};
			xhttp.open("GET", "orariXml.xml", true);
			xhttp.send();

	}

		
	function getYear(xml){

		let xmlDoc = xml.responseXML;
		let year = xmlDoc.getElementsByTagName("orari");
		let unique_year = [];

		let dega = document.getElementById("degree");
		let selected = dega.options[dega.selectedIndex].value;
		
		for(let i = 0; i <year.length; i++ ){

			if(year[i].getElementsByTagName("dega")[0].childNodes[0] != null){
				if(year[i].getElementsByTagName("dega")[0].childNodes[0].nodeValue == selected){

					if(unique_year.indexOf(year[i].getElementsByTagName("viti")[0].childNodes[0].nodeValue) == -1){
		            	unique_year.push(year[i].getElementsByTagName("viti")[0].childNodes[0].nodeValue);

		    		}
				}
			}	
		}

		$('#year').empty();
		$('#year').append($('<option></option>').val("").html("Zgjidh vitin"));
		$.each(unique_year.sort(), function(i, p) {

		    $('#year').append($('<option></option>').val(p).html(p));
		});

		console.log(unique_year.sort());
	}

	function showParalel(){

		let xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {

			if (this.readyState == 4 && this.status == 200) {
				getParalel(this);
			}
		};
			xhttp.open("GET", "orariXml.xml", true);
			xhttp.send();

	}

		
	function getParalel(xml){

		let xmlDoc = xml.responseXML;
		let year = xmlDoc.getElementsByTagName("orari");
		let unique_year = [];

		let dega = document.getElementById("degree");
		let selected = dega.options[dega.selectedIndex].value;
		console.log(selected);
		
		for(let i = 0; i <year.length; i++ ){

			if(year[i].getElementsByTagName("dega")[0].childNodes[0] != null){
				if(year[i].getElementsByTagName("dega")[0].childNodes[0].nodeValue == selected){

					if(unique_year.indexOf(year[i].getElementsByTagName("paraleli")[0].childNodes[0].nodeValue) == -1){
		            	unique_year.push(year[i].getElementsByTagName("paraleli")[0].childNodes[0].nodeValue);

		    		}
				}
			}	
		}

		$('#paraleli').empty();
		$('#paraleli').append($('<option></option>').val("").html("Zgjidh paralelin"));
		$.each(unique_year.sort(), function(i, p) {

		    $('#paraleli').append($('<option></option>').val(p).html(p));
		});

		console.log(unique_year.sort());
	}

	function orari(){
		
		let dega = document.getElementById("degree");
		let selected = dega.options[dega.selectedIndex].value;
		let viti = document.getElementById("year");
		let selectedYear = viti.options[viti.selectedIndex].value;
		let paraleli = document.getElementById("paraleli");
		let selectedParalel = paraleli.options[paraleli.selectedIndex].value;
		alert(selected + "_" + selectedYear + "_" + selectedParalel)
		let xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {

			if (this.readyState == 4 && this.status == 200) {
				
			}
		};
			xhttp.open("GET", "orariXml.xml", true);
			xhttp.send();
		
	}

 </msxsl:script>
</xsl:stylesheet>