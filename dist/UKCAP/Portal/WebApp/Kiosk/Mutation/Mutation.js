$(document).ready(function () {
    $('#divDeed').hide();
    $('#divMortgage').hide();
    $('#divRent').hide();

    $('#DODLI').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '02/12/2016',
        yearRange: "-50:+0",
        onSelect: function (date) {

        }
    });

    $('#DOIOH').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '02/12/2016',
        yearRange: "-50:+0",
        onSelect: function (date) {

        }
    });
    $('#DOPossission').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '02/12/2016',
        yearRange: "-50:+0",
        onSelect: function (date) {

        }
    });


    $('#txtDeedDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '02/12/2016',
        yearRange: "-50:+0",
        onSelect: function (date) {

        }
    });

    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });
});

function fuShowHideDiv(divID, isTrue) {
    debugger;
    //alert(divID);
    if (isTrue == "1") {
        $('#' + divID).show(500);
    }
    if (isTrue == "0") {
        $('#' + divID).hide(500);
    }
}

function SubmitData() {
    debugger;
    if (!ValidateForm()) {
        return;
    }

    var temp = "Gunwant";
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

    var DArr = $('#DOPossission').val().split("/");
    var DOP = DArr[2] + "-" + DArr[1] + "-" + DArr[0];

    var DArr = $('#DODLI').val().split("/");
    var DOP = DArr[2] + "-" + DArr[1] + "-" + DArr[0];

    var DArr = $('#DOIOH').val().split("/");
    var DOP = DArr[2] + "-" + DArr[1] + "-" + DArr[0];

    var DArr = $('#txtDeedDate').val().split("/");
    var DOP = DArr[2] + "-" + DArr[1] + "-" + DArr[0];


    var rbtnLeeseY = "";
    var rbtnBuildY = "";
    var rbtnTaxY = "";
    var rbtMortgageY = "";
    var rbtLawY = "";
    var rbtMutationY = "";
    var rbtConstY = "";
    var rbtRentY = "";


    var reg = $("input[name=rbtnLeese]:checked").val()
    if (reg == 1) {
        rbtnLeeseY = 'True';
    }
    else {
        rbtnLeeseY = 'false';
    }
    var Build = $("input[name=rbtnBuild]:checked").val()
    if (Build == 1) {
        rbtnBuildY = 'True';
    }
    else {
        rbtnBuildY = 'false';
    }

    var Tax = $("input[name=rbtnTax]:checked").val()
    if (Tax == 1) {
        rbtnTaxY = 'True';
    }
    else {
        rbtnTaxY = 'false';
    }
    var Mortgage = $("input[name=rbtMortgage]:checked").val()
    if (Mortgage == 1) {
        rbtMortgageY = 'True';
    }
    else {
        rbtMortgageY = 'false';
    }

    var Law = $("input[name=rbtLaw]:checked").val()
    if (Law == 1) {
        rbtLawY = 'True';
    }
    else {
        rbtLawY = 'false';
    }

    var Mutation = $("input[name=rbtMutation]:checked").val()
    if (Mutation == 1) {
        rbtMutationY = 'True';
    }
    else {
        rbtMutationY = 'false';
    }

    var Const = $("input[name=rbtConst]:checked").val()
    if (Const == 1) {
        rbtConstY = 'True';
    }
    else {
        rbtConstY = 'false';
    }
    var Rent = $("input[name=rbtRent]:checked").val()
    if (Rent == 1) {
        rbtRentY = 'True';
    }
    else {
        rbtRentY = 'false';
    }


    var datavar = {

        'aadhaarNumber': uid,
        'ProfileID': uid,
        'OriginalAllotee': $('#txtAllottee').val(),
        'FatherName': $('#txtFather').val(),
        'DeathIssuingAuthority': $('#txtDeathIssue').val(),
        'DeathLetterNo': $('#txtLetter').val(),
        'DCIssueDate': $('#DODLI').val(),
        'HeirshipIssuingAuthority': $('#txtHeirship').val(),
        'MiscCaseNo': $('#txtCaseno').val(),
        'HeirshipIssueDate': $('#DOIOH').val(),
        'AddressLine1': $('#AddressLine1').val(),
        'AddressLine2': $('#AddressLine2').val(),
        'RoadName': $('#RoadStreetName').val(),
        'LandMark': $('#LandMark').val(),
        'Locality': $('#Locality').val(),
        'AStateCode': $('#ddlState').val(),
        'ADistrictCode': $('#ddlDistrict').val(),
        'ASubDistrictCode': $('#ddlTaluka').val(),
        'AVillageCode': $('#ddlVillage').val(),
        'PinCode': $('#PinCode').val(),
        'District': "",
        'Block': "",
        'Mouza': $('#ddlMouza').val(),
        'DrawingNo': $('#txtDrawing').val(),
        'PlotNo': $('#txtDrawingPlot').val(),
        'AllottedArea': $('#txtArea').val(),
        'AreaUnit': $('#ddlUnit option:selected').text(),
        'RevenuePlotNo': $('#txtPlot').val(),
        'PossessionDate': DOP,
        'RentAmount': $('#txtRent').val(),
        'LandUsed': "",
        'LandUsedType': $('#ddlLandType option:selected').text(),
        'RegistrationNo': $('#txtRegistration').val(),
        'RYear': $('#ddlYear option:selected').text(),
        'DeedBookNo': $('#txtDeedBook').val(),
        'DeedVolumeNo': $('#txtVolume').val(),
        'FromPageDeedNo': $('#txtPagefrom').val(),
        'ToPageDeedNo': $('#txtPageTo').val(),
        'IsRegistered': rbtnLeeseY,
        'DeedNo': $('#txtDeedNo').val(),
        'DeedDate': $('#txtDeedDate').val(),
        'IsConstruted': rbtnBuildY,
        'IsHoldingTaxAccessed': rbtnTaxY,
        'IsNonResidential': 0,
        'IsMortgaged': rbtMortgageY,
        'MortgagedNo': $('#txtPermission').val(),
        'MortgagedBank': $('#txtBank').val(),
        'MortgagedBranch': $('#txtBranch').val(),
        'IsDisputed': rbtLawY,
        'IsMutation': rbtMutationY,
        'IsUnauthorisedConstruction': rbtConstY,
        'GroundRentPaid': rbtRentY,
        'LegalHeirName': $('#txtHeirshipName').val(),
        'LegalHeirFather': $('#txtHeirshipFather').val(),
        'LesseeRelation': $('#txtLesseeRelation').val(),
        'Remark': $('#txtRemark').val(),
        'KhataNo': $('#txtKhata').val(),
        'department': dpt,
        'district': dist,
        'block': blk,
        'panchayat': pan,
        'office': ofc,
        'officer': ofr,
        'HeirsDXML': document.getElementById("hdfHeirsSave").value
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/Mutation/Mutation.aspx/InsertMutation',
            data: $.stringify(obj, null, 4),
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
                window.location.href = '../Forms/Attachment.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID + '&UID=' + uid;
            }

        });// end of Then function of main Data Insert Function

    return false;
}

function AddHeirs(DeleteString) {
    debugger;
    if (validateHeirsValues(DeleteString) == true) {
        var strHeirs = "";
        var strSaveHeirs = "";
        var Appid = "";
        var strTempString = "";
        var strName = "";
        var strFather = "";
        var strRelation = "";
        var strRemarks = "";
        var Str = "";
        var SrNo = "";



        if (DeleteString == "") {

            strName = $('#txtHeirshipName').val();
            strFather = $('#txtHeirshipFather').val();
            strRelation = $('#txtLesseeRelation').val();
            strRemarks = $('#txtRemark').val();




            strTempString = document.getElementById("hdfHeirs").value + "#" + SrNo + "," + strName + "," + strFather + "," + strRelation + "," + strRemarks + "#";
        }
        else {
            strTempString = document.getElementById("hdfHeirs").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblHeirs' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sr. No. </th>";
        Str = Str + "<th style='text-align: center;'>Name of the legal heirs/Successor-in-interest</th>";
        Str = Str + "<th style='text-align: center;'>Father's/Husband's Name</th>";
        Str = Str + "<th style='text-align: center;'>Relation to Lessee</th>";
        Str = Str + "<th style='text-align: center;'>Remarks</th>";
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
            strName = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strFather = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strRelation = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            strRemarks = RemStr;

            var DeleteString = "#" + SrNo + "," + strName + "," + strFather + "," + strRelation + "," + strRemarks + "#";

            Str = Str + "<tr>";

            Str = Str + "<td style='width:65px' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strName + "</td>";
            Str = Str + "<td style='' >" + strFather + "</td>";
            Str = Str + "<td style='' >" + strRelation + "</td>";
            Str = Str + "<td style='' >" + strRemarks + "</td>";


            Str = Str + "<td align='center' style='width:85px'><input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";

            strHeirs = strHeirs + "#" + SrNo + "," + strName + "," + strFather + "," + strFather + "," + strRemarks + "#";

            strSaveHeirs = strSaveHeirs + "#" + SrNo + "," + strName + "," + strFather + "," + strRelation + "," + strRemarks + "#";

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);

        }

        Str = Str + "</table>";
        document.getElementById('divHeirs').innerHTML = Str;
        document.getElementById("hdfHeirs").value = strHeirs;
        document.getElementById("hdfHeirsSave").value = strSaveHeirs;
        document.getElementById("hdfHeirsString").value = intCount;


        rows += "<tr><td>" + strName + "</td><td>" + strFather + "</td><td>" + strFather + "</td><td>" + strRemarks + "</td></tr>";
        $(rows).appendTo("#list tbody");

        strName = $('#txtHeirshipName').val("").focus();
        strFather = $('#txtHeirshipFather').val("");
        strRelation = $('#txtLesseeRelation').val("");
        strRemarks = $('#txtRemark').val("");
    }

}

function DelString(DeleteString) {

    var Msg = "Do you want remove this Heirs?";

    if (confirm(Msg)) {
        var strString = document.getElementById("hdfHeirs").value;
        strString = strString.replace(DeleteString, "");
        document.getElementById("hdfHeirs").value = strString;
        AddHeirs(DeleteString);
    }
}

function validateHeirsValues(DeleteString) {
    debugger;
    if (DeleteString != '') {
        return true;
    }

    var strName = "";
    var strFather = "";
    var strRelation = "";
    var strRemark = "";
    var strMsg = "";
    var isError = false;

    var text = "";
    var opt = "";

    strName = $('#txtHeirshipName').val();
    strFather = $('#txtHeirshipFather').val();
    strRelation = $('#txtLesseeRelation').val();
    strRemarks = $('#txtRemark').val();

    if (strName == null || strName == "") {
        text += "<br /> -Please Enter Heirship Name ";
        $('#txtHeirshipName').attr('style', 'border:1px solid red !important;');
        $('#txtHeirshipName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtHeirshipName').attr('style', 'border:1px solid #ddd !important;');
        $('#txtHeirshipName').css({ "background-color": "#ffffff" });
    }
    if (strFather == null || strFather == "") {
        text += "<br /> -Please Enter Heirship Father ";
        $('#txtHeirshipFather').attr('style', 'border:1px solid red !important;');
        $('#txtHeirshipFather').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtHeirshipFather').attr('style', 'border:1px solid #ddd !important;');
        $('#txtHeirshipFather').css({ "background-color": "#ffffff" });
    }
    if (strRelation == null || strRelation == "") {
        text += "<br /> -Please Enter  Relation  to Lease";
        $('#txtLesseeRelation').attr('style', 'border:1px solid red !important;');
        $('#txtLesseeRelation').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtLesseeRelation').attr('style', 'border:1px solid #ddd !important;');
        $('#txtLesseeRelation').css({ "background-color": "#ffffff" });
    }
    if (strRemarks == null || strRemarks == "") {
        text += "<br /> -Please Enter Remarks";
        $('#txtRemark').attr('style', 'border:1px solid red !important;');
        $('#txtRemark').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtRemark').attr('style', 'border:1px solid #ddd !important;');
        $('#txtRemark').css({ "background-color": "#ffffff" });
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }

    return true;

}

function ValidateForm() {

    var text = "";
    var opt = "";
    debugger;

    // Ownership Detail
    var AllotteeName = $("#txtAllottee").val();
    var FatherName = $("#txtFather").val();
    var IssuingDeathIssue = $("#txtDeathIssue").val();
    var DeathLetterNo = $("#txtLetter").val();
    var DeathDateofissue = $("#DODLI").val();
    var IssueHeirship = $("#txtHeirship").val();
    var CaseNo = $("#txtCaseno").val();
    var HeirshipDateofissue = $("#DOIOH").val();

    //property Address

    var propertyAddressLine1 = $("#AddressLine1").val();
    var RoadStreetName = $("#RoadStreetName").val();
    var Locality = $("#Locality").val();
    var State = $("#ddlState option:selected").val();
    var District = $("#ddlDistrict option:selected").val();
    var Taluka = $("#ddlTaluka option:selected").val();
    var Village = $("#ddlVillage option:selected").val();
    var PinCode = $("#PinCode").val();

    // Detail legal
    var HeirshipName = $("#txtHeirshipName").val();
    var HeirshipFather = $("#txtHeirshipFather").val();
    var LesseeRelation = $("#txtLesseeRelation").val();
    var Remark = $("#txtRemark").val();

    //property detail
    //




    //Property Detail

    var Mouza = $("#ddlMouza option:selected").val();
    var DrawingPlot = $("#txtDrawingPlot").val();
    var Drawing = $("#txtDrawing").val();
    var Area = $("#txtArea").val();
    var Unit = $("#ddlUnit option:selected").val();
    var RevenuePlot = $("#txtPlot").val();
    var DOPossission = $("#DOPossission").val();
    var Rent = $("#txtRent").val();


    //Registerd 
    var Registration = $('#txtRegistration').val();
    var Year = $("#ddlYear option:selected").val();
    var DeedBook = $('#txtDeedBook').val();
    var Volume = $('#txtVolume').val();
    var Pagefrom = $('#txtPagefrom').val();
    var PageTo = $('#txtPageTo').val();
    var LandType = $("#ddlLandType option:selected").val();



    if (AllotteeName == null || AllotteeName == "") {
        text += "<br /> -Please Enter Name of the original Allotee. ";
        $('#txtAllottee').attr('style', 'border:1px solid red !important;');
        $('#txtAllottee').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAllottee').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAllottee').css({ "background-color": "#ffffff" });
    }
    if (FatherName == null || FatherName == "") {
        text += "<br /> -Please Enter Allotte Father Name. ";
        $('#txtFather').attr('style', 'border:1px solid red !important;');
        $('#txtFather').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtFather').attr('style', 'border:1px solid #ddd !important;');
        $('#txtFather').css({ "background-color": "#ffffff" });
    }


    if (IssuingDeathIssue == null || IssuingDeathIssue == "") {
        text += "<br /> -Please Enter Issuing Death Issue ";
        $('#txtDeathIssue').attr('style', 'border:1px solid red !important;');
        $('#txtDeathIssue').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtDeathIssue').attr('style', 'border:1px solid #ddd !important;');
        $('#txtDeathIssue').css({ "background-color": "#ffffff" });
    }
    if (DeathLetterNo == null || DeathLetterNo == "") {
        text += "<br /> -Please Enter Death letter  Number. ";
        $('#txtLetter').attr('style', 'border:1px solid red !important;');
        $('#txtLetter').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtLetter').attr('style', 'border:1px solid #ddd !important;');
        $('#txtLetter').css({ "background-color": "#ffffff" });
    }
    if (DeathDateofissue == null || DeathDateofissue == "") {
        text += "<br /> -Please Enter Death date issued. ";
        $('#DODLI').attr('style', 'border:1px solid red !important;');
        $('#DODLI').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#DODLI').attr('style', 'border:1px solid #ddd !important;');
        $('#DODLI').css({ "background-color": "#ffffff" });
    }
    if (IssueHeirship == null || IssueHeirship == "") {
        text += "<br /> -Please Enter Isuued Heirship. ";
        $('#txtHeirship').attr('style', 'border:1px solid red !important;');
        $('#txtHeirship').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtHeirship').attr('style', 'border:1px solid #ddd !important;');
        $('#txtHeirship').css({ "background-color": "#ffffff" });
    }
    if (CaseNo == null || CaseNo == "") {
        text += "<br /> -Please Enter CaseNo. ";
        $('#txtCaseno').attr('style', 'border:1px solid red !important;');
        $('#txtCaseno').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCaseno').attr('style', 'border:1px solid #ddd !important;');
        $('#txtCaseno').css({ "background-color": "#ffffff" });
    }
    if (HeirshipDateofissue == null || HeirshipDateofissue == "") {
        text += "<br /> -Please Enter Heirship Date of issue. ";
        $('#DOIOH').attr('style', 'border:1px solid red !important;');
        $('#DOIOH').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#DOIOH').attr('style', 'border:1px solid #ddd !important;');
        $('#DOIOH').css({ "background-color": "#ffffff" });
    }

    //Proerty Address
    if (propertyAddressLine1 == null || propertyAddressLine1 == "") {
        text += "<br /> -Please Enter property AddressLine1. ";
        $('#AddressLine1').attr('style', 'border:1px solid red !important;');
        $('#AddressLine1').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#AddressLine1').attr('style', 'border:1px solid #ddd !important;');
        $('#AddressLine1').css({ "background-color": "#ffffff" });
    }

    if (RoadStreetName == null || RoadStreetName == "") {
        text += "<br /> -Please Enter Road Street Name ";
        $('#RoadStreetName').attr('style', 'border:1px solid red !important;');
        $('#RoadStreetName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#RoadStreetName').attr('style', 'border:1px solid #ddd !important;');
        $('#RoadStreetName').css({ "background-color": "#ffffff" });
    }
    if (Locality == null || Locality == "") {
        text += "<br /> -Please Enter Locality ";
        $('#Locality').attr('style', 'border:1px solid red !important;');
        $('#Locality').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#Locality').attr('style', 'border:1px solid #ddd !important;');
        $('#Locality').css({ "background-color": "#ffffff" });
    }


    if (State == "0" || State == "-Select-") {
        text += "<br /> -Please select State.";
        $('#ddlState').attr('style', 'border:1px solid red !important;');
        $('#ddlState').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlState').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlState').css({ "background-color": "#ffffff" });
    }

    if (District == "0" || District == "-Select-") {
        text += "<br /> -Please select District.";
        $('#ddlDistrict').attr('style', 'border:1px solid red !important;');
        $('#ddlDistrict').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlDistrict').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlDistrict').css({ "background-color": "#ffffff" });
    }

    if (Taluka == "0" || Taluka == "-Select-" || Taluka == "Select Block") {
        text += "<br /> -Please select Taluka.";
        $('#ddlTaluka').attr('style', 'border:1px solid red !important;');
        $('#ddlTaluka').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlTaluka').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlTaluka').css({ "background-color": "#ffffff" });
    }

    if (Village == "0" || Village == "-Select-" || Village == "Select Panchayat") {
        text += "<br /> -Please select Village.";
        $('#ddlVillage').attr('style', 'border:1px solid red !important;');
        $('#ddlVillage').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlVillage').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlVillage').css({ "background-color": "#ffffff" });
    }

    if (PinCode == null || PinCode == "") {
        text += "<br /> -Please Enter PinCode. ";
        $('#PinCode').attr('style', 'border:1px solid red !important;');
        $('#PinCode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#PinCode').attr('style', 'border:1px solid #ddd !important;');
        $('#PinCode').css({ "background-color": "#ffffff" });
    }

    //if (HeirshipName == null || HeirshipName == "") {
    //    text += "<br /> -Please Enter Heirship Name. ";
    //    $('#txtHeirshipName').attr('style', 'border:1px solid red !important;');
    //    $('#txtHeirshipName').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#txtHeirshipName').attr('style', 'border:1px solid #ddd !important;');
    //    $('#txtHeirshipName').css({ "background-color": "#ffffff" });
    //}

    //if (HeirshipFather == null || HeirshipFather == "") {
    //    text += "<br /> -Please Enter Heirship Father. ";
    //    $('#txtHeirshipFather').attr('style', 'border:1px solid red !important;');
    //    $('#txtHeirshipFather').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#txtHeirshipFather').attr('style', 'border:1px solid #ddd !important;');
    //    $('#txtHeirshipFather').css({ "background-color": "#ffffff" });
    //}

    //if (LesseeRelation == null || LesseeRelation == "") {
    //    text += "<br /> -Please Enter Lessee Relation. ";
    //    $('#txtLesseeRelation').attr('style', 'border:1px solid red !important;');
    //    $('#txtLesseeRelation').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#txtLesseeRelation').attr('style', 'border:1px solid #ddd !important;');
    //    $('#txtLesseeRelation').css({ "background-color": "#ffffff" });
    //}
    //var Remark = $("#txtRemark").val();
    //if (Remark == null || Remark == "") {
    //    text += "<br /> -Please Enter Remark. ";
    //    $('#txtRemark').attr('style', 'border:1px solid red !important;');
    //    $('#txtRemark').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#txtRemark').attr('style', 'border:1px solid #ddd !important;');
    //    $('#txtRemark').css({ "background-color": "#ffffff" });
    //}


    //property Detail



    if (Mouza == "0" || Mouza == "-Select-") {
        text += "<br /> -Please select Mouza.";
        $('#ddlMouza').attr('style', 'border:1px solid red !important;');
        $('#ddlMouza').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlMouza').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlMouza').css({ "background-color": "#ffffff" });
    }

    if (DrawingPlot == null || DrawingPlot == "") {
        text += "<br /> -Please Enter Drawing Plot ";
        $('#txtDrawingPlot').attr('style', 'border:1px solid red !important;');
        $('#txtDrawingPlot').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtDrawingPlot').attr('style', 'border:1px solid #ddd !important;');
        $('#txtDrawingPlot').css({ "background-color": "#ffffff" });
    }
    if (Drawing == null || Drawing == "") {
        text += "<br /> -Please Enter Drawing. ";
        $('#txtDrawing').attr('style', 'border:1px solid red !important;');
        $('#txtDrawing').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtDrawing').attr('style', 'border:1px solid #ddd !important;');
        $('#txtDrawing').css({ "background-color": "#ffffff" });
    }

    if (Area == null || Area == "") {
        text += "<br /> -Please Enter Allotted Area. ";
        $('#txtArea').attr('style', 'border:1px solid red !important;');
        $('#txtArea').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtArea').attr('style', 'border:1px solid #ddd !important;');
        $('#txtArea').css({ "background-color": "#ffffff" });
    }

    if (Unit == "0" || Unit == "Select Unit") {
        text += "<br /> -Please select Unit.";
        $('#ddlUnit').attr('style', 'border:1px solid red !important;');
        $('#ddlUnit').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlUnit').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlUnit').css({ "background-color": "#ffffff" });
    }

    if (RevenuePlot == null || RevenuePlot == "") {
        text += "<br /> -Please Enter Khata. ";
        $('#txtPlot').attr('style', 'border:1px solid red !important;');
        $('#txtPlot').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtPlot').attr('style', 'border:1px solid #ddd !important;');
        $('#txtPlot').css({ "background-color": "#ffffff" });
    }


    if (DOPossission == null || DOPossission == "") {
        text += "<br /> -Please Enter Date of physical Possession. ";
        $('#DOPossission').attr('style', 'border:1px solid red !important;');
        $('#DOPossission').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#DOPossission').attr('style', 'border:1px solid #ddd !important;');
        $('#DOPossission').css({ "background-color": "#ffffff" });
    }
    if (Rent == null || Rent == "") {
        text += "<br /> -Please Enter Amount Of Grund Rent. ";
        $('#txtRent').attr('style', 'border:1px solid red !important;');
        $('#txtRent').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtRent').attr('style', 'border:1px solid #ddd !important;');
        $('#txtRent').css({ "background-color": "#ffffff" });
    }



    if (Registration == null || Registration == "") {
        text += "<br /> -Please Enter Registration ";
        $('#txtRegistration').attr('style', 'border:1px solid red !important;');
        $('#txtRegistration').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtRegistration').attr('style', 'border:1px solid #ddd !important;');
        $('#txtRegistration').css({ "background-color": "#ffffff" });
    }


    if (Year == "0" || Year == "-Select-") {
        text += "<br /> -Please select Registration Year .";
        $('#ddlYear').attr('style', 'border:1px solid red !important;');
        $('#ddlYear').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlYear').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlYear').css({ "background-color": "#ffffff" });
    }
    var DeedBook = $('#txtDeedBook').val();
    if (DeedBook == null || DeedBook == "") {
        text += "<br /> -Please Enter DeedBook ";
        $('#txtDeedBook').attr('style', 'border:1px solid red !important;');
        $('#txtDeedBook').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtDeedBook').attr('style', 'border:1px solid #ddd !important;');
        $('#txtDeedBook').css({ "background-color": "#ffffff" });
    }

    if (Volume == null || Volume == "") {
        text += "<br /> -Please Enter Volume ";
        $('#txtVolume').attr('style', 'border:1px solid red !important;');
        $('#txtVolume').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtVolume').attr('style', 'border:1px solid #ddd !important;');
        $('#txtVolume').css({ "background-color": "#ffffff" });
    }

    if (Pagefrom == null || Pagefrom == "") {
        text += "<br /> -Please Enter Pagefrom ";
        $('#txtPagefrom').attr('style', 'border:1px solid red !important;');
        $('#txtPagefrom').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtPagefrom').attr('style', 'border:1px solid #ddd !important;');
        $('#txtPagefrom').css({ "background-color": "#ffffff" });
    }

    if (PageTo == null || PageTo == "") {
        text += "<br /> -Please Enter PageTo ";
        $('#txtPageTo').attr('style', 'border:1px solid red !important;');
        $('#txtPageTo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtPageTo').attr('style', 'border:1px solid #ddd !important;');
        $('#txtPageTo').css({ "background-color": "#ffffff" });
    }


    if (LandType == "0" || LandType == "-Select-") {
        text += "<br /> -Please select Leased used Type";
        $('#ddlLandType').attr('style', 'border:1px solid red !important;');
        $('#ddlLandType').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlLandType').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlLandType').css({ "background-color": "#ffffff" });
    }

    //Section 1
    var leasedeed = $("input:radio[name='rbtnLeese']:checked").val();
    if (leasedeed == null) {
        text += "<br /> - Please choose whether lease deed Executed and registered.";
        opt = 1;
    }
    if (leasedeed == "yes") {
        var DeedNo = $('#txtDeedNo').val();
        var DeedDate = $('#txtDeedDate').val();
        if (DeedNo == null || DeedNo == "") {
            text += "<br /> -Please Enter DeedNo ";
            $('#txtDeedNo').attr('style', 'border:1px solid red !important;');
            $('#txtDeedNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtDeedNo').attr('style', 'border:1px solid #ddd !important;');
            $('#txtDeedNo').css({ "background-color": "#ffffff" });
        }
        if (DeedDate == null || DeedDate == "") {
            text += "<br /> -Please Enter DeedDate ";
            $('#txtDeedDate').attr('style', 'border:1px solid red !important;');
            $('#txtDeedDate').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtDeedDate').attr('style', 'border:1px solid #ddd !important;');
            $('#txtDeedDate').css({ "background-color": "#ffffff" });
        }

    }

    //Section 2

    var Buildingconstructed = $("input:radio[name='rbtnBuild']:checked").val();
    if (Buildingconstructed == null) {
        text += "<br /> - Please choose whether Building has been constructed.";
        opt = 1;
    }
    //Section 3
    var holdingtextassessed = $("input:radio[name='rbtnTax']:checked").val();
    if (holdingtextassessed == null) {
        text += "<br /> - Please choose If holding text assessed";
        opt = 1;
    }
    //Section 4
    var propertiesstand = $("input:radio[name='rbtMortgage']:checked").val();
    if (propertiesstand == null) {
        text += "<br /> - Please choose properties stand mortgaged.";
        opt = 1;
    }
    if (propertiesstand == "yes") {
        var Permission = $('#txtPermission').val();
        var BankName = $('#txtBank').val();
        var Branchofbank = $('#txtBranch').val();

        if (Permission == null || Permission == "") {
            text += "<br /> -Please Enter Mortgage Permission ";
            $('#txtPermission').attr('style', 'border:1px solid red !important;');
            $('#txtPermission').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtPermission').attr('style', 'border:1px solid #ddd !important;');
            $('#txtPermission').css({ "background-color": "#ffffff" });
        }
        if (BankName == null || BankName == "") {
            text += "<br /> -Please Enter Bank Name ";
            $('#txtBank').attr('style', 'border:1px solid red !important;');
            $('#txtBank').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtBank').attr('style', 'border:1px solid #ddd !important;');
            $('#txtBank').css({ "background-color": "#ffffff" });
        }
        if (Branchofbank == null || Branchofbank == "") {
            text += "<br /> -Please Enter Branch of bank ";
            $('#txtBranch').attr('style', 'border:1px solid red !important;');
            $('#txtBranch').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtBranch').attr('style', 'border:1px solid #ddd !important;');
            $('#txtBranch').css({ "background-color": "#ffffff" });
        }
    }


    //Section 5
    var Disputepending = $("input:radio[name='rbtLaw']:checked").val();
    if (Disputepending == null) {
        text += "<br /> - Please choose Disputepending in the court of lawregarding title of property.";
        opt = 1;
    }
    //Section 6
    var Applicationformutation = $("input:radio[name='rbtMutation']:checked").val();
    if (Applicationformutation == null) {
        text += "<br /> - Please choose Application for mutation for ROR is pending with tahasildar.";
        opt = 1;
    }
    //Section 7
    var Unauthorisedcostruction = $("input:radio[name='rbtConst']:checked").val();
    if (propertiesstand == null) {
        text += "<br /> - Please choose Unauthorised costruction is premises. ";
        opt = 1;
    }
    //Section 8
    var Dategroundrent = $("input:radio[name='rbtRent']:checked").val();
    if (Dategroundrent == null) {
        text += "<br /> - Please choose Date Ground Rent Along With Interest.";
        opt = 1;
    }




    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }

    return true;

}