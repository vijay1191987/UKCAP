// for md5 encryption);
function md5auth(seed) {
    debugger;
    var newpwd = $('#ContentPlaceHolder1_txtnewpass').val();
    var newpassword = newpwd;
    $('#ContentPlaceHolder1_hdnfldPass').val(newpassword);

    var confirmpwd = $('#ContentPlaceHolder1_txtconfirmpass').val();
    var confirmpassword = confirmpwd;
    //$('#ContentPlaceHolder1_hdnfldPass1').val(confirmpassword);


    var newHash = calcMD5(seed + (calcMD5(newpassword).toUpperCase()));
    var confirmHash = calcMD5(seed + (calcMD5(confirmpassword).toUpperCase()));

    if (newHash != confirmHash) {
        alert("Password mismatch.");
        return false;
    }

    $('#ContentPlaceHolder1_txtnewpass').val(newHash);
    $('#ContentPlaceHolder1_txtconfirmpass').val(confirmHash);


    return true;


}

function md5authlogin(seed) {
    debugger;
    var newpwd = $('#txtnewpass').val();
    var newpassword = newpwd;
    $('#hdnfldPass').val(newpassword);

    var confirmpwd = $('#txtconfirmpass').val();
    var confirmpassword = confirmpwd;
    //$('#ContentPlaceHolder1_hdnfldPass1').val(confirmpassword);


    var newHash = calcMD5(seed + (calcMD5(newpassword).toUpperCase()));
    var confirmHash = calcMD5(seed + (calcMD5(confirmpassword).toUpperCase()));

    if (newHash != confirmHash) {
        alert("Password mismatch.");
        return false;
    }

    $('#txtnewpass').val(newHash);
    $('#txtconfirmpass').val(confirmHash);


    return true;


}

function GetCitizenLoginCount() {
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Login/ChangePassword.aspx/GetCitizenUserCount',
        data: '{"LoginId":"' + $('#HdnField').val() + '","Password":"' + $('#txtcurrentpass').val() + '","Flag":"' + 2 + '"}',
        processData: false,
        dataType: "json",
        success: function (result) {
            if (result.d == "1") {
                $('#lblmsg').text("");
                $('#lblmsg').text("Password Matched In DataBase!!!");
                $('#lblmsg').removeClass('alert2 alert-danger');
                $('#lblmsg').attr('style', 'color: green !important;');
                $('#lblmsg').addClass('alert2 alert-success');
            }
            else {
                $('#lblmsg').text("");
                $('#lblmsg').text("*Invalid Password or Password Not Matched In DataBase!!!");
                $('#lblmsg').attr('style', 'color: red !important;');
                $('#lblmsg').addClass('alert2 alert-danger');
            }
        },
        error: function (a, b, c) {
            //alert("4." + a.responseText);
        }
    });
}


function GetDeptLoginCount() {
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/G2G/ChangePassword.aspx/GetDeptUserCount',
        data: '{"LoginId":"' + $('#ContentPlaceHolder1_HdnField').val() + '","Password":"' + $('#txtcurrentpass').val() + '","Flag":"' + 1 + '"}',
        processData: false,
        dataType: "json",
        success: function (result) {
            if (result.d == "1") {
                $('#ContentPlaceHolder1_lblmsg').text("");
                $('#ContentPlaceHolder1_lblmsg').text("Password Matched In DataBase!!!");
                $('#ContentPlaceHolder1_lblmsg').removeClass('alert2 alert-danger');
                $('#ContentPlaceHolder1_lblmsg').attr('style', 'color: green !important;');
                $('#ContentPlaceHolder1_lblmsg').addClass('alert2 alert-success');
            }
            else {
                $('#ContentPlaceHolder1_lblmsg').text("");
                $('#ContentPlaceHolder1_lblmsg').text("*Invalid Password or Password Not Matched In DataBase!!!");
                $('#ContentPlaceHolder1_lblmsg').attr('style', 'color: red !important;');
                $('#ContentPlaceHolder1_lblmsg').addClass('alert2 alert-danger');
            }
        },
        error: function (a, b, c) {
            //alert("4." + a.responseText);
        }
    });
}

