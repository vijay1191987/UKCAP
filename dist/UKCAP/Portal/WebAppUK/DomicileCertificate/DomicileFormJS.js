
$(document).ready(function () {
    GetState();
   //GetUKDistrict();
});


function fnSearchData() {
    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];

    if (uid != "" || uid != null) {

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebAppUK/DomicileCertificate/DomicileForm.aspx/SearchCitizenData',
            data: '{"ServiceID":"' + svcid + '","UID":"' + uid + '"}',
            processData: false,
            dataType: "json",
            success: function (data) {
                var obj = jQuery.parseJSON(data.d);
                if (obj[0] != null) {
                    $('#txtApplicantname').val(obj[0]["ApplicantName"]);
                    $('#txtFatherHusbandName').val(obj[0]["FatherName"]);
                    $('#txtMotherName').val(obj[0]["FatherName"]);
                    $('#drpGender').val(obj[0]["Gender"]);
                    $('#txtDOB').val(obj[0]["DOB"]);
                    $('#txtBirthPlace').val(obj[0]["FatherName"]);
                    $('#txtMobileNo').val(obj[0]["MobileNo"]);
                    $('#txtEmailID').val(obj[0]["EmailId"]);
                    $('#txtAddressLine1').val(obj[0]["FatherName"]);
                    $('#txtAddressLine2').val(obj[0]["FullAddress"]);
                    //$('#drpStateName').val(obj[0][""]);
                    //$('#drpDistrictName').val(obj[0][""]);
                    //$('#drpSubDistrictName').val(obj[0][""]);
                    //$('#drpGramPanchayatName').val(obj[0][""]);
                    $('#drpMunsiPatwariChowkiName').val(obj[0][""]);
                    $('#txtPincode').val(obj[0]["pincode"]);
                    //$('#txtReasonForDomicile').val(obj[0]["FatherName"]);
                    //$('#txtFatherBirthPlace').val(obj[0]["FatherName"]);
                    //$("input:radio[name='radio1']:checked").val(),
                    //$('#txtYearsInUK').val(),
                    //$("input:radio[name='radio2']:checked").val(),
                    //$('#txtDescribeProperty').val(),
                    //$("input:radio[name='radio3']:checked").val(),
                    //$('#txtIfNoDescribe').val()
                    //$('#txtFromWhen').val();
                    //$('#txtTypeOfBussiness').val();
                    //$("input:radio[name='radio4']:checked").val();
                    //$('#txtIfYesDistrict').val()
                    //$('#txtGovtDepartment').val();
                    //$('#txtGovtPost').val();

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

function ReturnSubmit()
{
    var qs = getQueryStrings();
    var uid = qs["UID"];
    window.location = '/WebApp/Citizen/Forms/Dashboard.aspx?UID=' + uid;
}

function SubmitData() {
    //document.getElementById("btnSubmit").disabled = true;
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
        'ApplicantName': $('#txtApplicantname').val(),
        'FatherHusbandName': $('#txtFatherHusbandName').val(),
        'MotherName': $('#txtMotherName').val(),
        'Gender': $('#drpGender').val(),
        'DOB': $('#txtDOB').val(),
        'BirthPlace': $('#txtBirthPlace').val(),
        'FatherBirthPlace': $('#txtFatherBirthPlace').val(),
        'MobileNo': $('#txtMobileNo').val(),
        'EmailID': $('#txtEmailID').val(),
        'ReasonForDomicile': $('#txtReasonForDomicile').val(),
        'AddressLine1': $('#txtAddressLine1').val(),
        'AddressLine2': $('#txtAddressLine2').val(),
        'StateName': $('#drpStateName').val(),
        'DistrictName': $('#drpDistrictName').val(),
        'SubDistrictName': $('#drpSubDistrictName').val(),
        'GramPanchayatName': $('#drpGramPanchayatName').val(),
        //'MunsiPatwariChowkiName': $('#drpMunsiPatwariChowkiName').val(),
        'Pincode': $('#txtPincode').val(),
        'IsResidentofUK': $("input:radio[name='radio1']:checked").val(),
        'YearsInUK': $('#txtYearsInUK').val(),
        'HasMomDadProperty': $("input:radio[name='radio2']:checked").val(),
        'DescribeProperty': $('#txtDescribeProperty').val(),
        'DescribeValue': $('#txtDescribeValue').val(),
        'isParentEarningUK': $("input:radio[name='radio3']:checked").val(),
        'IfNoDescribe': $('#txtIfNoDescribe').val(),
        'FromWhen': $('#txtFromWhen').val(),
        'TypeOfBussiness': $('#txtTypeOfBussiness').val(),
        'isParentWorkingGovt': $("input:radio[name='radio4']:checked").val(),
        'IfYesDistrict': $('#txtIfYesDistrict').val(),
        'GovtDepartment': $('#txtGovtDepartment').val(),
        'GovtPost': $('#txtGovtPost').val(),

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
            url: '/WebAppUK/DomicileCertificate/DomicileForm.aspx/InsertDomicileData',
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


function GetState() {
    var SelState = $('#drpStateName').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/StateData",
        data: '{}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=drpStateName]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select State-</option>');
            $.each(r.d, function () {
                $("[id*=drpStateName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });

            $('#drpStateName').val("05");
            GetUKDistrict();

        }
    });
}


//function GetDistrict() {
//    var SelState = $('#drpStateName').val();
//    $.ajax({
//        type: "POST",
//        contentType: "application/json; charset=utf-8",
//        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/DistrictData",
//        data: '{"SelState":"' + SelState + '"}',
//        dataType: "json",
//        success: function (r) {
//            var ddlCustomers = $("[id*=drpDistrictName]");
//            ddlCustomers.empty().append('<option selected="selected" value="0">-Select District-</option>');
//            $.each(r.d, function () {
//                $("[id*=drpDistrictName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
//            });
//        }
//    });
//}


function GetUKDistrict() {
    var SelState = $('#drpStateName').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKDistrict",
        data: '{"prefix":"","StateCode":"' + SelState + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=drpDistrictName]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select District-</option>');
            $.each(r.d, function () {
                $("[id*=drpDistrictName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}


function GetUKBlock() {
    var SelBlock = $('#drpDistrictName').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKBlock",
        data: '{"prefix":"","DistrictCode":"' + SelBlock + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=drpSubDistrictName]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select SubDistrict-</option>');
            $.each(r.d, function () {
                $("[id*=drpSubDistrictName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}


function GetUKPanchayat() {
    var SelSubDistrict = $('#drpSubDistrictName').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKPanchayat",
        data: '{"prefix":"","SubDistrictCode":"' + SelSubDistrict + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=drpGramPanchayatName]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select Gram Panchayat-</option>');
            $.each(r.d, function () {
                $("[id*=drpGramPanchayatName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}


function ValidateForm() {

    var text = "";
    var opt = "";

    if ($('#txtApplicantname').val() == "" || $('#txtApplicantname').val() == null) {
        text += "<br/>" + "	\u002A" + " Please Enter Full Name of Applicant.";
        $('#txtApplicantname').attr('style', 'border:1px solid red !important;');
        $('#txtApplicantname').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtApplicantname').attr('style', 'border:1px solid #ddd !important;');
        $('#txtApplicantname').css({ "background-color": "#ffffff" });
    }


    if ($('#txtFatherHusbandName').val() == "" || $('#txtFatherHusbandName').val() == null) {
        text += "<br/>" + "	\u002A" + " Please Enter Father/Husband Name.";
        $('#txtFatherHusbandName').attr('style', 'border:1px solid red !important;');
        $('#txtFatherHusbandName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtFatherHusbandName').attr('style', 'border:1px solid #ddd !important;');
        $('#txtFatherHusbandName').css({ "background-color": "#ffffff" });
    }


    if ($('#txtMotherName').val() == "" || $('#txtMotherName').val() == null) {
        text += "<br/>" + "	\u002A" + " Please Enter Mother Name.";
        $('#txtMotherName').attr('style', 'border:1px solid red !important;');
        $('#txtMotherName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtMotherName').attr('style', 'border:1px solid #ddd !important;');
        $('#txtMotherName').css({ "background-color": "#ffffff" });
    }


    if ($('#drpGender').val() == "0" || $('#drpGender').val() == "Select") {
        text += "<br/>" + "	\u002A" + " Please Enter Your Gender.";
        $('#drpGender').attr('style', 'border:1px solid red !important;');
        $('#drpGender').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#drpGender').attr('style', 'border:1px solid #ddd !important;');
        $('#drpGender').css({ "background-color": "#ffffff" });
    }


    if ($('#txtDOB').val() == "" || $('#txtDOB').val() == null) {
        text += "<br/>" + "	\u002A" + " Please Enter Your Date Of Birth.";
        $('#txtDOB').attr('style', 'border:1px solid red !important;');
        $('#txtDOB').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtDOB').attr('style', 'border:1px solid #ddd !important;');
        $('#txtDOB').css({ "background-color": "#ffffff" });
    }


    if ($('#txtBirthPlace').val() == "" || $('#txtBirthPlace').val() == null) {
        text += "<br/>" + "	\u002A" + " Please Enter Your Birth Place.";
        $('#txtBirthPlace').attr('style', 'border:1px solid red !important;');
        $('#txtBirthPlace').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtBirthPlace').attr('style', 'border:1px solid #ddd !important;');
        $('#txtBirthPlace').css({ "background-color": "#ffffff" });
    }


    if ($('#txtFatherBirthPlace').val() == "" || $('#txtFatherBirthPlace').val() == null) {
        text += "<br/>" + "	\u002A" + " Please Enter Your Father's Birth Place.";
        $('#txtFatherBirthPlace').attr('style', 'border:1px solid red !important;');
        $('#txtFatherBirthPlace').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtFatherBirthPlace').attr('style', 'border:1px solid #ddd !important;');
        $('#txtFatherBirthPlace').css({ "background-color": "#ffffff" });
    }


    if ($('#txtMobileNo').val() == "" || $('#txtMobileNo').val() == null) {
        text += "<br/>" + "	\u002A" + " Please Enter Your Mobile No.";
        $('#txtMobileNo').attr('style', 'border:1px solid red !important;');
        $('#txtMobileNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtMobileNo').attr('style', 'border:1px solid #ddd !important;');
        $('#txtMobileNo').css({ "background-color": "#ffffff" });
    }


    if ($('#txtEmailID').val() == "" || $('#txtEmailID').val() == null) {
        text += "<br/>" + "	\u002A" + " Please Enter Your Mobile No.";
        $('#txtEmailID').attr('style', 'border:1px solid red !important;');
        $('#txtEmailID').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtEmailID').attr('style', 'border:1px solid #ddd !important;');
        $('#txtEmailID').css({ "background-color": "#ffffff" });
    }


    if ($('#txtReasonForDomicile').val() == "" || $('#txtReasonForDomicile').val() == null) {
        text += "<br/>" + "	\u002A" + " Please Enter Reason For Applying Domicile Certificate.";
        $('#txtReasonForDomicile').attr('style', 'border:1px solid red !important;');
        $('#txtReasonForDomicile').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtReasonForDomicile').attr('style', 'border:1px solid #ddd !important;');
        $('#txtReasonForDomicile').css({ "background-color": "#ffffff" });
    }


    if ($('#txtAddressLine1').val() == "" || $('#txtAddressLine1').val() == null) {
        text += "<br/>" + "	\u002A" + " Please Enter Your Address Line 1.";
        $('#txtAddressLine1').attr('style', 'border:1px solid red !important;');
        $('#txtAddressLine1').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAddressLine1').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAddressLine1').css({ "background-color": "#ffffff" });
    }


    if ($('#txtAddressLine2').val() == "" || $('#txtAddressLine2').val() == null) {
        text += "<br/>" + "	\u002A" + " Please Enter Your Address Line 2.";
        $('#txtAddressLine2').attr('style', 'border:1px solid red !important;');
        $('#txtAddressLine2').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAddressLine2').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAddressLine2').css({ "background-color": "#ffffff" });
    }


    if ($('#drpStateName').val() == "0" || $('#drpStateName').val() == "" || $('#drpStateName').val() == null) {
        text += "<br/>" + "	\u002A" + " Please Select State Name.";
        $('#drpStateName').attr('style', 'border:1px solid red !important;');
        $('#drpStateName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#drpStateName').attr('style', 'border:1px solid #ddd !important;');
        $('#drpStateName').css({ "background-color": "#ffffff" });
    }


    if ($('#drpDistrictName').val() == "0" || $('#drpDistrictName').val() == "" || $('#drpDistrictName').val() == null) {
        text += "<br/>" + "	\u002A" + " Please Select District Name.";
        $('#drpDistrictName').attr('style', 'border:1px solid red !important;');
        $('#drpDistrictName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#drpDistrictName').attr('style', 'border:1px solid #ddd !important;');
        $('#drpDistrictName').css({ "background-color": "#ffffff" });
    }


    if ($('#drpSubDistrictName').val() == "0" || $('#drpSubDistrictName').val() == "" || $('#drpSubDistrictName').val() == null) {
        text += "<br/>" + "	\u002A" + " Please Select Block/Taluka/Sub District.";
        $('#drpSubDistrictName').attr('style', 'border:1px solid red !important;');
        $('#drpSubDistrictName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#drpSubDistrictName').attr('style', 'border:1px solid #ddd !important;');
        $('#drpSubDistrictName').css({ "background-color": "#ffffff" });
    }


    if ($('#drpGramPanchayatName').val() == "0" || $('#drpGramPanchayatName').val() == "" || $('#drpGramPanchayatName').val() == null) {
        text += "<br/>" + "	\u002A" + " Please Select Gram Panchayat Name.";
        $('#drpGramPanchayatName').attr('style', 'border:1px solid red !important;');
        $('#drpGramPanchayatName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#drpGramPanchayatName').attr('style', 'border:1px solid #ddd !important;');
        $('#drpGramPanchayatName').css({ "background-color": "#ffffff" });
    }


    //if ($('#drpMunsiPatwariChowkiName').val() == "0" || $('#drpMunsiPatwariChowkiName').val() == "" || $('#drpMunsiPatwariChowkiName').val() == null) {
    //    text += "<br/>" + "	\u002A" + " Please Enter Municipality/Patvari Chowki Name.";
    //    $('#drpMunsiPatwariChowkiName').attr('style', 'border:1px solid red !important;');
    //    $('#drpMunsiPatwariChowkiName').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#drpMunsiPatwariChowkiName').attr('style', 'border:1px solid #ddd !important;');
    //    $('#drpMunsiPatwariChowkiName').css({ "background-color": "#ffffff" });
    //}


    if ($('#txtPincode').val() == "0" || $('#txtPincode').val() == "" || $('#txtPincode').val() == null) {
        text += "<br/>" + "	\u002A" + " Please Enter Picode.";
        $('#txtPincode').attr('style', 'border:1px solid red !important;');
        $('#txtPincode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtPincode').attr('style', 'border:1px solid #ddd !important;');
        $('#txtscode').css({ "background-color": "#ffffff" });
    }



    if ($("input:radio[name='radio1']:checked").val() == null) {
        text += "<br/>" + "	\u002A" + " Are you a resident of Uttarakhand? ";
        opt = 1;
    }
    else if ($("input:radio[name='radio1']:checked").val()=="Yes")
    {
        if ($('#txtYearsInUK').val() == "" || $('#txtYearsInUK').val() == null) {
            text += "<br/>" + "	\u002A" + " Please Enter For How Many Years Have You Been Residing In Uttarakhand?.";
            $('#txtYearsInUK').attr('style', 'border:1px solid red !important;');
            $('#txtYearsInUK').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtYearsInUK').attr('style', 'border:1px solid #ddd !important;');
            $('#txtYearsInUK').css({ "background-color": "#ffffff" });
        }
    }


    if ($("input[name='radio2']:checked").val() == null) {
        text += "<br/>" + "	\u002A" + " Have you or your father/mother/grandfather any property? ";
        opt = 1;
    }
    else if ($("input:radio[name='radio2']:checked").val() == "Yes")
    {
        if ($('#txtDescribeProperty').val() == "" || $('#txtYearsInUK').val() == null) {
            text += "<br/>" + "	\u002A" + " Please Enter Please Describe Your Father/Mother/Grandfather Property.";
            $('#txtDescribeProperty').attr('style', 'border:1px solid red !important;');
            $('#txtDescribeProperty').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtDescribeProperty').attr('style', 'border:1px solid #ddd !important;');
            $('#txtDescribeProperty').css({ "background-color": "#ffffff" });
        }
    }


    if ($("input:radio[name='radio3']:checked").val() == null) {
        text += "<br/>" + "	\u002A" + " Wheather the parent of the applicant are earning livinghood in their native place? ";
        opt = 1;
    }
    else if ($("input:radio[name='radio3']:checked").val() == "No") {
        if ($('#txtIfNoDescribe').val() == "" || $('#txtYearsInUK').val() == null) {
            text += "<br/>" + " \u002A" + " Please Describe Where They Earning Their livinghood.";
            $('#txtIfNoDescribe').attr('style', 'border:1px solid red !important;');
            $('#txtIfNoDescribe').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtIfNoDescribe').attr('style', 'border:1px solid #ddd !important;');
            $('#txtIfNoDescribe').css({ "background-color": "#ffffff" });
        }

        if ($('#txtFromWhen').val() == "" || $('#txtFromWhen').val() == null) {
            text += "<br/>" + " \u002A" + " Please Describe From When They Earning Their livinghood.";
            $('#txtFromWhen').attr('style', 'border:1px solid red !important;');
            $('#txtFromWhen').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtFromWhen').attr('style', 'border:1px solid #ddd !important;');
            $('#txtFromWhen').css({ "background-color": "#ffffff" });
        }

        if ($('#txtTypeOfBussiness').val() == "" || $('#txtTypeOfBussiness').val() == null) {
            text += "<br/>" + " \u002A" + " Please Enter Please Describe Type of Bussiness Of Their livinghood.";
            $('#txtTypeOfBussiness').attr('style', 'border:1px solid red !important;');
            $('#txtTypeOfBussiness').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtTypeOfBussiness').attr('style', 'border:1px solid #ddd !important;');
            $('#txtTypeOfBussiness').css({ "background-color": "#ffffff" });
        }
    }


    if ($("input[name='radio4']:checked").val() == null) {
        text += "<br/>" + " \u002A" + " Wheather The Parents Of the Applicant Are Working In Govt.Sector?";
        opt = 1;
    }
    else if ($("input:radio[name='radio4']:checked").val() == "Yes") {
        if ($('#txtIfYesDistrict').val() == "" || $('#txtIfYesDistrict').val() == null) {
            text += "<br/>" + " \u002A" + " Please Describe In Which District Parent Are Working In Govt.Sector.";
            $('#txtIfYesDistrict').attr('style', 'border:1px solid red !important;');
            $('#txtIfYesDistrict').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtIfYesDistrict').attr('style', 'border:1px solid #ddd !important;');
            $('#txtIfYesDistrict').css({ "background-color": "#ffffff" });
        }

        if ($('#txtGovtDepartment').val() == "" || $('#txtGovtDepartment').val() == null) {
            text += "<br/>" + " \u002A" + " Please Describe In Which Govt. Department Parent Are Working.";
            $('#txtGovtDepartment').attr('style', 'border:1px solid red !important;');
            $('#txtGovtDepartment').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtGovtDepartment').attr('style', 'border:1px solid #ddd !important;');
            $('#txtGovtDepartment').css({ "background-color": "#ffffff" });
        }

        if ($('#txtGovtPost').val() == "" || $('#txtGovtPost').val() == null) {
            text += "<br/>" + " \u002A" + " Please Describe In Which Govt. Post Parent Are Working.";
            $('#txtGovtPost').attr('style', 'border:1px solid red !important;');
            $('#txtGovtPost').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtGovtPost').attr('style', 'border:1px solid #ddd !important;');
            $('#txtGovtPost').css({ "background-color": "#ffffff" });
        }
    }


    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}


$(document).on("contextmenu", function (e) {
    e.preventDefault();
});


$(document).keydown(function (event) {
    if (event.keyCode == 123) {
        return false;
    }
    else if (event.ctrlKey &&
    (event.keyCode === 67 ||
     event.keyCode === 86 ||
     event.keyCode === 85 ||
     event.keyCode === 117)) {
        //alert('not allowed');
        return false;
    }
    else if (event.ctrlKey && event.shiftKey && event.keyCode == 73) {
        return false;  //Prevent from ctrl+shift+i
    }
});


function EmailValidation() {
    var emailid = document.getElementById('txtEmailID').value;
    //var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-z/A-Z]+\.)+[a-z/A-Z]{1,3})(\]?))$/;
    //var reg = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    var reg = /[a-zA-Z0-9\.\-]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
    if (emailid.match(reg)) {
        $('#txtEmailID').attr('style', 'border:2px solid green !important;');
        $('#txtEmailID').css({ "background-color": "#ffffff" });
    }
    else {
        alertPopup("Email-ID Information.", "</BR> Please Enter Valid Email-ID, In Proper Format");
        $('#txtEmailID').attr('style', 'border:2px solid red !important;');
        $('#txtEmailID').val('');
    }
}


function PinCodeValidation() {
    var PinCode = $('#txtPincode').val();
    if (PinCode.length >= 6) {
        $('#txtPincode').attr('style', 'border:2px solid green !important;');
        $('#txtPincode').css({ "background-color": "#ffffff" });
        return true;
    }
    else {
        alertPopup("Pincode Validation", "<BR><BR> Please Enter 6 Digit Pincode.");
        $('#txtPincode').val('');
        $('#txtPincode').attr('style', 'border:2px solid red !important;');
        $('#txtPincode').css({ "background-color": "#fff2ee" });
        return false;
    }
}


function MobileValidation() {

    var text = "";
    var opt = "";

    var mobileno = $("#txtMobileNo").val();
  
        if (isNaN(mobileno) || mobileno.indexOf(" ") != -1) {
            text += "<br/>" + " \u002A" + " Please Enter A Valid Mobile Number.";
            //alertPopup("Mobile Number", "</BR> Please Enter Valid Mobile Number.");
            $('#txtMobileNos').attr('style', 'border:2px solid red !important;');
            $('#txtMobileNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        if (mobileno.length > 10 || mobileno.length < 10) {
            text += "<br/>" + " \u002A" + " Mobile No. Should Be Atleast 10 Digit.";
            //alertPopup("Mobile Number", "</BR> Mobile No. Should Be 10 Digit.");
            $('#txtMobileNo').attr('style', 'border:2px solid red !important;');
            $('#txtMobileNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        if (!(mobileno.charAt(0) == "9" || mobileno.charAt(0) == "8" || mobileno.charAt(0) == "7")) {
            text += "<br/>" + " \u002A" + " Mobile No. Should Start With 9 ,8 or 7.";
            //alertPopup("Mobile Number", "</BR> Mobile No. Should Starts Sith 9 ,8 or 7");
            $('#txtMobileNo').attr('style', 'border:2px solid red !important;');
            $('#txtMobileNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
    
    if (opt == "1") {
        alertPopup("Mobile Information.", text);
        $("#txtMobileNo").val("");
        return false;
    }
    $('#txtMobileNo').attr('style', 'border:2px solid green !important;');
    $('#txtMobileNo').css({ "background-color": "#ffffff" });
    return true;
}


function GetAge() {
    var t_DOB = $("#txtDOB").val();
    if (t_DOB != "" && t_DOB != null) {
        var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
        var selectedYear = S_date.getFullYear();
        var Age = AgeCalculate(t_DOB);
        $('#txtAge').val(Age);

        //var dNow = new Date();
        //var localdate = (dNow.getDate() + '/' + dNow.getMonth() + 1) + '/' + dNow.getFullYear();
        var fullDate = new Date()
        //console.log(fullDate);
        var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);
        var currentDate = fullDate.getDate() + "/" + twoDigitMonth + "/" + fullDate.getFullYear();
        //console.log(currentDate);

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


function AlphaNumericIdentity(evt) {
    var IdentityDetail = $('#ddlIdentification').val();
    var identityno = $("#txtidentificationid").val();
    if (IdentityDetail == 'AadhaarCard') {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            $("#txtidentificationid").val("");
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
                $("#txtidentificationid").val("");
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


function AllowIFSC() {
    var ifsc = document.getElementById('IFSCCode').value;
    var reg = /^[A-Z|a-z]{4}[0][\w]{6}$/;
    if (ifsc.match(reg)) {

        $('.IFSCCode').css("border-color", "none")
        $('.forerrormsg').html("")
        return true;
    }
    else {
        //alert("You Entered Wrong IFSC Code");
        $('.IFSCCode').css("border-color", "#dc1717")
        $('.forerrormsg').html("Please Enter Correct  IFSC Code")
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


function isNumberKey(evt, inputName) {
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (!isNum(charCode)) return false;
    return true;
}


var bool = 1;
function ckhInfo() {
    if (bool == 0) {
        bool = 1;
        $('#divInfo').show(500);
    }
    else {
        bool = 0;
        $('#divInfo').hide(500);
    }
}


function allowBackspace(evt) {
    var e = evt;
    Name = (e.which) ? e.which : event.keyCode;
    //    console.log( e.keyCode );
    if (Name.keyCode >= 37 && Name.keyCode <= 40) {
        return; // arrow keys
    }
    if (Name.keyCode === 8 || Name.keyCode === 46) {
        return; // backspace / delete
    }
    Name.preventDefault();
} false;


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

function numericspecialchar(e) {
    var regex = new RegExp("[0-9:/-]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}