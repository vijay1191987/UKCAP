$(document).ready(function () {

    $('#myModal').modal({
        backdrop: 'static',
        keyboard: false
    })

    $('#txtAdvancePaidDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
        }
    });

    $('#txtAgreementDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
        }
    });

    $('#txtTenantDOB').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
        }
    });
    $('#txtOwnerDOB').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
        }
    });
    $('#txtReceiptNo').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
        }
    });

    $('#txtCurrentDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
        }
    });
    $('#txtRentPayableDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
        }
    });
    /*Rent/House/Premises Mode function START HERE*/
    $("#txtAdvanceRentInNumber").prop('disabled', true);
    $("#txtAdvanceRentInWords").prop('disabled', true);
    $("#txtPaidAdvance").bind("change", function (e) {
        if ($("#txtPaidAdvance").val() == "0" || $("#txtPaidAdvance").val() == "no") {
            $("#txtAdvanceRentInNumber").prop('disabled', true);
            $("#txtAdvanceRentInWords").prop('disabled', true);
        }
        else {
            $("#txtAdvanceRentInNumber").prop('disabled', false);
            $("#txtAdvanceRentInWords").prop('disabled', false);
        }
    });
    /*Rent/House/Premises Mode function END HERE*/

    /*Payment Mode function START HERE*/
    $("#txtBankName").prop('disabled', true);
    $("#txtBankBranch").prop('disabled', true);
    $("#txtBankIFSCCode").prop('disabled', true);
    $("#txtDDNumber").prop('disabled', true);
    $("#txtReceiptNo").prop('disabled', true);

    $("#txtPaymentMode").bind("change", function (e) {
        if ($("#txtPaymentMode").val() == "0" || $("#txtPaymentMode").val() == "cash") {
            $("#txtBankName").prop('disabled', true);
            $("#txtBankBranch").prop('disabled', true);
            $("#txtBankIFSCCode").prop('disabled', true);
            $("#txtDDNumber").prop('disabled', true);
            $("#txtReceiptNo").prop('disabled', true);
        }
        else {
            $("#txtBankName").prop('disabled', false);
            $("#txtBankBranch").prop('disabled', false);
            $("#txtBankIFSCCode").prop('disabled', false);
            $("#txtDDNumber").prop('disabled', false);
            $("#txtReceiptNo").prop('disabled', false);
        }
    });
    /*Payment Mode function END HERE*/


    GetState();
    $("#DLLVandeeState").change(function () {

        GetUKDistrict('#DLLVandeeState', '#DdlVendeeDistrict')
    });
    $("#VendeeddlState").change(function () {

        GetUKDistrict('#VendeeddlState', '#VendeeddlDistrict')
    });
    $("#ddlVendorState").change(function () {

        GetUKDistrict('#ddlVendorState', '#ddlVendorDistrict')
    });
    $("#VendorddlState").change(function () {

        GetUKDistrict('#VendorddlState', '#VendorddlDistrict')
    });
    //Block bind
    $("#DdlVendeeDistrict").change(function () {

        GetUKBlock('#DdlVendeeDistrict', '#DdlVendeeBlock')
    });
    $("#VendeeddlDistrict").change(function () {

        GetUKBlock('#VendeeddlDistrict', '#VendeeddlTaluka')
    });
    $("#ddlVendorDistrict").change(function () {

        GetUKBlock('#ddlVendorDistrict', '#ddlVendorBlock')
    });
    $("#VendorddlDistrict").change(function () {

        GetUKBlock('#VendorddlDistrict', '#VendorddlTaluka')
    });
    //Panchayat bind
    $("#VendorddlTaluka").change(function () {

        GetUKPanchayat('#VendorddlTaluka', '#VendorddlVillage')
    });
    $("#VendeeddlTaluka").change(function () {

        GetUKPanchayat('#VendeeddlTaluka', '#VendeeddlVillage')
    });
    $("#txtDeedPeriodInYears").on("keyup", function () {
        var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
            val = this.value;
        if (!valid || val > 100) {
            console.log("Invalid input!");
            this.value = val.substring(0, val.length - 1);
        }
    });
    $("#txtDeedPeriodInDays").on("keyup", function () {
        var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
            val = this.value;
        if (!valid || val > 31) {
            console.log("Invalid input!");
            this.value = val.substring(0, val.length - 1);
        }
    });
    $("#txtDeedPeriodInMonths").on("keyup", function () {
        var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
            val = this.value;
        if (!valid || val > 12) {
            console.log("Invalid input!");
            this.value = val.substring(0, val.length - 1);
        }
    });
    $("#txtRateOfInterest").on("keyup", function () {
        var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
            val = this.value;
        if (!valid || val > 100) {
            console.log("Invalid input!");
            this.value = val.substring(0, val.length - 1);
        }
    });
    $("#txtTitleNotClearRefundAmt").on("keyup", function () {
        var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
            val = this.value;

        if (!valid) {
            console.log("Invalid input!");
            this.value = val.substring(0, val.length - 1);
        }
    });
    $("#txtRefundAmount").on("keyup", function () {
        var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
            val = this.value;

        if (!valid) {
            console.log("Invalid input!");
            this.value = val.substring(0, val.length - 1);
        }
    });
    $("#txtAdvanceAmountInNumber").on("keyup", function () {
        var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
            val = this.value;

        if (!valid) {
            console.log("Invalid input!");
            this.value = val.substring(0, val.length - 1);
        }
    }).change(function () {
        //$("#txtAdvanceAmountInWords").val(toWords(this.value).toUpperCase())
    });


    $('#verifyUID').click(function () {
        //debugger;
        //var Adhaar = $('#txtUIDVerify').val();
        var text = "";
        var opt = "";
        var VerificationTypeID = $("#txtVerificationType").val(); if (VerificationTypeID == 0) { text += "<br /> -Please Select Verification Type."; $("#txtVerificationType").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVerificationType").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVerificationType").attr('style', '1px solid #cdcdcd !important;'); $("#txtVerificationType").css({ "background-color": "#ffffff" }); }
        var UIDVerifyID = $("#txtUIDVerify").val(); if (UIDVerifyID == "" || UIDVerifyID == null) { text += "<br /> -Please Select UID Verify."; $("#txtUIDVerify").attr('style', 'border:1px solid #d03100 !important;'); $("#txtUIDVerify").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtUIDVerify").attr('style', '1px solid #cdcdcd !important;'); $("#txtUIDVerify").css({ "background-color": "#ffffff" }); }
        if (opt == "1") {
            alertPopup("Please Fill The Following Information.", text);
            return false;
        }
        openWindow(1, 2, 'UIDCasteCertificate1');
        return true;
    });
    window.CallParent = function () {
        var Element = $('#txtApplicantType').val();
        if (Element == 1) {
            var ID = 2
            //BindAadhaarData(ID);
        }
        else if (Element == 2) {
            var ID = 1
            //BindAadhaarData(ID);
        }
        BindAadhaarData(ID);
    }
});

// Adhaar Verification Window for Verification of Entered UID
function openWindow(UIDVal, value, SessionName) {
    //validateUID(UIDVal) != false
    if (true) {
        //if (UIDVal == "1") {
        //code = UIDVal;
        //}

        //CheckLocalAadhar($("#UID").val());
        var UID = $("#txtUIDVerify").val();
        var EID = "0";
        var left = (screen.width / 2) - (560 / 2);
        var top = (screen.height / 2) - (400 / 2);

        window.open('/UID/Default.aspx?SvcID=403&aadhaarNumber=' + UID + '&kycTypesToUse=OTP', 'open_window',
        ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        window.focus();
    }
    return false;
}

// Bind Entered UID
function BindAadhaarData(ID) {
    if ($('#HFUIDData').val() != "" && $('#HFUIDData').val() != null) {
        var obj = jQuery.parseJSON($('#HFUIDData').val());
        console.log(obj);
        //alert(Element);
        if (ID == 1) {
            if (obj["residentName"] != "" && obj["residentName"] != null) {
                $('#txtVendorName').val(obj["residentName"])
                $('#txtVendorName').prop("disabled", true)
            }
            if (obj["dateOfBirth"] != "0" && obj["dateOfBirth"] != null) {
                $('#txtVendorDOB').val(obj["dateOfBirth"])
                $('#txtVendorDOB').prop("disabled", true)
            }
            if (obj["gender"] != "") {
                if (obj["gender"] == "M") {
                    $('#txtVendorGender').val("M");
                }
                else if (obj["gender"] == "F") {
                    $('#txtVendorGender').val("F");
                }
                else {
                    $('#txtVendorGender').val("T");
                }
                $('#txtVendorGender').prop("disabled", true);
            }
            if (obj["emailId"] != "" && obj["emailId"] != null) {
                $('#txtVendorEmailId').val(obj["emailId"])
                $('#txtVendorEmailId').prop("disabled", true)
            }
            if (obj["phone"] != "" && obj["phone"] != null) {
                $('#txtVendorMobile').val(obj["phone"])
                $('#txtVendorMobile').prop("disabled", true)
            }
            if (obj["houseNumber"] != "" && obj["houseNumber"] != null) {
                $('#txtVendorRentPlace').val(obj["houseNumber"])
                $('#txtVendorRentPlace').prop("disabled", true)
            }
            if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["state"] != "" && obj["state"] != null) {
                $('#txtVendorState').show();
                $('#txtVendorState').val(obj["state"])
                $('#txtVendorState').prop("disabled", true);
                $('#ddlVendorState').hide();
            }
            else {
                $('#ddlVendorState').show();
            }
            if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["state"] != "" && obj["state"] != null) {
                $('#txtVendorDistrict').show();
                $('#txtVendorDistrict').val(obj["district"])
                $('#txtVendorDistrict').prop("disabled", true);
                $('#ddlVendorDistrict').hide();
            }
            else {
                $('#ddlVendorDistrict').show();
            }
            if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["state"] != "" && obj["state"] != null) {
                $('#txtVendorBlock').show();
                $('#txtVendorBlock').val(obj["subDistrict"])
                $('#txtVendorBlock').prop("disabled", true);
                $('#ddlVendorBlock').hide();
            }
            else {
                $('#ddlVendorBlock').show();
            }
            if (obj["pincode"] != "" && obj["pincode"] != null) {
                $('#txtVendorPincode').val(obj["pincode"])
                $('#txtVendorPincode').prop("disabled", true)
            }
            //parmanent Address:
            if (obj["careOf"] != "" && obj["careOf"] != null) {
                $('#VendorAddressLine1').val(obj["careOf"])
                $('#VendorAddressLine1').prop("disabled", true)
            }
            if (obj["houseNumber"] != "" && obj["houseNumber"] != null) {
                $('#VendorAddressLine2').val(obj["houseNumber"])
                $('#VendorAddressLine2').prop("disabled", true)
            }
            if (obj["locality"] != "" && obj["locality"] != null) {
                $('#VendorRoadStreetName').val(obj["locality"])
                $('#VendorRoadStreetName').prop("disabled", true)
            }
            if (obj["landmark"] != "" && obj["landmark"] != null) {
                $('#VendorLandMark').val(obj["landmark"])
                $('#VendorLandMark').prop("disabled", true)
            }
            if (obj["locality"] != "" && obj["locality"] != null) {
                $('#VendorLocality').val(obj["locality"])
                $('#VendorLocality').prop("disabled", true)
            }
            if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["state"] != "" && obj["state"] != null) {
                $('#VendortextState').show();
                $('#VendortextState').val(obj["state"])
                $('#VendortextState').prop("disabled", true);
                $('#VendorddlState').hide();
            }
            else {
                $('#VendorddlState').show();
            }
            if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["vtc"] != "" && obj["vtc"] != null && obj["state"] != "" && obj["state"] != null) {
                $('#VendorTextDistrict').show();
                $('#VendorTextDistrict').val(obj["district"])
                $('#VendorTextDistrict').prop("disabled", true);
                $('#VendorddlDistrict').hide();
            }
            else {
                $('#VendorddlDistrict').show();
            }
            if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["vtc"] != "" && obj["vtc"] != null && obj["state"] != "" && obj["state"] != null) {
                $('#VendortextTaluka').show();
                $('#VendortextTaluka').val(obj["subDistrict"])
                $('#VendortextTaluka').prop("disabled", true);
                $('#VendorddlTaluka').hide();
            }
            else {
                $('#VendorddlTaluka').show();
            }
            if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["vtc"] != "" && obj["vtc"] != null && obj["state"] != "" && obj["state"] != null) {
                $('#VendortextVillage').show();
                $('#VendortextVillage').val(obj["vtc"])
                $('#VendortextVillage').prop("disabled", true);
                $('#VendorddlVillage').hide();
            }
            else {
                $('#VendorddlVillage').show();
                // $('#VendortextVillage').show();
            }
            if (obj["pincode"] != "" && obj["pincode"] != null) {
                $('#VendortxtPinCode').val(obj["pincode"])
                $('#VendortxtPinCode').prop("disabled", true)
            }
        }
        else if (ID == 2) {
            if (obj["residentName"] != "" && obj["residentName"] != null) {
                $('#txtVendeeName').val(obj["residentName"])
                $('#txtVendeeName').prop("disabled", true)
            }
            if (obj["dateOfBirth"] != "0" && obj["dateOfBirth"] != null) {
                $('#txtVendeeDOB').val(obj["dateOfBirth"])
                $('#txtVendeeDOB').prop("disabled", true)
            }
            if (obj["gender"] != "") {
                if (obj["gender"] == "M") {
                    $('#txtVendeeGender').val("M");
                }
                else if (obj["gender"] == "F") {
                    $('#txtVendeeGender').val("F");
                }
                else {
                    $('#txtVendeeGender').val("T");
                }
                $('#txtVendeeGender').prop("disabled", true);
            }
            if (obj["emailId"] != "" && obj["emailId"] != null) {
                $('#txtVendeeEmailId').val(obj["emailId"])
                $('#txtVendeeEmailId').prop("disabled", true)
            }
            if (obj["phone"] != "" && obj["phone"] != null) {
                $('#txtVendeeMobile').val(obj["phone"])
                $('#txtVendeeMobile').prop("disabled", true)
            }
            if (obj["houseNumber"] != "" && obj["houseNumber"] != null) {
                $('#txtVendeeRentPlace').val(obj["houseNumber"])
                $('#txtVendeeRentPlace').prop("disabled", true)
            }
            if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["state"] != "" && obj["state"] != null) {
                $('#txtVendeeState').show();
                $('#txtVendeeState').val(obj["state"])
                $('#txtVendeeState').prop("disabled", true);
                $('#DLLVandeeState').hide();
            }
            else {
                $('#DLLVandeeState').show();
            }
            if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["state"] != "" && obj["state"] != null) {
                $('#txtVendeeDistrict').show();
                $('#txtVendeeDistrict').val(obj["district"])
                $('#txtVendeeDistrict').prop("disabled", true);
                $('#DdlVendeeDistrict').hide();
            }
            else {
                $('#DdlVendeeDistrict').show();
            }
            if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["state"] != "" && obj["state"] != null) {
                $('#txtVendeeBlock').show();
                $('#txtVendeeBlock').val(obj["subDistrict"])
                $('#txtVendeeBlock').prop("disabled", true);
                $('#DdlVendeeBlock').hide();
            }
            else {
                $('#DdlVendeeBlock').show();
            }
            if (obj["pincodeLocal"] != "" && obj["pincodeLocal"] != null) {
                $('#txtVendeePincode').val(obj["pincodeLocal"])
                $('#txtVendeePincode').prop("disabled", true)
            }
            //parmanent Address:
            if (obj["careOf"] != "" && obj["careOf"] != null) {
                $('#VendeeAddressLine1').val(obj["careOf"])
                $('#VendeeAddressLine1').prop("disabled", true)
            }
            if (obj["houseNumber"] != "" && obj["houseNumber"] != null) {
                $('#VendeeAddressLine2').val(obj["houseNumber"])
                $('#VendeeAddressLine2').prop("disabled", true)
            }
            if (obj["locality"] != "" && obj["locality"] != null) {
                $('#VendeeRoadStreetName').val(obj["locality"])
                $('#VendeeRoadStreetName').prop("disabled", true)
            }
            if (obj["landmark"] != "" && obj["landmark"] != null) {
                $('#VendeeLandMark').val(obj["landmark"])
                $('#VendeeLandMark').prop("disabled", true)
            }
            if (obj["locality"] != "" && obj["locality"] != null) {
                $('#VendeeLocality').val(obj["locality"])
                $('#VendeeLocality').prop("disabled", true)
            }
            if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["state"] != "" && obj["state"] != null) {
                $('#VendeetextState').show();
                $('#VendeetextState').val(obj["state"])
                $('#VendeetextState').prop("disabled", true);
                $('#VendeeddlState').hide();
            }
            else {
                $('#ddlVendeeBlock').show();
            }
            if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["vtc"] != "" && obj["vtc"] != null && obj["state"] != "" && obj["state"] != null) {
                $('#VendeeTextDistrict').show();
                $('#VendeeTextDistrict').val(obj["district"])
                $('#VendeeTextDistrict').prop("disabled", true);
                $('#VendeeddlDistrict').hide();
            }
            else {
                $('#VendeeddlDistrict').show();
            }
            if (obj["district"] != "" && obj["district"] != null && obj["subDistrict"] != "" && obj["subDistrict"] != null && obj["vtc"] != "" && obj["vtc"] != null && obj["state"] != "" && obj["state"] != null) {
                $('#VendeetextTaluka').show();
                $('#VendeetextTaluka').val(obj["subDistrict"])
                $('#VendeetextTaluka').prop("disabled", true);
                $('#VendeeddlTaluka').hide();
            }
            else {
                $('#VendeeddlTaluka').show();
            }
            if (obj["vtc"] != "" && obj["vtc"] != null) {
                $('#VendeetextVillage').show();
                $('#VendeetextVillage').val(obj["vtc"])
                $('#VendeetextVillage').prop("disabled", true);
                $('#VendeeddlVillage').hide();
            }
            else {
                $('#VendeeddlVillage').show();
            }
            if (obj["pincode"] != "" && obj["pincode"] != null) {
                $('#VendeetxtPinCode').val(obj["pincode"])
                $('#VendeetxtPinCode').prop("disabled", true)
            }
        }
    }
}

// Login User UID
function GetDatalocalAdhar(uid) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/Deeds/HouseSaleAgreement.aspx/GetDetailAdhaar",
        data: "{ UID: '" + uid + "'}",
        dataType: "json",
        success: function (r) {
            var Element = $('#txtApplicantType').val();
            var obj = JSON.parse(r.d);
            //console.log(obj);
            if (Element == 1) {
                if (obj[0]["residentName"] != "" && obj[0]["residentName"] != null) {
                    $('#txtVendorName').val(obj[0]["residentName"])
                    $('#txtVendorName').prop("disabled", true)
                }
                if (obj[0]["dateOfBirth"] != "0" && obj[0]["dateOfBirth"] != null) {
                    $('#txtVendorDOB').val(obj[0]["dateOfBirth"])
                    $('#txtVendorDOB').prop("disabled", true)
                }
                if (obj[0]["gender"] != "") {
                    if (obj[0]["gender"] == "M") {
                        $('#txtVendorGender').val("M");
                    }
                    else if (obj[0]["gender"] == "F") {
                        $('#txtVendorGender').val("F");
                    }
                    else {
                        $('#txtVendorGender').val("T");
                    }
                    $('#txtVendorGender').prop("disabled", true);
                }
                if (obj[0]["emailId"] != "" && obj[0]["emailId"] != null) {
                    $('#txtVendorEmailId').val(obj[0]["emailId"])
                    $('#txtVendorEmailId').prop("disabled", true)
                }
                if (obj[0]["phone"] != "" && obj[0]["phone"] != null) {
                    $('#txtVendorMobile').val(obj[0]["phone"])
                    $('#txtVendorMobile').prop("disabled", true)
                }
                if (obj[0]["houseNumberLocal"] != "" && obj[0]["houseNumberLocal"] != null) {
                    $('#txtVendorRentPlace').val(obj[0]["houseNumberLocal"])
                    $('#txtVendorRentPlace').prop("disabled", true)
                }

                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null) {
                    $('#txtVendorState').show();
                    $('#txtVendorState').val(obj[0]["state"])
                    $('#txtVendorState').prop("disabled", true);
                    $('#ddlVendorState').hide();
                }
                else {
                    $('#ddlVendorState').show();
                }

                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null) {
                    $('#txtVendorDistrict').show();
                    $('#txtVendorDistrict').val(obj[0]["district"])
                    $('#txtVendorDistrict').prop("disabled", true);
                    $('#ddlVendorDistrict').hide();
                }
                else {
                    $('#ddlVendorDistrict').show();
                }
                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null) {
                    $('#txtVendorBlock').show();
                    $('#txtVendorBlock').val(obj[0]["subDistrict"])
                    $('#txtVendorBlock').prop("disabled", true);
                    $('#ddlVendorBlock').hide();
                }
                else {
                    $('#ddlVendorBlock').show();
                }
                if (obj[0]["pincode"] != "" && obj[0]["pincode"] != null) {
                    $('#txtVendorPincode').val(obj[0]["pincode"])
                    $('#txtVendorPincode').prop("disabled", true)
                }

                //parmanent Address:
                if (obj[0]["careOf"] != "" && obj[0]["careOf"] != null) {
                    $('#VendorAddressLine1').val(obj[0]["careOf"])
                    $('#VendorAddressLine1').prop("disabled", true)
                }
                if (obj[0]["houseNumber"] != "" && obj[0]["houseNumber"] != null) {
                    $('#VendorAddressLine2').val(obj[0]["houseNumber"])
                    $('#VendorAddressLine2').prop("disabled", true)
                }
                if (obj[0]["locality"] != "" && obj[0]["locality"] != null) {
                    $('#VendorRoadStreetName').val(obj[0]["locality"])
                    $('#VendorRoadStreetName').prop("disabled", true)
                }
                if (obj[0]["landmark"] != "" && obj[0]["landmark"] != null) {
                    $('#VendorLandMark').val(obj[0]["landmark"])
                    $('#VendorLandMark').prop("disabled", true)
                }
                if (obj[0]["locality"] != "" && obj[0]["locality"] != null) {
                    $('#VendorLocality').val(obj[0]["locality"])
                    $('#VendorLocality').prop("disabled", true)
                }


                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null && obj[0]["vtc"] != "" && obj[0]["vtc"] != null) {
                    $('#VendortextState').show();
                    $('#VendortextState').val(obj[0]["state"])
                    $('#VendortextState').prop("disabled", true);
                    $('#VendorddlState').hide();
                }
                else {
                    $('#VendorddlState').show();
                }

                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null && obj[0]["vtc"] != "" && obj[0]["vtc"] != null) {
                    $('#VendorTextDistrict').show();
                    $('#VendorTextDistrict').val(obj[0]["district"])
                    $('#VendorTextDistrict').prop("disabled", true);
                    $('#VendorddlDistrict').hide();
                }
                else {
                    $('#VendorddlDistrict').show();
                }

                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null && obj[0]["vtc"] != "" && obj[0]["vtc"] != null) {
                    $('#VendortextTaluka').show();
                    $('#VendortextTaluka').val(obj[0]["subDistrict"])
                    $('#VendortextTaluka').prop("disabled", true);
                    $('#VendorddlTaluka').hide();
                }
                else {
                    $('#VendorddlTaluka').show();
                }

                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null && obj[0]["vtc"] != "" && obj[0]["vtc"] != null) {
                    $('#VendortextVillage').show();
                    $('#VendortextVillage').val(obj[0]["vtc"])
                    $('#VendortextVillage').prop("disabled", true);
                    $('#VendorddlVillage').hide();
                }
                else {
                    $('#VendorddlVillage').show();
                }

                if (obj[0]["pincode"] != "" && obj[0]["pincode"] != null) {
                    $('#VendortxtPinCode').val(obj[0]["pincode"])
                    $('#VendortxtPinCode').prop("disabled", true)
                }
            }
            else if (Element == 2) {
                if (obj[0]["residentName"] != "" && obj[0]["residentName"] != null) {
                    $('#txtVendeeName').val(obj[0]["residentName"])
                    $('#txtVendeeName').prop("disabled", true)
                }

                if (obj[0]["dateOfBirth"] != "0" && obj[0]["dateOfBirth"] != null) {
                    var t_DOB = obj[0]["dateOfBirth"];
                    var D1 = t_DOB.split('-');
                    var calday = D1[2];
                    var calmon = D1[1];
                    var calyear = D1[0];
                    D_DOB = calday.toString() + "-" + calmon.toString() + "-" + calyear;
                    $('#txtVendeeDOB').val(D_DOB);
                    $('#txtVendeeDOB').prop("disabled", true);
                }
                if (obj[0]["gender"] != "") {
                    if (obj[0]["gender"] == "M") {
                        $('#txtVendeeGender').val("M");
                    }
                    else if (obj[0]["gender"] == "F") {
                        $('#txtVendeeGender').val("F");
                    }
                    else {
                        $('#txtVendeeGender').val("T");
                    }
                    $('#txtVendeeGender').prop("disabled", true);
                }
                if (obj[0]["emailId"] != "" && obj[0]["emailId"] != null) {
                    $('#txtVendeeEmailId').val(obj[0]["emailId"])
                    $('#txtVendeeEmailId').prop("disabled", true)
                }
                if (obj[0]["phone"] != "" && obj[0]["phone"] != null) {
                    $('#txtVendeeMobile').val(obj[0]["phone"])
                    $('#txtVendeeMobile').prop("disabled", true)
                }
                if (obj[0]["houseNumber"] != "" && obj[0]["houseNumber"] != null) {
                    $('#txtVendeeRentPlace').val(obj[0]["houseNumber"])
                    $('#txtVendeeRentPlace').prop("disabled", true)
                }
                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null) {
                    $('#txtVendeeState').show();
                    $('#txtVendeeState').val(obj[0]["state"])
                    $('#txtVendeeState').prop("disabled", true);
                    $('#DLLVandeeState').hide();
                }
                else {
                    $('#DLLVandeeState').show();
                }
                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null) {
                    $('#txtVendeeDistrict').show();
                    $('#txtVendeeDistrict').val(obj[0]["district"])
                    $('#txtVendeeDistrict').prop("disabled", true);
                    $('#DdlVendeeDistrict').hide();
                }
                else {
                    $('#DdlVendeeDistrict').show();
                }
                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null) {
                    $('#txtVendeeBlock').show();
                    $('#txtVendeeBlock').val(obj[0]["subDistrict"])
                    $('#txtVendeeBlock').prop("disabled", true);
                    $('#DdlVendeeBlock').hide();
                }
                else {
                    $('#DdlVendeeBlock').show();
                }
                if (obj[0]["pincodeLocal"] != "" && obj[0]["pincodeLocal"] != null) {
                    $('#txtVendeePincode').val(obj[0]["pincodeLocal"])
                    $('#txtVendeePincode').prop("disabled", true)
                }
                //parmanent Address:
                if (obj[0]["careOf"] != "" && obj[0]["careOf"] != null) {
                    $('#VendeeAddressLine1').val(obj[0]["careOf"])
                    $('#VendeeAddressLine1').prop("disabled", true)
                }
                if (obj[0]["houseNumber"] != "" && obj[0]["houseNumber"] != null) {
                    $('#VendeeAddressLine2').val(obj[0]["houseNumber"])
                    $('#VendeeAddressLine2').prop("disabled", true)
                }
                if (obj[0]["locality"] != "" && obj[0]["locality"] != null) {
                    $('#VendeeRoadStreetName').val(obj[0]["locality"])
                    $('#VendeeRoadStreetName').prop("disabled", true)
                }
                if (obj[0]["landmark"] != "" && obj[0]["landmark"] != null) {
                    $('#VendeeLandMark').val(obj[0]["landmark"])
                    $('#VendeeLandMark').prop("disabled", true)
                }
                if (obj[0]["locality"] != "" && obj[0]["locality"] != null) {
                    $('#VendeeLocality').val(obj[0]["locality"])
                    $('#VendeeLocality').prop("disabled", true)
                }

                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null && obj[0]["vtc"] != "" && obj[0]["vtc"] != null) {
                    $('#VendeetextState').show();
                    $('#VendeetextState').val(obj[0]["state"])
                    $('#VendeetextState').prop("disabled", true);
                    $('#VendeeddlState').hide();
                }
                else {
                    $('#VendeeddlState').show();
                }

                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null && obj[0]["vtc"] != "" && obj[0]["vtc"] != null) {
                    $('#VendeeTextDistrict').show();
                    $('#VendeeTextDistrict').val(obj[0]["district"])
                    $('#VendeeTextDistrict').prop("disabled", true);
                    $('#VendeeddlDistrict').hide();
                }
                else {
                    $('#VendeeddlDistrict').show();
                }

                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null && obj[0]["vtc"] != "" && obj[0]["vtc"] != null) {
                    $('#VendeetextTaluka').show();
                    $('#VendeetextTaluka').val(obj[0]["subDistrict"])
                    $('#VendeetextTaluka').prop("disabled", true);
                    $('#VendeeddlTaluka').hide();
                }
                else {
                    $('#VendeeddlTaluka').show();
                }

                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null && obj[0]["vtc"] != "" && obj[0]["vtc"] != null) {
                    $('#VendeetextVillage').show();
                    $('#VendeetextVillage').val(obj[0]["vtc"])
                    $('#VendeetextVillage').prop("disabled", true);
                    $('#VendeeddlVillage').hide();
                }
                else {
                    $('#VendeeddlVillage').show();
                }

                if (obj[0]["pincode"] != "" && obj[0]["pincode"] != null) {
                    $('#VendeetxtPinCode').val(obj[0]["pincode"])
                    $('#VendeetxtPinCode').prop("disabled", true)
                }
            }
        }
    });
}

// Select Applicant Type
function submitApplicantType(e) {
    //debugger;
    var text = "";
    var ApplicatantType = $('#txtApplicantType').val();
    if (ApplicatantType == "0") {
        text += "Please Select Applicatant Type. ";
        $("#txtApplicantType").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtApplicantType").css({ "background-color": "#fff2ee" });
        $("#errorMsg").show();
        $("#errorMsg").val(text);
    }
    else {
        $("#txtApplicantType").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtApplicantType").css({ "background-color": "#ffffff" });

        var qs = getQueryStrings();
        var uid = qs["UID"];
        var SvcID = qs["SvcID"];
        var DPT = qs["DPT"];
        GetDatalocalAdhar(uid);

        $('#myModal').modal('hide');
    }
}

// Save Form Data
function SubmitData(e) {
    //debugger;
    var opt = 0;
    if (!ValidateForm()) {
        return;
    }
    var objUser = {};
    objUser = {

        "DistrictName": "",
        "TalukaName": "",

        "VerificationTypeID": "",
        "VendeeAadhaarUIDNumber": "",
        "VendeeAadhaarVerified": "",
        "VendorAadhaarUIDNumber": "",
        "VendorAadhaarVerified": "",
        "VendeeName": "",
        "VendeeDOB": "",
        "VendeeGenderID": "",
        "VendeeEmail": "",
        "VendeeMobile": "",
        "VendeePresentAddress": "",
        "VendeeStateID": "",
        "VendeeDistID": "",
        "VendeeDistBlockID": "",
        "VendeePinCode": "",
        "VendorName": "",
        "VendorDOB": "",
        "VendorGenderID": "",
        "VendorEmail": "",
        "VendorMobile": "",
        "VendorPresentAddress": "",
        "VendorStateID": "",
        "VendorDistID": "",
        "VendorDistBlockID": "",
        "VendorPinCode": "",
        "VendeePrmntAddrLine1": "",
        "VendeePrmntAddrLine2": "",
        "VendeePrmntStreetName": "",
        "VendeePrmntStreetLandMark": "",
        "VendeePrmntStreetLocality": "",
        "VendeePrmntStateID": "",
        "VendeePrmntDistD": "",
        "VendeePrmntBlockD": "",
        "VendeePrmntCityID": "",
        "VendeePrmntPinCode": "",
        "VendorPrmntAddrLine1": "",
        "VendorPrmntAddrLine2": "",
        "VendorPrmntStreetName": "",
        "VendorPrmntStreetLandMark": "",
        "VendorPrmntStreetLocality": "",
        "VendorPrmntStateID": "",
        "VendorPrmntDistD": "",
        "VendorPrmntBlockD": "",
        "VendorPrmntCityID": "",
        "VendorPrmntPinCode": "",
        "HouseFullAddress": "",
        "HouseLandmark": "",
        "HouseCity": "",
        "HousePincode": "",
        "AgreementDate": "",
        "AgreementPlace": "",
        "DefaultCaseROI": "",
        "BreachCaseROI": "",
        "IntimationProdOfAdvoct": "",
        "AdvnsAmntPaidDate": "",
        "AdvnsAmnt": "",
        "AdvnsAmntInWords": "",
        "DeedCompleteYear": "",
        "DeedCompleteMonth": "",
        "DeedCompleteDays": "",
        "RefundAmount": "",
        "CreatedBy": "",
        "Createdon": "",
        "IsActive": "",
        "AppID": "",
        "IsVarified": ""
    };
    var text = "";


    var ApplicatantType = $('#txtApplicantType').val();
    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];

    objUser.VerificationTypeID = $('#txtVerificationType').val();
    // 1 - Vendor
    // 2 - Vendee
    if (ApplicatantType == 1) {
        objUser.VendeeAadhaarUIDNumber = $('#txtUIDVerify').val();
        objUser.VendorAadhaarUIDNumber = uid;
        objUser.DistrictName = $('#txtVendorDistrict').val();
        objUser.TalukaName = $('#txtVendorBlock').val();
    }
    else {
        objUser.VendorAadhaarUIDNumber = $('#txtUIDVerify').val();
        objUser.VendeeAadhaarUIDNumber = uid;
        objUser.DistrictName = $('#txtVendeeDistrict').val();
        objUser.TalukaName = $('#txtVendeeBlock').val();
    }

    objUser.VendeeAadhaarVerified = "1";
    objUser.VendorAadhaarVerified = "1";

    objUser.VendeeName = $('#txtVendeeName').val();
    objUser.VendeeDOB = $('#txtVendeeDOB').val();
    objUser.VendeeGenderID = $('#txtVendeeGender').val();
    objUser.VendeeEmail = $('#txtVendeeEmailId').val();
    objUser.VendeeMobile = $('#txtVendeeMobile').val();
    objUser.VendeePresentAddress = $('#txtVendeeRentPlace').val();
    objUser.VendeeStateID = $('#txtVendeeState ').val();
    objUser.VendeeDistID = $('#txtVendeeDistrict').val();
    objUser.VendeeDistBlockID = $('#txtVendeeBlock').val();
    objUser.VendeePinCode = $('#txtVendeePincode').val();

    objUser.VendorName = $('#txtVendorName').val();
    objUser.VendorDOB = $('#txtVendorDOB').val();
    objUser.VendorGenderID = $('#txtVendorGender').val();
    objUser.VendorEmail = $('#txtVendorEmailId').val();
    objUser.VendorMobile = $('#txtVendorMobile').val();
    objUser.VendorPresentAddress = $('#txtVendorRentPlace').val();
    objUser.VendorStateID = $('#txtVendorState').val();
    objUser.VendorDistID = $('#txtVendorDistrict').val();
    objUser.VendorDistBlockID = $('#txtVendorBlock').val();
    objUser.VendorPinCode = $('#txtVendorPincode').val();

    objUser.VendeePrmntAddrLine1 = $('#VendeeAddressLine1').val();
    objUser.VendeePrmntAddrLine2 = $('#VendeeAddressLine2').val();
    objUser.VendeePrmntStreetName = $('#VendeeRoadStreetName').val();
    objUser.VendeePrmntStreetLandMark = $('#VendeeLandMark').val();
    objUser.VendeePrmntStreetLocality = $('#VendeeLocality').val();
    objUser.VendeePrmntStateID = $('#VendeetextState').val();
    objUser.VendeePrmntDistD = $('#VendeeTextDistrict').val();
    objUser.VendeePrmntBlockD = $('#VendeetextTaluka').val();
    objUser.VendeePrmntCityID = $('#VendeetextVillage').val();
    objUser.VendeePrmntPinCode = $('#VendeetxtPinCode').val();

    objUser.VendorPrmntAddrLine1 = $('#VendorAddressLine1').val();
    objUser.VendorPrmntAddrLine2 = $('#VendorAddressLine2').val();
    objUser.VendorPrmntStreetName = $('#VendorRoadStreetName').val();
    objUser.VendorPrmntStreetLandMark = $('#VendorLandMark').val();
    objUser.VendorPrmntStreetLocality = $('#VendorLocality').val();
    objUser.VendorPrmntStateID = $('#VendorddlState').val();
    objUser.VendorPrmntDistD = $('#VendorddlDistrict').val();
    objUser.VendorPrmntBlockD = $('#VendorddlTaluka').val();
    objUser.VendorPrmntCityID = $('#VendorddlVillage').val();
    objUser.VendorPrmntPinCode = $('#VendortxtPinCode').val();


    objUser.HouseFullAddress = $('#txtSaleHouseFullAddress').val();
    objUser.HouseLandmark = $('#txtSaleHouseLandmark').val();
    objUser.HouseCity = $('#txtSaleHouseCity').val();
    objUser.HousePincode = $('#txtSaleHousePincode').val();
    objUser.AgreementDate = $('#txtAgreementDate').val();
    objUser.AgreementPlace = $('#txtAgreementPlace').val();
    objUser.DefaultCaseROI = $('#txtRateOfInterest').val();
    objUser.BreachCaseROI = $('#txtRefundAmount').val();
    objUser.IntimationProdOfAdvoct = $('#txtAdvocateIntimationPeriod').val();
    objUser.AdvnsAmntPaidDate = $('#txtAdvancePaidDate').val();
    objUser.AdvnsAmnt = $('#txtAdvanceAmountInNumber').val();
    objUser.AdvnsAmntInWords = $('#txtAdvanceAmountInWords').val();
    objUser.DeedCompleteYear = $('#txtDeedPeriodInYears').val();
    objUser.DeedCompleteMonth = $('#txtDeedPeriodInMonths').val();
    objUser.DeedCompleteDays = $('#txtDeedPeriodInDays').val();
    objUser.RefundAmount = $('#txtTitleNotClearRefundAmt').val();
    objUser.CreatedBy = uid;
    objUser.Createdon = "";
    objUser.IsActive = 'false';
    objUser.AppID = "";
    objUser.IsVarified = 'false';

    var temp = 'Ravi';
    var obj = {
        "prefix": "'" + temp + "'",
        "Data": JSON.stringify(objUser, null, 4)
    };

    $.when(
       $.ajax({
           type: "POST",
           contentType: "application/json; charset=utf-8",
           url: "/WebAppUK/Deeds/HouseSaleAgreement.aspx/SaleOfHouse",
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

           if (result) {

               //bootbox.alert("Aggreement Request Applied Successfully..")
               alert("Application submitted successfully. Reference ID : " + obj.AppID); //+ " Please attach necessary document.");
               window.location.href = "/WebAppUK/Deeds/OutputForHSA.aspx?SvcID=" + svcid + '&AppID=' + obj.AppID + '&UID=' + uid;
           }

       });// end of Then function of main Data Insert Function

    return false;

}

function ValidateForm() {
    //debugger;
    var text = "";
    var opt = "";

    var txtVerificationTypeID = $("#txtVerificationType").val(); if (txtVerificationTypeID == 0) { text += "<br /> -Please Select VerificationType."; $("#txtVerificationType").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVerificationType").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVerificationType").attr('style', '1px solid #cdcdcd !important;'); $("#txtVerificationType").css({ "background-color": "#ffffff" }); }
    var txtUIDVerifyID = $("#txtUIDVerify").val(); if (txtUIDVerifyID == "" || txtUIDVerifyID == null) { text += "<br /> -Please Select UIDVerify."; $("#txtUIDVerify").attr('style', 'border:1px solid #d03100 !important;'); $("#txtUIDVerify").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtUIDVerify").attr('style', '1px solid #cdcdcd !important;'); $("#txtUIDVerify").css({ "background-color": "#ffffff" }); }
    var txtVendeeNameID = $("#txtVendeeName").val(); if (txtVendeeNameID == "" || txtVendeeNameID == null) { text += "<br /> -Please Select VendeeName."; $("#txtVendeeName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVendeeName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVendeeName").attr('style', '1px solid #cdcdcd !important;'); $("#txtVendeeName").css({ "background-color": "#ffffff" }); }
    var txtVendeeDOBID = $("#txtVendeeDOB").val(); if (txtVendeeDOBID == "" || txtVendeeDOBID == null) { text += "<br /> -Please Select VendeeDOB."; $("#txtVendeeDOB").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVendeeDOB").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVendeeDOB").attr('style', '1px solid #cdcdcd !important;'); $("#txtVendeeDOB").css({ "background-color": "#ffffff" }); }
    var txtVendeeGenderID = $("#txtVendeeGender").val(); if (txtVendeeGenderID == '-Select-' || txtVendeeGenderID == "0") { text += "<br /> -Please Select Vendee Gender. "; $("#txtVendeeGender").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVendeeGender").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVendeeGender").attr('style', 'border:1px solid #cdcdcd !important;'); $("#txtVendeeGender").css({ "background-color": "#ffffff" }); }
    var txtVendeeEmailIdID = $("#txtVendeeEmailId").val(); if (txtVendeeEmailIdID == "" || txtVendeeEmailIdID == null) { text += "<br /> -Please Select Vendee EmailId."; $("#txtVendeeEmailId").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVendeeEmailId").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVendeeEmailId").attr('style', '1px solid #cdcdcd !important;'); $("#txtVendeeEmailId").css({ "background-color": "#ffffff" }); }
    var txtVendeeMobileID = $("#txtVendeeMobile").val(); if (txtVendeeMobileID == "" || txtVendeeMobileID == null) { text += "<br /> -Please Select Vendee Mobile."; $("#txtVendeeMobile").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVendeeMobile").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVendeeMobile").attr('style', '1px solid #cdcdcd !important;'); $("#txtVendeeMobile").css({ "background-color": "#ffffff" }); }
    var txtVendeeRentPlaceID = $("#txtVendeeRentPlace").val(); if (txtVendeeRentPlaceID == "" || txtVendeeRentPlaceID == null) { text += "<br /> -Please Select VendeeRent Place."; $("#txtVendeeRentPlace").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVendeeRentPlace").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVendeeRentPlace").attr('style', '1px solid #cdcdcd !important;'); $("#txtVendeeRentPlace").css({ "background-color": "#ffffff" }); }
    var txtVendeeStateID = $("#txtVendeeState").val(); if ((txtVendeeStateID == "" || txtVendeeStateID == null) && $("#DLLVandeeState").val() == 0) { $("#txtVendeeState").hide(); text += "<br /> -Please Select Vendee State."; $("#DLLVandeeState").attr('style', 'border:1px solid #d03100 !important;'); $("#DLLVandeeState").css({ "background-color": "#fff2ee" }); opt = 1; } else { if ($("#DLLVandeeState").val() != 0) { $("#txtVendeeState").hide(); $("#DLLVandeeState").attr('style', '1px solid #cdcdcd !important;'); $("#DLLVandeeState").css({ "background-color": "#ffffff" }); } }
    var txtVendeeDistrictID = $("#txtVendeeDistrict").val(); if (txtVendeeDistrictID == "" || txtVendeeDistrictID == null) { $("#txtVendeeDistrict").hide(); $("#DdlVendeeDistrict").show(); if ($("#DdlVendeeDistrict").val() == 0) { text += "<br /> -Please Select Vendee District."; $("#DdlVendeeDistrict").attr('style', 'border:1px solid #d03100 !important;'); $("#DdlVendeeDistrict").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#DdlVendeeDistrict").attr('style', 'border:1px solid #cdcdcd !important;'); $("#DdlVendeeDistrict").css({ "background-color": "#fff" }); } } else { $("#DdlVendeeDistrict").hide(); $("#txtVendeeDistrict").show(); $("#txtVendeeDistrict").attr('style', '1px solid #cdcdcd !important;'); $("#txtVendeeDistrict").css({ "background-color": "##eee" }); }
    var txtVendeeBlockID = $("#txtVendeeBlock").val(); if (txtVendeeBlockID == "" || txtVendeeBlockID == null) { $("#txtVendeeBlock").hide(); $("#DdlVendeeBlock").show(); if ($("#DdlVendeeBlock").val() == 0) { text += "<br /> -Please Select Vendee Block."; $("#DdlVendeeBlock").attr('style', 'border:1px solid #d03100 !important;'); $("#DdlVendeeBlock").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#DdlVendeeBlock").attr('style', 'border:1px solid #cdcdcd !important;'); $("#DdlVendeeBlock").css({ "background-color": "#fff" }); } } else { $("#DdlVendeeBlock").hide(); $("#txtVendeeBlock").show(); $("#txtVendeeBlock").attr('style', '1px solid #cdcdcd !important;'); $("#txtVendeeBlock").css({ "background-color": "##eee" }); }
    var txtVendeePincodeID = $("#txtVendeePincode").val(); if (txtVendeePincodeID == "" || txtVendeePincodeID == null) { text += "<br /> -Please Select VendeePincode."; $("#txtVendeePincode").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVendeePincode").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVendeePincode").attr('style', '1px solid #cdcdcd !important;'); $("#txtVendeePincode").css({ "background-color": "#ffffff" }); }
    var txtVendorNameID = $("#txtVendorName").val(); if (txtVendorNameID == "" || txtVendorNameID == null) { text += "<br /> -Please Select VendorName."; $("#txtVendorName").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVendorName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVendorName").attr('style', '1px solid #cdcdcd !important;'); $("#txtVendorName").css({ "background-color": "#ffffff" }); }
    var txtVendorDOBID = $("#txtVendorDOB").val(); if (txtVendorDOBID == "" || txtVendorDOBID == null) { text += "<br /> -Please Select VendorDOB."; $("#txtVendorDOB").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVendorDOB").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVendorDOB").attr('style', '1px solid #cdcdcd !important;'); $("#txtVendorDOB").css({ "background-color": "#ffffff" }); }
    var txtVendorGenderID = $("#txtVendorGender").val(); if (txtVendorGenderID == '-Select-' || txtVendorGenderID == "0") { text += "<br /> -Please Select Vendor Gender. "; $("#txtVendorGender").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVendorGender").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVendorGender").attr('style', 'border:1px solid #cdcdcd !important;'); $("#txtVendorGender").css({ "background-color": "#ffffff" }); }
    var txtVendorEmailIdID = $("#txtVendorEmailId").val(); if (txtVendorEmailIdID == "" || txtVendorEmailIdID == null) { text += "<br /> -Please Select Vendor EmailId."; $("#txtVendorEmailId").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVendorEmailId").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVendorEmailId").attr('style', '1px solid #cdcdcd !important;'); $("#txtVendorEmailId").css({ "background-color": "#ffffff" }); }
    var txtVendorMobileID = $("#txtVendorMobile").val(); if (txtVendorMobileID == "" || txtVendorMobileID == null) { text += "<br /> -Please Select Vendor Mobile."; $("#txtVendorMobile").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVendorMobile").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVendorMobile").attr('style', '1px solid #cdcdcd !important;'); $("#txtVendorMobile").css({ "background-color": "#ffffff" }); }
    var txtVendorRentPlaceID = $("#txtVendorRentPlace").val(); if (txtVendorRentPlaceID == "" || txtVendorRentPlaceID == null) { text += "<br /> -Please Select Vendor RentPlace."; $("#txtVendorRentPlace").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVendorRentPlace").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVendorRentPlace").attr('style', '1px solid #cdcdcd !important;'); $("#txtVendorRentPlace").css({ "background-color": "#ffffff" }); }
    var txtVendorStateID = $("#txtVendorState").val(); if ((txtVendorStateID == "" || txtVendorStateID == null) && $("#ddlVendorState").val() == 0) { $("#txtVendorState").hide(); text += "<br /> -Please Select Vendor State."; $("#ddlVendorState").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlVendorState").css({ "background-color": "#fff2ee" }); opt = 1; } else { if ($("#ddlVendorState").val() != 0) { $("#txtVendorState").hide(); $("#ddlVendorState").attr('style', '1px solid #cdcdcd !important;'); $("#ddlVendorState").css({ "background-color": "#ffffff" }); } }
    var txtVendorDistrictID = $("#txtVendorDistrict").val(); if (txtVendorDistrictID == "" || txtVendorDistrictID == null) { $("#txtVendorDistrict").hide(); $("#ddlVendorDistrict").show(); if ($("#ddlVendorDistrict").val() == 0) { text += "<br /> -Please Select Vendor District."; $("#ddlVendorDistrict").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlVendorDistrict").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlVendorDistrict").attr('style', 'border:1px solid #cdcdcd !important;'); $("#ddlVendorDistrict").css({ "background-color": "#fff" }); } } else { $("#ddlVendorDistrict").hide(); $("#txtVendorDistrict").attr('style', '1px solid #cdcdcd !important;'); $("#txtVendorDistrict").css({ "background-color": "##eee" }); }
    var txtVendorBlockID = $("#txtVendorBlock").val(); if (txtVendorBlockID == "" || txtVendorBlockID == null) { $("#txtVendorBlock").hide(); $("#ddlVendorBlock").show(); if ($("#ddlVendorBlock").val() == 0) { text += "<br /> -Please Select Vendor Block."; $("#ddlVendorBlock").attr('style', 'border:1px solid #d03100 !important;'); $("#ddlVendorBlock").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#ddlVendorBlock").attr('style', 'border:1px solid #cdcdcd !important;'); $("#ddlVendorBlock").css({ "background-color": "#fff" }); } } else { $("#ddlVendorBlock").hide(); $("#txtVendorBlockID").attr('style', '1px solid #cdcdcd !important;'); $("#txtVendorBlockID").css({ "background-color": "##eee" }); }
    var txtVendorPincodeID = $("#txtVendorPincode").val(); if (txtVendorPincodeID == "" || txtVendorPincodeID == null) { text += "<br /> -Please Select Vendor Pincode."; $("#txtVendorPincode").attr('style', 'border:1px solid #d03100 !important;'); $("#txtVendorPincode").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtVendorPincode").attr('style', '1px solid #cdcdcd !important;'); $("#txtVendorPincode").css({ "background-color": "#ffffff" }); }
    var VendeeAddressLine1ID = $("#VendeeAddressLine1").val(); if (VendeeAddressLine1ID == "" || VendeeAddressLine1ID == null) { text += "<br /> -Please Select Vendee AddressLine1."; $("#VendeeAddressLine1").attr('style', 'border:1px solid #d03100 !important;'); $("#VendeeAddressLine1").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendeeAddressLine1").attr('style', '1px solid #cdcdcd !important;'); $("#VendeeAddressLine1").css({ "background-color": "#ffffff" }); }
    //var VendeeAddressLine2ID = $("#VendeeAddressLine2").val(); if (VendeeAddressLine2ID == "" || VendeeAddressLine2ID == null) { text += "<br /> -Please Select VendeeAddressLine2."; $("#VendeeAddressLine2").attr('style', 'border:1px solid #d03100 !important;'); $("#VendeeAddressLine2").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendeeAddressLine2").attr('style', '1px solid #cdcdcd !important;'); $("#VendeeAddressLine2").css({ "background-color": "#ffffff" }); }
    var VendeeRoadStreetNameID = $("#VendeeRoadStreetName").val(); if (VendeeRoadStreetNameID == "" || VendeeRoadStreetNameID == null) { text += "<br /> -Please Select Vendee RoadStreet Name."; $("#VendeeRoadStreetName").attr('style', 'border:1px solid #d03100 !important;'); $("#VendeeRoadStreetName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendeeRoadStreetName").attr('style', '1px solid #cdcdcd !important;'); $("#VendeeRoadStreetName").css({ "background-color": "#ffffff" }); }
    //var VendeeLandMarkID = $("#VendeeLandMark").val(); if (VendeeLandMarkID == "" || VendeeLandMarkID == null) { text += "<br /> -Please Select VendeeLandMark."; $("#VendeeLandMark").attr('style', 'border:1px solid #d03100 !important;'); $("#VendeeLandMark").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendeeLandMark").attr('style', '1px solid #cdcdcd !important;'); $("#VendeeLandMark").css({ "background-color": "#ffffff" }); }
    var VendeeLocalityID = $("#VendeeLocality").val(); if (VendeeLocalityID == "" || VendeeLocalityID == null) { text += "<br /> -Please Select VendeeLocality."; $("#VendeeLocality").attr('style', 'border:1px solid #d03100 !important;'); $("#VendeeLocality").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendeeLocality").attr('style', '1px solid #cdcdcd !important;'); $("#VendeeLocality").css({ "background-color": "#ffffff" }); }
    var VendeetextStateID = $("#VendeetextState").val(); if ((VendeetextStateID == "" || VendeetextStateID == null) && $("#VendeeddlState").val() == 0) { $("#VendeetextState").hide(); text += "<br /> -Please Select Vendee Permanent State."; $("#VendeeddlState").attr('style', 'border:1px solid #d03100 !important;'); $("#VendeeddlState").css({ "background-color": "#fff2ee" }); opt = 1; } else { if ($("#VendeeddlState").val() != 0) { $("#VendeetextState").hide(); $("#VendeeddlState").attr('style', '1px solid #cdcdcd !important;'); $("#VendeeddlState").css({ "background-color": "#ffffff" }); } }
    var VendeeTextDistrictID = $("#VendeeTextDistrict").val(); if (VendeeTextDistrictID == "" || VendeeTextDistrictID == null) { $("#VendeeTextDistrict").hide(); $("#VendeeddlDistrict").show(); if ($("#VendeeddlDistrict").val() == 0) { text += "<br /> -Please Select Vendee Permanent District."; $("#VendeeddlDistrict").attr('style', 'border:1px solid #d03100 !important;'); $("#VendeeddlDistrict").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendeeddlDistrict").attr('style', 'border:1px solid #cdcdcd !important;'); $("#VendeeddlDistrict").css({ "background-color": "#fff" }); } } else { $("#VendeeddlDistrict").hide(); $("#VendeeTextDistrict").show(); $("#VendeeTextDistrict").attr('style', '1px solid #cdcdcd !important;'); $("#VendeeTextDistrict").css({ "background-color": "##eee" }); }
    var VendeetextTalukaID = $("#VendeetextTaluka").val(); if (VendeetextTalukaID == "" || VendeetextTalukaID == null) { $("#VendeetextTaluka").hide(); $("#VendeeddlTaluka").show(); if ($("#VendeeddlTaluka").val() == 0) { text += "<br /> -Please Select Vendee Permanent Block."; $("#VendeeddlTaluka").attr('style', 'border:1px solid #d03100 !important;'); $("#VendeeddlTaluka").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendeeddlTaluka").attr('style', 'border:1px solid #cdcdcd !important;'); $("#VendeeddlTaluka").css({ "background-color": "#fff" }); } } else { $("#VendeeddlTaluka").hide(); $("#VendeetextTaluka").show(); $("#VendeetextTaluka").attr('style', '1px solid #cdcdcd !important;'); $("#VendeetextTaluka").css({ "background-color": "##eee" }); }
    var VendeetextVillageID = $("#VendeetextVillage").val(); if (VendeetextVillageID == "" || VendeetextVillageID == null) { $("#VendeetextVillage").hide(); $("#VendeeddlVillage").show(); if ($("#VendeeddlVillage").val() == 0) { text += "<br /> -Please Select Vendee Permanent Village."; $("#VendeeddlVillage").attr('style', 'border:1px solid #d03100 !important;'); $("#VendeeddlVillage").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendeeddlVillage").attr('style', 'border:1px solid #cdcdcd !important;'); $("#VendeeddlVillage").css({ "background-color": "#fff" }); } } else { $("#VendeeddlVillage").hide(); $("#VendeetextVillage").show(); $("#VendeetextVillage").attr('style', '1px solid #cdcdcd !important;'); $("#VendeetextVillage").css({ "background-color": "##eee" }); }
    var VendeetxtPinCodeID = $("#VendeetxtPinCode").val(); if (VendeetxtPinCodeID == "" || VendeetxtPinCodeID == null) { text += "<br /> -Please Select Vendee PinCode."; $("#VendeetxtPinCode").attr('style', 'border:1px solid #d03100 !important;'); $("#VendeetxtPinCode").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendeetxtPinCode").attr('style', '1px solid #cdcdcd !important;'); $("#VendeetxtPinCode").css({ "background-color": "#ffffff" }); }
    var VendorAddressLine1ID = $("#VendorAddressLine1").val(); if (VendorAddressLine1ID == "" || VendorAddressLine1ID == null) { text += "<br /> -Please Select Vendor AddressLine1."; $("#VendorAddressLine1").attr('style', 'border:1px solid #d03100 !important;'); $("#VendorAddressLine1").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendorAddressLine1").attr('style', '1px solid #cdcdcd !important;'); $("#VendorAddressLine1").css({ "background-color": "#ffffff" }); }
    //var VendorAddressLine2ID = $("#VendorAddressLine2").val(); if (VendorAddressLine2ID == "" || VendorAddressLine2ID == null) { text += "<br /> -Please Select VendorAddressLine2."; $("#VendorAddressLine2").attr('style', 'border:1px solid #d03100 !important;'); $("#VendorAddressLine2").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendorAddressLine2").attr('style', '1px solid #cdcdcd !important;'); $("#VendorAddressLine2").css({ "background-color": "#ffffff" }); }
    var VendorRoadStreetNameID = $("#VendorRoadStreetName").val(); if (VendorRoadStreetNameID == "" || VendorRoadStreetNameID == null) { text += "<br /> -Please Select Vendor RoadStreet Name."; $("#VendorRoadStreetName").attr('style', 'border:1px solid #d03100 !important;'); $("#VendorRoadStreetName").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendorRoadStreetName").attr('style', '1px solid #cdcdcd !important;'); $("#VendorRoadStreetName").css({ "background-color": "#ffffff" }); }
    //var VendorLandMarkID = $("#VendorLandMark").val(); if (VendorLandMarkID == "" || VendorLandMarkID == null) { text += "<br /> -Please Select VendorLandMark."; $("#VendorLandMark").attr('style', 'border:1px solid #d03100 !important;'); $("#VendorLandMark").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendorLandMark").attr('style', '1px solid #cdcdcd !important;'); $("#VendorLandMark").css({ "background-color": "#ffffff" }); }
    var VendorLocalityID = $("#VendorLocality").val(); if (VendorLocalityID == "" || VendorLocalityID == null) { text += "<br /> -Please Select VendorLocality."; $("#VendorLocality").attr('style', 'border:1px solid #d03100 !important;'); $("#VendorLocality").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendorLocality").attr('style', '1px solid #cdcdcd !important;'); $("#VendorLocality").css({ "background-color": "#ffffff" }); }
    var VendortextStateID = $("#VendortextState").val(); if ((VendortextStateID == "" || VendortextStateID == null) && $("#VendorddlState").val() == 0) { $("#VendortextState").hide(); text += "<br /> -Please Select Vendor Permanent State."; $("#VendorddlState").attr('style', 'border:1px solid #d03100 !important;'); $("#VendorddlState").css({ "background-color": "#fff2ee" }); opt = 1; } else { if ($("#VendorddlState").val() != 0) { $("#VendortextState").hide(); $("#VendorddlState").attr('style', '1px solid #cdcdcd !important;'); $("#VendorddlState").css({ "background-color": "#ffffff" }); } }
    var VendorTextDistrictID = $("#VendorTextDistrict").val(); if (VendorTextDistrictID == "" || VendorTextDistrictID == null) { $("#VendorTextDistrict").hide(); $("#VendorddlDistrict").show(); if ($("#VendorddlDistrict").val() == 0) { text += "<br /> -Please Select Vendor Permanent District."; $("#VendorddlDistrict").attr('style', 'border:1px solid #d03100 !important;'); $("#VendorddlDistrict").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendorddlDistrict").attr('style', 'border:1px solid #cdcdcd !important;'); $("#VendorddlDistrict").css({ "background-color": "#fff" }); } } else { $("#VendorddlDistrict").hide(); $("#VendorTextDistrict").show(); $("#VendorTextDistrict").attr('style', '1px solid #cdcdcd !important;'); $("#VendorTextDistrict").css({ "background-color": "##eee" }); }
    var VendortextTalukaID = $("#VendortextTaluka").val(); if (VendortextTalukaID == "" || VendortextTalukaID == null) { $("#VendortextTaluka").hide(); $("#VendorddlTaluka").show(); if ($("#VendorddlTaluka").val() == 0) { text += "<br /> -Please Select Vendor Permanent Block."; $("#VendorddlTaluka").attr('style', 'border:1px solid #d03100 !important;'); $("#VendorddlTaluka").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendorddlTaluka").attr('style', 'border:1px solid #cdcdcd !important;'); $("#VendorddlTaluka").css({ "background-color": "#fff" }); } } else { $("#VendorddlTaluka").hide(); $("#VendortextTaluka").show(); $("#VendortextTaluka").attr('style', '1px solid #cdcdcd !important;'); $("#VendortextTaluka").css({ "background-color": "##eee" }); }
    var VendortextVillageID = $("#VendortextVillage").val(); if (VendortextVillageID == "" || VendortextVillageID == null) { $("#VendortextVillage").hide(); $("#VendorddlVillage").show(); if ($("#VendorddlVillage").val() == 0) { text += "<br /> -Please Select Vendee Permanent Village."; $("#VendorddlVillage").attr('style', 'border:1px solid #d03100 !important;'); $("#VendorddlVillage").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendorddlVillage").attr('style', 'border:1px solid #cdcdcd !important;'); $("#VendorddlVillage").css({ "background-color": "#fff" }); } } else { $("#VendorddlVillage").hide(); $("#VendortextVillage").show(); $("#VendortextVillage").attr('style', '1px solid #cdcdcd !important;'); $("#VendortextVillage").css({ "background-color": "##eee" }); }
    var VendortxtPinCodeID = $("#VendortxtPinCode").val(); if (VendortxtPinCodeID == "" || VendortxtPinCodeID == null) { text += "<br /> -Please Select Vendor PinCode."; $("#VendortxtPinCode").attr('style', 'border:1px solid #d03100 !important;'); $("#VendortxtPinCode").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#VendortxtPinCode").attr('style', '1px solid #cdcdcd !important;'); $("#VendortxtPinCode").css({ "background-color": "#ffffff" }); }
    var txtSaleHouseFullAddressID = $("#txtSaleHouseFullAddress").val(); if (txtSaleHouseFullAddressID == "" || txtSaleHouseFullAddressID == null) { text += "<br /> -Please Select Sale House FullAddress."; $("#txtSaleHouseFullAddress").attr('style', 'border:1px solid #d03100 !important;'); $("#txtSaleHouseFullAddress").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtSaleHouseFullAddress").attr('style', '1px solid #cdcdcd !important;'); $("#txtSaleHouseFullAddress").css({ "background-color": "#ffffff" }); }
    var txtSaleHouseLandmarkID = $("#txtSaleHouseLandmark").val(); if (txtSaleHouseLandmarkID == "" || txtSaleHouseLandmarkID == null) { text += "<br /> -Please Select Sale House Landmark."; $("#txtSaleHouseLandmark").attr('style', 'border:1px solid #d03100 !important;'); $("#txtSaleHouseLandmark").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtSaleHouseLandmark").attr('style', '1px solid #cdcdcd !important;'); $("#txtSaleHouseLandmark").css({ "background-color": "#ffffff" }); }
    var txtSaleHouseCityID = $("#txtSaleHouseCity").val(); if (txtSaleHouseCityID == "" || txtSaleHouseCityID == null) { text += "<br /> -Please Select Sale House City."; $("#txtSaleHouseCity").attr('style', 'border:1px solid #d03100 !important;'); $("#txtSaleHouseCity").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtSaleHouseCity").attr('style', '1px solid #cdcdcd !important;'); $("#txtSaleHouseCity").css({ "background-color": "#ffffff" }); }
    var txtSaleHousePincodeID = $("#txtSaleHousePincode").val(); if (txtSaleHousePincodeID == "" || txtSaleHousePincodeID == null) { text += "<br /> -Please Select Sale House Pincode."; $("#txtSaleHousePincode").attr('style', 'border:1px solid #d03100 !important;'); $("#txtSaleHousePincode").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtSaleHousePincode").attr('style', '1px solid #cdcdcd !important;'); $("#txtSaleHousePincode").css({ "background-color": "#ffffff" }); }
    var txtAgreementDateID = $("#txtAgreementDate").val(); if (txtAgreementDateID == "" || txtAgreementDateID == null) { text += "<br /> -Please Select AgreementDate."; $("#txtAgreementDate").attr('style', 'border:1px solid #d03100 !important;'); $("#txtAgreementDate").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtAgreementDate").attr('style', '1px solid #cdcdcd !important;'); $("#txtAgreementDate").css({ "background-color": "#ffffff" }); }
    var txtAgreementPlaceID = $("#txtAgreementPlace").val(); if (txtAgreementPlaceID == "" || txtAgreementPlaceID == null) { text += "<br /> -Please Select Agreement Place."; $("#txtAgreementPlace").attr('style', 'border:1px solid #d03100 !important;'); $("#txtAgreementPlace").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtAgreementPlace").attr('style', '1px solid #cdcdcd !important;'); $("#txtAgreementPlace").css({ "background-color": "#ffffff" }); }
    var txtRateOfInterestID = $("#txtRateOfInterest").val(); if (txtRateOfInterestID == "" || txtRateOfInterestID == null) { text += "<br /> -Please Select Rate Of Interest."; $("#txtRateOfInterest").attr('style', 'border:1px solid #d03100 !important;'); $("#txtRateOfInterest").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtRateOfInterest").attr('style', '1px solid #cdcdcd !important;'); $("#txtRateOfInterest").css({ "background-color": "#ffffff" }); }
    var txtRefundAmountID = $("#txtRefundAmount").val(); if (txtRefundAmountID == "" || txtRefundAmountID == null) { text += "<br /> -Please Select RefundAmount."; $("#txtRefundAmount").attr('style', 'border:1px solid #d03100 !important;'); $("#txtRefundAmount").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtRefundAmount").attr('style', '1px solid #cdcdcd !important;'); $("#txtRefundAmount").css({ "background-color": "#ffffff" }); }
    var txtAdvocateIntimationPeriodID = $("#txtAdvocateIntimationPeriod").val(); if (txtAdvocateIntimationPeriodID == "" || txtAdvocateIntimationPeriodID == null) { text += "<br /> -Please Select Advocate Intimation Period."; $("#txtAdvocateIntimationPeriod").attr('style', 'border:1px solid #d03100 !important;'); $("#txtAdvocateIntimationPeriod").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtAdvocateIntimationPeriod").attr('style', '1px solid #cdcdcd !important;'); $("#txtAdvocateIntimationPeriod").css({ "background-color": "#ffffff" }); }
    var txtAdvancePaidDateID = $("#txtAdvancePaidDate").val(); if (txtAdvancePaidDateID == "" || txtAdvancePaidDateID == null) { text += "<br /> -Please Select Advance PaidDate."; $("#txtAdvancePaidDate").attr('style', 'border:1px solid #d03100 !important;'); $("#txtAdvancePaidDate").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtAdvancePaidDate").attr('style', '1px solid #cdcdcd !important;'); $("#txtAdvancePaidDate").css({ "background-color": "#ffffff" }); }
    var txtAdvanceAmountInNumberID = $("#txtAdvanceAmountInNumber").val(); if (txtAdvanceAmountInNumberID == "" || txtAdvanceAmountInNumberID == null) { text += "<br /> -Please Select Advance Amount In Number."; $("#txtAdvanceAmountInNumber").attr('style', 'border:1px solid #d03100 !important;'); $("#txtAdvanceAmountInNumber").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtAdvanceAmountInNumber").attr('style', '1px solid #cdcdcd !important;'); $("#txtAdvanceAmountInNumber").css({ "background-color": "#ffffff" }); }
    var txtAdvanceAmountInWordsID = $("#txtAdvanceAmountInWords").val(); if (txtAdvanceAmountInWordsID == "" || txtAdvanceAmountInWordsID == null) { text += "<br /> -Please Select Advance Amount In Words."; $("#txtAdvanceAmountInWords").attr('style', 'border:1px solid #d03100 !important;'); $("#txtAdvanceAmountInWords").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtAdvanceAmountInWords").attr('style', '1px solid #cdcdcd !important;'); $("#txtAdvanceAmountInWords").css({ "background-color": "#ffffff" }); }
    var txtDeedPeriodInYearsID = $("#txtDeedPeriodInYears").val(); if (txtDeedPeriodInYearsID == "" || txtDeedPeriodInYearsID == null) { text += "<br /> -Please Select Deed Period InYears."; $("#txtDeedPeriodInYears").attr('style', 'border:1px solid #d03100 !important;'); $("#txtDeedPeriodInYears").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtDeedPeriodInYears").attr('style', '1px solid #cdcdcd !important;'); $("#txtDeedPeriodInYears").css({ "background-color": "#ffffff" }); }
    var txtDeedPeriodInMonthsID = $("#txtDeedPeriodInMonths").val(); if (txtDeedPeriodInMonthsID == "" || txtDeedPeriodInMonthsID == null) { text += "<br /> -Please Select Deed Period InMonths."; $("#txtDeedPeriodInMonths").attr('style', 'border:1px solid #d03100 !important;'); $("#txtDeedPeriodInMonths").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtDeedPeriodInMonths").attr('style', '1px solid #cdcdcd !important;'); $("#txtDeedPeriodInMonths").css({ "background-color": "#ffffff" }); }
    var txtDeedPeriodInDaysID = $("#txtDeedPeriodInDays").val(); if (txtDeedPeriodInDaysID == "" || txtDeedPeriodInDaysID == null) { text += "<br /> -Please Select Deed Period In Days."; $("#txtDeedPeriodInDays").attr('style', 'border:1px solid #d03100 !important;'); $("#txtDeedPeriodInDays").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtDeedPeriodInDays").attr('style', '1px solid #cdcdcd !important;'); $("#txtDeedPeriodInDays").css({ "background-color": "#ffffff" }); }
    var txtTitleNotClearRefundAmtID = $("#txtTitleNotClearRefundAmt").val(); if (txtTitleNotClearRefundAmtID == "" || txtTitleNotClearRefundAmtID == null) { text += "<br /> -Please Select TitleNotClearRefundAmt."; $("#txtTitleNotClearRefundAmt").attr('style', 'border:1px solid #d03100 !important;'); $("#txtTitleNotClearRefundAmt").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtTitleNotClearRefundAmt").attr('style', '1px solid #cdcdcd !important;'); $("#txtTitleNotClearRefundAmt").css({ "background-color": "#ffffff" }); }

    if (opt == "1") {
        alertPopup("Please Fill The Following Information.", text);
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

function GetState() {

    var SelState = $('#DLLVandeeState');
    var SelState1 = $('#ddlVendorState');
    var SelState2 = $('#VendeeddlState');
    var SelState3 = $('#VendorddlState');
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/Deeds/HouseSaleAgreement.aspx/StateData",
        data: '{}',
        dataType: "json",
        success: function (r) {
            SelState.empty().append('<option selected="selected" value="0">-Select State-</option>');
            SelState1.empty().append('<option selected="selected" value="0">-Select State-</option>');
            SelState2.empty().append('<option selected="selected" value="0">-Select State-</option>');
            SelState3.empty().append('<option selected="selected" value="0">-Select State-</option>');
            $.each(r.d, function () {
                $(SelState).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                $(SelState1).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                $(SelState2).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                $(SelState3).append('<option value = "' + this.Id + '">' + this.Name + '</option>');

            });
        }
    });
}

function GetUKDistrict(ddlstate, ddlDistict) {

    var SelState = $(ddlstate).val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/Deeds/HouseSaleAgreement.aspx/GetUKDistrict",
        data: '{"prefix":"","StateCode":"' + SelState + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $(ddlDistict);
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select District-</option>');
            $.each(r.d, function () {
                $(ddlDistict).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

function GetUKBlock(ddl, ddlblock) {

    var SelBlock1 = $(ddl).val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/Deeds/HouseSaleAgreement.aspx/GetUKBlock",
        data: '{"prefix":"","DistrictCode":"' + SelBlock1 + '"}',
        dataType: "json",
        success: function (r) {

            var ddlCustomer1 = $(ddlblock);
            ddlCustomer1.empty().append('<option selected="selected" value="0">-Select SubDistrict-</option>');
            $.each(r.d, function () {
                $(ddlblock).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

function GetUKPanchayat(ddl, ddlPanchayat) {

    var SelSubDistrict = $(ddl).val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/Deeds/HouseSaleAgreement.aspx/GetUKPanchayat",
        data: '{"prefix":"","SubDistrictCode":"' + SelSubDistrict + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $(ddlPanchayat);
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select Gram Panchayat-</option>');
            $.each(r.d, function () {
                $(ddlPanchayat).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
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



// American Numbering System
var th = ['', 'thousand', 'million', 'billion', 'trillion'];
// uncomment this line for English Number System
// var th = ['','thousand','million', 'milliard','billion'];

var dg = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
var tn = ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']; var tw = ['twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];
function toWords(s) {
    s = s.toString(); s = s.replace(/[\, ]/g, '');
    if (s != parseFloat(s))
        return ''; var x = s.indexOf('.');
    if (x == -1) x = s.length; 
    if (x > 15) return 'too big';
    var n = s.split('');
    var str = '';
    var sk = 0; for (var i = 0; i < x; i++) { if ((x - i) % 3 == 2) { if (n[i] == '1') { str += tn[Number(n[i + 1])] + ' '; i++; sk = 1; } else if (n[i] != 0) { str += tw[n[i] - 2] + ' '; sk = 1; } } else if (n[i] != 0) { str += dg[n[i]] + ' '; if ((x - i) % 3 == 0) str += 'hundred '; sk = 1; } if ((x - i) % 3 == 1) { if (sk) str += th[(x - i - 1) / 3] + ' '; sk = 0; } } if (x != s.length)
        { var y = s.length; str += 'Only '; for (var i = x + 1; i < y; i++) str += dg[n[i]] + ' '; } return str.replace(/\s+/g, ' ');
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
function EmailValidation() {
    var emailid = document.getElementById('txtVendeeEmailId').value;
    //var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-z/A-Z]+\.)+[a-z/A-Z]{1,3})(\]?))$/;
    //var reg = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    var reg = /[a-zA-Z0-9\.\-]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
    if (emailid.match(reg)) {
        $('#txtVendeeEmailId').attr('style', 'border:2px solid green !important;');
        $('#txtVendeeEmailId').css({ "background-color": "#ffffff" });
    }
    else {
        alertPopup("Email-ID Information.", "</BR> Please Enter Valid Email-ID, In Proper Format");
        $('#txtVendeeEmailId').attr('style', 'border:2px solid red !important;');
        $('#txtVendeeEmailId').val('');
    }
}
function EmailValid() {
    var emailid = document.getElementById('txtVendorEmailId').value;
    //var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-z/A-Z]+\.)+[a-z/A-Z]{1,3})(\]?))$/;
    //var reg = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    var reg = /[a-zA-Z0-9\.\-]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
    if (emailid.match(reg)) {
        $('#txtVendorEmailId').attr('style', 'border:2px solid green !important;');
        $('#txtVendorEmailId').css({ "background-color": "#ffffff" });
    }
    else {
        alertPopup("Email-ID Information.", "</BR> Please Enter Valid Email-ID, In Proper Format");
        $('#txtVendorEmailId').attr('style', 'border:2px solid red !important;');
        $('#txtVendorEmailId').val('');
    }
}