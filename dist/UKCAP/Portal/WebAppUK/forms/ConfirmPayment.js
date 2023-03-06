$(document).ready(function () {
    $('#btnSubmit').prop("disabled", true);
    
});

function calc() {
    
    if ($('#FormDeclaration').prop('checked') == true) {
        $('#btnSubmit').prop("disabled", false);
    } else {
        $('#btnSubmit').prop("disabled", true);
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

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
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
function sendotp() {
  
    var MobileNo = $('#ContentPlaceHolder1_MobileNo').val();
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
        url: "/WebAppUK/forms/ConfirmPaymentCOD.aspx/SendOtpbtn",
        data: '{"MobileNo":"' + $('#ContentPlaceHolder1_MobileNo').val() + '"}',
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
        url: "/WebAppUK/forms/ConfirmPaymentCOD.aspx/verifyotpbtn",
        data: '{"MobileNo":"' + $('#ContentPlaceHolder1_MobileNo').val() + '","OTPText":"' + $('#verifyOTP').val() + '"}',
        processData: false,
        dataType: "json",
        success: function (result) {
            if (result.d == null || result.d == "0") {
                alert("OTP Verification Failed");
                $('#verifyOTP').val('');
                $('#btnSubmit').prop("disabled", true);
            }
            else {
              
                alert("OTP Successfully Verified");
                var St = $('#verifyOTP').val();
                $('#HiddenField1').val(St);
                $('#btnverifyotp').prop("disabled", true);
                $('#btnSubmit').prop("disabled", false);

            }
        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });
}