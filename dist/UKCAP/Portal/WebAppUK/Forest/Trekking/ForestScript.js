$(document).ready(function ()
{
    $("#btnSubmit2").prop('disabled', true);

    GetDivisionList();

    $('#txtFromDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        //maxDate: '-1d',
        minDate: '+1',
        yearRange: "-1:+1",
        onSelect: function (date)
        {
            if ($('#ddlArea').val() != "0")
            {
                var Duration = $('#ddlArea').val();
                var TrackngDays = Duration.split("-");
                TrackngDays = TrackngDays[1];
                TrackngDays = parseInt(TrackngDays[1]);
            }
            var dt2 = $('#txtToDate');
            var startDate = $(this).datepicker('getDate');
            var minDate = $(this).datepicker('getDate');
            //dt2.datepicker('setDate', minDate);
            //startDate.setDate(startDate.getDate() + 30);
            startDate.setDate(startDate.getDate() + TrackngDays);//01//
            ////sets dt2 maxDate to the last day of 30 days window
            //dt2.datepicker('option', 'maxDate', startDate);
            //dt2.datepicker('option', 'minDate', minDate); // Start Date From Date 1
            //$(this).datepicker('option', 'minDate', minDate);
            dt2.datepicker('option', 'minDate', startDate); //01/Set Date From Specific Date
            dt2.datepicker('option', 'maxDate', startDate);
            dt2.datepicker("setDate", startDate);
        }
    });

    $('#txtToDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        //maxDate: '-1d',
        minDate: '+1',
        yearRange: "-1:+1",
        onSelect: function (date)
        {
            //GetAge();
        }
    });

    $('#DateOfBirth').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '-1',
        yearRange: "-70:+40",
        onSelect: function (date)
        {
            GetAge();
        }
    });

   

    $("#divDeclaration").hide(800);

    //$('#ddlItemType').change(function ()
    $('#ddlNationality').bind("change", function (e)
    {
        if ($('#ddlNationality').val() == "Indian")
        {
            $('#ddlIDProofType').val('0');
            $('#ddlIDProofDetail').val('');
            $('#txtTrackingFee').val('150');
            $('#ddlIDProofDetail').prop('disabled', false);
            $('#ddlIDProofType').prop('disabled', false);
            $("option[value='AadhaarCard']").attr('style', 'display: block !important;');
            $("option[value='VoterCard']").attr('style', 'display: block !important;');
            $("option[value='Passport']").attr('style', 'display: block !important;');
            $("option[value='DrivingLicence']").attr('style', 'display: block !important;');
            $("option[value='GovernmentID']").attr('style', 'display: block !important;');
            $("option[value='CountryID']").attr('style', 'display: none !important;');
        }
        else if ($('#ddlNationality').val() == "Others")
        {
            $('#ddlIDProofType').val('0');
            $('#ddlIDProofDetail').val('');
            $('#txtTrackingFee').val('600');
            $('#ddlIDProofDetail').prop('disabled', false);
            $('#ddlIDProofType').prop('disabled', false);
            $("option[value='AadhaarCard']").attr('style', 'display: none !important;');
            $("option[value='VoterCard']").attr('style', 'display: none !important;');
            $("option[value='Passport']").attr('style', 'display: block !important;');
            $("option[value='DrivingLicence']").attr('style', 'display: none !important;');
            $("option[value='GovernmentID']").attr('style', 'display: none !important;');
            $("option[value='CountryID']").attr('style', 'display: block !important;');
        }
        else
        {
            $('#ddlIDProofDetail').prop('disabled', true);
            $('#ddlIDProofType').prop('disabled', true);
            $('#txtTrackingFee').val('');
        }
    });

    $('#ddlIDProofType').bind("change", function (e)
    {
        $('#ddlIDProofDetail').val('');
    });

    fnSearchData();
    GetCircleList();

});

function GetCircleList() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/Forest/construction/constructionnocform.aspx/GetCircleList",
        data: '{}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var catCount = 0;
            var ddlCircle = $("[id=ddlCircle]");
            ddlCircle.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=ddlCircle]").append('<option value = "' + this.FCircleCode + '">' + this.FCirclename + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetDivisionList2() {
    var SelState = $('#ddlCircle').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/Forest/construction/constructionnocform.aspx/GetDivisionList",
        data: '{"prefix":"","CircleCode":"' + SelState + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            var ddlDivision2 = $("[id=ddlDivision2]");
            ddlDivision2.empty().append('<option selected="selected" value="0">--Select--</option>');
            $.each(Category, function () {
                $("[id=ddlDivision2]").append('<option value = "' + this.FDivisioncode + '">' + this.FDivisionname + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetRangeList() {
    var SelState = $('#ddlDivision2').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/Forest/construction/constructionnocform.aspx/GetRangeList",
        data: '{"prefix":"","DivisionCode":"' + SelState + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            var ddlRange = $("[id=ddlRange]");
            ddlRange.empty().append('<option selected="selected" value="0">--Select--</option>');
            $.each(Category, function () {
                $("[id=ddlRange]").append('<option value = "' + this.RangeCode + '">' + this.RangeName + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GettourDetails() {
    var qs = getQueryStrings();
    var uid = $('#ddlDivision').val();
    var TourOperator = $('#ddlTourOperator').val();

    if (uid != "" || uid != null) {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/WebAppUK/Forest/Trekking/TrackingForm.aspx/SearchTourData",
            data: '{"ServiceID":"' + TourOperator + '","UID":"' + uid + '"}',
            processData: false,
            dataType: "json",
            success: function (data) {
                var obj = jQuery.parseJSON(data.d);
                if (obj[0] != null) {
                    $('#txtTourName').val(obj[0]["ManagingDirector"]);
                    $('#txtTourMobileNo').val(obj[0]["MobileNo"]);
                }
            },
            error: function (a, b, c) {
                result = false;
                alert("5." + a.responseText);
            }
        });
    }
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

function getTrakkingDays()
{
    $('#txtFromDate').val('');
    $('#txtToDate').val('');
    if ($('#ddlArea').val() != "0")
    {
        var Duration = $('#ddlArea').val();
        var TrackngDays = Duration.split("-");
        TrackngDays = TrackngDays[1];
    }
}


function fnSearchData()
{
    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];

    if (uid != "" || uid != null)
    {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",

            url: '/WebAppUK/DomicileCertificate/DomicileForm.aspx/SearchCitizenData',
            data: '{"ServiceID":"' + svcid + '","UID":"' + uid + '"}',
            processData: false,
            dataType: "json",
            success: function (data)
            {
                var obj = jQuery.parseJSON(data.d);
                if (obj[0] != null)
                {
                    $('#txtFullName').val(obj[0]["ApplicantName"]);
                    $('#HDNFNM').val(obj[0]["ApplicantName"]);
                    $('#txtFatherSpouseName').val(obj[0]["FatherName"]);
                    $('#ddlGender').val(obj[0]["Gender"]);
                    $('#txtMobileNo').val(obj[0]["MobileNo"]);
                    $('#txtEmailID').val(obj[0]["EmailId"]);

                    var DOB = "";
                    DOB = obj[0]["DOB"];
                    DOB = DOB.split("-");
                    if (DOB[0].length == 4) {
                        DOB = DOB[2] + "/" + DOB[1] + "/" + DOB[0];
                    }
                    else {
                        DOB = DOB[0] + "/" + DOB[1] + "/" + DOB[2];
                    }

                    $('#DateOfBirth').val(DOB);
                    GetAge();

                    //$("input:radio[name='radio4']:checked").val();

                    //GetStateAsPerValue(obj[0]["StateCode"], obj[0]["DistrictCode"], obj[0]["BlockTalukaCode"], obj[0]["PanchayatVillageCode"]);
                }
            },
            error: function (a, b, c)
            {
                result = false;
                alert("5." + a.responseText);
            }
        });
    }
    debugger;
//    BindAppleteAuthority2("", svcid);
}


function GetState()
{
    var SelState = $('#ddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/webapp/Registration/KioskRegistration.aspx/GetState",
        data: '{"prefix": ""}',
        dataType: "json",
        success: function (response)
        {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            var ddlState = $("[id=ddlState]");
            ddlState.empty().append('<option selected="selected" value="0">--Select--</option>');
            $.each(Category, function ()
            {
                $("[id*=State]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //$('#State').val("05");
                catCount++;
            });
        },
        error: function (a, b, c)
        {
            alert("2." + a.responseText);
        }
    });
}


function GetDistrict()
{
    var SelState = $('#ddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
        data: '{"prefix":"","StateCode":"' + SelState + '"}',
        dataType: "json",
        success: function (response)
        {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            var ddlDistrict = $("[id=ddlDistrict]");
            ddlDistrict.empty().append('<option selected="selected" value="0">--Select--</option>');
            $.each(Category, function ()
            {
                $("[id=ddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c)
        {
            alert("2." + a.responseText);
        }
    });
}


function GetBlock()
{
    var SelBlock = $('#ddlDistrict').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict",
        data: '{"prefix":"","DistrictCode":"' + SelBlock + '"}',
        dataType: "json",
        success: function (response)
        {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            var ddlBlock = $("[id=ddlTaluka]");
            ddlBlock.empty().append('<option selected="selected" value="0">--Select--</option>');
            $.each(Category, function ()
            {
                $("[id=ddlTaluka]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c)
        {
            alert("2." + a.responseText);
        }
    });
}


function GetPanchayat()
{
    var SelSubDistrict = $('#ddlTaluka').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Registration/KioskRegistration.aspx/GetVillage",
        data: '{"prefix":"","SubDistrictCode":"' + SelSubDistrict + '"}',
        dataType: "json",
        success: function (response)
        {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            var ddlVillage = $("[id=ddlVillage]");
            ddlVillage.empty().append('<option selected="selected" value="0">--Select--</option>');
            $.each(Category, function ()
            {
                $("[id=ddlVillage]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c)
        {
            alert("2." + a.responseText);
        }
    });
}


function GetDivisionList()
{
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/Forest/Trekking/TrackingForm.aspx/GetDivisionList",
        data: '{}',
        dataType: "json",
        success: function (response)
        {
            var Category = eval(response.d);
            var catCount = 0;
            var ddlDivision = $("[id=ddlDivision]");
            ddlDivision.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function ()
            {
                $("[id=ddlDivision]").append('<option value = "' + this.DivisionCode + '">' + this.DivisionName + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c)
        {
            alert("2." + a.responseText);
        }
    });
}


function GetSubDivisionList()
{
    var DivisionCode = $("#ddlDivision").val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/Forest/Trekking/TrackingForm.aspx/GetSubDivisionList",
        data: '{"DivisionCode":"' + DivisionCode + '"}',
        dataType: "json",
        success: function (response)
        {
            var Category = eval(response.d);
            var catCount = 0;
            var ddlSubDivision = $("[id=ddlArea]");
            ddlSubDivision.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function ()
            {
                $("[id=ddlArea]").append('<option value = "' + this.SubDivisionCode + '">' + this.SubDivisionName + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c)
        {
            alert("2." + a.responseText);
        }
    });

    GetTourOperatorList();
}


function GetTourOperatorList()
{
    var DivisionCode = $("#ddlDivision").val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/Forest/Trekking/TrackingForm.aspx/GetTourOperatorList",
        data: '{"DivisionCode":"' + DivisionCode + '"}',
        dataType: "json",
        success: function (response)
        {
            var Category = eval(response.d);
            var catCount = 0;
            var ddlSubDivision = $("[id=ddlTourOperator]");
            ddlSubDivision.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function ()
            {
                $("[id=ddlTourOperator]").append('<option value = "' + this.TOCode + '">' + this.TOName + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c)
        {
            alert("2." + a.responseText);
        }
    });
}
// Logic For Add More //

//**************add more function for Servant details.***************************

function Duplicateno(strTempString) {
    debugger;
    var opt = 0;
    var currentIdentityno = $('#ddlIDProofDetail').val();
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
        strName = RemStr.substring(0, StartIndex);
        RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

        StartIndex = RemStr.indexOf(",");
        strFatherSpouseName = RemStr.substring(0, StartIndex);
        RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

        StartIndex = RemStr.indexOf(",");
        strGender = RemStr.substring(0, StartIndex);
        RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

        StartIndex = RemStr.indexOf(",");
        strAge = RemStr.substring(0, StartIndex);
        RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

        StartIndex = RemStr.indexOf(",");
        strMobileNo = RemStr.substring(0, StartIndex);
        RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

        StartIndex = RemStr.indexOf(",");
        strEmergencyNo = RemStr.substring(0, StartIndex);
        RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

        StartIndex = RemStr.indexOf(",");
        strEmailID = RemStr.substring(0, StartIndex);
        RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

        StartIndex = RemStr.indexOf(",");
        strIDProof = RemStr.substring(0, StartIndex);
        RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

        StartIndex = RemStr.indexOf(",");
        strIDProofDetail = RemStr.substring(0, StartIndex);
        RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

        StartIndex = RemStr.indexOf(",");
        strNatinality = RemStr.substring(0, StartIndex);
        RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

        StartIndex = RemStr.indexOf(",");
        strTrackingFee = RemStr.substring(0, StartIndex);
        RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

        strTrackingFee = RemStr;
        if (strTempString != "") {
            if (currentIdentityno == strIDProofDetail) {
                alert("Duplicate Identity Proof No found");
                opt = 1;
            }
        }

    }

    if (opt == 1) {
        return false;
    }
    else
    {
        return true;
    }
}

function AddTrackerDetail(DeleteString)
{
    if (validateValues(DeleteString) == true)
    {
        var Str = "";
        var SrNo = "";
        var strName = "";
        var strFatherSpouseName = "";
        var strGender = "";
        var strAge = "";
        var strMobileNo = "";
        var strEmergencyNo = "";
        var strEmailID = "";
        var strNatinality = "";
        var strIDProof = "";
        var strIDProofDetail = "";
        var strTrackingFee = "";

        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";

      

        if (DeleteString == "")
        {
            strName = $('#txtFullName').val();
            strFatherSpouseName = $('#txtFatherSpouseName').val();
            strGender = $('#ddlGender').val();
            strAge = $('#DateOfBirth').val();
            strMobileNo = $('#txtMobileNo').val();
            strEmergencyNo = $('#txtEmergencyNo').val();
            strEmailID = $('#txtEmailID').val();
            strNatinality = $('#ddlNationality').val();
            strIDProof = $('#ddlIDProofType').val();
            strIDProofDetail = $('#ddlIDProofDetail').val();
            strTrackingFee = $('#txtTrackingFee').val();

            if (Duplicateno(document.getElementById("hdfTracker").value) == false)
            {
                return;
            }

            strTempString = document.getElementById("hdfTracker").value + "#" + SrNo + "," + strName + "," + strFatherSpouseName + "," + strGender + "," + strAge + "," + strMobileNo + "," + strEmergencyNo + "," + strEmailID + "," + strIDProof + "," + strIDProofDetail + "," + strNatinality + "," + strTrackingFee + "#";
        }
        else
        {
            strTempString = document.getElementById("hdfTracker").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblAddMore' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sl.No.</th>";
        Str = Str + "<th style='text-align: center;'>Name</th>";
        Str = Str + "<th style='text-align: center;'>Father/Husband Name</th>";
        Str = Str + "<th style='text-align: center;'>Gender</th>";
        Str = Str + "<th style='text-align: center;'>Birth Date</th>";
        Str = Str + "<th style='text-align: center;'>Mobile No</th>";
        Str = Str + "<th style='text-align: center;'>Emergency No</th>";
        Str = Str + "<th style='text-align: center;'>Email ID</th>";
        Str = Str + "<th style='text-align: center;'>ID Proof</th>";
        Str = Str + "<th style='text-align: center;'>ID Proof Detail</th>";
        Str = Str + "<th style='text-align: center;'>Nationality</th>";
        Str = Str + "<th style='text-align: center;'>Tracking Fee</th>";
        Str = Str + "<th style='text-align: center;'>Action</th>";
        Str = Str + "</tr>";

        while (strTempString.length > 0)
        {
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
            strName = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strFatherSpouseName = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strGender = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strAge = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strMobileNo = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strEmergencyNo = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strEmailID = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strIDProof = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strIDProofDetail = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strNatinality = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strTrackingFee = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            strTrackingFee = RemStr;

            var DeleteString = "#" + SrNo + "," + strName + "," + strFatherSpouseName + "," + strGender + "," + strAge + "," + strMobileNo + "," + strEmergencyNo + "," + strEmailID + "," + strIDProof + "," + strIDProofDetail + "," + strNatinality + "," + strTrackingFee + "#";

            Str = Str + "<tr>";
            Str = Str + "<td style='width:65px' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strName + "</td>";
            Str = Str + "<td style='' >" + strFatherSpouseName + "</td>";
            Str = Str + "<td style='' >" + strGender + "</td>";
            Str = Str + "<td style='' >" + strAge + "</td>";
            Str = Str + "<td style='' >" + strMobileNo + "</td>";
            Str = Str + "<td style='' >" + strEmergencyNo + "</td>";
            Str = Str + "<td style='' >" + strEmailID + "</td>";
            Str = Str + "<td style='' >" + strIDProof + "</td>";
            Str = Str + "<td style='' >" + strIDProofDetail + "</td>";
            Str = Str + "<td style='' >" + strNatinality + "</td>";
            Str = Str + "<td style='' >" + strTrackingFee + "</td>";
            Str = Str + "<td align='center' style='width:150px'><input type='button' style='min-width:20px' class='btn-outline-danger' value='Delete' onclick='DelStringS(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";

            
            strSuspect = strSuspect + "#" + SrNo + "," + strName + "," + strFatherSpouseName + "," + strGender + "," + strAge + "," + strMobileNo + "," + strEmergencyNo + "," + strEmailID + "," + strIDProof + "," + strIDProofDetail + "," + strNatinality + "," + strTrackingFee + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + strName + "," + strFatherSpouseName + "," + strGender + "," + strAge + "," + strMobileNo + "," + strEmergencyNo + "," + strEmailID + "," + strIDProof + "," + strIDProofDetail + "," + strNatinality + "," + strTrackingFee + "#";

            var HeirsDXMLS = strSaveSuspect;

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);
        }

        Str = Str + "</table>";
        $("#divmore").show();
        document.getElementById('divmore').innerHTML = Str;
        document.getElementById("hdfTracker").value = strSuspect;
        document.getElementById("hdfTrackerSave").value = strSaveSuspect;
        document.getElementById("hdfTrackerString").value = intCount;

        var tbody = $("#divTrackerDetail tbody");

        if (tbody.children().length >= 1)
        {
            $("#divTrackerDetail").show(800);
            //$("#btnSubmit2").prop('disabled', false);
        }

        strName = $('#txtFullName').val('');
        strFatherSpouseName = $('#txtFatherSpouseName').val('');
        strGender = $('#ddlGender').val(0);
        strAge = $('#DateOfBirth').val('');
        strMobileNo = $('#txtMobileNo').val('');
        strEmergencyNo = $('#txtEmergencyNo').val('');
        strEmailID = $('#txtEmailID').val('');
        strNatinality = $('#ddlNationality').val(0);
        strIDProof = $('#ddlIDProofType').val(0);
        strIDProofDetail = $('#ddlIDProofDetail').val('');
        strTrackingFee = $('#txtTrackingFee').val('');
        $('#txtYear').val('');
        $('#txtMonth').val('');
        $('#txtDay').val('');
        dispanel(1);

    }
}
function ClearTrackerDetail()
{
    $('#txtFullName').val('');
    $('#txtFatherSpouseName').val('');
    $('#ddlGender').val(0);
    $('#DateOfBirth').val('');
    $('#txtMobileNo').val('');
    $('#txtEmergencyNo').val('');
    $('#txtEmailID').val('');
    $('#ddlNationality').val(0);
    $('#ddlIDProofType').val(0);
    $('#ddlIDProofDetail').val('');
    $('#txtTrackingFee').val('');
    $('#txtYear').val('');
    $('#txtMonth').val('');
    $('#txtDay').val('');
}


function DelStringS(DeleteString)
{
    var Msg = "Do you want remove this Entry?";
    if (confirm(Msg))
    {
        var strString = document.getElementById('hdfTracker').value;
        strString = strString.replace(DeleteString, "");
        document.getElementById('hdfTracker').value = strString;
        AddTrackerDetail(DeleteString);
    }

    var tbody = $("#divmore tbody");

    if (tbody.children().length == 1)
    {
        $("#divTrackerDetail").hide(800);
        $("#btnSubmit2").prop('disabled', true);
    }
}


    function validateValues(DeleteString)
    {
        if (DeleteString != '')
        {
            return true;
        }

        var text = "";
        var opt = "";

        //var Division = $('#ddlDivision option:selected').text();
        var Division = $('#ddlDivision').val();
        if (Division == "-Select-" || Division == "0")
        {
            text += "<BR>" + " \u002A" + " Please Select Division From List.";
            $('#ddlDivision').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlDivision').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else
        {
            $('#ddlDivision').attr('style', '1px solid #cdcdcd !important;');
            $('#ddlDivision').css({ "background-color": "#ffffff" });
        }

        var Area = $('#ddlArea').val();
        if (Area == "-Select-" || Area == "0")
        {
            text += "<BR>" + " \u002A" + " Please Select Area From List.";
            $('#ddlArea').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlArea').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else
        {
            $('#ddlArea').attr('style', '1px solid #cdcdcd !important;');
            $('#ddlArea').css({ "background-color": "#ffffff" });
        }

        var FromDate = $('#txtFromDate').val();
        if (FromDate == "" || FromDate == null)
        {
            text += "<BR>" + " \u002A" + " Please Enter From Date.";
            $('#txtFromDate').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtFromDate').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else
        {
            $('#txtFromDate').attr('style', '1px solid #cdcdcd !important;');
            $('#txtFromDate').css({ "background-color": "#ffffff" });
        }

        var ToDate = $('#txtToDate').val();
        if (ToDate == "" || ToDate == null)
        {
            text += "<BR>" + " \u002A" + " Please Enter To Date.";
            $('#txtToDate').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtToDate').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else
        {
            $('#txtToDate').attr('style', '1px solid #cdcdcd !important;');
            $('#txtToDate').css({ "background-color": "#ffffff" });
        }

        var FullName = $('#txtFullName').val();
        if (FullName == "" || FullName == null)
        {
            text += "<BR>" + " \u002A" + " Please Enter Full Name.";
            $('#txtFullName').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtFullName').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else
        {
            $('#txtFullName').attr('style', '1px solid #cdcdcd !important;');
            $('#txtFullName').css({ "background-color": "#ffffff" });
        }

        var FatherSpouseName = $('#txtFatherSpouseName').val();
        if (FatherSpouseName == "" || FatherSpouseName == null)
        {
            text += "<BR>" + " \u002A" + " Please Enter Father/Spouse Name.";
            $('#txtFatherSpouseName').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtFatherSpouseName').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else
        {
            opt = 0;
            $('#txtFatherSpouseName').attr('style', '1px solid #cdcdcd !important;');
            $('#txtFatherSpouseName').css({ "background-color": "#ffffff" });
        }

        var Age = $('#ddlGender').val();
        if (Age == "-Select-" || Age == "0")
        {
            text += "<BR>" + " \u002A" + " Please Select Gender From List.";
            $('#ddlGender').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlGender').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else
        {
            $('#ddlGender').attr('style', '1px solid #cdcdcd !important;');
            $('#ddlGender').css({ "background-color": "#ffffff" });
        }

        var DOB = $('#DateOfBirth').val();
        if (DOB == "" || DOB == null)
        {
            text += "<BR>" + " \u002A" + " Please Enter Your Age.";
            $('#DateOfBirth').attr('style', 'border:1px solid #d03100 !important;');
            $('#DateOfBirth').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else
        {
            $('#DateOfBirth').attr('style', '1px solid #cdcdcd !important;');
            $('#DateOfBirth').css({ "background-color": "#ffffff" });
        }

        var MobileNo = $('#txtMobileNo').val();
        if (MobileNo == "" || MobileNo == null)
        {
            text += "<BR>" + " \u002A" + " Please Enter Mobile No.";
            $('#txtMobileNo').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMobileNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else
        {
            $('#txtMobileNo').attr('style', '1px solid #cdcdcd !important;');
            $('#txtMobileNo').css({ "background-color": "#ffffff" });
        }

        var EmergencyMobileNo = $('#txtEmergencyNo').val();
        if (EmergencyMobileNo == "" || EmergencyMobileNo == null)
        {
            text += "<BR>" + " \u002A" + " Please Enter Emergency No.";
            $('#txtEmergencyNo').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtEmergencyNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else
        {
            $('#txtEmergencyNo').attr('style', '1px solid #cdcdcd !important;');
            $('#txtEmergencyNo').css({ "background-color": "#ffffff" });
        }

        var EmailID = $('#txtEmailID').val();
        if (EmailID == "" || EmailID == null)
        {
            text += "<BR>" + " \u002A" + " Please Enter Your Email ID.";
            $('#txtEmailID').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtEmailID').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else
        {
            $('#txtEmailID').attr('style', '1px solid #cdcdcd !important;');
            $('#txtEmailID').css({ "background-color": "#ffffff" });
        }

        var Nationality = $('#ddlNationality').val();
        if (Nationality == "-Select-" || Nationality == "0")
        {
            text += "<BR>" + " \u002A" + " Please Select Nationality From List.";
            $('#ddlNationality').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlNationality').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else
        {
            $('#ddlNationality').attr('style', '1px solid #cdcdcd !important;');
            $('#ddlNationality').css({ "background-color": "#ffffff" });
        }

        var IDProof = $('#ddlIDProofType').val();
        if (IDProof == "-Select-" || IDProof == "0")
        {
            text += "<BR>" + " \u002A" + " Please Select ID Proof From List.";
            $('#ddlIDProofType').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlIDProofType').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else
        {
            $('#ddlIDProofType').attr('style', '1px solid #cdcdcd !important;');
            $('#ddlIDProofType').css({ "background-color": "#ffffff" });
        }

        var IDProofDetail = $('#ddlIDProofDetail').val();
        if (IDProofDetail == "" || IDProofDetail <= 0)
        {
            text += "<BR>" + " \u002A" + " Please Enter ID Proof Detail.";
            $('#ddlIDProofDetail').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlIDProofDetail').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else
        {
            $('#ddlIDProofDetail').attr('style', '1px solid #cdcdcd !important;');
            $('#ddlIDProofDetail').css({ "background-color": "#ffffff" });
        }

        if (IDProof == "AadhaarCard") {
            debugger;
            if (checkUID(IDProofDetail) == false) {
                text += "<BR>" + " \u002A" + " Please Enter Valid 12 Digit Aadhar no ";
                $('#ddlIDProofDetail').attr('style', 'border:1px solid #d03100 !important;');
                $('#ddlIDProofDetail').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#ddlIDProofDetail').attr('style', '1px solid #cdcdcd !important;');
                $('#ddlIDProofDetail').css({ "background-color": "#ffffff" });
            }
        }


        if (IDProof == "Passport") {
            debugger;
            if (checkPssportNo(IDProofDetail) == false) {
                text += "<BR>" + " \u002A" + " Please Enter Valid Passports no ";
                $('#ddlIDProofDetail').attr('style', 'border:1px solid #d03100 !important;');
                $('#ddlIDProofDetail').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#ddlIDProofDetail').attr('style', '1px solid #cdcdcd !important;');
                $('#ddlIDProofDetail').css({ "background-color": "#ffffff" });
            }
        }

        if (opt == "1")
        {
            alertPopup("Please fill following information.", text);
            return false;
        }
        return true;
    }


    function SubmitData()
    {
        //if (!validateValues(''))
        //{
        //    return false;
        //}

        $('#g207').show();
        $("#btnSubmit2").prop('disabled', true);

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


        if ($('#txtFromDate').val() != '')
        {
            var FromDate = $('#txtFromDate').val().split("/");
            FromDate = FromDate[2] + "-" + FromDate[1] + "-" + FromDate[0];
        }
        else
        {
            var FromDate = "";
        }

        if ($('#txtToDate').val() != '')
        {
            var ToDate = $('#txtToDate').val().split("/");
            ToDate = ToDate[2] + "-" + ToDate[1] + "-" + ToDate[0];
        }
        else
        {
            var ToDate = "";
        }

        if ($('#DateOfBirth').val() != '')
        {
            var DOB = $('#DateOfBirth').val().split("/");
            DOB = DOB[2] + "-" + DOB[1] + "-" + DOB[0];
        }
        else
        {
            var DOB = "";
        }

        //var TypeOfService = $("input:radio[name='RegisterType']:checked").val();

        var datavar = {
            'ServiceID': svcid,

            'Division': $('#ddlDivision').val(),
            'Area': $('#ddlArea').val(),
            'FromDate': FromDate,//$('#txtFromDate').val(),
            'ToDate': ToDate,
            'FullName': $('#txtAddressLine1').val(),
            'FatherSpouseName': $('#txtAddressLine2').val(),
            'Gender': $('#txtRoadStreetName').val(),
            'Age': DOB,
            'MobileNo': $('#txtLocality').val(),
            'EmergencyNo': $('#ddlState').val(),
            'EmailID': $('#ddlDistrict').val(),
            'Nationality': $('#ddlTaluka').val(),
            'IDProof': $('#ddlVillage').val(),
            'IDProofDetail': $('#txtPinCode').val(),
            'TrackingFee': $('#txtPinCode').val(),

            'HeirsDXML': document.getElementById("hdfTrackerSave").value,
            'TOCode': $('#ddlTourOperator').val(),

            'CircleCode': $('#ddlCircle').val(),
            'RangeCode': $('#ddlRange').val(),
            'FDivisioncode': $('#ddlDivision').val(),


        };

        var obj = {
            "prefix": "'" + temp + "'",
            "Data": $.stringify(datavar, null, 4)
        };

        $.when(
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebAppUK/Forest/Trekking/TrackingForm.aspx/InsertTrackingData',
                data: $.stringify(obj, null, 4),
                processData: false,
                dataType: "json",
                success: function (response)
                {
                },
                error: function (a, b, c)
                {
                    $('#g207').hide();
                    $("#btnSubmit2").prop('disabled', false);
                    result = false;
                    alertPopup("Could Not Save the Application, Please try again.", "5. " + a.responseText);
                }
            })
        ).then(function (data, textStatus, jqXHR)
        {
            var obj = jQuery.parseJSON(data.d);
            var html = "";
            var status = obj.Status;

            AppID = obj.AppID;
            result = true;
            if (AppID == "" || AppID == null)
            {
                $('#g207').hide();
                $("#btnSubmit2").prop('disabled', false);
                result = false;
                alertPopup("Form Validation Failed", "<br>Error While Saving Application. <BR> Application Form Has Not Been Submitted.<br> PLease Try Again.");
                //rtnurl = "/Account/Login";
                //window.location.href = rtnurl;
                //return;
            }
            else
            {
                if (status == "Success")
                {
                    //alertPopup("Tracking Application", "Your Tracking Entrance Application has been saved successfully. <br> Your Application ID : " + obj.AppID);
                    $('#g207').hide();
                    //window.location.href = '/WebApp/Kiosk/Forms/AttachmentV2.aspx?SvcID=464&AppID=' + obj.AppID;
                    window.location.href = '/WebAppUK/ProgressBar/ProgressBar.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID + '&UID=' + qs["UID"] + '&ProfileID= ' + qs["ProfileID"] + '&KeyField=' + qs["KeyField"];
                }
            }
        });// end of Then function of main Data Insert Function
        return false;
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
                EmailID.attr('style', 'border:1px solid #d03100 !important;');
                EmailID.css({ "background-color": "#fff2ee" });
                alertPopup("Email Validation", "<BR>" + " \u002A" + " Please Enter EmailID In Proper Format.")
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

        window.location.href = '/WebAppUK/Forest/Trekking/TrackingForm.aspx?SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr + '&UID=' + uid + '';
    }


    function Declaration(chk)
    {
        debugger;
        $('#btnSubmit2').prop('disabled', true);
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
                $('#btnSubmit2').prop('disabled', false);
                $("#divDeclaration").show(800);
            }
        }
        else
        {
            $("#lblUName").html("");
            $('#btnSubmit2').prop('disabled', true);
            $("#divDeclaration").hide(800);
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
        if (!(mobileno.charAt(0) == "9" || mobileno.charAt(0) == "8" || mobileno.charAt(0) == "7"))
        {
            text += "<br/>" + " \u002A" + " Mobile No. Should Start With 9 ,8 or 7.";
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


    function GetAge()
    {
        var t_DOB = $("#DateOfBirth").val();
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
        var cald = new Date(calday, calmon - 1, calyear);
        var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) - Date.UTC(calday, calmon, calyear, 0, 0, 0);
        var dife = datedif(curd, cald);
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

    function dispanel(dvalue) {
        if (dvalue = 1) {
            $("#txtFromDate").prop('disabled', true);
            $("#txtToDate").prop('disabled', true);
            $("#ddlDivision").prop('disabled', true);
            $("#ddlArea").prop('disabled', true);
            $("#ddlTourOperator").prop('disabled', true);
        }
        else {
            $("#txtFromDate").prop('disabled', false);
            $("#txtToDate").prop('disabled', false);
            $("#ddlDivision").prop('disabled', false);
            $("#ddlArea").prop('disabled', false);
            $("#ddlTourOperator").prop('disabled', true);
        }

    }

    function AlphaNumericIdentity(evt) {
        var IdentityDetail = $('#ddlIDProofType').val();
        var identityno = $("#ddlIDProofDetail").val();
        if (IdentityDetail == 'AadhaarCard') {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                //    $("#ddlIDProofDetail").val("");
                return false;
            }
            return true;
        }
        if (IdentityDetail == 'Pancard') {
            var regex = new RegExp("[ A-Za-z0-9]");
            var key = e.keyCode || e.which;
            key = String.fromCharCode(key);

            if (!regex.test(key)) {
                e.returnValue = false;
                if (e.preventDefault) {
                    e.preventDefault();
                    //      $("#ddlIDProofDetail").val("");
                }
            }
        }
        if (IdentityDetail == 'Voter ID' || IdentityDetail == 'DrivingLicence') {
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