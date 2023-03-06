$(document).ready(function () {
    debugger;
    console.log("ready!");
    GetState();
    //GetUKDistrict();
    $('#btnsubmit').prop('disabled', true);
                           
});



function sendotp() {
    debugger;
    var MobileNo = $('#MobileNo').val();
    var btnotp = $('#btnsendotp').val();
    if (MobileNo == null || MobileNo == "") {
        alert("Please Enter Mobile Number");
        return;
    }
    else {
        $('#btnsendotp').prop('disabled', false);
    }


    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/g2c/Forms/index.aspx/SendOtpbtn",
        data: '{"MobileNo":"' + $('#MobileNo').val() + '"}',
        processData: false,
        dataType: "json",
        success: function (result) {
            alert("OTP Sucessfully Sent, Please Check and Verify!!!");
            $('#btnsendotp').prop('disabled', true);
        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });
}
function verifyotp() {
    var OTP = $('#verifyOTP').val();
    var btnotp = $('#btnverifyotp').val();
    if (OTP == null || OTP == "") {
        alert("Please Enter 6-Digit OTP Number");
        return;
    }
    else {
        $('#btnverifyotp').prop('disabled', false);
    }

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/g2c/Forms/index.aspx/verifyotpbtn",
        data: '{"MobileNo":"' + $('#MobileNo').val() + '","OTPText":"' + $('#verifyOTP').val() + '"}',
        processData: false,
        dataType: "json",
        success: function (result) {
            if (result.d == null || result.d == "0") {
                alert("OTP Verification Failed");
                $('#verifyOTP').val('');
            }
            else {
                alert("OTP Successfully Verified");
                $('#btnverifyotp').prop("disabled", true);

            }
        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });
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



function GetState() {
    debugger;
    var SelState = $('#ddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/webapp/Registration/KioskRegistration.aspx/GetState",
        data: '{"prefix": ""}',
        dataType: "json",
        success: function (r) {
            debugger;
            var arr = eval(r.d);
            var ddlCustomers = $("[id*=ddlState]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select State-</option>');
            $.each(arr, function () {
                $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });

            $('#ddlState').val("5");
            GetUKDistrict();

        }
    });
}


function GetUKDistrict() {
    var SelState = $('#ddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Registration/KioskRegistration.aspx/GetDistrict",
        data: '{"prefix":"","StateCode":"' + SelState + '"}',
        dataType: "json",
        success: function (r) {
            debugger;
             var arr = eval(r.d);
            var ddlCustomers = $("[id*=ddlDistrict]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select District-</option>');
            $.each(arr, function () {
                $("[id*=ddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
           
        }
    });
}


function GetUKBlock() {
    debugger;
    var SelBlock = $('#ddlDistrict').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict",
        data: '{"prefix":"","DistrictCode":"' + SelBlock + '"}',
        dataType: "json",
        success: function (r) {
            debugger;
            var arr = eval(r.d);
            var ddlCustomers = $("[id*=ddlBlock]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select Taluka-</option>');
            $.each(arr, function () {
                $("[id*=ddlBlock]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
            
        }
    });
}


function GetUKPanchayat() {
    debugger;
    var SelSubDistrict = $('#ddlBlock').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Registration/KioskRegistration.aspx/GetVillage",
        data: '{"prefix":"","SubDistrictCode":"' + SelSubDistrict + '"}',
        dataType: "json",
        success: function (r) {
            debugger;
            var arr = eval(r.d);
            var ddlCustomers = $("[id*=ddlpanchayat]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select Panchayat-</option>');
            $.each(arr, function () {
                $("[id*=ddlpanchayat]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}


//function Locationchange() {
//    debugger;
//    var locationtype = $('#ddllocationtype').val();
//    var panchayat = $('#ddlpanchayat').val();
//    var Muncipality = $('#ddlmuncipality').val();

//    if (locationtype != "0" || locationtype != "-Select Location Type-") {
//        if (locationtype == "rural") {
//            $('#divPanchayat').show();

//        }
//        else {
//            $('#divPanchayat').hide();
//        }

//        if (locationtype == "urban") {
//            $('#divmuncipality').show();

//        }
//        else {
//            $('#divmuncipality').hide();
//        }
//    }
//    if (locationtype == "0" || locationtype == "-Select Location Type-") {
//        $('#divPanchayat').show();
//        $('#divmuncipality').show();
//    }
//}

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

function fetchApplicantData() {
    debugger;
    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];

    if (uid != "" || uid != null) {

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebAppUK/IncomeCertificate/IncomeForm.aspx/GetApplicantData',
            data: '{"ServiceID":"' + svcid + '","UID":"' + uid + '"}',
            processData: false,
            dataType: "json",
            success: function (data) {
                var obj = jQuery.parseJSON(data.d);
                var html = "";
                debugger;
                if (obj[0] != null) {



                    $('#txtfullname').val(obj[0]["FullName"]);
                    $('#txtfathername').val(obj[0]["FHName"]);
                    $('#txtmothername').val(obj[0]["FHName"]);
                    $('#ddlgender').val(obj[0]["gender"]);
                    $('#txtmobile').val(obj[0]["MobileNo"]);
                    $('#txtmail').val(obj[0]["EmailId"]);
                    $('#txtAddress1').val(obj[0]["FullAddress"]);
                    $('#txtAddress2').val(obj[0]["locality"]);
                    $('#txtpincode').val(obj[0]["pincode"]);
                    $('#ddlDistrict').val(obj[0][""]);
                    $('#ddlBlock').val(obj[0][""]);
                    $('#IPanchayat').val(obj[0][""]);
                    $('#Muncipality').val(obj[0][""]);
                    $('#txtPincode').val(obj[0]["Pincode"]);
                    //$('#txtfullname').prop("disabled", true);
                    //$('#txtfathername').prop("disabled", true);
                    //$('#txtmobile').prop("disabled", true);
                    //$('#txtmail').prop("disabled", true);
                    //$('#txtAddress1').prop("disabled", true);
                    //$('#txtAddress2').prop("disabled", true);
                   // $('#txtpincode').prop("disabled", true);
                    //GetStateAsPerValue(obj[0]["StateCode"], obj[0]["DistrictCode"], obj[0]["BlockTalukaCode"], obj[0]["PanchayatVillageCode"]);
                }
            },
            error: function (a, b, c) {
                result = false;
                alert("5." + a.responseText);
            }
        });
    }
}



function SubmitIncomeCertificate() {
    //document.getElementById("btnSubmit").disabled = true;
    if (!ValidateIncomeCertificate()) {
        return;
    }

    var temp = "Mohan";
    var AppID = "";
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

    var datavar = {

        'AadhaarNumber': uid,

        'FullName': $('#txtfullname').val(),
        'FHName': $('#txtfathername').val(),
        'MotherName': $('#txtmothername').val(),
        'Gender': $('#ddlgender').val(),
        'MobileNo': $('#txtmobile').val(),
        'EmailId': $('#txtmail').val(),
        'Occupation': $('#txtoccupation').val(),
        'MonthlyIncome': $('#txtincome').val(),
        'IncomeInWords': $('#txtincomeinword').val(),
        //'LocationType': $('#ddllocationtype').val(),
        'Address1': $('#txtAddress1').val(),
        'Address2': $('#txtAddress2').val(),
        'IState': $('#ddlState').val(),
        'IDistrict': $('#ddlDistrict').val(),
        'IBlock': $('#ddlBlock').val(),
        'IPanchayat': $('#ddlpanchayat').val(),
        //'Muncipality': $('#ddlmuncipality').val(),
        'Pincode': $('#txtpincode').val(),

        'department': dpt,
        'district': dist,
        'block': blk,
        'panchayat': pan,
        'office': ofc,
        'officer': ofr,

    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": JSON.stringify(datavar, null, 4)
    };

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebAppUK/IncomeCertificate/IncomeForm.aspx/InsertUKInComeCertificate',
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
                window.location.href = '/WebApp/Kiosk/forms/AttachmentV2.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID + '&UID=' + uid;
            }

        });// end of Then function of main Data Insert Function

    return false;
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
    var mobileno = $("#txtmobile").val();
        if (mobileno != null) {
            if (isNaN(mobileno) || mobileno.indexOf(" ") != -1) {
                text += "<br /> Please Enter A Valid Mobile Number.";
                //alertPopup("Mobile Number", "</BR> Please Enter Valid Mobile Number.");
                opt = 1;
            }
            if (mobileno.length > 10 || mobileno.length < 10) {
                text += "<br /> Mobile No. Should Be Atleast 10 Digit.";
                //alertPopup("Mobile Number", "</BR> Mobile No. Should Be 10 Digit.");
                opt = 1;
            }
            if (!(mobileno.charAt(0) == "9" || mobileno.charAt(0) == "8" || mobileno.charAt(0) == "7")) {
                text += "<br /> Mobile No. Should Start With 9 ,8 or 7.";
                //alertPopup("Mobile Number", "</BR> Mobile No. Should Starts Sith 9 ,8 or 7");
                opt = 1;
            }
        }
        if (opt == "1") {
            alertPopup("Please Fill The Following Information.", text);
            $("#txtmobile").val("");

            return false;
        }
        return true;
    }

function email() {
        debugger;
        var emailid = document.getElementById('txtmail').value;
        //var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-z/A-Z]+\.)+[a-z/A-Z]{1,3})(\]?))$/;
        //var reg = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        var reg = /[a-zA-Z0-9\.\-]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
        if (emailid.match(reg)) {
            $('#txtmail').attr('style', 'border:1px solid #ddd !important;');
            $('#txtmail').css({ "background-color": "#ffffff" });
        }
        else {
            alertPopup("Please Enter Email-ID.", "</BR> Please Enter A Valid Email-ID in Proper Format");
            $('#txtmail').attr('style', 'border:2px solid red !important;');
            $('#txtmail').val('');
        }
}


function ForName(e) {
    var regex = new RegExp("[ A-Za-z.]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);
    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}


function ValidateIncomeCertificate() {
    debugger;
    var text = "";
    var opt = "";

    var FullName = $('#txtfullname').val();
    var txtfathername = $('#txtfathername').val();
    var txtmothername = $('#txtmothername').val();
    var txtmobile = $('#txtmobile').val();
    var ddlgender = $("#ddlgender option:selected").val()
    var txtmail = $('#txtmail').val();
    var txtoccupation = $('#txtoccupation').val();
    //var ddllocationtype = $("#ddllocationtype option:selected").val();
    var ddlState = $("#ddlState option:selected").val();
    var ddlDistrict = $("#ddlDistrict option:selected").val();
    var ddlBlock = $("#ddlBlock option:selected").val();
    var ddlpanchayat = $("#ddlpanchayat option:selected").val();
    //var ddlmuncipality = $("#ddlmuncipality").val();
    var txtincome = $('#txtincome').val();
    var txtincomeinword = $('#txtincomeinword').val();
    var txtAddress1 = $('#txtAddress1').val();
    var txtAddress2 = $('#txtAddress2').val();
    var txtpincode = $('#txtpincode').val();



    if (FullName == null || FullName == "") {
        text += "<br /> Please Enter Your Name. ";
        $('#txtfullname').attr('style', 'border:1px solid red !important;');
        $('#txtfullname').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtfullname').attr('style', 'border:1px solid #ddd !important;');
        $('#txtfullname').css({ "background-color": "#ffffff" });
    }


    if (txtfathername == null || txtfathername == "") {
        text += "<br /> Please Enter Your father name ";
        $('#txtfathername').attr('style', 'border:1px solid red !important;');
        $('#txtfathername').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtfathername').attr('style', 'border:1px solid #ddd !important;');
        $('#txtfathername').css({ "background-color": "#ffffff" });
    }
    if (txtmothername == null || txtmothername == "") {
        text += "<br /> Please Enter Mother name. ";
        $('#txtmothername').attr('style', 'border:1px solid red !important;');
        $('#txtmothername').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtmothername').attr('style', 'border:1px solid #ddd !important;');
        $('#txtmothername').css({ "background-color": "#ffffff" });
    }
    if (txtmobile == null || txtmobile == "") {
        text += "<br /> Please Enter Your mobile no. ";
        $('#txtmobile').attr('style', 'border:1px solid red !important;');
        $('#txtmobile').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtmobile').attr('style', 'border:1px solid #ddd !important;');
        $('#txtmobile').css({ "background-color": "#ffffff" });
    }
    if (txtoccupation == null || txtoccupation == "") {
        text += "<br /> Please Enter Your Name. ";
        $('#txtoccupation').attr('style', 'border:1px solid red !important;');
        $('#txtoccupation').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtoccupation').attr('style', 'border:1px solid #ddd !important;');
        $('#txtoccupation').css({ "background-color": "#ffffff" });
    }

    if (ddlgender == "-Select Gender-" || ddlgender == "0") {
        text += "<br /> Please Select  Gender.";
        $('#ddlgender').attr('style', 'border:1px solid red !important;');
        $('#ddlgender').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlgender').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlgender').css({ "background-color": "#ffffff" });
    }

    //if (ddllocationtype == "-Select Location Type-" || ddllocationtype == "0") {
    //    text += "<br /> Please Select  Location type.";
    //    $('#ddllocationtype').attr('style', 'border:1px solid red !important;');
    //    $('#ddllocationtype').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //}
    //else {
    //    $('#ddllocationtype').attr('style', 'border:1px solid #ddd !important;');
    //    $('#ddllocationtype').css({ "background-color": "#ffffff" });
    //}

    if (txtmail == null || txtmail == "") {
        text += "<br /> Please Enter Your Email Id. ";
        $('#txtmail').attr('style', 'border:1px solid red !important;');
        $('#txtmail').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtmail').attr('style', 'border:1px solid #ddd !important;');
        $('#txtmail').css({ "background-color": "#ffffff" });
    }

    var ddlState = $("#ddlState option:selected").val();
    if (ddlState == "-Select State-" || ddlState == "0") {
        text += "<br /> Please Select  State.";
        $('#ddlState').attr('style', 'border:1px solid red !important;');
        $('#ddlState').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlState').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlState').css({ "background-color": "#ffffff" });
    }
    if (ddlDistrict == "-Select District-" || ddlDistrict == "0") {
        text += "<br /> Please Select  District.";
        $('#ddlDistrict').attr('style', 'border:1px solid red !important;');
        $('#ddlDistrict').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlDistrict').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlDistrict').css({ "background-color": "#ffffff" });
    }
    if (ddlBlock == "-Select Taluka-" || ddlBlock == "0") {
        text += "<br /> Please Select  Block.";
        $('#ddlBlock').attr('style', 'border:1px solid red !important;');
        $('#ddlBlock').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlBlock').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlBlock').css({ "background-color": "#ffffff" });
    }
   
    if (ddlpanchayat == "-Select Panchayat-" || ddlpanchayat == "0") {
        text += "<br /> Please Select  panchayat.";
        $('#ddlpanchayat').attr('style', 'border:1px solid red !important;');
        $('#ddlpanchayat').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlpanchayat').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlpanchayat').css({ "background-color": "#ffffff" });
    }



      //  if (ddlmuncipality == null || ddlmuncipality == "") {
      //  text += "<br /> Please Enter muncipality. ";
      //  $('#ddlmuncipality').attr('style', 'border:1px solid red !important;');
      //  $('#ddlmuncipality').css({ "background-color": "#fff2ee" });
      //     opt = 1;
      //     }
      //  else
      //{
      //  $('#ddlmuncipality').attr('style', 'border:1px solid #ddd !important;');
      //  $('#ddlmuncipality').css({ "background-color": "#ffffff" });
      // }
  
            if (txtincome == null || txtincome == "") {
                text += "<br /> Please Enter income. ";
                $('#txtincome').attr('style', 'border:1px solid red !important;');
                $('#txtincome').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#txtincome').attr('style', 'border:1px solid #ddd !important;');
                $('#txtincome').css({ "background-color": "#ffffff" });
            }
            if (txtincomeinword == null || txtincomeinword == "") {
                text += "<br /> Please Enter income in word. ";
                $('#txtincomeinword').attr('style', 'border:1px solid red !important;');
                $('#txtincomeinword').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#txtincomeinword').attr('style', 'border:1px solid #ddd !important;');
                $('#txtincomeinword').css({ "background-color": "#ffffff" });
            }
        

        if (txtAddress1 == null || txtAddress1 == "") {
            text += "<br /> Please Enter Your Address1 . ";
            $('#txtAddress1').attr('style', 'border:1px solid red !important;');
            $('#txtAddress1').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtAddress1').attr('style', 'border:1px solid #ddd !important;');
            $('#txtAddress1').css({ "background-color": "#ffffff" });
        }
         if (txtpincode == null || txtpincode == "") {
            text += "<br /> Please Enter Your pincode . ";
            $('#txtpincode').attr('style', 'border:1px solid red !important;');
            $('#txtpincode').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtpincode').attr('style', 'border:1px solid #ddd !important;');
            $('#txtpincode').css({ "background-color": "#ffffff" });
        }

        if (opt == "1") {
            alertPopup("Please Fill The Following Information.", text);
            return false;
        }
        return true;
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
