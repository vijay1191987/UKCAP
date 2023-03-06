

$(document).ready(function () {
    debugger;
   
    //Relative Details panel
    $("input[name='RelativeY']").on('change', function () {
        var Relative = $("input[name='RelativeY']:checked").val();
        if (Relative == "Yes") {
            $("#DivRelativeDetails").show(800);
        }
        else {
            $("#DivRelativeDetails").hide(800);
        }
    });
    //Medical details panel
    $("input[name='RBTNMedical']").on('change', function () {
        var Medical = $("input[name='RBTNMedical']:checked").val();
        if (Medical == "Yes") {
            $("#DivMedicalHistory").show(800);
        }
        else {
            $("#DivMedicalHistory").hide(800);
        }
    });

    debugger;
    var DistPS = $("#HDFDistrict").val();
    
    if (DistPS != "" && DistPS!="undefined")
    {
        if (DistPS == "61")
        {
            DistPS = "Dehradun";
        }
        else if (DistPS == "68")
        {
            DistPS = "Hardwar";
        }
        $('#PddlDistrict1 option:selected').text(DistPS),
        $("#PddlDistrict1").prop("disabled", true);

        GetDistrictPloiceStations();
       
    }
    EL("ApplicantImage").addEventListener("change", readFile, false);
    EL("ApplicantSign").addEventListener("change", readFile2, false);

    GetCitizenData();
    
});

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


function ParentBindProfile() {
    if ($("#HFUIDData").val() != "") {

        BindProfileV2($("#HFUIDData").val(), 0);//function to call with 1 in case of Citizen Profile Data
    }
}

function validateUID(UIDVal) {
    debugger;
    if (UIDVal == "1") {
        var UID = $("#UID").val();
        var length = UID.length;

        if ($("#UID").val() == "") {
            alert("Please enter Aadhaar UID number.");
            //$("#UID").focus();
            return false;
        }
        if (eval(length) < 12) {
            alert("Aadhaar UID should be 12 digit");
            $("#UID").val("");

            return false;
        }

    }
}


function openWindow(UIDVal, value, SessionName) {
    if (validateUID(UIDVal) != false) {

        //if (UIDVal == "1") {
        //code = UIDVal;
        //}

        //CheckLocalAadhar($("#UID").val());
        var UID = $("#UID").val();
        var EID = "0";
        var left = (screen.width / 2) - (560 / 2);
        var top = (screen.height / 2) - (400 / 2);

        window.open('/UID/Default.aspx?SvcID=424&aadhaarNumber=' + UID + '&kycTypesToUse=OTP', 'open_window',
        ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        window.focus();
    }
    return false;
}

function selectByVal(p_Control, txt) {
    var t_Value = txt;
    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }
    return t_Value;
}


function selectByTextAddress(p_Control, txt) {
    $("[id*=ddlState] option")
    .filter(function () { return $.trim($(this).text()) == txt; })
    .attr('selected', true);

    var t_Value = "";

    $("[id*=" + p_Control + "] option").prop('selected', false).filter(function () {
        return $(this).text().toLowerCase() == txt.toLowerCase();
        if ($(this).text().toLowerCase() == txt.toLowerCase()) {
            t_Value = $(this).val();
            return t_Value;
        }
    }).prop('selected', true);

    alert(t_Value);
    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }

    $("[id*=" + p_Control + "] option").each(function () {
        if ($(this).text() == theText) {
            //$(this).attr('selected', 'selected');
            t_Value = $(this).val();
        }
    });

    $("[id*=" + p_Control + "]").val(t_Value);

    return t_Value;
}


function selectByTextCitizen(p_Control, txt) {
    $("[id*=ddlState] option")
    .filter(function () { return $.trim($(this).text()) == txt; })
    .attr('selected', true);

    var t_Value = $("#" + txt + "").val();
    var t_Value = txt;
    $("[id*=" + p_Control + "] option").prop('selected', false).filter(function () {
        //return $(this).text().toLowerCase() == txt.toLowerCase();
        if ($(this).val().toLowerCase() == txt.toLowerCase()) {
            t_Value = $(this).val();
            return t_Value;
        }
    }).prop('selected', true);

    alert(t_Value);
    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }

    $("[id*=" + p_Control + "] option").each(function () {
        if ($(this).text() == theText) {
            //$(this).attr('selected', 'selected');
            t_Value = $(this).val();
        }
    });

    $("[id*=" + p_Control + "]").val(t_Value);

    return t_Value;
}


function MobileValidation(MobileNo) {
    var MobileVal = $("[id*=" + MobileNo + "]").val();
    var text = "";
    var opt = "";

    if (isNaN(MobileVal) || MobileVal.indexOf(" ") != -1) {
        text += "<br/>" + " \u002A" + " Please Enter A Valid Mobile Number.";
        //$("[id*=" + MobileNo + "]").attr('style', 'border:2px solid red !important;');
        //$("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (MobileVal.length > 10 || MobileVal.length < 10) {
        text += "<br/>" + " \u002A" + " Mobile No. Should Be Atleast 10 Digit.";
        //$("[id*=" + MobileNo + "]").attr('style', 'border:2px solid red !important;');
        //$("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (!(MobileVal.charAt(0) == "9" || MobileVal.charAt(0) == "8" || MobileVal.charAt(0) == "7")) {
        text += "<br/>" + " \u002A" + " Mobile No. Should Start With 9 ,8 or 7.";
        //$("[id*=" + MobileNo + "]").attr('style', 'border:2px solid red !important;');
        //$("[id*=" + MobileNo + "]").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        //$("[id*=" + MobileNo + "]").attr('style', 'border:2px solid green !important;');
        //$("[id*=" + MobileNo + "]").css({ "background-color": "#ffffff" });
        //return true;
    }

    if (opt == "1") {
        alertPopup("Mobile Information.", text);
        $("[id*=" + MobileNo + "]").val("");
        return false;
    }
}


function ValiateEmail() {
    var EmailID = $("#EmailID");
    if (EmailID.val() != '') {
        var emailmatch = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (!emailmatch.test(EmailID.val())) {
            $("#EmailID").val('');
            EmailID.attr('style', 'border:1px solid #d03100 !important;');
            EmailID.css({ "background-color": "#fff2ee" });
            alertPopup("Email Validation", "<BR>" + " \u002A" + " Please Enter EmailID In Proper Format.")
        }
    }
}
////validate senior citizen age
function ValiateSCAge(Ages) {
    debugger;
    var Age = Ages;
    if (Age != '') {
        if (Age < 60 || Age<=0) {
            $("#Year").val('');
            $("#Month").val('');
            $("#Day").val('');
            $("#DOB").val('');
            var dob = $("#DOB");

            //dob.attr('style', 'border:1px solid #d03100 !important;');
            //dob.css({ "background-color": "#fff2ee" });
            alertPopup("Age Validation", "<BR>" + " \u002A" + "For apply this service your age should be minimum 60 year.")
        }
       
    }
}


function PinCodeValidation(PinCode) {
    var PinCodeVal = $("[id*=" + PinCode + "]").val();
    if (PinCodeVal.length >= 6) {
        //$("[id*=" + PinCode + "]").attr('style', 'border:2px solid green !important;');
        //$("[id*=" + PinCode + "]").css({ "background-color": "#ffffff" });
        return true;
    }
    else {
        alertPopup("Pincode Validation", "<BR>" + " \u002A" + " Please Enter 6 Digit Pincode.");
        $("[id*=" + PinCode + "]").val('');
        //$("[id*=" + PinCode + "]").attr('style', 'border:2px solid red !important;');
        //$("[id*=" + PinCode + "]").css({ "background-color": "#fff2ee" });
        return false;
    }
}


function isNumberKeyDecimal(e) {
    var code = (code ? code : e.which);
    if (code != 46 && code > 31 && (code < 48 || code > 57))
        return false;
        //if it is (.)
    else if (code == 46) {
        var Value = $('#txtTotalMarks').val();//this.value;
        //if value already contains (.) character
        if (Value.indexOf('.') != -1) {
            var splt = Value.split('.');
            //if there is already(.) char then return false
            if (splt.length >= 2)
                return false;
        }
    }
    return true;
}


function EL(id) {
    return document.getElementById(id);
} // Get el by ID helper function


function readFile() {

    if (this.files && this.files[0]) {

        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfPhoto').val(sizekb);
        if (sizekb < 10 || sizekb > 50) {
            // $('#imgupload').attr('src', null);
            alert('The size of the photograph should fall between 20KB to 50KB. Your Photo Size is ' + sizekb + 'kb.');
            return false;
        }
        var ftype = this;
        var fileupload = ftype.value;
        if (fileupload == '') {
            alert("Photograph only allows file types of PNG, JPG, JPEG. ");
            return;
        }
        else {
            var Extension = fileupload.substring(fileupload.indexOf('.') + 1);
            if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
            }
            else {
                alert("Photograph only allows file types of PNG, JPG, JPEG. ");
                return;
            }
        }

        var FR = new FileReader();
        FR.onload = function (e) {
            EL("myImg").src = e.target.result;
            EL("HFb64").value = e.target.result;
        };
        FR.readAsDataURL(this.files[0]);
    }
}


function readFile2() {

    if (this.files && this.files[0]) {

        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfSign').val(sizekb);
        if (sizekb < 5 || sizekb > 20) {
            // $('#imgupload').attr('src', null);
            alert('The size of the signature should fall between 10KB to 20KB. Your signature Size is ' + sizekb + 'kb.');
            return false;
        }

        var ftype = this; //document.getElementById('File1');
        var fileupload = ftype.value;
        if (fileupload == '') {
            alert("Signature only allows file types of PNG, JPG, JPEG. ");
            return;
        }
        else {
            var Extension = fileupload.substring(fileupload.indexOf('.') + 1);
            if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
            }
            else {
                alert("Signature only allows file types of PNG, JPG, JPEG. ");
                return;
            }
        }

        var FR = new FileReader();
        FR.onload = function (e) {
            EL("mySign").src = e.target.result;
            EL("HFb64Sign").value = e.target.result;
        };
        FR.readAsDataURL(this.files[0]);
    }
}


function SubmitData() {
    debugger;
    if (!ValidateForm()) {
        return false;
    }

    //$("#btnSubmit").prop('disabled', true);

    var t_Message = "";
    var result = false;

    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];
    var dpt = qs["DPT"];
    var dist = qs["DIST"];
    var blk = qs["BLK"];
    var pan = qs["PAN"];
    var ofc = qs["OFC"];
    var ofr = qs["OFR"];

    var DOB = $("#DOB");

    if (DOB.val() != '') {
        var todaydate = $.datepicker.formatDate('dd/mm/yy', new Date());
        var txtDOB = DOB.val();
        var dateDOB = new Date(txtDOB.substr(6, 4), txtDOB.substr(3, 2) - 1, txtDOB.substr(0, 2));
        var Age = calcExSerDur(txtDOB, todaydate);
        var ageToCompare = Age.years;
        var ageActual = Age.years;
    }

    var temp = "Gunwant";
    var AppID = "";
    var rtnurl = "";

    var ResponseType = "C";

    if ($("#HFUIDData").val() != "") {
        ResponseType = "";
    }

    var result = false;
    var DOBArr = $('#DOB').val().split("/");
    var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

    //var BloodGroup = 'No';
    //if ($('#BloodGroup').is(":checked")) {
    //    BloodGroup = 'Yes';
    //}

    var Arthritis = 'No';
    if ($('#Arthritis').is(":checked")) {
        Arthritis = 'Yes';
    }

    var HeartDisease = 'No';
    if ($('#HeartDisease').is(":checked")) {
        HeartDisease = 'Yes';
    }

    var Cancer = 'No';
    if ($('#Cancer').is(":checked")) {
        Cancer = 'Yes';
    }

    var RespiratoryDiseases = 'No';
    if ($('#RespiratoryDiseases').is(":checked")) {
        RespiratoryDiseases = 'Yes';
    }

    var AlzheimerDisease = 'No';
    if ($('#AlzheimerDisease').is(":checked")) {
        AlzheimerDisease = 'Yes';
    }

    var Osteoporosis = 'No';
    if ($('#Osteoporosis').is(":checked")) {
        Osteoporosis = 'Yes';
    }

    var Diabetes = 'No';
    if ($('#Diabetes').is(":checked")) {
        Diabetes = 'Yes';
    }

    var InfluenzaPneumonia = 'No';
    if ($('#InfluenzaPneumonia').is(":checked")) {
        InfluenzaPneumonia = 'Yes';
    }

    var Others = 'No';
    if ($('#Others').is(":checked")) {
        Others = 'Yes';
    }
    var hdfSptSave="";
    if ($('#hdfSuspectSave').val()==null){
        hdfSptSave="";
    }
    else {
        hdfSptSave=$('#hdfSuspectSave').val();
    }
    var hdfSuspectSS="";
    if ($('#hdfSuspectSaveS').val()==null){
        hdfSuspectSS="";
    }
    else {
        hdfSuspectSS=$('#hdfSuspectSaveS').val();
    }
    debugger;
    var datavar = {

        'ProfileID': uid,
        'AadhaarNumber': uid,//$('#UID').val(),
        'AadhaarDetail': $('#ddlSearch option:selected').text(),
        'AppMobileNo': $('#txtMobile').val(),
        'PSDistrict': $('#PddlDistrict1 option:selected').text(),
        'DPoliceStation': $('#Pddlps option:selected').text(),
        'PoliceStation': '',//$('#PoliceStationName').val(),
        'AppName': $('#FirstName').val(),
        'DOB': DOBConverted,
        'Year': $('#Year').val(),
        'Month': $('#Month').val(),
        'Day': $('#Day').val(),
        'Gender': $('#ddlGender').val(),
        'Nationality': $('#Nationality').val(),
        'MobileNo': $('#MobileNo').val(),
        'EmailId': $('#EmailID').val(),
        'SpouseName': $('#SpouseName').val(),
        'RelativeSameCity': $("input[name='RelativeY']:checked").val(),
        'MedicalHistory': $("input[name='RBTNMedical']:checked").val(),

        'BloodGroup': $('#ddlBloodGroup option:selected').text(),
        'Arthritis': Arthritis,
        'HeartDisease': HeartDisease,
        'Cancer': Cancer,
        'RespiratoryDiseases': RespiratoryDiseases,
        'AlzheimerDiseases': AlzheimerDisease,
        'Osteoporosis': Osteoporosis,
        'Diabetes': Diabetes,
        'InfluenzaPheumonia': InfluenzaPneumonia,
        'Others': Others,
        'DescribeOther': $('#OtherDisease').val(),
        'DoctorName': $('#FamilyDoctorName').val(),
        'DoctorMobileNo': $('#FamilyDoctorNo').val(),
        'DoctorAddress': $('#FamilyDoctorAddress').val(),
        'DoctorPinCode': $('#FamilyDoctorPincode').val(),

        'residentName': $('#FirstName').val(),
        'residentNameLocal': $('#FirstName').val(),

        'Image': $('#HFb64').val(),
        'ImageSign': $('#HFb64Sign').val(),
        
        'JSONData': '',
        'statecode': $('#CddlState').val(),
        'districtcode': $('#CddlDistrict').val(),
        'subDistrictcode': $('#CddlTaluka').val(),
        'Villagecode': $('#CddlVillage').val(),

        'MotherName': $('#txtMotherName').val(),
        'FatherName': $('#txtFatherName').val(),
        'Religion': $('#ddlReligion option:selected').text(),
        'Category':$('#ddlCategory option:selected').text(),
        'LandLineNo': $('#txtlandlineno').val(),
        'ResponseType': ResponseType,

        'HeirsDXML': hdfSptSave,//document.getElementById("hdfSuspectSave").value,
        'HeirsDXMLS': hdfSuspectSS,//document.getElementById("hdfSuspectSaveS").value,
       
        'department': dpt,
        'district': dist,
        'block': blk,
        'panchayat': pan,
        'office': ofc,
        'officer': ofr,
        'SpouseOrFather':$("input[name='FOrS']:checked").val(),
    };
    debugger;

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };
    $("#progressbar").show();
    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/RD/CitizenForm.aspx/InsertSeniorCitizenData',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) {
                debugger;
            },
            error: function (a, b, c) {
                $("#progressbar").hide();
                $("#btnSubmit").prop('disabled', false);
                result = false;
                alertPopup("Could Not Save the Application, Please try again.", "5. " + a.responseText);
            }
        })
        ).then(function (data, textStatus, jqXHR) {
            debugger;
            var obj = jQuery.parseJSON(data.d);
            var html = "";
            var status = obj.Status;
            var AadhaarNo = obj.AadhaarNo;
            var CardNo = obj.CardNo;
            var Dist = obj.District;
            var PS = obj.PoliceStation;

            AppID = obj.AppID;
            result = true;
            if (AppID == "" || AppID == null) {
                alertPopup("Form Validation Failed", "Error While Saving Application., <BR> Either You Have Used MobileNumber or AadhaarNumber Which Has Been Used Earlier.");
                //rtnurl = "/Account/Login";
                //window.location.href = rtnurl;
                //return;
            }
            else {
                if (status == "Success") {
                    $("#progressbar").hide();
                    alertPopup("Senior Citizen RD", "Application saved successfully. Reference ID : " + obj.AppID );//+ " Please Make Payment against the Application Number."
                    window.location.href = '/WebApp/Kiosk/Forms/AttachmentV2.aspx?SvcID=424&AppID=' + obj.AppID;
                    //window.location.href = '/WebApp/Kiosk/OUAT/OUATProcessbar.aspx?SvcID=424&AppID=' + obj.AppID;
                }
                else if (status == "AadhaarMobile") {
                    $("#progressbar").hide();
                    alertPopup("Aadhaar and Mobile No already exist", "Unable to save Application,We have sent login credentials in your registered mobile no.");
                }
               else if (status == "Mobile") {
                    $("#progressbar").hide();
                    alertPopup("Mobile No already exist", "Mobile no already registered. Please enter another mobile no.");
               }
               else if (status == "Aadhaar") {
                   $("#progressbar").hide();
                   if (CardNo != "") {
                       alertPopup("Aadhaar No already exist", "Your aadhaar no. " + AadhaarNo + " already exist in the system with Reg. No. " + CardNo + " from district " + Dist + " and Police Station " + PS);
                   }
                   else {
                       alertPopup("Aadhaar No already exist", "Your aadhaar no. " + AadhaarNo + " already exist in the system and your card in progress from district " + Dist + " and Police Station " + PS);
                   }
                   }
                else {
                    $("#progressbar").hide();
                    alertPopup("Either Aadhaar/Mobile No already exist", "Unable to save Application, Please refresh the browser and try again");
                }
            }

        });// end of Then function of main Data Insert Function

    return false;
}


function ValidateForm() {
    debugger;
    var text = "";
    var opt = "";

   
    // Basic Information 

    var FirstName = $("#FirstName");
    var MobileNo = $("#MobileNo");
    var EmailID = $("#EmailID");
    var DOB = $("#DOB");
    var Age = $("#Age");
    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");
    var Nationality = $("#nationality option:selected").text();
    var Gender = $("#ddlGender option:selected").text();
    //police station 
    //var PSDist = $("#PddlDistrict1 option:selected").text();
    var Pstation = $("#Pddlps option:selected").text();
    //Permanent  address

    var UserType = $("#HDFLoginID").val();

    if (Pstation != null && (Pstation == '' || Pstation == '-Select-')) {
        text += "<BR>" + " \u002A" + " Please select Police Station Name.";
        $('#Pddlps').attr('style', 'border:1px solid #d03100 !important;');
        $('#Pddlps').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#Pddlps').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#Pddlps').css({ "background-color": "#ffffff" });
    }
   
    if (FirstName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Full Name. ";
        FirstName.attr('style', 'border:1px solid #d03100 !important;');
        FirstName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        FirstName.attr('style', '1px solid #cdcdcd !important;');
        FirstName.css({ "background-color": "#ffffff" });
    }


    if (DOB.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Date of Birth. ";
        DOB.attr('style', 'border:1px solid #d03100 !important;');
        DOB.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        DOB.attr('style', 'border:1px solid #cdcdcd !important;');
        DOB.css({ "background-color": "#ffffff" });
    }

    if ((Gender == '' || Gender == 'Select' || Gender == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Gender. ";
        $("#ddlGender").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlGender").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlGender").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlGender").css({ "background-color": "#ffffff" });
    }


    if (MobileNo.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Mobile No. ";
        MobileNo.attr('style', 'border:1px solid #d03100 !important;');
        MobileNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        //MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
        //MobileNo.css({ "background-color": "#ffffff" });
    }

   

    if ($('#ddlBloodGroup').val() == '' || $('#ddlBloodGroup').val() == 'Select BloodGroup' || $('#ddlBloodGroup').val() == "0") {
        text += "<BR>" + " \u002A" + " Please Select Blood Group? ";
        $('#ddlBloodGroup').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlBloodGroup').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
       
    }

    if ($('#SpouseName').val() == '' || $('#SpouseName').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Father / Spouse Name. ";
        $('#SpouseName').attr('style', 'border:1px solid #d03100 !important;');
        $('#SpouseName').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#SpouseName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#SpouseName').css({ "background-color": "#ffffff" });
    }


    var FatherOrSpouse = $("input[name='FOrS']:checked").val();

    if (FatherOrSpouse == null || FatherOrSpouse == "undefined") {
        text += "<BR>" + " \u002A" + " Please Choose Any Of Your Father / Spouse Name?.";
        $('#FOrSChk').attr('style', 'color:red !important;');
        $('#FOrSChk').css({ "color": "red !important;" });
        opt = 1;
    } else {
       
    }
    if (EL("myImg").src.indexOf("photo.png") != -1) {
        text += "<BR>" + " \u002A" + " Please upload Applicant Photograph.";
        $('#myImg').attr('style', 'border:1px solid #d03100 !important;');
        $('#myImg').css({ "background-color": "#fff2ee" });
        $('#myImg').css({ "height": "220px" });
        opt = 1;
    } else {
        $('#myImg').attr('style', 'border:0 !important;');
        $('#myImg').css({ "background-color": "" });
        $('#myImg').css({ "height": "220px" });
    }

    if (EL("mySign").src.indexOf("signature.png") != -1) {
        text += "<BR>" + " \u002A" + " Please upload Applicant Signature.";
        $('#mySign').attr('style', 'border:1px solid #d03100 !important;');
        $('#mySign').css({ "background-color": "#fff2ee" });
        $('#mySign').css({ "height": "130px" });
        opt = 1;
    } else {
        $('#mySign').attr('style', '');
        $('#mySign').css({ "background-color": "" });
        $('#mySign').css({ "height": "130px" });
    }

    var Relative = $("input[name='RelativeY']:checked").val();

    if (Relative == null || Relative == "undefined") {
        text += "<BR>" + " \u002A" + " Please Choose Any Of Your Relative Staying In Same City?.";
        $('#Relativechk').attr('style', 'color:red !important;');
        $('#Relativechk').css({ "color": "red !important;" });
        opt = 1;
    } else {
        $('#Relativechk').attr('style', 'color:#fff !important;');
        $('#Relativechk').css({ "color": "#fff " });
    }

    var MedicalH = $("input[name='RelativeY']:checked").val();

    if (MedicalH == null || MedicalH == "undefined") {
        text += "<BR>" + " \u002A" + " Please Choose Do You Have Any Medical History?.";
        $('#Medicalchk').attr('style', 'color:red !important;');
        $('#Medicalchk').css({ "color": "red !important;" });
        opt = 1;
    } else {
        $('#Medicalchk').attr('style', 'color:#fff !important;');
        $('#Medicalchk').css({ "color": "#fff " });
    }
    
    
    var MedicalMendatory = $("input[name='RBTNMedical']:checked").val();
    if (MedicalMendatory == "Yes") {
        if (!$('#Others').is(":checked") && !$('#BloodGroup').is(":checked") && !$('#Arthritis').is(":checked") && !$('#HeartDisease').is(":checked") && !$('#RespiratoryDiseases').is(":checked") && !$('#AlzheimerDisease').is(":checked") && !$('#Osteoporosis').is(":checked") && !$('#Diabetes').is(":checked") && !$('#InfluenzaPneumonia').is(":checked") && !$('#Cancer').is(":checked")) {
            text += "<BR>" + " \u002A" + " Please Fill Your Medical History Details.";
            $('#BorderMedHis').attr('style', 'border:1px solid #d03100 !important;');
            $('#BorderMedHis').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
       
    }
    debugger;
    var chkdeclaration = 0;
    if ($('#chkDeclaration').is(":checked")) {
        // it is checked
        chkdeclaration = 1;
    }

    if (chkdeclaration == 0) {
        //chkAbility
        text += "<br /> - Please check Declaration and read it. ";
        opt = 1;
        $('#lblDeclaration').attr('style', 'color:red !important;');
        $('#lblDeclaration').css({ "color": "red" });
    }
    else {
        $('#lblDeclaration').attr('style', 'color:#000000 !important;');
        $('#lblDeclaration').css({ "color": "#000000 " });
    }



    if (opt == "") {
        if (!$("#chkDeclaration").is(":checked")) {
            text += "<br /> -Please check Self Declaration.";
            lblDeclaration
            $('#lblDeclaration').attr('style', 'color:red !important;');
            $('#lblDeclaration').css({ "color": "red" });
            opt = 1;
        }
        else {
            $('#lblDeclaration').attr('style', 'color:#000000 !important;');
            $('#lblDeclaration').css({ "color": "#000000" });
        }
    }


    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}


//**************add more function for relative details.***************************
function AddSuspect(DeleteString) {
    if (validateSuspectValues(DeleteString) == true) {
        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";
        var strNOR = "";
        var strRelation = "";
        var strAddress = "";
        var strMobile = "";
        var Str = "";
        var SrNo = "";

        if (DeleteString == "") {

            strNOR = $('#txtNOR').val();
            strRelation = $('#txtRelation').val();
            strAddress = $('#txtAddress').val();
            strMobile = $('#txtMobileno').val();

            strTempString = document.getElementById("hdfSuspect").value + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "#";
        }
        else {
            strTempString = document.getElementById("hdfSuspect").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblSuspect' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sr. No. </th>";
        Str = Str + "<th style='text-align: center;'> Name of Relative</th>";
        Str = Str + "<th style='text-align: center;'>Realtion</th>";
        Str = Str + "<th style='text-align: center;'>Address</th>";
        Str = Str + "<th style='text-align: center;'>Mobile</th>";
        Str = Str + "<th style='text-align: center;'>Remove</th>";
        Str = Str + "</tr>";

        while (strTempString.length > 0) {

            intCount = intCount + 1;
            var StartIndex = strTempString.indexOf("#");
            strTempString = strTempString.substring(StartIndex + 1, strTempString.length);
            var EndIndex = strTempString.indexOf("#");
            var RemStr = strTempString.substring(0, EndIndex);


            StartIndex = RemStr.indexOf(",");
            SrNo = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);
            SrNo = intCount;

            StartIndex = RemStr.indexOf(",");
            strNOR = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strRelation = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strAddress = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            //StartIndex = RemStr.indexOf(",");
            //strRemarks = RemStr.substring(0, StartIndex);
            //RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            strMobile = RemStr;

            var DeleteString = "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "#";

            Str = Str + "<tr>";

            Str = Str + "<td style='width:65px' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strNOR + "</td>";
            Str = Str + "<td style='' >" + strRelation + "</td>";
            Str = Str + "<td style='' >" + strAddress + "</td>";
            Str = Str + "<td style='' >" + strMobile + "</td>";
            Str = Str + "<td align='center' style='width:85px'><input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";
            // <input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/>
            strSuspect = strSuspect + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "#";

            var HeirsDXML = strSaveSuspect;

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);

        }

        Str = Str + "</table>";
        document.getElementById('divSuspect').innerHTML = Str;
        document.getElementById("hdfSuspect").value = strSuspect;
        document.getElementById("hdfSuspectSave").value = strSaveSuspect;
        document.getElementById("hdfSuspectString").value = intCount;

        strNOR = $('#txtNOR').val("").focus();
        strRelation = $('#txtRelation').val("");
        strAddress = $('#txtAddress').val("");
        strMobile = $('#txtMobileno').val("");
    }
}
function DelString(DeleteString) {
    var Msg = "Do you want remove this Suspect?";
    if (confirm(Msg)) {
        var strString = document.getElementById('hdfSuspect').value;
        strString = strString.replace(DeleteString, "");
        document.getElementById('hdfSuspect').value = strString;
        AddSuspect(DeleteString);
    }
}

function validateSuspectValues(DeleteString) {
    if (DeleteString != '') {
        return true;
    }

    var strName = "";
    var strHof = "";
    var strage = "";
    var strnominated = "";
    var strMsg = "";
    var isError = false;

    strName = $('#txtNOR').val();
    strHof = $('#txtRelation').val();
    strage = $('#txtAddress').val();
    strnominated = $('#txtMobileno').val();

    if (strName == "") {
        strMsg = strMsg + "</br> * Please Enter Name of Relative.";
        document.getElementById('txtNOR').focus();
        isError = true;
    }

    if (strHof == "") {
        strMsg = strMsg + "</br> * Please Enter Relation.";
        document.getElementById('txtRelation').focus();
        isError = true;
    }
    if (strage == "") {
        strMsg = strMsg + "</br> * Please Enter Address.";
        document.getElementById('txtAddress').focus();
        isError = true;
    }
    if (strnominated == "") {
        strMsg = strMsg + "</br> * Please Enter Mobile.";
        document.getElementById('txtMobileno').focus();
        isError = true;
    }

    if (isError == true) {
        document.getElementById("divmore").innerHTML = " * Below are the Family Member Details validation error(s), please rectify ! <br> " + strMsg;
        $("#divmore").show();
        document.getElementById("divmore").focus();
        return false;
    }
    else {
        document.getElementById("divmore").innerHTML = "";
        $("#divmore").hide();
    }
    return true;

}
//police station district list
function GetDistrictPloiceStations() {
    debugger;
    var Ps = $("#HDFPS").val();
    var SelDistrict = $('#PddlDistrict1').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/RD/SeniorCitizen.aspx/GetDistrictPloiceStation',
        data: '{"prefix":"","DistrictCode":"' + SelDistrict + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlps = $("[id=Pddlps]");
            ddlps.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=Pddlps]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
                if (Ps != "" && Ps != "undefined") {
                    $('#Pddlps option:selected').text(Ps);
                    $("#Pddlps").prop("disabled", true);
                }
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
//end here
//**************add more function for Servant details.***************************
function AddServantSuspect(DeleteStringS) {
    debugger;
    if (validateSuspectValuesS(DeleteStringS) == true) {
        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";
        var strNOR = "";
        var strRelation = "";
        var strAddress = "";
        var strMobile = "";
        var Str = "";
        var SrNo = "";

        if (DeleteStringS == "") {

            strNOR = $('#SddlPersonType option:selected').text();
            strRelation = $('#txtSNameOfPerson').val();
            strAddress = $('#txtSAddress').val();
            strMobile = $('#txtSMobile').val();

            strTempString = document.getElementById("hdfSuspectS").value + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "#";
        }
        else {
            strTempString = document.getElementById("hdfSuspectS").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblSuspect' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sr. No. </th>";
        Str = Str + "<th style='text-align: center;'> Person Type</th>";
        Str = Str + "<th style='text-align: center;'>Name Of Person</th>";
        Str = Str + "<th style='text-align: center;'>Address</th>";
        Str = Str + "<th style='text-align: center;'>Mobile</th>";
        Str = Str + "<th style='text-align: center;'>Remove</th>";
        Str = Str + "</tr>";

        while (strTempString.length > 0) {

            intCount = intCount + 1;
            var StartIndex = strTempString.indexOf("#");
            strTempString = strTempString.substring(StartIndex + 1, strTempString.length);
            var EndIndex = strTempString.indexOf("#");
            var RemStr = strTempString.substring(0, EndIndex);


            StartIndex = RemStr.indexOf(",");
            SrNo = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);
            SrNo = intCount;

            StartIndex = RemStr.indexOf(",");
            strNOR = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strRelation = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strAddress = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            //StartIndex = RemStr.indexOf(",");
            //strRemarks = RemStr.substring(0, StartIndex);
            //RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            strMobile = RemStr;

            var DeleteStringS = "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "#";

            Str = Str + "<tr>";

            Str = Str + "<td style='width:65px' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strNOR + "</td>";
            Str = Str + "<td style='' >" + strRelation + "</td>";
            Str = Str + "<td style='' >" + strAddress + "</td>";
            Str = Str + "<td style='' >" + strMobile + "</td>";
            Str = Str + "<td align='center' style='width:85px'><input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelStringS(&quot;" + DeleteStringS + "&quot;);'/></td>";
            Str = Str + "</tr>";
            // <input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/>
            strSuspect = strSuspect + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + strNOR + "," + strRelation + "," + strAddress + "," + strMobile + "#";

            var HeirsDXMLS = strSaveSuspect;

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);

        }

        Str = Str + "</table>";
        document.getElementById('divSuspectS').innerHTML = Str;
        document.getElementById("hdfSuspectS").value = strSuspect;
        document.getElementById("hdfSuspectSaveS").value = strSaveSuspect;
        document.getElementById("hdfSuspectStringS").value = intCount;

        strNOR = $('#SddlPersonType option:selected').focus();
        strRelation = $('#txtSNameOfPerson').val("");
        strAddress = $('#txtSAddress').val("");
        strMobile = $('#txtSMobile').val("");
    }
}
function DelStringS(DeleteStringS) {
    var Msg = "Do you want remove this Suspect?";
    if (confirm(Msg)) {
        var strString = document.getElementById('hdfSuspectS').value;
        strString = strString.replace(DeleteStringS, "");
        document.getElementById('hdfSuspectS').value = strString;
        AddServantSuspect(DeleteStringS);
    }
}

function validateSuspectValuesS(DeleteStringS) {
    if (DeleteStringS != '') {
        return true;
    }

    var strName = "";
    var strHof = "";
    var strage = "";
    var strnominated = "";
    var strMsg = "";
    var isError = false;

    strName = $('#SddlPersonType option:selected').text();
    strHof = $('#txtSNameOfPerson').val();
    strage = $('#txtSAddress').val();
    strnominated = $('#txtSMobile').val();

    if (strName == "") {
        strMsg = strMsg + "</br> * Please Select Person type.";
        document.getElementById('#SddlPersonType option:selected').focus();
        isError = true;
    }

    if (strHof == "") {
        strMsg = strMsg + "</br> * Please Enter Name Of Person.";
        document.getElementById('txtSNameOfPerson').focus();
        isError = true;
    }
    if (strage == "") {
        strMsg = strMsg + "</br> * Please Enter Address.";
        document.getElementById('txtSAddress').focus();
        isError = true;
    }
    if (strnominated == "") {
        strMsg = strMsg + "</br> * Please Enter Mobile.";
        document.getElementById('txtSMobile').focus();
        isError = true;
    }

    if (isError == true) {
        document.getElementById("divmoreS").innerHTML = " * Below are the Servant/Driver/Watchman/Tenant Details validation error(s), please rectify ! <br> " + strMsg;
        $("#divmoreS").show();
        document.getElementById("divmoreS").focus();
        return false;
    }
    else {
        document.getElementById("divmoreS").innerHTML = "";
        $("#divmoreS").hide();
    }
    return true;

}

/*Validate Aadhaar Number weather already exist on not 11 Aug 2017--*/
function ValidateAadhaar(UIDVal, value, SessionName) {
    debugger;
    //var AadhaarNo = $('#UID').val();
    //var datavar = {
    //    'AadhaarNumber': $('#UID').val(),

    //};

    //var obj = {
    //    "prefix": "''",
    //    "Data": $.stringify(datavar, null, 4)
    //};

    //$("#progressbar").show();
    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/RD/SeniorCitizen.aspx/ValidateAadhaarNo',
            data: '{"AadhaarNumber":"' + $('#UID').val() + '"}',
            processData: false,
            dataType: "json",
            success: function (response) {
                debugger;
            },
            error: function (a, b, c) {
                $("#progressbar").hide();
                $("#btnSubmit").prop('disabled', false);
                result = false;
                alertPopup("Could Not Save the Application, Please try again.", "5. " + a.responseText);
            }
        })
        ).then(function (data, textStatus, jqXHR) {
            debugger;
            var obj = jQuery.parseJSON(data.d);
            var html = "";
            var status = obj.Status;
            var AadhaarNo = obj.AadhaarNo;
            var CardNo = obj.CardNo;
            var Dist = obj.District;
            var PS = obj.PoliceStation;
            var intStatus = obj.intStatus;

            AppID = obj.AppID;
            result = true;

            if (intStatus == "0") {
                if (validateUID(UIDVal) != false) {

                    //if (UIDVal == "1") {
                    //code = UIDVal;
                    //}

                    //CheckLocalAadhar($("#UID").val());
                    var UID = $("#UID").val();
                    var EID = "0";
                    var left = (screen.width / 2) - (560 / 2);
                    var top = (screen.height / 2) - (400 / 2);

                    window.open('/UID/Default.aspx?SvcID=424&aadhaarNumber=' + UID + '&kycTypesToUse=OTP', 'open_window',
                    ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
                    window.focus();
                }
            }
            else {
                if (status == "AadhaarExist") {
                    $("#progressbar").hide();
                    alertPopup("Aadhaar No already exist", "Aadhaar Number already exist,We have sent login credentials in your registered mobile no. Please login and apply for service.");
                }
                else if (status == "AadhaarExistInCard") {
                    $("#progressbar").hide();
                    if (CardNo != "") {
                        alertPopup("Aadhaar No already exist", "Your aadhaar no. " + AadhaarNo + " already exist in the system with Reg. No. " + CardNo + " from district " + Dist + " and Police Station " + PS);
                    }
                    else {
                        alertPopup("Aadhaar No already exist", "Your aadhaar no. " + AadhaarNo + " already exist in the system and your card in progress from district " + Dist + " and Police Station " + PS);
                    }
                }
                else {
                    $("#progressbar").hide();
                    alertPopup("Either Aadhaar/Mobile No already exist", "Unable to save Application, Please refresh the browser and try again");

                }
            }


        });// end of Then function of main Data Insert Function

    return false;
}

function GetCitizenData() {
    debugger;
   
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/RD/CitizenForm.aspx/GetCitizenData',
        data: '{}',
        dataType: "json",
        success: function (data) {

            var arr = $.parseJSON(data.d);
            debugger;
            for (var i = 0; i < arr.length; i++) {
                
                var FName = arr[i].FirstName;
                var Gender = arr[i].Gender;
                var Mobile = arr[i].Mobile;
                var Email = arr[i].Email;
                if (FName != '') {
                    $('#FirstName').val(FName);
                    $('#FirstName').prop('disabled', true);
                }
                else {
                    $('#FirstName').prop('disabled', false);
                }
                if (Gender != '') {
                    $('#ddlGender').val(Gender);
                    $('#ddlGender').prop('disabled', true);
                }
                else {
                   $('#ddlGender').prop('disabled', false);
                }
                if (Mobile != '') {
                    $('#MobileNo').val(Mobile);
                    $('#MobileNo').prop('disabled', true);
                }
                else {
                    $('#MobileNo').prop('disabled', false);
                }
                if (Email != '') {
                    $('#EmailID').val(Email);
                    $('#EmailID').prop('disabled', true);
                }
                else {
                    $('#EmailID').prop('disabled', false);
                }
                $('#myImg').attr('src', arr[i].ApplicantImageStr);
               
            }
           
        },
        error: function (data) {
            alert("Error");
        }
    });
}
function AlphaNumeric(e) {
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