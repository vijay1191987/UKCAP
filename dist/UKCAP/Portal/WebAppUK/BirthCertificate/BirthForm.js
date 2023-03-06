
$(document).ready(function () {

    GetState();
    //GetUKDistrict();
     BeneficiaryState2();
    //GetUKDistrict2();

    $('#divmuncipality').hide();

    BeneficiaryState2();

    $('#NoOfDaysTillBirth').val('');

    $('#DOB').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '-1d',
        yearRange: "-150:+0",
        onSelect: function (date) {
        
           getdays();
        }
    });
});

function getdays() {
   
    var fullDate = new Date();
    var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);
   
    var date1 = $("#DOB").val();
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
    $('#NoOfDaysTillBirth').val(Math.floor(timeDifferenceInDays));
}

function GetAge() {
    var t_DOB = $("#DOB").val();
    if (t_DOB != "" && t_DOB != null) {

        var fullDate = new Date();
        var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);
        var currentDate = twoDigitMonth + "/" + fullDate.getDate() + "/" + fullDate.getFullYear();
            
        days = (currentDate - t_DOB) / (1000 * 60 * 60 * 24);
        $('#NoOfDaysTillBirth').val(Math.floor(days));
        alert(Math.round(days));
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


function ValidateForm() {
   
    var text = "";
    var opt = "";

    var ChildName = $('#txtChildName');
    var DOB = $("#DOB");
    var Gender = $("#ddlGender option:selected").text();
    var FatherName = $("#FatherName");
    var MotherName = $("#MotherName");
    var PlaceOfBirth = $("#PlaceOfBirth");
    var NoOfDaysTillBirth = $("#NoOfDaysTillBirth");
    var Religion = $("#Religion option:selected").text();
    var HospitalName = $("#HospitalName");
    var Address1 = $("#Address1");
    var Address2 = $("#Address2");
    var Street = $("#Street");
    var Landmark = $("#Landmark");
    var Locality = $("#Locality");
    var State = $("#State option:selected").text();
    var District = $("#ddlDistrict option:selected").text();
    var BlockTaluka = $("#BlockTaluka option:selected").text();
    var PanchayatVillageCity = $("#PanchayatVillageCity option:selected").text();

    var BName = $("#BName");
    var BMobile = $("#BMobile");
    var BRelationWithChild = $("#BRelationWithChild");
    var BNationality = $("#BNationality option:selected").text();
    var BLocationType = $("#ContentPlaceHolder1_BLocationType option:selected").text();
    var BAddressOfCareOf = $("#ContentPlaceHolder1_BAddressOfCareOf");
    var BAddressBuilding = $("#ContentPlaceHolder1_BAddressBuilding");
    var BenfState = $("#BenfState option:selected").text();
    var BDistrict = $("#BDistrict option:selected").text();
    var BGramPanchayat=$("ContentPlaceHolder1_BGramPanchayat option:selected").text();

    var BlockTalukaSubDistrict = $("#BBlockTalukaSubDistrict option:selected").text();
    //var BGramPanchayat = $("#BGramPanchayat option:selected").text();
    //var BMunicipality = $("#BMunicipality option:selected").text();




    if (ChildName.val() == '' || ChildName.val() == null) {
        text += "<br /> -Please Enter Name of Child. ";
        ChildName.attr('style', 'border:1px solid #d03100 !important;');
        ChildName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        ChildName.attr('style', '1px solid #cdcdcd !important;');
        ChildName.css({ "background-color": "#ffffff" });
    }
    if (FatherName.val() == '' || FatherName.val() == null) {
        text += "<br /> -Please Enter Father Name ";
        $("#FatherName").attr('style', 'border:1px solid #d03100 !important;');
        $("#FatherName").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#FatherName").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#FatherName").css({ "background-color": "#ffffff" });
    }

    if ((MotherName.val() == '' || MotherName.val() == null)) {
        text += "<br /> -Please Enter Mother Name. ";
        $("#MotherName").attr('style', 'border:1px solid #d03100 !important;');
        $("#MotherName").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#MotherName").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#MotherName").css({ "background-color": "#ffffff" });
    }

    if (Gender == '-Select-' || Gender == "0") {
        text += "<br /> -Please Select Gender. ";
        $("#ddlGender").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlGender").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $("#ddlGender").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlGender").css({ "background-color": "#ffffff" });
    }
    if (DOB.val() == '' || DOB.val() == null) {
        text += "<br /> -Please Enter Date Of Birth. ";
        $("#DOB").attr('style', 'border:1px solid #d03100 !important;');
        $("#DOB").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $("#DOB").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#DOB").css({ "background-color": "#ffffff" });
    }

    if (PlaceOfBirth.val() == '') {
        text += "<br /> -Please Enter Place Of Birth. ";
        PlaceOfBirth.attr('style', 'border:1px solid #d03100 !important;');
        PlaceOfBirth.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        PlaceOfBirth.attr('style', '1px solid #cdcdcd !important;');
        PlaceOfBirth.css({ "background-color": "#ffffff" });
    }

    //if (NoOfDaysTillBirth.val() == '') {
    //    text += "<br /> -Please Enter No Of Days Till Birth. ";
    //    NoOfDaysTillBirth.attr('style', 'border:1px solid #d03100 !important;');
    //    NoOfDaysTillBirth.css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //}
    //else {
    //    NoOfDaysTillBirth.attr('style', '1px solid #cdcdcd !important;');
    //    NoOfDaysTillBirth.css({ "background-color": "#ffffff" });
    //}
    if (BRelationWithChild.val() == '') {
        text += "<br /> -Please Enter Relation With Child. ";
        BRelationWithChild.attr('style', 'border:1px solid #d03100 !important;');
        BRelationWithChild.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        BRelationWithChild.attr('style', '1px solid #cdcdcd !important;');
        BRelationWithChild.css({ "background-color": "#ffffff" });
    }
    if (Religion == '-Select-' || Religion == "0") {
        text += "<br /> -Please Select Religion. ";
        $("#Religion").attr('style', 'border:1px solid #d03100 !important;');
        $("#Religion").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $("#Religion").attr('style', '1px solid #cdcdcd !important;');
        $("#Religion").css({ "background-color": "#ffffff" });
    }

    if (BNationality == '-Select-' || BNationality == "0") {
        text += "<br /> -Please Select Nationality. ";
        $("#BNationality").attr('style', 'border:1px solid #d03100 !important;');
        $("#BNationality").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $("#BNationality").attr('style', '1px solid #cdcdcd !important;');
        $("#BNationality").css({ "background-color": "#ffffff" });
    }
    //if (BLocationType == '-Select-' || BLocationType == "0") {
    //    text += "<br /> -Please Select Location Type. ";
    //    $("#ContentPlaceHolder1_BLocationType").attr('style', 'border:1px solid #d03100 !important;');
    //    $("#ContentPlaceHolder1_BLocationType").css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //}
    //else {
    //    $("#ContentPlaceHolder1_BLocationType").attr('style', '1px solid #cdcdcd !important;');
    //    $("#ContentPlaceHolder1_BLocationType").css({ "background-color": "#ffffff" });
    //}

    if (BAddressOfCareOf.val() == '') {

        text += "<br /> -Please Enter Beneficiary Address Line-1 (Care of). ";
        $('#ContentPlaceHolder1_BAddressOfCareOf').attr('style', 'border:1px solid red !important;');
        $('#ContentPlaceHolder1_BAddressOfCareOf').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ContentPlaceHolder1_BAddressOfCareOf').attr('style', 'border:1px solid #ddd !important;');
        $('#ContentPlaceHolder1_BAddressOfCareOf').css({ "background-color": "#ffffff" });
    }
    if (BAddressBuilding.val() == '') {

        text += "<br /> -Please Enter Beneficiary Address Line-2 (Building). ";
        $('#ContentPlaceHolder1_BAddressBuilding').attr('style', 'border:1px solid red !important;');
        $('#ContentPlaceHolder1_BAddressBuilding').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ContentPlaceHolder1_BAddressBuilding').attr('style', 'border:1px solid #ddd !important;');
        $('#ContentPlaceHolder1_BAddressBuilding').css({ "background-color": "#ffffff" });
    }

    if (BenfState == '-Select State-' || BenfState == "0") {
        text += "<br /> -Please Select Beneficiary State . ";
        $("#BenfState").attr('style', 'border:1px solid #d03100 !important;');
        $("#BenfState").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $("#BenfState").attr('style', '1px solid #cdcdcd !important;');
        $("#BenfState").css({ "background-color": "#ffffff" });
    }
    if (BDistrict == '-Select-' || BDistrict == "0") {
        text += "<br /> -Please Select Beneficiary District . ";
        $("#BDistrict").attr('style', 'border:1px solid #d03100 !important;');
        $("#BDistrict").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $("#BDistrict").attr('style', '1px solid #cdcdcd !important;');
        $("#BDistrict").css({ "background-color": "#ffffff" });
    }
    if (BlockTalukaSubDistrict == '-Select-' || BlockTalukaSubDistrict == "0") {
        text += "<br /> -Please Select Beneficiary Block/Taluka/Sub district . ";
        $("#BBlockTalukaSubDistrict").attr('style', 'border:1px solid #d03100 !important;');
        $("#BBlockTalukaSubDistrict").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $("#BBlockTalukaSubDistrict").attr('style', '1px solid #cdcdcd !important;');
        $("#BBlockTalukaSubDistrict").css({ "background-color": "#ffffff" });
    }


    if ($('#ContentPlaceHolder1_BGramPanchayat').val() == "-Select-" || $('#ContentPlaceHolder1_BGramPanchayat').val() == "0") {
        text += "<br /> -Please Select Beneficiary Gram Panchayat.";
        $('#ContentPlaceHolder1_BGramPanchayat').attr('style', 'border:1px solid red !important;');
        $('#ContentPlaceHolder1_BGramPanchayat').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ContentPlaceHolder1_BGramPanchayat').attr('style', 'border:1px solid #ddd !important;');
        $('#ContentPlaceHolder1_BGramPanchayat').css({ "background-color": "#ffffff" });
    }

    //if (BLocationType == "-Select-" || BLocationType == "0") {

    //    text += "<br /> -Please Enter Municipality/Patvari Chowki. ";
    //    $('#ContentPlaceHolder1_BMunicipality').attr('style', 'border:1px solid red !important;');
    //    $('#ContentPlaceHolder1_BMunicipality').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //}
    //else {
    //    $('#ContentPlaceHolder1_BMunicipality').attr('style', 'border:1px solid #ddd !important;');
    //    $('#ContentPlaceHolder1_BMunicipality').css({ "background-color": "#ffffff" });
    //}


    var PinCode = $("#HPinCode");

    var BPinCode = $("#BPincode");
    if (BPinCode.val() == '') {
        text += "<br /> -Please Enter  Benifisary Pincode. ";
        BPinCode.attr('style', 'border:1px solid #d03100 !important;');
        BPinCode.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        BPinCode.attr('style', '1px solid #cdcdcd !important;');
        BPinCode.css({ "background-color": "#ffffff" });
    }
  
  

    if (HospitalName.val() == '') {
        text += "<br /> -Please Enter Name Of Hospital. ";
        HospitalName.attr('style', 'border:1px solid #d03100 !important;');
        HospitalName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        HospitalName.attr('style', '1px solid #cdcdcd !important;');
        HospitalName.css({ "background-color": "#ffffff" });
    }
    if (Address1.val() == '') {
        text += "<br /> -Please Enter Hospital Address Line-1 (Care Of) . ";
        Address1.attr('style', 'border:1px solid #d03100 !important;');
        Address1.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        Address1.attr('style', '1px solid #cdcdcd !important;');
        Address1.css({ "background-color": "#ffffff" });
    }
    if (Address2.val() == '') {
        text += "<br /> -Please Enter Hospital Address Line-2 (Building) . ";
        Address2.attr('style', 'border:1px solid #d03100 !important;');
        Address2.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        Address2.attr('style', '1px solid #cdcdcd !important;');
        Address1.css({ "background-color": "#ffffff" });
    }
    if (Street.val() == '') {
        text += "<br /> -Please Enter Road/Street Name . ";
        Street.attr('style', 'border:1px solid #d03100 !important;');
        Street.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        Street.attr('style', '1px solid #cdcdcd !important;');
        Street.css({ "background-color": "#ffffff" });
    }
    if (Landmark.val() == '') {
        text += "<br /> -Please Enter Landmark . ";
        Landmark.attr('style', 'border:1px solid #d03100 !important;');
        Landmark.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        Landmark.attr('style', '1px solid #cdcdcd !important;');
        Landmark.css({ "background-color": "#ffffff" });
    }
    if (Locality.val() == '') {
        text += "<br /> -Please Enter Locality . ";
        Locality.attr('style', 'border:1px solid #d03100 !important;');
        Locality.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        Locality.attr('style', '1px solid #cdcdcd !important;');
        Locality.css({ "background-color": "#ffffff" });
    }
    //State 1
    if (State == '-Select State-' || State == "0") {
        text += "<br /> -Please Select State . ";
        $("#State").attr('style', 'border:1px solid #d03100 !important;');
        $("#State").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $("#State").attr('style', '1px solid #cdcdcd !important;');
        $("#State").css({ "background-color": "#ffffff" });
    }
    if (District == '-Select-' || District == "0") {
        text += "<br /> -Please Select District . ";
        $("#ddlDistrict").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlDistrict").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $("#ddlDistrict").attr('style', '1px solid #cdcdcd !important;');
        $("#ddlDistrict").css({ "background-color": "#ffffff" });
    }
    if (BlockTaluka == '-Select-' || BlockTaluka == "0") {
        text += "<br /> -Please Select Block/Taluka . ";
        $("#BlockTaluka").attr('style', 'border:1px solid #d03100 !important;');
        $("#BlockTaluka").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $("#BlockTaluka").attr('style', '1px solid #cdcdcd !important;');
        $("#BlockTaluka").css({ "background-color": "#ffffff" });
    }
    if (PanchayatVillageCity == '-Select-' || PanchayatVillageCity == "0") {
        text += "<br /> -Please Select Panchayat/Village/City. ";
        $("#PanchayatVillageCity").attr('style', 'border:1px solid #d03100 !important;');
        $("#PanchayatVillageCity").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
        //End 
    else {
        $("#PanchayatVillageCity").attr('style', '1px solid #cdcdcd !important;');
        $("#PanchayatVillageCity").css({ "background-color": "#ffffff" });
    }
    if (PinCode.val() == '') {
        text += "<br /> -Please Enter  Hospital Pincode. ";
        PinCode.attr('style', 'border:1px solid #d03100 !important;');
        PinCode.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        PinCode.attr('style', '1px solid #cdcdcd !important;');
        PinCode.css({ "background-color": "#ffffff" });
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }

    return true;
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
function SubmitData() {
    if (!ValidateForm()) {
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
        'SvcID': svcid,

        'ChildName': $('#txtChildName').val(),
        'DOB': $('#DOB').val(),
        'Gender': $('#ddlGender').val(),
        'FatherName': $('#FatherName').val(),
        'MotherName': $('#MotherName').val(),
        'PlaceOfBirth': $('#PlaceOfBirth').val(),
        'NoOfDaysTillBirth': $('#NoOfDaysTillBirth').val(),
        'Religion': $('#Religion').val(),

        'HospitalName': $('#HospitalName').val(),
        'Address1': $('#Address1').val(),
        'Address2': $('#Address2').val(),
        'Street': $('#Street').val(),
        'Landmark': $('#Landmark').val(),
        'Locality': $('#Locality').val(),
        'State': $('#State').val(),

        'District': $('#ddlDistrict').val(),
        'BlockTaluka': $('#BlockTaluka').val(),
        'PanchayatVillageCity': $('#PanchayatVillageCity').val(),

        'PinCode': $('#HPinCode').val(),
        'BName': $('#BName').val(),
        'BMobile': $('#BMobile').val(),
        'BRelationWithChild': $('#BRelationWithChild').val(),
        'BNationality': $('#BNationality').val(),


        'BLocationType': $('#ContentPlaceHolder1_BLocationType').val(),
        'BAddressOfCareOf': $('#ContentPlaceHolder1_BAddressOfCareOf').val(),
        'BAddressBuilding': $('#ContentPlaceHolder1_BAddressBuilding').val(),

        'BState': $('#BenfState').val(),
        'BDistrict': $('#BDistrict').val(),
        'BBlockTalukaSubDistrict': $('#BBlockTalukaSubDistrict').val(),
        'BGramPanchayat': $('#ContentPlaceHolder1_BGramPanchayat').val(),
        'BMunicipality': $('#ContentPlaceHolder1_BMunicipality').val(),

        'BPincode': $('#BPincode').val(),

    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": JSON.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebAppUK/BirthCertificate/BirthForm.aspx/BirthCertificate',
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
function fnSearchData() {
    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];

    if (uid != "" || uid != null) {
       
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebAppUK/BirthCertificate/BirthForm.aspx/SearchCitizenData',
            data: '{"ServiceID":"' + svcid + '","UID":"' + uid + '"}',
            processData: false,
            dataType: "json",
            success: function (data) {

                var obj = jQuery.parseJSON(data.d);
                var html = "";
                if (obj[0] != null) {

                    $('#ContentPlaceHolder1_BName').val(obj[0]["ApplicantName"]);
                    $('#ContentPlaceHolder1_BMobile').val(obj[0]["MobileNo"]);
                    $('#ContentPlaceHolder1_BAddressOfCareOf').val(obj[0]["FatherName"]);
                    $('#ContentPlaceHolder1_BAddressBuilding').val(obj[0]["FullAddress"]);
                    $('#BenfState').val(obj[0]["state"]);

                }
            },
            error: function (a, b, c) {
                result = false;
                alert("5." + a.responseText);
            }
        });
    }
}
function GetState() {
   
    var SelState = $('#State').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/webapp/Registration/KioskRegistration.aspx/GetState",
        data: '{"prefix": ""}',
        dataType: "json",
        success: function (r) {
            var arr = eval(r.d);
            var ddlCustomers = $("[id*=State]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select State-</option>');
            $.each(arr, function () {
                $("[id*=State]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });

            $('#State').val("5");
            GetUKDistrict();
        }
    });
}
function GetUKDistrict() {
  
    var SelState = $('#State').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
        data: '{"prefix":"","StateCode":"' + SelState + '"}',
        dataType: "json",
        success: function (r) {
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
 
    var SelBlock1 = $('#ddlDistrict').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict",
        data: '{"prefix":"","DistrictCode":"' + SelBlock1 + '"}',
        dataType: "json",
        success: function (r) {
            var arr = eval(r.d);
            var ddlCustomer1 = $("[id=BlockTaluka]");
            ddlCustomer1.empty().append('<option selected="selected" value="0">-Select SubDistrict-</option>');
            $.each(arr, function () {
                $("[id=BlockTaluka]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

function GetUKPanchayat() {
 
    var SelSubDistrict = $('#BlockTaluka').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Registration/KioskRegistration.aspx/GetVillage",
        data: '{"prefix":"","SubDistrictCode":"' + SelSubDistrict + '"}',
        dataType: "json",
        success: function (r) {
             var arr = eval(r.d);
            var ddlCustomers = $("[id*=PanchayatVillageCity]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select Gram Panchayat-</option>');
            $.each(arr, function () {
                $("[id*=PanchayatVillageCity]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

//
function BeneficiaryState2() {
    var SelState = $('#BenfState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/webapp/Registration/KioskRegistration.aspx/GetState",
        data: '{"prefix": ""}',
        dataType: "json",
        success: function (r) {
            var arr = eval(r.d);
            var ddlCustomers = $("[id*=BenfState]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select State-</option>');
            $.each(arr, function () {
                $("[id*=BenfState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');                
            });

            $('#BenfState').val("5");
            GetUKDistrict2();
        }
    });
}

function GetUKDistrict2() {
    var SelState = $('#BenfState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
        data: '{"prefix":"","StateCode":"' + SelState + '"}',
        dataType: "json",
        success: function (r) {
            var arr = eval(r.d);
            var ddlCustomers = $("[id*=BDistrict]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select District-</option>');
            $.each(arr, function () {
                $("[id*=BDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');

            });
        }
    });
}

function GetUKBlock2() {
    var SelBlock2 = $('#BDistrict').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict",
        data: '{"prefix":"","DistrictCode":"' + SelBlock2 + '"}',
        dataType: "json",
        success: function (r) {
            var arr = eval(r.d);
            var ddlCustomer2 = $("[id*=BBlockTalukaSubDistrict]");
            ddlCustomer2.empty().append('<option selected="selected" value="0">-Select SubDistrict-</option>');
            $.each(arr, function () {
                $("[id*=BBlockTalukaSubDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

function GetUKPanchayat2() {
  
    var SelSubDistrict = $('#BBlockTalukaSubDistrict').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Registration/KioskRegistration.aspx/GetVillage",
        data: '{"prefix":"","SubDistrictCode":"' + SelSubDistrict + '"}',
        dataType: "json",
        success: function (r) {
            var arr = eval(r.d);
            var ddlCustomers = $("[id*=ContentPlaceHolder1_BGramPanchayat]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select Gram Panchayat-</option>');
            $.each(arr, function () {
                $("[id*=ContentPlaceHolder1_BGramPanchayat]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

function onlyNumbers(evt) {
    flag = false
    var e = evt; // for trans-browser compatibility
    var charCode = e.which || e.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        //alert("Only numbers are allowed");
        return false;
    }
    return true;
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


//function Locationchange() {
//    var locationtype = $('#ddllocationtype').val();
//    var panchayat = $('#ddlpanchayat').val();


//    if (locationtype != "0" || locationtype != "-Select Location Type-") {
//        if (locationtype == "rural") {
//            $('#divPanchayat').show();

//        }
//        else {
//            $('#divPanchayat').show();
//        }

//        if (locationtype == "urban") {
//            $('#divPanchayat').show();

//        }
//        else {
//            $('#divPanchayat').show();
//        }
//    }
//    if (locationtype == "0" || locationtype == "-Select Location Type-") {
//        $('#divPanchayat').show();
//        $('#divPanchayat').show();
//    }
//}


function checkmobile() {
    var text = "";
    var opt = "";
    var mobileno = $("#ContentPlaceHolder1_BMobile").val();
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
        $("#ContentPlaceHolder1_BMobile").val("");

        return false;
    }
    return true;
}

function checkBpincode() {
    var text = "";
    var opt = "";
    var mobileno = document.getElementById('BPincode').value;//$('#BPincode').val();
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
        $("#BPincode").val("");

        return false;
    }
    return true;
}

function checkHpincode() {
    var text = "";
    var opt = "";
    var mobileno = $("#HPinCode").val();
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
        $("#HPinCode").val("");

        return false;
    }
    return true;
}
function Alphanumericspecialchar(e) {

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