/*!
    * Start Bootstrap - SB Admin v6.0.0 (https://startbootstrap.com/templates/sb-admin)
    * Copyright 2013-2020 Start Bootstrap
    * Licensed under MIT (https://github.com/BlackrockDigital/startbootstrap-sb-admin/blob/master/LICENSE)
    */
    (function($) {
    "use strict";

    // Add active state to sidbar nav links
    var path = window.location.href; // because the 'href' property of the DOM element is the absolute path
        $("#layoutSidenav_nav .sb-sidenav a.nav-link").each(function() {
            if (this.href === path) {
                $(this).addClass("active");
            }
        });

    // Toggle the side navigation
    $("#sidebarToggle").on("click", function(e) {
        e.preventDefault();
        $("body").toggleClass("sb-sidenav-toggled");
    });
})(jQuery);

function addRow() {

	var table = document.getElementById("datatable");
	var tbody = table.getElementsByTagName("tbody")[0];

	var rowCount = table.tBodies[0].rows.length;
	var row = tbody.insertRow();
    
	

	var cell2 = row.insertCell(0);
	var element2 = document.createElement("input");
	element2.type = "text";
	element2.classList.add("form-control");
	element2.name="item["+rowCount+"]";
	element2.required=true;
	cell2.appendChild(element2);

	var cell3 = row.insertCell(1);
	var element3 = document.createElement("input");
	element3.type = "text";
	element3.classList.add("form-control");
	element3.name="quantity["+rowCount+"]";
	element3.required=true;
	cell3.appendChild(element3);

	var cell4 = row.insertCell(2);
	var element4 = document.createElement("select");
	element4.classList.add("form-control");
	element4.name="unit["+rowCount+"]";
	element4.required=true;
	var op = new Option();
	op.value = "select";
	op.text = "Select";
	element4.options.add(op); 
	cell4.appendChild(element4);
	var op = new Option();
	op.value = "pcs";
	op.text = "PCS";
	element4.options.add(op);
	cell4.appendChild(element4);
	var op = new Option();
	op.value = "set";
	op.text = "SET";
	element4.options.add(op);
	cell4.appendChild(element4);
	var op = new Option();
	op.value = "pair";
	op.text = "PAIR";
	element4.options.add(op);
	cell4.appendChild(element4);
	
	var cell5 = row.insertCell(3);
	var element5 = document.createElement("a");
	element5.classList.add("delete");
	element5.title="Delete";
	element5.name="delete["+rowCount+"]";
	element5.onclick = deleteRow;
	var element6 = document.createElement("i");
	element6.classList.add("material-icons");
	element6.innerHTML = "&#xE872;";
	//element6.classList.add("fa-delete");
	element5.appendChild(element6);
	cell5.appendChild(element5);
	
	document.getElementById("rowcount").value = tbody.rows.length;
}
function deleteRow(){
	var rowNumber = this.name.substr(6);
	var row = this.parentNode.parentNode;
	alert("Deleting Row");
	row.remove();
	var table = document.getElementById("datatable");
	var tbody = table.tBodies[0];
	
	for(var i = 0; i < tbody.rows.length; i++){
		var firstCol = tbody.rows[i].childNodes[0].childNodes[0];
		var secondCol = tbody.rows[i].childNodes[1].childNodes[0];
		var thirdCol = tbody.rows[i].childNodes[2].childNodes[0];
		var forthCol = tbody.rows[i].childNodes[3].childNodes[0];
		firstCol.name = "item["+i+"]";
		secondCol.name = "quantity["+i+"]";
		thirdCol.name = "unit["+i+"]";
		forthCol.name = "delete["+i+"]";
	}
	
	document.getElementById("rowcount").value = tbody.rows.length;
}


$("#SearchChallanData").change(function(e){
	alert("Test");
	var option = document.getElementById("SearchChallanData");
	var form = $("#SearchChallanForm");
	var url = form.attr('action');
	alert(option.selected);
	if(option != -1){
		$.ajax({
			type:"GET",
			url:url,
			data:form.serialize(),
			success: function(data){
				console.log(data);
				$('#ShowChallanModal').modal('show');
				document.getElementById("ShowChallanName").value=data.challan_name;
				document.getElementById('ShowChallanName').readOnly = true;
				alert("Data Count "+data.challan_data.length);
				for(var i=1;i<=data.challan_data.length;i++){
					
				}
			}
		});
	}else{
		alert("Select Valid Challan from Dropdown!");
	}
	
});

$("#NewChallanForm").submit(function(e){
	e.preventDefault();
	
	var form = $(this);
	var url = form.attr('action');
	
	$.ajax({
		type:"POST",
		url:url,
		data:form.serialize(),
		success: function(){
			$('#AddChallanModal').modal('hide');
			$('#ChallanSuccessModal').modal('show');
			document.getElementById("ShowChallanName").innerHTML
		}
	});
});

function loadDropDownData(){
	var url = "DropdownData";
	var method = "GET";
	$.ajax({  
        type: method,  
        url: url,  
        data: "{}",  
        success: function (data) {
        	var Challan_Data = data.Challan_Data;
            var s = '<option value="-1">Select a Challan</option>';  
            for (var i = 0; i < Challan_Data.length; i++) {  
                s += '<option value="' + Challan_Data[i].challanAlias + '">' + Challan_Data[i].challanName + '</option>';  
            }  
            $("#updateChallan").html(s); 
            $("#SearchChallanData").html(s); 
        }  
    });  
}
