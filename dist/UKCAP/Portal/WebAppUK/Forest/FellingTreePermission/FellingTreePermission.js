$(document).ready(function ()
{
    $("#btnSubmit2").prop('disabled', true);

    EL("File1").addEventListener("change", readFile, false);
    EL("File2").addEventListener("change", readFile2, false);


    GetDistrict();
    GetCircleList();
    $("#divDeclaration").hide(800);

    fnSearchData();

    $("[name='Address']").change(function () {
        FetchState(this.value);
    });

  

});


function GetCircleList() {
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/Forest/construction/constructionnocform.aspx/GetCircleList",
        data: '{}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var catCount = 0;
            var ddlCircleName = $("[id=ddlCircleName]");
            ddlCircleName.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=ddlCircleName]").append('<option value = "' + this.FCircleCode + '">' + this.FCirclename + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetDivisionList() {
    var SelState = $('#ddlCircleName').val();
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
            var ddlDivision = $("[id=ddlDivision]");
            ddlDivision.empty().append('<option selected="selected" value="0">--Select--</option>');
            $.each(Category, function () {
                $("[id=ddlDivision]").append('<option value = "' + this.FDivisioncode + '">' + this.FDivisionname + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetRangeList() {
    var SelState = $('#ddlDivision').val();
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
            var ddlForestRange = $("[id=ddlForestRange]");
            ddlForestRange.empty().append('<option selected="selected" value="0">--Select--</option>');
            $.each(Category, function () {
                $("[id=ddlForestRange]").append('<option value = "' + this.RangeCode + '">' + this.RangeName + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}



function EL(id) { return document.getElementById(id); } // Get el by ID helper function

function readFile()
{
    debugger;
    if (this.files && this.files[0])
    {
        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfPhoto').val(sizekb);
        if (sizekb < 10 || sizekb > 50)
        {
            alert('The size of the photograph should fall between 20KB to 50KB. Your Photo Size is ' + sizekb + 'kb.');
            return false;
        }
        var ftype = this;
        var fileupload = ftype.value;
        if (fileupload == '')
        {
            alert("Photograph only allows file types of PNG, JPG, JPEG. ");
            return;
        }
        else
        {
            var Extension = fileupload.substring(fileupload.indexOf('.') + 1);
            if (Extension == "png" || Extension == "jpeg" || Extension == "jpg")
            { }
            else
            {
                alert("Photograph only allows file types of PNG, JPG, JPEG. ");
                return;
            }
        }

        var FR = new FileReader();
        FR.onload = function (e)
        {
            EL("myImg").src = e.target.result;
            EL("HFb64").value = e.target.result;
        };
        FR.readAsDataURL(this.files[0]);
    }
}

function readFile2()
{
    if (this.files && this.files[0])
    {
        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfSign').val(sizekb);
        if (sizekb < 5 || sizekb > 20)
        {
            alert('The size of the signature should fall between 10KB to 20KB. Your signature Size is ' + sizekb + 'kb.');
            return false;
        }

        var ftype = this; //document.getElementById('File1');
        var fileupload = ftype.value;
        if (fileupload == '')
        {
            alert("Signature only allows file types of PNG, JPG, JPEG. ");
            return;
        }
        else
        {
            var Extension = fileupload.substring(fileupload.indexOf('.') + 1);
            if (Extension == "png" || Extension == "jpeg" || Extension == "jpg")
            { }
            else
            {
                alert("Signature only allows file types of PNG, JPG, JPEG. ");
                return;
            }
        }
        var FR = new FileReader();
        FR.onload = function (e)
        {
            EL("mySign").src = e.target.result;
            EL("HFb64Sign").value = e.target.result;
        };
        FR.readAsDataURL(this.files[0]);
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
                    $('#txtApplicantName').val(obj[0]["ApplicantName"]);
                    $('#HDNFNM').val(obj[0]["ApplicantName"]);
                    $('#txtFatherSpouseName').val(obj[0]["FatherName"]);
                    $('#ddlGender').val(obj[0]["Gender"]);
                    $('#txtMobileNo').val(obj[0]["MobileNo"]);
                    $('#txtEmailID').val(obj[0]["EmailId"]);

                    var DOB = "";
                    DOB = obj[0]["DOB"];
                    DOB = DOB.split("-");
                    if (DOB[0].length == 4)
                    {
                        DOB = DOB[2] + "/" + DOB[1] + "/" + DOB[0];
                    }
                    else
                    {
                        DOB = DOB[0] + "/" + DOB[1] + "/" + DOB[2];
                    }

                    $('#txtDOB').val(DOB);
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

    window.location.href = '/WebAppUK/Forest/Construction/ConstructionNocForm.aspx?SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr + '&UID=' + uid + '';
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

function GetDistrict() {
    var SelState = "0";// $('#ddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKDistrict",
        data: '{"prefix":"","StateCode":"' + SelState + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=ddlDistrict]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                $("[id*=ddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}


function GetUKBlock() {
    var SelBlock = $('#ddlDistrict').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKBlock",
        data: '{"prefix":"","DistrictCode":"' + SelBlock + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=ddlTaluka]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                $("[id*=ddlTaluka]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}


function GetUKPanchayat() {
    var SelSubDistrict = $('#ddlTaluka').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKPanchayat",
        data: '{"prefix":"","SubDistrictCode":"' + SelSubDistrict + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=ddlVillage]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                $("[id*=ddlVillage]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}



function FormValidation()
{
    var text = "";
    var opt = "";

    if (EL("myImg").src.indexOf("photo.png") != -1)
    {
        text += "<BR>" + " \u002A" + " Please Upload Applicant Photograph.";
        $('#myImg').attr('style', 'border:1px solid #d03100 !important;');
        $('#myImg').css({ "background-color": "#fff2ee" });
        $('#myImg').css({ "height": "220px" });
        opt = 1;
    } else
    {
        $('#myImg').attr('style', 'border:0 !important;');
        $('#myImg').css({ "background-color": "" });
        $('#myImg').css({ "height": "220px" });
    }

    if (EL("mySign").src.indexOf("signature.png") != -1)
    {
        text += "<BR>" + " \u002A" + " Please Upload Applicant Signature.";
        $('#mySign').attr('style', 'border:1px solid #d03100 !important;');
        $('#mySign').css({ "background-color": "#fff2ee" });
        $('#mySign').css({ "height": "220px" });
        opt = 1;
    } else
    {
        $('#mySign').attr('style', 'border:0 !important;');
        $('#mySign').css({ "background-color": "" });
        $('#mySign').css({ "height": "220px" });
    }

    if ($('#txtFirmCompName').val() == "" || $('#txtFirmCompName').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Company/Firm Name.";
        $('#txtFirmCompName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFirmCompName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtFirmCompName').attr('style', '1px solid #cdcdcd !important;');
        $('#txtFirmCompName').css({ "background-color": "#ffffff" });
    }


    if ($('#txtApplicantName').val() == "" || $('#txtApplicantName').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Applicant Name.";
        $('#txtApplicantName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtApplicantName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtApplicantName').attr('style', '1px solid #cdcdcd !important;');
        $('#txtApplicantName').css({ "background-color": "#ffffff" });
    }

    if ($('#txtEmailID').val() == "" || $('#txtEmailID').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Your Email ID.";
        $('#txtEmailID').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtEmailID').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtEmailID').attr('style', '1px solid #cdcdcd !important;');
        $('#txtEmailID').css({ "background-color": "#ffffff" });
    }


    if ($('#txtMobileNo').val() == "" || $('#txtMobileNo').val() == null)
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


    var IDProof = $('#IdProofType').val();
    if (IDProof == "-Select-" || IDProof == "0") {
        text += "<BR>" + " \u002A" + " Please Select ID Proof From List.";
        $('#IdProofType').attr('style', 'border:1px solid #d03100 !important;');
        $('#IdProofType').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#IdProofType').attr('style', '1px solid #cdcdcd !important;');
        $('#IdProofType').css({ "background-color": "#ffffff" });
    }

    var IDProofDetail = $('#txtIDProofNo').val();
    if (IDProofDetail == "" || IDProofDetail <=0) {
        text += "<BR>" + " \u002A" + " Please Enter ID Proof Detail.";
        $('#txtIDProofNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtIDProofNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtIDProofNo').attr('style', '1px solid #cdcdcd !important;');
        $('#txtIDProofNo').css({ "background-color": "#ffffff" });
    }

    if (IDProof == "AadhaarCard") {
        debugger;
        if (checkUID(IDProofDetail) == false) {
            text += "<BR>" + " \u002A" + " Please Enter Valid 12 Digit Aadhar no ";
            $('#txtIDProofNo').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtIDProofNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtIDProofNo').attr('style', '1px solid #cdcdcd !important;');
            $('#txtIDProofNo').css({ "background-color": "#ffffff" });
        }
    }


    if (IDProof == "Passport") {
        debugger;
        if (checkPssportNo(IDProofDetail) == false) {
            text += "<BR>" + " \u002A" + " Please Enter Valid Passports no ";
            $('#txtIDProofNo').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtIDProofNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtIDProofNo').attr('style', '1px solid #cdcdcd !important;');
            $('#txtIDProofNo').css({ "background-color": "#ffffff" });
        }
    }
    if (IDProof == "PAN") {
        debugger;
        if (checkPAN(IDProofDetail) == false) {
            text += "<BR>" + " \u002A" + " Please Enter Valid PAN no ";
            $('#txtIDProofNo').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtIDProofNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtIDProofNo').attr('style', '1px solid #cdcdcd !important;');
            $('#txtIDProofNo').css({ "background-color": "#ffffff" });
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
    debugger;
    if (!FormValidation())
    {
        return false;
    }
    
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

    var datavar = {
        'ServiceID': svcid,
        'ProfileID': uid,
        'FirmFullName': $('#txtFirmCompName').val(),
        'ApplicantName': $('#txtApplicantName').val(),
        'AadhaarNo': $('#ddlConstPurpose').val(),
        'FatherName': $('#txtFatherName').val(),
        'MotherName': $('#txtMotherName').val(),
        'Gender': $('#ddlGender').val(),
        'IDProof': $('#IdProofType').val(),
        'IDProofNo': $('#txtIDProofNo').val(),
        'Nationality': $('#ddlNationality').val(),
        'Mobileno': $('#txtMobileNo').val(),
        'Landlineno': $('#txtLandlineNo').val(),
        'Emailid': $('#txtEmailID').val(),
        'GSTNoCompany': $('#txtGSTNO').val(),
        'PortalAddress': $('#txtPostalAddress').val(),
        'LandType': $('#ddlLandType').val(),
        'Plotno': $('#txtPlotNo').val(),
        'District': $('#ddlDistrict').val(),
        'Taluka': $('#ddlTaluka').val(),
        'Village': $('#ddlVillage').val(),
        'ChoukiName': $('#txtChauki').val(),
        'Pincode': $('#txtPinCode').val(),
        'CircleName': $('#ddlCircleName').val(),
        'DFO': $('#ddldfo').val(),
        'ForestRangeName': $('#ddlForestRange').val(),
        'LattituteDegree': $('#txtLatituteDegree').val(),
        'LattituteMinute': $('#txtLatituteMinute').val(),
        'LattituteSecond': $('#txtLatituteSecond').val(),
        'LongitudeDegree': $('#txtLongitudeDegree').val(),
        'LongitudeMinute': $('#txtLongitudeMinute').val(),
        'LongitudeSecond': $('#txtLongitudeSecond').val(),
        'PremisesCateory': $('#ddlPremises').val(),
        'PremisesCatOthers': $('#ddlPremisesOther').val(),
        'TreeFellingReason': $('#ddlTreeFellingReason').val(),
        'GovForesrRecord': $('#ddlGovForesrRecord').val(),
        'Exempted1976': $('#ddlExempted1976').val(),
        'PremisesAreaHectere': $('#txtPremisesAreaHectere').val(),
        'ZoneinKm': $('#txtZoneinKm').val(),
        'TransitFrom': $('#txtTransitFrom').val(),
        'TransitTo': $('#txtTransitTo').val(),
        'TransitVia': $('#txtTransitVia').val(),
        'IsNonForestLand': $("input:radio[name='NonForest']:checked").val(),
        'IsSettingIndustry': $("input:radio[name='SetIndustry']:checked").val(),
        'IsSoughtPermisson': $("input:radio[name='SoughtPrev']:checked").val(),
        'IsOwnershipCertificate': $("input:radio[name='CertAttach']:checked").val(),
        'IsJoinOwnership': $("input:radio[name='SharedOwnership']:checked").val(),
        'IsNOCJointOwner': $("input:radio[name='NOCObtain']:checked").val(),
        'IsSurveyMap': $("input:radio[name='SketchAttach']:checked").val(),
        'IsEnumerationlit': $("input:radio[name='EnumerationAttach']:checked").val(),
        'IsExemptedTPA1976': $("input:radio[name='ExemptedTPA1976']:checked").val(),
        'IsLocationMapAttach': $("input:radio[name='LocationMapAttach']:checked").val(),
        'TreeFelledNonExempted': document.getElementById("hdfSuspect2").value,
        'TreeFelledExempted': document.getElementById("hdfSuspect").value,
        'Image': $('#HFb64').val(),
        'Sign': $('#HFb64Sign').val(),
        'OthercategoryReason': $('#OthercategoryReason').val(),
        'Division': $('#ddlDivision').val()


    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebAppUK/Forest/FellingTreePermission/FellingTreePermissionForm.aspx/InsertFellingPermissionData',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response)
            {
            },
            error: function (a, b, c)
            {
                result = false;
                $("#btnSubmit2").prop('disabled', false);
                $('#g207').hide();
                alertPopup("<br>Could Not Save the Application, Please try again.", "5. " + a.responseText);
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
            result = false;
            $("#btnSubmit2").prop('disabled', false);
            $('#g207').hide();
            alertPopup("Form Validation Failed", "<br>Error While Saving Application. <BR> Application Form Has Not Been Submitted.<br> PLease Try Again.");
        }
        else
        {
            if (status == "Success")
            {
                window.location.href = '/WebAppUK/ProgressBar/ProgressBar.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID + '&UID=' + qs["UID"] + '&ProfileID= ' + qs["ProfileID"] + '&KeyField=' + qs["KeyField"];
                $('#g207').hide();
            }
        }
    });// end of Then function of main Data Insert Function
    return false;
}

function AddSuspect(DeleteString) {
    debugger;

    //if (validateSuspectValues(DeleteString) == true) {

        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";
       var TreeSpecies            ="";
       var TotalnoTreesArea       ="";
       var No0to10                ="";
       var No10to20               ="";
       var No20to30               ="";
       var No30to40               ="";
       var No40to50               ="";
       var No50to60               ="";
       var No60to70               ="";
       var Noabove70              ="";
       var PositionOfTrees        ="";
       var ConditionofTrees = "";


        var Str = "";
        var SrNo = "";

        if (DeleteString == "") {


            TreeSpecies = $('#ddlTreeSpecies').val();
            TotalnoTreesArea = $('#TotalnoTreesArea').val();
            No0to10 = $('#No0to10').val();
            No10to20 = $('#No10to20').val();
            No20to30 = $('#No20to30').val();
            No30to40 = $('#No30to40').val();
            No40to50 = $('#No40to50').val();
            No50to60 = $('#No50to60').val();
            No60to70 = $('#No60to70').val();
            Noabove70 = $('#Noabove70').val();
            PositionOfTrees = $('#ddlPositionOfTrees').val();
            ConditionofTrees = $('#ddlConditionofTrees').val();


            strTempString = document.getElementById("hdfSuspect").value + "#" + SrNo + "," + TreeSpecies + "," + TotalnoTreesArea + "," + No0to10 + "," + No10to20 + "," + No20to30 + ","
                + No30to40 + "," + No40to50 + "," + No50to60 + "," + No60to70 + "," + Noabove70 + "," + PositionOfTrees + "," + ConditionofTrees + "#";

        }
        else {
            strTempString = document.getElementById("hdfSuspect").value;
        }

        intCount = 0;
    
        Str = " <table cellpadding='0' cellspacing='0' class='table table-bordered' style='width: 99%; margin: 0 auto;'> ";
        Str = Str + "                         <tbody>";
        Str = Str + "                    <tr>";
        Str = Str + "<th rowspan='2'><strong>Tree species</strong></th>";
        Str = Str + " <th rowspan='2'><strong>Total No. of Trees existing in the premises/plot/area</strong></th>";
        Str = Str + "   <th colspan='8'> <p style='text-align: center;'> <strong>No. of Trees proposed to be Felled</strong></p> </th>";
        Str = Str + "         <th rowspan='2'><strong>Position of Trees (Standing/Fallen)</strong></th>";
        Str = Str + " <th rowspan='2'><strong>Condition of Trees (Green/Dry)</strong></th>";
        Str = Str + "             <th rowspan='2' style='width: 100px;'>Action</th>";
        Str = Str + "        </tr>";
        Str = Str + "   <tr>";
        Str = Str + "   <td style='text-align: center;'>0-10</td>";
        Str = Str + " <td style='text-align: center;'>10-20</td>";
        Str = Str + "            <td style='text-align: center;'>20-30</td>";
        Str = Str + "                       <td style='text-align: center;'>30-40</td>";
                        Str = Str + "                    <td style='text-align: center;'>40-50</td>";
                        Str = Str + "                    <td style='text-align: center;'>50-60</td>";
                        Str = Str + "                 <td style='text-align: center;'>60-70</td>";
                        Str = Str + "               <td style='text-align: center;'>&gt;70</td>";
                        Str = Str + "        </tr>";
                                       
    
                    
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
            TreeSpecies = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            TotalnoTreesArea = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            No0to10 = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            No10to20 = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            No20to30 = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);


            StartIndex = RemStr.indexOf(",");
            No30to40 = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            No40to50 = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            No50to60 = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);



            StartIndex = RemStr.indexOf(",");
            No60to70 = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            Noabove70 = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            PositionOfTrees = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            ConditionofTrees = RemStr;
            
            var DeleteString = "#" + SrNo + "," + TreeSpecies + "," + TotalnoTreesArea + "," + No0to10 + "," + No10to20 + "," + No20to30 + ","
                + No30to40 + "," + No40to50 + "," + No50to60 + "," + No60to70 + "," + Noabove70 + "," + PositionOfTrees + "," + ConditionofTrees + "#";

            Str = Str + "<tr>";

            Str = Str + "<td style='' >" + TreeSpecies + "</td>";
            Str = Str + "<td style='' >" + TotalnoTreesArea + "</td>";
            Str = Str + "<td style='' >" + No0to10 + "</td>";
            Str = Str + "<td style='' >" + No10to20 + "</td>";
            Str = Str + "<td style='' >" + No20to30 + "</td>";

            Str = Str + "<td style='' >" + No30to40 + "</td>";
            Str = Str + "<td style='' >" + No40to50 + "</td>";

            Str = Str + "<td style='' >" + No50to60 + "</td>";
            Str = Str + "<td style='' >" + No60to70 + "</td>";

            Str = Str + "<td style='' >" + Noabove70 + "</td>";
            Str = Str + "<td style='' >" + PositionOfTrees + "</td>";

            Str = Str + "<td style='' >" + ConditionofTrees + "</td>";


            Str = Str + "<td align='center' style='width:85px'><input class='btn btn-danger' style='width:85px' value='Delete' onclick='DelString(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";

            strSuspect = strSuspect + "#" + SrNo + "," + TreeSpecies + "," + TotalnoTreesArea + "," + No0to10 + "," + No10to20 + "," + No20to30 + ","
                + No30to40 + "," + No40to50 + "," + No50to60 + "," + No60to70 + "," + Noabove70 + "," + PositionOfTrees + "," + ConditionofTrees + "#";


            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);



        }



        Str = Str + "     </tbody>";

        Str = Str + "</table>";
        if (intCount > 0) {
            document.getElementById('divSuspect').innerHTML = Str;
        }
        else {
            document.getElementById('divSuspect').innerHTML = "";
        }


        document.getElementById("hdfSuspect").value = strSuspect;
        


         $('#ddlTreeSpecies').val('');
         $('#TotalnoTreesArea').val('');
        $('#No0to10').val('');
        $('#No10to20').val('');
         $('#No20to30').val('');
         $('#No30to40').val('');
        $('#No40to50').val('');
         $('#No50to60').val('');
        $('#No60to70').val('');
        $('#Noabove70').val('');
        $('#ddlPositionOfTrees').val('');
        $('#ddlConditionofTrees').val('');


    
}

function DelString(DeleteString) {

    var Msg = "Do you want remove this Record?";
    debugger;
    if (confirm(Msg)) {
        var strString = document.getElementById("hdfSuspect").value;
        strString = strString.replace(DeleteString, "");
        document.getElementById("hdfSuspect").value = strString;
        AddSuspect(DeleteString);
    }
}

function AddSuspect2(DeleteString) {
    debugger;

    //if (validateSuspectValues2(DeleteString) == true) {

    var strSuspect = "";
    var strSaveSuspect = "";
    var Appid = "";
    var strTempString = "";
    var TreeSpecies = "";
    var TotalnoTreesArea = "";
    var PositionOfTrees = "";
    var ConditionofTrees = "";
    var TotalnoofProposedTrees = "";

    var Str = "";
    var SrNo = "";

    if (DeleteString == "") {

        TreeSpecies = $('#ddlNonTreeSpecies').val();
        TotalnoTreesArea = $('#NonTotalnoTreesArea').val();
        PositionOfTrees = $('#NonPositionOfTrees').val();
        ConditionofTrees = $('#ddlnonConditionofTrees').val();
        TotalnoofProposedTrees = $('#dddlnonTotalnoofProposedTrees').val();

        strTempString = document.getElementById("hdfSuspect2").value + "#" + SrNo + "," + TreeSpecies + "," + 
        TotalnoTreesArea + "," + PositionOfTrees + "," + ConditionofTrees + "," + TotalnoofProposedTrees + "#";

    }
    else {
        strTempString = document.getElementById("hdfSuspect2").value;
    }

    intCount = 0;
        
    Str =  "<table cellpadding='0' cellspacing='0' class='table table-bordered' style='width: 99%; margin: 0 auto;'>";
    Str = Str + "                                 <tbody>";
    Str = Str + "                                <tr>";
                                           
    Str = Str + "                <th><strong>Tree species</strong></th>";
    Str = Str + "                            <th><strong>Total No. of Trees existing in the premises/plot/area</strong></th>";
    Str = Str + "           <th><strong>No. of Trees proposed to be Exempted</strong></th>";
    Str = Str + "               <th><strong>Position of Trees (Standing/Fallen)</strong></th>";
    Str = Str + "     <th><strong>Condition of Trees (Green/Dry)</strong></th>";
    Str = Str + "    <th><strong>Action</strong></th>";
    Str = Str + "   </tr>";

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
        TreeSpecies = RemStr.substring(0, StartIndex);
        RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

        StartIndex = RemStr.indexOf(",");
        TotalnoTreesArea = RemStr.substring(0, StartIndex);
        RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

        StartIndex = RemStr.indexOf(",");
        PositionOfTrees = RemStr.substring(0, StartIndex);
        RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

        StartIndex = RemStr.indexOf(",");
        ConditionofTrees = RemStr.substring(0, StartIndex);
        RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

        TotalnoofProposedTrees = RemStr;

        var DeleteString = "#" + SrNo + "," + TreeSpecies + "," +
        TotalnoTreesArea + "," + PositionOfTrees + "," + ConditionofTrees + "," + TotalnoofProposedTrees + "#";

        Str = Str + "<tr>";

        Str = Str + "<td style='' >" + TreeSpecies + "</td>";
        Str = Str + "<td style='' >" + TotalnoTreesArea + "</td>";
        Str = Str + "<td style='' >" + PositionOfTrees + "</td>";
        Str = Str + "<td style='' >" + ConditionofTrees + "</td>";
        Str = Str + "<td style='' >" + TotalnoofProposedTrees + "</td>";


        Str = Str + "<td align='center' style='width:85px'><input class='btn btn-danger' style='width:85px' value='Delete' onclick='DelString2(&quot;" + DeleteString + "&quot;);'/></td>";
        Str = Str + "</tr>";

        strSuspect = strSuspect + "#" + SrNo + "," + TreeSpecies + "," +
        TotalnoTreesArea + "," + PositionOfTrees + "," + ConditionofTrees + "," + TotalnoofProposedTrees + "#";

        strTempString = strTempString.substring(EndIndex + 1, strTempString.length);
    }
    Str = Str + "     </tbody>";

    Str = Str + "</table>";
    if (intCount > 0) {
        document.getElementById('divSuspect2').innerHTML = Str;
    }
    else {
        document.getElementById('divSuspect2').innerHTML = "";
    }


    document.getElementById("hdfSuspect2").value = strSuspect;

    $('#ddlNonTreeSpecies').val('');
    $('#NonTotalnoTreesArea').val('');
    $('#NonPositionOfTrees').val('');
    $('#ddlnonConditionofTrees').val('');
    $('#dddlnonTotalnoofProposedTrees').val('');

}

function DelString2(DeleteString) {

    var Msg = "Do you want remove this Record?";
    debugger;
    if (confirm(Msg)) {
        var strString = document.getElementById("hdfSuspect2").value;
        strString = strString.replace(DeleteString, "");
        document.getElementById("hdfSuspect2").value = strString;
        AddSuspect2(DeleteString);
    }
}

function validateSuspectValues(DeleteString) {

    if (DeleteString != '') {
        return true;
    }

    var strSuspect = "";
    var strSaveSuspect = "";
    var Appid = "";
    var strTempString = "";
    var strName = "";
    var strRelation = "";
    var strage = "";
    var strMOccupation = "";
    var strMIncome = "";
    var Totalincome = "";
    var Str = "";
    var SrNo = "";
    var strMsg = "";
    var isError = "";
    strName = $('#MName').val();
    strage = $('#MAge').val();
    strRelation = $('#MRelation').val();
    strMOccupation = $('#MOccupation').val();
    strMIncome = $('#MIncome').val();



    if (strName == "") {
        strMsg = strMsg + "</br> * Please Enter Family Member Name.";
        document.getElementById('MName').focus();
        isError = true;
    }

    if (strage == "") {
        strMsg = strMsg + "</br> * Please Enter Family Member Age.";
        document.getElementById('MAge').focus();
        isError = true;
    }

    if (strRelation == "0") {
        strMsg = strMsg + "</br> * Please Enter Family Member Relation.";
        document.getElementById('MRelation').focus();
        isError = true;
    }

    if (strMOccupation == "") {
        strMsg = strMsg + "</br> * Please Enter Family Member Occupation.";
        document.getElementById('MOccupation').focus();
        isError = true;
    }
    if (strMIncome == "") {
        strMsg = strMsg + "</br> * Please Enter Family Member Income.";
        document.getElementById('MIncome').focus();
        isError = true;
    }


    if (isError == true) {
        alertPopup("Please fill following information.", strMsg);

        return false;
    }

    return true;

}

function validateSuspectValues2(DeleteString) {

    if (DeleteString != '') {
        return true;
    }

    var strSuspect = "";
    var strSaveSuspect = "";
    var Appid = "";
    var strTempString = "";
    var strName = "";
    var strRelation = "";
    var strage = "";
    var strMOccupation = "";
    var strMIncome = "";
    var Totalincome = "";
    var Str = "";
    var SrNo = "";
    var strMsg = "";
    var isError = "";
    strName = $('#MName').val();
    strage = $('#MAge').val();
    strRelation = $('#MRelation').val();
    strMOccupation = $('#MOccupation').val();
    strMIncome = $('#MIncome').val();



    if (strName == "") {
        strMsg = strMsg + "</br> * Please Enter Family Member Name.";
        document.getElementById('MName').focus();
        isError = true;
    }

    if (strage == "") {
        strMsg = strMsg + "</br> * Please Enter Family Member Age.";
        document.getElementById('MAge').focus();
        isError = true;
    }

    if (strRelation == "0") {
        strMsg = strMsg + "</br> * Please Enter Family Member Relation.";
        document.getElementById('MRelation').focus();
        isError = true;
    }

    if (strMOccupation == "") {
        strMsg = strMsg + "</br> * Please Enter Family Member Occupation.";
        document.getElementById('MOccupation').focus();
        isError = true;
    }
    if (strMIncome == "") {
        strMsg = strMsg + "</br> * Please Enter Family Member Income.";
        document.getElementById('MIncome').focus();
        isError = true;
    }


    if (isError == true) {
        alertPopup("Please fill following information.", strMsg);

        return false;
    }

    return true;

}

function FetchState(Address) {

    var qs = getQueryStrings();
    var UID = qs["UID"];

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetAddress",
        data: '{"AddType":"' + Address + '","UID":"' + UID + '"}',
        dataType: "json",
        success: function (data) {

            var obj = jQuery.parseJSON(data.d);
            var Address1 = obj[0].Address1;
            var Address2 = obj[0].Address2;
            var Street = obj[0].Street;
            var Landmark = obj[0].Landmark;
            var Locality = obj[0].Locality;
            var PinCode = obj[0].PinCode;
            var State = obj[0].State;
            var District = obj[0].District;
            var Taluka = obj[0].Taluka;
            var Village = obj[0].Village;

            /*
            if (State.length = 1) {
                State = '0' + obj[0].State;
                $('#ddlState').val(State);
            }

            if (District.length = 2) {
                District = '0' + obj[0].District;
            }

            if (Taluka.length = 3) {
                Taluka = '00' + obj[0].Taluka;
            }

            if (Village.length == 5) {
                Village = '0' + obj[0].Village;
            }
            */

            $('#txtAddress1').val(Address1);
            $('#txtAddress2').val(Address2);
            $('#txtRoadStreetName').val(Street);
            $('#txtLandMark').val(Landmark);
            $('#txtLocality').val(Locality);
            $('#txtPincode').val(PinCode);

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKDistrict",
                data: '{"prefix":"","StateCode":"' + State + '"}',
                processData: false,
                dataType: "json",
                success: function (r) {
                    var ddlCustomers = $("[id*=ddlDistrict]");
                    ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
                    $.each(r.d, function () {
                        $("[id*=ddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    });

                    $('#ddlDistrict').val(District);

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKBlock",
                        data: '{"prefix":"","DistrictCode":"' + District + '"}',
                        dataType: "json",
                        success: function (r) {
                            var ddlCustomers = $("[id*=ddlBlock]");
                            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
                            $.each(r.d, function () {
                                $("[id*=ddlBlock]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                            });

                            $('#ddlBlock').val(Taluka);

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKPanchayat",
                                data: '{"prefix":"","SubDistrictCode":"' + Taluka + '"}',
                                dataType: "json",
                                success: function (r) {
                                    var ddlCustomers = $("[id*=ddlPanchayat]");
                                    ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
                                    $.each(r.d, function () {
                                        $("[id*=ddlPanchayat]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                    });

                                    $('#ddlPanchayat').val(Village);
                                }
                            });
                        }
                    });
                }
            });
        },
        error: function (a, b, c) {
            alert("1." + a.responseText);
        }
    });
}

// ********************* VALIDATION CHECK ****************** //

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

function Declaration(chk) {
    if (chk) {
       
            $('#btnSubmit2').prop('disabled', false);
        
    }
    else {
        $('#btnSubmit2').prop('disabled', true);
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
    if (!(mobileno.charAt(0) == "6" || mobileno.charAt(0) == "9" || mobileno.charAt(0) == "8" || mobileno.charAt(0) == "7"))
    {
        text += "<br/>" + " \u002A" + " Mobile No. Should Start With 6 ,7, 8 or 9.";
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

function AlphaNumericNum(e)
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

function AadhaarValidation(ControlID)
{
    var Aadhaar = $(ControlID).val();
    if (Aadhaar.length >= 12)
    {
        $(ControlID).attr('style', 'border:2px solid green !important;');
        $(ControlID).css({ "background-color": "#ffffff" });
        return true;
    }
    else
    {
        alertPopup("Aadhaar Validation", "<BR> Please Enter 12 Digit Aadhaar Number.");
        $(ControlID).val('');
        $(ControlID).attr('style', 'border:2px solid red !important;');
        $(ControlID).css({ "background-color": "#fff2ee" });
        return false;
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