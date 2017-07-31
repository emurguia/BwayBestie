/*
 *script to autofill user information into lottery forms
 */ 

 function fillLuckySeat(firstName, lastName, email, zipcode, age, ticketNumber){
	 	document.getElementById('firstname').value = firstName;
	 	document.getElementById('lastname').value = lastName;
	 	document.getElementById('email').value = email; 
	 	document.getElementById('zipcode').value = zipcode;
	 	document.getElementById('age').value = age;

	//set ticket number 
 	if(ticketNumber == 2){
 		document.getElementById('two_tickets').checked = true;
 	}else {
 		document.getElementById('one_ticket').checked = true;
 	}
 	

 	if numberTickets == '2'{document.getElementById('two_tickets').checked = true;} else{document.getElementById('one_ticket').checked = true;}
 }

//iframe 
function fillBroadwayDirect(firstName, lastName, email, zipcode, birthMonth, birthDate, birthYear, ticketNumber){
	var frame = document.querySelector('[id^='fancybox-frame']');
	var innerDoc = frame.contentDocument || frame.contentWindow.document;
	innerDoc.getElementById('dlslot_name_first').value = firstName;
	innerDoc.getElementById('dlslot_name_last').value = lastName;
	innerDoc.getElementById('dlslot_email').value = email;
	innerDoc.getElementById('dlslot_dob_month').value = birthMonth;
	innerDoc.getElementById('dlslot_dob_day').value = birthDate;
	innerDoc.getElementById('dlslot_dob_year').value = birthYear;
	innerDoc.getElementById('dlslot_zip').value = zipcode;

	//set ticket number 
	if(ticketNumber == 2){
		innerDoc.getElementById('dlslot_ticket_qty').options[2].selected = true;
	}else{
		innerDoc.getElementById('dlslot_ticket_qty').options[1].selected = true
	}
}

//no iframe 
function fillBroadwayDirect(firstName, lastName, email, zipcode, birthMonth, birthDate, birthYear, ticketNumber){
	
	document.getElementById('dlslot_name_first').value = firstName;
	document.getElementById('dlslot_name_last').value = lastName;
	document.getElementById('dlslot_email').value = email;
	document.getElementById('dlslot_dob_month').value = birthMonth;
	document.getElementById('dlslot_dob_day').value = birthDate;
	document.getElementById('dlslot_dob_year').value = birthYear;
	document.getElementById('dlslot_zip').value = zipcode;

	//set ticket number 
	if(ticketNumber == 2){
		document.getElementById('dlslot_ticket_qty').options[2].selected = true;
	}else{
		document.getElementById('dlslot_ticket_qty').options[1].selected = true
	}
}




