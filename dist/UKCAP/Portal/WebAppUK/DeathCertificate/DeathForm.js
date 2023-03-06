$(document).ready(function () {
    GetState();
    //GetUKDistrict();
    
    $('#NoOfDaysTillDeath').val('');
    $('#DateOfDeath').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '-1d',
        yearRange: "-150:+0",
        onSelect: function (date) {
        
            GetAge();
           
        }
    });
});

function getdays() {
   
    var fullDate = new Date();
    var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);

    var date1 = $("#DateOfDeath").val();
    var date2 = fullDate.getDate() + "/" + twoDigitMonth + "/" + fullDate.getFullYear();
    //var date1 = '01/01/2011';
    //var date2 = '01/01/2012';


    date1 = date1.split('/');
    date2 = date2.split('/');
    date1 = new Date(date1[2], date1[1], date1[0]);
    date2 = new Date(date2[2], date2[1], date2[0]);
    date1_unixtime = parseInt(date1.getTime() / 1000);
    date2_unixtime = parseInt(date2.getTime() / 1000);
    var timeDifference = date2_unixtime - date1_unixtime;
    var timeDifferenceInHours = timeDifference / 60 / 60;
    var timeDifferenceInDays = timeDifferenceInHours / 24;
    $('#NoOfDaysTillDeath').val(Math.floor(timeDifferenceInDays));
}
function GetAge() {
    getdays();
    var t_DOB = $("#DateOfBirth").val();
    var t_DOD = $("#DateOfDeath").val();
    if (t_DOB != "" && t_DOB != null) {
        var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
        var selectedYear = S_date.getFullYear();
        var Age = AgeCalculate(t_DOB);
        $('#Age').val(Age);

        var fullDate = new Date();
        var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);
        var currentDate = fullDate.getDate() + "/" + twoDigitMonth + "/" + fullDate.getFullYear();

        var TotalAge = calcExSerDur(t_DOB, t_DOD);
        $('#Age').val(TotalAge.years);

    }
}
function getQueryStrings() {
    var assoc = {};
    var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
    var queryString = location.search.substring(1);
    var keyValues = queryString.split('&');

    for (var i in keyValues) {
        var key = keyValues[i].split('=');
        if (key.length > 1) {
            assoc[decode(key[0])] = decode(key[1]);
        }
    }
    return assoc;
}

function ReturnSubmit() {
    var qs = getQueryStrings();
    var uid = qs["UID"];
    window.location = '/WebApp/Citizen/Forms/Dashboard.aspx?UID=' + uid;
}

function SubmitData() {

    if (!ValidateDeathCertificate()) {
        return;
    }

    var temp = "Mohan";
    var AppID = "";
    var result = false;

    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];
    //var dpt = qs["DPT"];
    //var dist = qs["DIST"];
    //var blk = qs["BLK"];
    //var pan = qs["PAN"];
    //var ofc = qs["OFC"];
    //var ofr = qs["OFR"];
    
    var datavar = {
        'AadhaarNumber': uid,
        'SvcID': svcid,
        'Name': $('#txtName').val(),
        'FatherName': $('#FatherName').val(),
        'MotherName': $('#MotherName').val(),

        'Gender': $('#ddlGender').val(),
        'Religion': $('#Religion').val(),
        'DOB': $('#DateOfBirth').val(),
        'DateOfDeath': $('#DateOfDeath').val(),
        'Age': $('#Age').val(),

        'PlaceOfDeath': $('#PlaceOfDeath').val(),
        'Nationality': $('#Nationality').val(),
        'NoOfDaysTillDeath': $('#NoOfDaysTillDeath').val(),
        'CauseOfDeath': $('#CauseOfDeath').val(),
        'DllDeathAutority': $('#DllDeathAutority').val(),

        'KindOfTharapy': $('#KindOfTharapy').val(),
        'BRelationWithDesease': $('#RelationWithDesease').val(),
        'BLocationType':  $("#ddllocationtype").val(),
        'BAddressOfCareOf': $('#Addressline1').val(),
        'BAddressBuilding': $('#Addressline2').val(),

        'BState': $('#ddlstate').val(),
        'BDistrict': $('#ddldistrict').val(),
        'BlockTalukaSubDistrict': $('#ddlblock').val(),
        'BGramPanchayat': $('#ddlpanchayat').val(),
        'PinCode': $('#pincode').val(),
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": JSON.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebAppUK/DeathCertificate/DeathForm.aspx/DeathCertificate',
            data: JSON.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                result = false;
                alert("5." + a.responseText);
            }
        })
        ).then(function (data, textStatus, jqXHR) {

            var obj = jQuery.parseJSON(data.d);
            var html = "";
            AppID = obj.AppID;
            result = true;

            if (result /*&& jqXHRData_IMG_result*/) {
                alert("Application submitted successfully. Reference ID : " + obj.AppID + " Please attach necessary document.");
                window.location.href = '/WebApp/Kiosk/Forms/AttachmentV2.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID + '&UID=' + uid;
            }

        });// end of Then function of main Data Insert Function

    return false;
}

function ValidateDeathCertificate() {

    var text = "";
    var opt = "";

    var txtName = $('#txtName').val();
    var FatherName = $('#FatherName').val();
    var MotherName = $('#MotherName').val();
    var Religion = $('#Religion').val();
    var DateOfBirth = $('#DateOfBirth').val();
    var DateOfDeath = $('#DateOfDeath').val();
    var Age = $('#Age').val();
    var BNationality = $('#Nationality').val();
    var PlaceOfDeath = $('#PlaceOfDeath').val();
    var NoOfDaysTillDeath = $('#NoOfDaysTillDeath').val();
    var CauseOfDeath = $('#CauseOfDeath').val();
    var DllDeathAutority = $("#DllDeathAutority option:selected").val();
    var KindOfTharapy = $('#KindOfTharapy').val();
    var BName = $('#BName').val();
    var BRelationWithDesease = $('#RelationWithDesease').val();
    var BMobile = $('#BMobile').val();
    var Bemail = $('#Bemail').val();
    var ddllocationtype = $("#ddllocationtype option:selected").val()
    var Addressline1 = $('#Addressline1').val();
    var Addressline2 = $('#Addressline2').val();
    var ddlstate = $("#ddlstate option:selected").val();
    var ddldistrict = $("#ddldistrict option:selected").val();
    var ddlblock = $("#ddlblock option:selected").val();
    var ddlpanchayat = $("#ddlpanchayat option:selected").val();
    var ddlmuncipality = $("#ddlmuncipality option:selected").val();
    var pincode = $('#pincode').val();

    if (txtName == null || txtName == "") {
        text += "<br />-Please Enter Full Name of Deceased. ";
        $('#txtName').attr('style', 'border:1px solid red !important;');
        $('#txtName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtName').attr('style', 'border:1px solid #ddd !important;');
        $('#txtName').css({ "background-color": "#ffffff" });
    }


    if (FatherName == null || FatherName == "") {
        text += "<br />-Please Enter Father/Husband Name. ";
        $('#FatherName').attr('style', 'border:1px solid red !important;');
        $('#FatherName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#FatherName').attr('style', 'border:1px solid #ddd !important;');
        $('#FatherName').css({ "background-color": "#ffffff" });
    }
    if (MotherName == null || MotherName == "") {
        text += "<br />-Please Enter Mother Name. ";
        $('#MotherName').attr('style', 'border:1px solid red !important;');
        $('#MotherName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#MotherName').attr('style', 'border:1px solid #ddd !important;');
        $('#MotherName').css({ "background-color": "#ffffff" });
    }

    if ($('#ddlGender').val() == "select" || $('#ddlGender').val() == "0") {
        text += "<br />-Please Select  Gender.";
        $('#ddlGender').attr('style', 'border:1px solid red !important;');
        $('#ddlGender').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlGender').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlGender').css({ "background-color": "#ffffff" });
    }

    if (Religion == "Select" || Religion == "0") {
        text += "<br />-Please Select  Religion.";
        $('#Religion').attr('style', 'border:1px solid red !important;');
        $('#Religion').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#Religion').attr('style', 'border:1px solid #ddd !important;');
        $('#Religion').css({ "background-color": "#ffffff" });
    }

    if (DateOfBirth == null || DateOfBirth == "") {
        text += "<br />-Please Enter Date Of Birth. ";
        $('#DateOfBirth').attr('style', 'border:1px solid red !important;');
        $('#DateOfBirth').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#DateOfBirth').attr('style', 'border:1px solid #ddd !important;');
        $('#DateOfBirth').css({ "background-color": "#ffffff" });
    }

    if (DateOfDeath == null || DateOfDeath == "") {
        text += "<br />-Please Enter Date Of Death. ";
        $('#DateOfDeath').attr('style', 'border:1px solid red !important;');
        $('#DateOfDeath').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#DateOfDeath').attr('style', 'border:1px solid #ddd !important;');
        $('#DateOfDeath').css({ "background-color": "#ffffff" });
    }

    //if (Age == null || Age == "") {
    //    text += "<br /> Please Enter Age ";
    //    $('#Age').attr('style', 'border:1px solid red !important;');
    //    $('#Age').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#Age').attr('style', 'border:1px solid #ddd !important;');
    //    $('#Age').css({ "background-color": "#ffffff" });
    //}


    if (BNationality == "Select" || BNationality == "0") {
        text += "<br />-Please Select  Nationality.";
        $('#Nationality').attr('style', 'border:1px solid red !important;');
        $('#Nationality').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#Nationality').attr('style', 'border:1px solid #ddd !important;');
        $('#Nationality').css({ "background-color": "#ffffff" });
    }

    if (PlaceOfDeath == null || PlaceOfDeath == "") {
        text += "<br />-Please Enter Place Of Death. ";
        $('#PlaceOfDeath').attr('style', 'border:1px solid red !important;');
        $('#PlaceOfDeath').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#PlaceOfDeath').attr('style', 'border:1px solid #ddd !important;');
        $('#PlaceOfDeath').css({ "background-color": "#ffffff" });
    }

    //if (NoOfDaysTillDeath == null || NoOfDaysTillDeath == "") {
    //    text += "<br /> Please Enter No. Of Days Till Death ";
    //    $('#NoOfDaysTillDeath').attr('style', 'border:1px solid red !important;');
    //    $('#NoOfDaysTillDeath').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#NoOfDaysTillDeath').attr('style', 'border:1px solid #ddd !important;');
    //    $('#NoOfDaysTillDeath').css({ "background-color": "#ffffff" });
    //}

    if (CauseOfDeath == null || CauseOfDeath == "") {
        text += "<br />-Please Enter Cause Of Death. ";
        $('#CauseOfDeath').attr('style', 'border:1px solid red !important;');
        $('#CauseOfDeath').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#CauseOfDeath').attr('style', 'border:1px solid #ddd !important;');
        $('#CauseOfDeath').css({ "background-color": "#ffffff" });
    }

    if (DllDeathAutority == "Select" || DllDeathAutority == "0") {
        text += "<br />-Please Select Death Autority.";
        $('#DllDeathAutority').attr('style', 'border:1px solid red !important;');
        $('#DllDeathAutority').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#DllDeathAutority').attr('style', 'border:1px solid #ddd !important;');
        $('#DllDeathAutority').css({ "background-color": "#ffffff" });
    }
    if (KindOfTharapy == null || KindOfTharapy == "") {
        text += "<br />-Please Enter Kind Of Tharapy. ";
        $('#KindOfTharapy').attr('style', 'border:1px solid red !important;');
        $('#KindOfTharapy').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#KindOfTharapy').attr('style', 'border:1px solid #ddd !important;');
        $('#KindOfTharapy').css({ "background-color": "#ffffff" });
    }

    if (BRelationWithDesease == null || BRelationWithDesease == "") {
        text += "<br />-Please Enter Beneficiary Relation with Desease. ";
        $('#RelationWithDesease').attr('style', 'border:1px solid red !important;');
        $('#RelationWithDesease').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#RelationWithDesease').attr('style', 'border:1px solid #ddd !important;');
        $('#RelationWithDesease').css({ "background-color": "#ffffff" });
    }

    //if (ddllocationtype == "Select" || ddllocationtype == "0") {
    //    text += "<br /> Please Select location type.";
    //    $('#ddllocationtype').attr('style', 'border:1px solid red !important;');
    //    $('#ddllocationtype').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //}
    //else {
    //    $('#ddllocationtype').attr('style', 'border:1px solid #ddd !important;');
    //    $('#ddllocationtype').css({ "background-color": "#ffffff" });
    //}

    if (Addressline1 == null || Addressline1 == "") {
        text += "<br />-Please Enter Beneficiary Address line1. ";
        $('#Addressline1').attr('style', 'border:1px solid red !important;');
        $('#Addressline1').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#Addressline1').attr('style', 'border:1px solid #ddd !important;');
        $('#Addressline1').css({ "background-color": "#ffffff" });
    }
    if (Addressline2 == null || Addressline2 == "") {
        text += "<br />-Please Enter Beneficiary Address line2. ";
        $('#Addressline2').attr('style', 'border:1px solid red !important;');
        $('#Addressline2').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#Addressline2').attr('style', 'border:1px solid #ddd !important;');
        $('#Addressline2').css({ "background-color": "#ffffff" });
    }


    if (ddlstate == "-Select State-" || ddlstate == "0") {
        text += "<br />-Please Select State.";
        $('#ddlstate').attr('style', 'border:1px solid red !important;');
        $('#ddlstate').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlstate').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlstate').css({ "background-color": "#ffffff" });
    }
    if (ddldistrict == "-Select District-" || ddldistrict == "0") {
        text += "<br />-Please Select District.";
        $('#ddldistrict').attr('style', 'border:1px solid red !important;');
        $('#ddldistrict').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddldistrict').attr('style', 'border:1px solid #ddd !important;');
        $('#ddldistrict').css({ "background-color": "#ffffff" });
    }

    if (ddlblock == "-Select Taluka-" || ddlblock == "0") {
        text += "<br />-Please Select Block.";
        $('#ddlblock').attr('style', 'border:1px solid red !important;');
        $('#ddlblock').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlblock').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlblock').css({ "background-color": "#ffffff" });
    }

    if (ddlpanchayat == "-Select Panchayat-" || ddlpanchayat == "0") {
        text += "<br />-Please Select Panchayat.";
        $('#ddlpanchayat').attr('style', 'border:1px solid red !important;');
        $('#ddlpanchayat').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlpanchayat').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlpanchayat').css({ "background-color": "#ffffff" });
    }

    //if (ddlmuncipality == "Select" || ddlmuncipality == "0") {
    //    text += "<br /> Please Select  muncipality.";
    //    $('#ddlmuncipality').attr('style', 'border:1px solid red !important;');
    //    $('#ddlmuncipality').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //}
    //else {
    //    $('#ddlmuncipality').attr('style', 'border:1px solid #ddd !important;');
    //    $('#ddlmuncipality').css({ "background-color": "#ffffff" });
    //}

    if (pincode == null || pincode == "") {
        text += "<br />-Please Enter Pincode. ";
        $('#pincode').attr('style', 'border:1px solid red !important;');
        $('#pincode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#pincode').attr('style', 'border:1px solid #ddd !important;');
        $('#pincode').css({ "background-color": "#ffffff" });
    }

    if (opt == "1") {
        alertPopup("Please Fill The Following Information.", text);
        return false;
    }
    return true;
}

function AlphaNumeric(e) {
    var regex = new RegExp("[ A-Za-z0-9]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}



function ValidateAlpha(evt) {
    //var Name = $('#AccountHolder').val();
    //var charCode;
    var e = evt; // for trans-browser compatibility
    Name = (e.which) ? e.which : event.keyCode;
    //charCode = (evt.which) ? evt.which : event.keyCode;
    if (Name >= 97 && Name <= 122 || Name >= 65 && Name <= 90 || Name == 8 || Name == 32) {
        return true;
    }
    else {
        return false;
    }
}

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

function checkmobile() {
    var text = "";
    var opt = "";
    var mobileno = $("#BMobile").val();
    if (mobileno != null) {
        if (isNaN(mobileno) || mobileno.indexOf(" ") != -1) {
            text += "<br /> Please Enter A Valid Mobile Number.";
            opt = 1;
        }
        if (mobileno.length > 10 || mobileno.length < 10) {
            text += "<br /> Mobile No. Should Be Atleast 10 Digit.";
            opt = 1;
        }
        if (!(mobileno.charAt(0) == "9" || mobileno.charAt(0) == "8" || mobileno.charAt(0) == "7")) {
            text += "<br /> Mobile No. Should Start With 9 ,8 or 7.";
            opt = 1;
        }
    }
    if (opt == "1") {
        alertPopup("Please Fill The Following Information.", text);
        $("#BMobile").val("");

        return false;
    }
    return true;
}

function email() {
    var emailid = document.getElementById('Bemail').value;
    var reg = /[a-zA-Z0-9\.\-]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
    if (emailid.match(reg)) {
        $('#Bemail').attr('style', 'border:1px solid #ddd !important;');
        $('#Bemail').css({ "background-color": "#ffffff" });
    }
    else {
        alertPopup("Please Enter Email-ID.", "</BR> Please Enter A Valid Email-ID in Proper Format");
        $('#Bemail').attr('style', 'border:2px solid red !important;');
        $('#Bemail').val('');
    }
}

function checkpincode() {
    var text = "";
    var opt = "";
    var mobileno = $("#txtpincode").val();
    if (mobileno != null) {
        if (isNaN(mobileno) || mobileno.indexOf(" ") != -1) {
            text += "<br /> Please Enter A Valid Pincode.";
            //alertPopup("Mobile Number", "</BR> Please Enter Valid Mobile Number.");
            opt = 1;
        }
        if (mobileno.length > 6 || mobileno.length < 6) {
            text += "<br /> Pincode No. Should Be Atleast 6 Digit.";
            //alertPopup("Mobile Number", "</BR> Mobile No. Should Be 10 Digit.");
            opt = 1;
        }

    }
    if (opt == "1") {
        alertPopup("Please Fill The Following Information.", text);
        $("#txtpincode").val("");

        return false;
    }
    return true;
}



function GetState() {
    var SelState = $('#ddlstate').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/webapp/Registration/KioskRegistration.aspx/GetState",
        data: '{"prefix": ""}',
        dataType: "json",
        success: function (r) {
            var arr = eval(r.d);
            var ddlCustomers = $("[id*=ddlstate]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select State-</option>');
            $.each(arr, function () {
                $("[id*=ddlstate]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
       
            $('#ddlstate').val("5");
            GetUKDistrict();

        }
    });
}


function GetUKDistrict() {
    var SelState = $('#ddlstate').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
        data: '{"prefix":"","StateCode":"' + SelState + '"}',
        dataType: "json",
        success: function (r) {
            var arr = eval(r.d);
            var ddlCustomers = $("[id*=ddldistrict]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select District-</option>');
            $.each(arr, function () {
                $("[id*=ddldistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });

        }
    });
}


function GetUKBlock() {
    var SelBlock = $('#ddldistrict').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict",
        data: '{"prefix":"","DistrictCode":"' + SelBlock + '"}',
        dataType: "json",
        success: function (r) {
            var arr = eval(r.d);
            var ddlCustomers = $("[id*=ddlblock]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select Taluka-</option>');
            $.each(arr, function () {
                $("[id*=ddlblock]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });

        }
    });
}


function GetUKPanchayat() {
    var SelSubDistrict = $('#ddlblock').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Registration/KioskRegistration.aspx/GetVillage",
        data: '{"prefix":"","SubDistrictCode":"' + SelSubDistrict + '"}',
        dataType: "json",
        success: function (r) {
            var arr = eval(r.d);
            var ddlCustomers = $("[id*=ddlpanchayat]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select Panchayat-</option>');
            $.each(arr, function () {
                $("[id*=ddlpanchayat]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}





function PinCodeValidation() {
    var PinCode = $('#pincode').val();
    if (PinCode.length >= 6) {
        $('#pincode').attr('style', 'border:2px solid green !important;');
        $('#pincode').css({ "background-color": "#ffffff" });
        return true;
    }
    else {
        alertPopup("Pincode Validation", "<BR><BR> Please Enter 6 Digit Pincode.");
        $('#pincode').val('');
        $('#pincode').attr('style', 'border:2px solid red !important;');
        $('#pincode').css({ "background-color": "#fff2ee" });
        return false;
    }
}


var dat = new Date();
var curday = dat.getDate();
var curmon = dat.getMonth() + 1;
var curyear = dat.getFullYear();

function checkleapyear(datea) {

    datea.Date = new Date();
    if (datea.getyear() % 4 == 0) {
        if (datea.getyear() % 10 != 0) {
            return true;
        } else {
            if (datea.getyear() % 400 == 0)
                return true;
            else
                return false;
        }
    }
    return false;
}

function DaysInMonth(Y, M) {
    with (new Date(Y, M, 1, 12)) {
        setDate(0);
        return getDate();
    }
}

function datedif(date1, date2) {
    var y1 = date1.getFullYear(),
    m1 = date1.getMonth(),
    d1 = date1.getDate(),
    y2 = date2.getFullYear(),
    m2 = date2.getMonth(),
    d2 = date2.getDate();
    if (d1 < d2) {
        m1--;
        d1 += DaysInMonth(y2, m2);
    }
    if (m1 < m2) {
        y1--;
        m1 += 12;
    }
    return [y1 - y2, m1 - m2, d1 - d2];
}

function AgeCalculate(dob) {

    var D1 = dob.split('/');
    var calyear = D1[0];
    var calmon = D1[1];
    var calday = D1[2];

    var curd = new Date(curyear, curmon - 1, curday);
    var cald = new Date(calday, calmon - 1, calyear);
    var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) - Date.UTC(calday, calmon, calyear, 0, 0, 0);
    var dife = datedif(curd, cald);
    return dife[0];
}


function calcDobAge(dateTo) {
    var dateFrom = new Date();
    return calcYMDAge(dateFrom, dateTo);
}

function calcExSerDur(dateOld, dateNew) {

    if (dateOld == null) return false;
    if (dateOld == "") return false;

    if (dateNew == null) return false;
    if (dateNew == "") return false;

    var dateLatest = new Date(dateNew.substring(6, 10),
                    dateNew.substring(3, 5) - 1,
                    dateNew.substring(0, 2)
                  );
    return calcYMDAge(dateLatest, dateOld);
}

// Kindly Change javascript getYear to getFullYear as getYear is depricated
// first param is the most recent/ new date/ current date 
function calcYMDAge(dateFrom, dateTo) {
    var now = dateFrom;
    var today = new Date(now.getFullYear(), now.getMonth(), now.getDate());

    var yearNow = now.getFullYear();
    var monthNow = now.getMonth();
    var dateNow = now.getDate();

    var dob = new Date(dateTo.substring(6, 10),
                        dateTo.substring(3, 5) - 1,
                        dateTo.substring(0, 2)
                      );

    var yearDob = dob.getFullYear();
    var monthDob = dob.getMonth();
    var dateDob = dob.getDate();
    var age = {};
    var ageString = "";
    var yearString = "";
    var monthString = "";
    var dayString = "";


    yearAge = yearNow - yearDob;

    if (monthNow >= monthDob)
        var monthAge = monthNow - monthDob;
    else {
        yearAge--;
        var monthAge = 12 + monthNow - monthDob;
    }

    if (dateNow >= dateDob)
        var dateAge = dateNow - dateDob;
    else {
        monthAge--;
        var dateAge = 31 + dateNow - dateDob;

        if (monthAge < 0) {
            monthAge = 11;
            yearAge--;
        }
    }

    age = {
        years: yearAge,
        months: monthAge,
        days: dateAge
    };

    if (age.years > 1) yearString = " years";
    else yearString = " year";
    if (age.months > 1) monthString = " months";
    else monthString = " month";
    if (age.days > 1) dayString = " days";
    else dayString = " day";


    if ((age.years > 0) && (age.months > 0) && (age.days > 0))
        ageString = age.years + yearString + ", " + age.months + monthString + ", and " + age.days + dayString + " old.";
    else if ((age.years == 0) && (age.months == 0) && (age.days > 0))
        ageString = "Only " + age.days + dayString + " old!";
    else if ((age.years > 0) && (age.months == 0) && (age.days == 0))
        ageString = age.years + yearString + " old. Happy Birthday!!";
    else if ((age.years > 0) && (age.months > 0) && (age.days == 0))
        ageString = age.years + yearString + " and " + age.months + monthString + " old.";
    else if ((age.years == 0) && (age.months > 0) && (age.days > 0))
        ageString = age.months + monthString + " and " + age.days + dayString + " old.";
    else if ((age.years > 0) && (age.months == 0) && (age.days > 0))
        ageString = age.years + yearString + " and " + age.days + dayString + " old.";
    else if ((age.years == 0) && (age.months > 0) && (age.days == 0))
        ageString = age.months + monthString + " old.";
    else ageString = "Oops! Could not calculate age!";

    return age;
}


function ValidateAlpha(evt) {
    //var Name = $('#AccountHolder').val();
    //var charCode;
    var e = evt; // for trans-browser compatibility
    Name = (e.which) ? e.which : event.keyCode;
    //charCode = (evt.which) ? evt.which : event.keyCode;
    if (Name >= 97 && Name <= 122 || Name >= 65 && Name <= 90 || Name == 8 || Name == 32) {
        return true;
    }
    else {
        return false;
    }
}
function Alphanumericspecialchar(e) {
    debugger;
    var regex = new RegExp("[ A-Za-z0-9.()-/ ]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}