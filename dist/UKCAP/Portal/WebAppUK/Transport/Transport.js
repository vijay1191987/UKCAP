$(document).ready(function ()
{
    GetTransportService();
    window.onload = window.history.forward(-1);  //calling function on window onload
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };
    preventBack();

});

function preventBack()
{
    window.history.forward();
}

function getQueryStrings()
{
    var assoc = {};
    var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
    var queryString = location.search.substring(1);
    var keyValues = queryString.split('&');

    for (var i in keyValues)
    {
        var key = keyValues[i].split('=');
        if (key.length > 1)
        {
            assoc[decode(key[0])] = decode(key[1]);
        }
    }
    return assoc;
}


function ValidateForm()
{
    var text = "";
    var opt = "";


    var purcd = $('#pur_cd').val();
    if (purcd == "-Select-" || purcd == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select Service From List.";
        $('#pur_cd').attr('style', 'border:1px solid #d03100 !important;');
        $('#pur_cd').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#pur_cd').attr('style', '1px solid #cdcdcd !important;');
        $('#pur_cd').css({ "background-color": "#ffffff" });
    }


    var regnno = $('#regn_no').val();
    if (regnno == "" || regnno == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Vehicle Registration Numver.";
        $('#regn_no').attr('style', 'border:1px solid #d03100 !important;');
        $('#regn_no').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#regn_no').attr('style', '1px solid #cdcdcd !important;');
        $('#regn_no').css({ "background-color": "#ffffff" });
    }

    var chassino = $('#chassi_no').val();
    if (chassino == "" || chassino == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Vehicle Chasis Number.";
        $('#chassi_no').attr('style', 'border:1px solid #d03100 !important;');
        $('#chassi_no').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#chassi_no').attr('style', '1px solid #cdcdcd !important;');
        $('#chassi_no').css({ "background-color": "#ffffff" });
    }

    var MobileNo = $('#mobile_no').val();
    if (MobileNo == "" || MobileNo == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Mobile Number.";
        $('#mobile_no').attr('style', 'border:1px solid #d03100 !important;');
        $('#mobile_no').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#mobile_no').attr('style', '1px solid #cdcdcd !important;');
        $('#mobile_no').css({ "background-color": "#ffffff" });
    }

    if (opt == "1")
    {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function GetTransportService()
{
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebAppUK/Transport/VehicleRegistration.aspx/GetTransportService',
        data: '{}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var catCount = 0;
            var ServiceList = $("[id=pur_cd]");
            ServiceList.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=pur_cd]").append('<option value = "' + this.SvcID + '">' + this.SvcName + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}


function SubmitData()
{
    if (!ValidateForm())
    {
        return false;
    }

    $("#btnSubmit").prop('disabled', true);

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

    var temp = "Mohan";
    var AppID = "";
    
    var pur_cd = $('#pur_cd').val();
    var regn_no = $('#regn_no').val();
    var chassi_no = $('#chassi_no').val();
    var mobile_no = $('#mobile_no').val();

    //var URL = "";
    //URL = 'http://164.100.78.110/vahanservice/vahan/ui/eapplication/form_eApplicatonHome.xhtml?portal_cd=112&pur_cd=' + pur_cd + '&regn_no=' + regn_no + '&chassi_no=' + chassi_no + '&mobile_no=' + mobile_no + '&regn_no=' + regn_no;
    //window.open(URL, '_blank', 'target = _private');
    //ReturnSubmit();


    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebAppUK/Transport/VehicleRegistration.aspx/EncryptDecryptData',
        data: '{"purCd":"' + pur_cd + '","regn_no":"' + regn_no + '","chaSI":"' + chassi_no + '","mobile_no":"' + mobile_no + '"}',
        processData: false,
        dataType: "json",
        success: function (URL)
        {
            window.location.href = URL.d;
            //window.open(URL.d, '_blank');
            //window.location.href = "/WebAppUK/Transport/NICResponsePage.aspx?NicReturnURL=" + URL.d;
            //ReturnSubmit();
        },
        error: function (a, b, c)
        {
            result = false;
            alert("5." + a.responseText);
        }
    });
}



function SubmitTData() {

    if (!ValidateForm()) {
        return false;
    }

    $('#g207').show();

    $("#btnSubmit").prop('disabled', true);

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

    var temp = "Mohan";
    var AppID = "";
    var rtnurl = "";

    var datavar = {
        'ServiceID': svcid,
        'ProfileID': uid,
        'PurposeCode': $('#pur_cd').val(),
        'PurposeName': $('#pur_cd :selected').text(),
        'RegistrationNo': $('#regn_no').val(),
        'ChasisNo': $('#chassi_no').val(),
        'MobileNo': $('#mobile_no').val(),
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebAppUK/Transport/VehicleRegistration.aspx/InsertTransportData',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) { },
            error: function (a, b, c) {
                $('#g207').hide();
                $("#btnSubmit").prop('disabled', false);
                result = false;
                alertPopup("<br>Could Not Save the Application, Please try again.", "5. " + a.responseText);
            }
        })
    ).then(function (data, textStatus, jqXHR) {
        var obj = jQuery.parseJSON(data.d);
        var html = "";
        var status = obj.Status;

        AppID = obj.AppID;
        result = true;
        if (AppID == "" || AppID == null) {
            $('#g207').hide();
            $("#btnSubmit").prop('disabled', false);
            result = false;
            alertPopup("Form Submission Failed", "<BR> Something Went Wrong. <BR> Error While Submitting Application. <BR> Please Try Again!!!.");
        }
        else {
            if (status == "Success") {
                $('#g207').hide();
                window.location.href = AppID;
            }
        }
    });
    return false;
}


function ReturnSubmit()
{
    var qs = getQueryStrings();
    var uid = qs["UID"];
    window.location = '/WebAppUK/DashboardV3/Dashboard.aspx?UID=' + uid;
}


function Reset()
{
    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];
    var dpt = qs["DPT"];
    var dist = qs["DIST"];
    var blk = qs["BLK"];
    var pan = qs["PAN"];
    var ofc = qs["OFC"];
    var ofr = qs["OFR"];

    window.location.href = '/WebAppUK/Transport/VehicleRegistration.aspx?SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr + '&UID=' + uid + '';
}


function Declaration(chk)
{
    $('#btnSubmit').prop('disabled', true);
    if (chk)
    {
        var name = $('#HDNFNM').val();
        if (name == '' || name == null)
        {
            alertPopup("Declaration Check", "Please Enter Your Full Name.");
            $('#chkDeclaration').prop('checked', false);
        }
        else
        {
            $("#lblUName").html(name);
            $('#btnSubmit').prop('disabled', false);
            $("#divDeclaration").show(800);
        }
    }
    else
    {
        $("#lblUName").html("");
        $('#btnSubmit').prop('disabled', true);
        $("#divDeclaration").hide(800);
    }
}

// ********************* VALIDATION CHECK ****************** //

function AlphaNumeric(e)
{
    var regex = new RegExp("[ A-Za-z0-9.()-/ ]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key))
    {
        e.returnValue = false;
        if (e.preventDefault)
        {
            e.preventDefault();
        }
    }
}


function ValiateEmail()
{
    var EmailID = $("#txtEmailID");
    if (EmailID.val() != '')
    {
        var emailmatch = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (!emailmatch.test(EmailID.val()))
        {
            $("#txtEmailID").val('');
            EmailID.attr('style', 'border:2px solid #d03100 !important;');
            EmailID.css({ "background-color": "#fff2ee" });
            alertPopup("Email Validation", "<BR>" + " \u002A" + " Please Enter EmailID In Proper Format.")
        }
        else
        {
            EmailID.attr('style', 'border:2px solid green !important;');
            EmailID.css({ "background-color": "#ffffff" });
        }
    }
}


function CheckPinCode()
{
    var text = "";
    var opt = "";
    var mobileno = $("#txtPinCode").val();
    if (mobileno != null)
    {
        if (isNaN(mobileno) || mobileno.indexOf(" ") != -1)
        {
            text += "<br /> Please Enter A Valid Pincode.";
            //alertPopup("Mobile Number", "</BR> Please Enter Valid Mobile Number.");
            opt = 1;
        }
        if (mobileno.length > 6 || mobileno.length < 6)
        {
            text += "<br /> Pincode No. Should Be Atleast 6 Digit.";
            //alertPopup("Mobile Number", "</BR> Mobile No. Should Be 10 Digit.");
            opt = 1;
        }
    }
    if (opt == "1")
    {
        alertPopup("Please Fill The Following Information.", text);
        $("#txtPinCode").val("");

        return false;
    }
    return true;
}


function PinCodeValidation()
{
    var PinCode = $('#txtPincode').val();
    if (PinCode.length >= 6)
    {
        $('#txtPincode').attr('style', 'border:2px solid green !important;');
        $('#txtPincode').css({ "background-color": "#ffffff" });
        return true;
    }
    else
    {
        alertPopup("Pincode Validation", "<BR><BR> Please Enter 6 Digit Pincode.");
        $('#txtPincode').val('');
        $('#txtPincode').attr('style', 'border:2px solid red !important;');
        $('#txtPincode').css({ "background-color": "#fff2ee" });
        return false;
    }
}


function allowBackspace(evt)
{
    var e = evt;
    Name = (e.which) ? e.which : event.keyCode;
    //    console.log( e.keyCode );
    if (Name.keyCode >= 37 && Name.keyCode <= 40)
    {
        return; // arrow keys
    }
    if (Name.keyCode === 8 || Name.keyCode === 46)
    {
        return; // backspace / delete
    }
    Name.preventDefault();
} false;


function ForName(e)
{
    var regex = new RegExp("[ A-Za-z.]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);
    if (!regex.test(key))
    {
        e.returnValue = false;
        if (e.preventDefault)
        {
            e.preventDefault();
        }
    }
}


function numericspecialchar(e)
{
    var regex = new RegExp("[0-9:/-]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key))
    {
        e.returnValue = false;
        if (e.preventDefault)
        {
            e.preventDefault();
        }
    }
}


$(document).on("contextmenu", function (e)
{
    e.preventDefault();
});


$(document).keydown(function (event)
{
    if (event.keyCode == 123)
    {
        return false;
    }
    else if (event.ctrlKey &&
        (event.keyCode === 67 ||
            event.keyCode === 86 ||
            event.keyCode === 85 ||
            event.keyCode === 117))
    {
        //alert('not allowed');
        return false;
    }
    else if (event.ctrlKey && event.shiftKey && event.keyCode == 73)
    {
        return false;  //Prevent from ctrl+shift+i
    }
});


function EmailValidation()
{
    var emailid = document.getElementById('txtEmailID').value;
    //var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-z/A-Z]+\.)+[a-z/A-Z]{1,3})(\]?))$/;
    //var reg = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    var reg = /[a-zA-Z0-9\.\-]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
    if (emailid.match(reg))
    {
        $('#txtEmailID').attr('style', 'border:2px solid green !important;');
        $('#txtEmailID').css({ "background-color": "#ffffff" });
    }
    else
    {
        alertPopup("Email-ID Information.", "</BR> Please Enter Valid Email-ID, In Proper Format");
        $('#txtEmailID').attr('style', 'border:2px solid red !important;');
        $('#txtEmailID').val('');
    }
}


function MobileValidation(ContrlID)
{
    var text = "";
    var opt = "";

    var mobileno = $(ContrlID).val();

    if (isNaN(mobileno) || mobileno.indexOf(" ") != -1)
    {
        text += "<br/>" + " \u002A" + " Please Enter A Valid Mobile Number.";
        //alertPopup("Mobile Number", "</BR> Please Enter Valid Mobile Number.");
        $(ContrlID).attr('style', 'border:2px solid red !important;');
        $(ContrlID).css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    if (mobileno.length > 10 || mobileno.length < 10)
    {
        text += "<br/>" + " \u002A" + " Mobile No. Should Be Atleast 10 Digit.";
        //alertPopup("Mobile Number", "</BR> Mobile No. Should Be 10 Digit.");
        $(ContrlID).attr('style', 'border:2px solid red !important;');
        $(ContrlID).css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    if (!(mobileno.charAt(0) == "6" || mobileno.charAt(0) == "9" || mobileno.charAt(0) == "8" || mobileno.charAt(0) == "7"))
    {
        text += "<br/>" + " \u002A" + " Mobile No. Should Start With 6,7,8 or 9.";
        //alertPopup("Mobile Number", "</BR> Mobile No. Should Starts Sith 9 ,8 or 7");
        $(ContrlID).attr('style', 'border:2px solid red !important;');
        $(ContrlID).css({ "background-color": "#fff2ee" });
        opt = 1;
    }

    if (opt == "1")
    {
        alertPopup("Mobile Information.", text);
        $(ContrlID).val("");
        return false;
    }
    $(ContrlID).attr('style', 'border:2px solid green !important;');
    $(ContrlID).css({ "background-color": "#ffffff" });
    return true;
}


function AllowIFSC()
{
    var ifsc = document.getElementById('IFSCCode').value;
    var reg = /^[A-Z|a-z]{4}[0][\w]{6}$/;
    if (ifsc.match(reg))
    {

        $('.IFSCCode').css("border-color", "none")
        $('.forerrormsg').html("")
        return true;
    }
    else
    {
        //alert("You Entered Wrong IFSC Code");
        $('.IFSCCode').css("border-color", "#dc1717")
        $('.forerrormsg').html("Please Enter Correct  IFSC Code")
        return false;
    }
}


function GetAge()
{
    var t_DOB = $("#txtDOB").val();
    if (t_DOB != "" && t_DOB != null)
    {
        var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
        var selectedYear = S_date.getFullYear();
        var Age = AgeCalculate(t_DOB);
        $('#txtAge').val(Age);
        //var dNow = new Date();
        //var localdate = (dNow.getDate() + '/' + dNow.getMonth() + 1) + '/' + dNow.getFullYear();
        var fullDate = new Date()
        var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);
        if (fullDate.getDate() <= 9)
        {
            var twoDigitDay = ((fullDate.getDate().length + 1) === 1) ? (fullDate.getDate() + 1) : '0' + (fullDate.getDate());
        }
        else
        {
            var twoDigitDay = ((fullDate.getDate().length + 1) === 1) ? (fullDate.getDate() + 1) : + (fullDate.getDate());
        }
        //var currentDate = fullDate.getDate() + "/" + twoDigitMonth + "/" + fullDate.getFullYear();
        var currentDate = twoDigitDay + "/" + twoDigitMonth + "/" + fullDate.getFullYear();

        var Age = calcExSerDur(t_DOB, currentDate);
        $('#txtAge').val(Age.years);
        $("#txtYear").val(Age.years);
        $("#txtMonth").val(Age.months);
        $("#txtDay").val(Age.days);
        $("#txtAge").val("Years: " + Age.years + " | Months: " + Age.months + " | Days: " + Age.days);
    }
}


var dat = new Date();
var curday = dat.getDate();
var curmon = dat.getMonth() + 1;
var curyear = dat.getFullYear();

function checkleapyear(datea)
{

    datea.Date = new Date();
    if (datea.getyear() % 4 == 0)
    {
        if (datea.getyear() % 10 != 0)
        {
            return true;
        } else
        {
            if (datea.getyear() % 400 == 0)
                return true;
            else
                return false;
        }
    }
    return false;
}


function DaysInMonth(Y, M)
{
    with (new Date(Y, M, 1, 12))
    {
        setDate(0);
        return getDate();
    }
}


function datedif(date1, date2)
{
    var y1 = date1.getFullYear(),
        m1 = date1.getMonth(),
        d1 = date1.getDate(),
        y2 = date2.getFullYear(),
        m2 = date2.getMonth(),
        d2 = date2.getDate();
    if (d1 < d2)
    {
        m1--;
        d1 += DaysInMonth(y2, m2);
    }
    if (m1 < m2)
    {
        y1--;
        m1 += 12;
    }
    return [y1 - y2, m1 - m2, d1 - d2];
}


function AgeCalculate(dob)
{
    var D1 = dob.split('/');
    var calyear = D1[0];
    var calmon = D1[1];
    var calday = D1[2];
    var curd = new Date(curyear, curmon - 1, curday);
    var cald = new Date(calyear, calmon - 1, calday);
    var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) - Date.UTC(calyear, calmon, calday, 0, 0, 0);
    var dife = datediff(curd, cald);
    return dife[0];
}


function calcDobAge(dateTo)
{
    var dateFrom = new Date();
    return calcYMDAge(dateFrom, dateTo);
}

function calcExSerDur(dateOld, dateNew)
{

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

function calcYMDAge(dateFrom, dateTo)
{
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
    else
    {
        yearAge--;
        var monthAge = 12 + monthNow - monthDob;
    }

    if (dateNow >= dateDob)
        var dateAge = dateNow - dateDob;
    else
    {
        monthAge--;
        var dateAge = 31 + dateNow - dateDob;

        if (monthAge < 0)
        {
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


function ValidateAlpha(evt)
{
    //var Name = $('#AccountHolder').val();
    //var charCode;
    var e = evt; // for trans-browser compatibility
    Name = (e.which) ? e.which : event.keyCode;
    //charCode = (evt.which) ? evt.which : event.keyCode;
    if (Name >= 97 && Name <= 122 || Name >= 65 && Name <= 90 || Name == 8 || Name == 32)
    {
        return true;
    }
    else
    {
        return false;
    }
}


function AlphaNumeric(e)
{
    var regex = new RegExp("[ A-Za-z0-9]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key))
    {
        e.returnValue = false;
        if (e.preventDefault)
        {
            e.preventDefault();
        }
    }
}


function AlphaNumericIdentity(evt)
{
    var IdentityDetail = $('#ddlIdentification').val();
    var identityno = $("#txtidentificationid").val();
    if (IdentityDetail == 'AadhaarCard')
    {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57))
        {
            $("#txtidentificationid").val("");
            return false;
        }
        return true;
    }
    if (IdentityDetail == 'Pancard')
    {
        var regex = new RegExp("[ A-Za-z0-9]");
        var key = e.keyCode || e.which;
        key = String.fromCharCode(key);

        if (!regex.test(key))
        {
            e.returnValue = false;
            if (e.preventDefault)
            {
                e.preventDefault();
                $("#txtidentificationid").val("");
            }
        }
    }
    if (IdentityDetail == 'Voter ID' || IdentityDetail == 'DrivingLicence')
    {
        var regex = new RegExp("[ A-Za-z0-9]");
        var key = e.keyCode || e.which;
        key = String.fromCharCode(key);

        if (!regex.test(key))
        {
            e.returnValue = false;
            if (e.preventDefault)
            {
                e.preventDefault();
            }
        }
    }
}


function isNumber(evt)
{
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57))
    {
        return false;
    }
    return true;
}


function isNumberKey(evt, inputName)
{
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (!isNum(charCode)) return false;
    return true;
}