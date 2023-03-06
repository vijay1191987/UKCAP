/// <reference path="OutputForRentDeed.aspx" />
$(document).ready(function () {
    $('#myModal').modal({
        backdrop: 'static',
        keyboard: false
    })
    $("#tblItem").hide();
    var previous;
    $("#ddlPremisesTypeID").change(function () {
        //var val = $("#hidPremises").val();
        //if (val > 0) { previous = val; $("#hidPremises").val($("#ddlPremisesTypeID").val()) }
        //alert($("#hidPremises").val());
        //alert(previous);
        //debugger;
        if ($("#ddlPremisesTypeID").val() == 0) {
            if ($("#hdfSuspectSave").val() != "") {
                bootbox.confirm("Are you sure want to delete?", function (result) {
                    //alert(result);
                    if (result) {
                        $("#tblItem").hide();
                        $("#tblSuspect").hide();
                        $("#divSuspect").html("");
                        $("#hdfSuspect").val("");
                        $("#hdfSuspectSave").val("");
                        $("#hdfSuspectString").val(0);
                        $("#hidPremises").val(previous);
                    }
                });
            } else {
                $("#tblItem").hide();
                $("#tblSuspect").hide();
                $("#divSuspect").html("");
                $("#hdfSuspect").val("");
                $("#hdfSuspectSave").val("");
                $("#hdfSuspectString").val(0);
            }
            $("#txtItem").attr('style', '1px solid #eee !important;');
            $("#txtItem").css({
                "background-color": "#ffffff"
            });
            $("#txtQty").attr('style', '1px solid #eee !important;');
            $("#txtQty").css({
                "background-color": "#ffffff"
            });
        } else {
            $("#tblItem").show();
        }
    })
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
    $('#txtRentPayableDatePM').datepicker({
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
    $('#txtDeedDate').datepicker({
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
    $('#txtLandlordDOB').datepicker({
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
    $('#txtRentPayableGraceDatePM').datepicker({
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
    $('#txtRentPayDDDate').datepicker({
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
    $('#txtSecurityPayDDDate').datepicker({
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
    // State Bindind
    GetState();
    // District Binding
    $("#ddlTenantStateID").change(function () {
        GetUKDistrict('#ddlTenantStateID', '#ddlTenantDistID')
    });
    $("#ddlLandlordStateID").change(function () {
        GetUKDistrict('#ddlLandlordStateID', '#ddlLandlordDistID')
    });
    $("#ddlTenantPrmntStateID").change(function () {
        GetUKDistrict('#ddlTenantPrmntStateID', '#ddlTenantPrmntDistD')
    });
    //Block bind
    $("#ddlTenantDistID").change(function () {
        GetUKBlock('#ddlTenantDistID', '#ddlTenantDistBlockID')
    });
    $("#ddlLandlordDistID").change(function () {
        GetUKBlock('#ddlLandlordDistID', '#ddlLandlordDistBlockID')
    });
    $("#ddlTenantPrmntDistD").change(function () {
        GetUKBlock('#ddlTenantPrmntDistD', '#ddlTenantPrmntBlockD')
    });
    //Panchayat bind
    $("#ddlTenantPrmntBlockD").change(function () {
        GetUKPanchayat('#ddlTenantPrmntBlockD', '#ddlTenantPrmntCityID')
    });

    $("#txtSecurityAmntPeriod").val("");
    $("#txtSecurityAmntPeriod").prop('disabled', true);
    $("#txtSecurityAmnt").val("");
    $("#txtSecurityAmnt").prop('disabled', true);
    $("#txtSecurityAmntInWords").val("");
    $("#txtSecurityAmntInWords").prop('disabled', true);

    $("#ddlSecurityPayMode").attr('style', 'border:1px solid #eee !important;');
    $("#ddlSecurityPayMode").css({
        "background-color": "#eee"
    });
    $("#txtSecurityPayAmnt").attr('style', 'border:1px solid #eee !important;');
    $("#txtSecurityPayAmnt").css({
        "background-color": "#eee"
    });
    $("#txtSecurityPayAmntWords").attr('style', 'border:1px solid #eee !important;');
    $("#txtSecurityPayAmntWords").css({
        "background-color": "#eee"
    });

    $(".seqrityhide").hide();
    /*Rent/House/Premises Mode function*/
    $("#txtIsSecurityAmntPaid").bind("change", function (e) {
        if ($("#txtIsSecurityAmntPaid").val() == "0") {
            $("#txtSecurityAmntPeriod").val("");
            $("#txtSecurityAmntPeriod").prop('disabled', true);
            $("#txtSecurityAmnt").val("");
            $("#txtSecurityAmnt").prop('disabled', true);
            $("#txtSecurityAmntInWords").val("");
            $("#txtSecurityAmntInWords").prop('disabled', true);

            $("#txtSecurityAmntPeriod").attr('style', 'border:1px solid #eee !important;');
            $("#txtSecurityAmntPeriod").css({
                "background-color": "#eee"
            });
            $("#txtSecurityAmnt").attr('style', 'border:1px solid #eee !important;');
            $("#txtSecurityAmnt").css({
                "background-color": "#eee"
            });
            $("#txtSecurityAmntInWords").attr('style', 'border:1px solid #eee !important;');
            $("#txtSecurityAmntInWords").css({
                "background-color": "#eee"
            });

            $("#ddlSecurityPayMode").attr('style', 'border:1px solid #eee !important;');
            $("#ddlSecurityPayMode").css({
                "background-color": "#eee"
            });
            $("#txtSecurityPayAmnt").attr('style', 'border:1px solid #eee !important;');
            $("#txtSecurityPayAmnt").css({
                "background-color": "#eee"
            });
            $("#txtSecurityPayAmntWords").attr('style', 'border:1px solid #eee !important;');
            $("#txtSecurityPayAmntWords").css({
                "background-color": "#eee"
            });

            $(".seqrityhide").hide();
        }
        if ($("#txtIsSecurityAmntPaid").val() == "2") {
            $("#txtPaymentSecurity").val("Deposit");
            $("#txtSecurityAmntPeriod").val("");
            $("#txtSecurityAmntPeriod").prop('disabled', false);
            $("#txtSecurityAmnt").val("");
            $("#txtSecurityAmnt").prop('disabled', false);
            $("#txtSecurityAmntInWords").val("");
            $("#txtSecurityAmntInWords").prop('disabled', false);
            $("#txtSecurityAmntPeriod").attr('style', 'border:1px solid #eee !important;');
            $("#txtSecurityAmntPeriod").css({
                "background-color": "#fff"
            });
            $("#txtSecurityAmnt").attr('style', 'border:1px solid #eee !important;');
            $("#txtSecurityAmnt").css({
                "background-color": "#fff"
            });
            $("#txtSecurityAmntInWords").attr('style', 'border:1px solid #eee !important;');
            $("#txtSecurityAmntInWords").css({
                "background-color": "#fff"
            });


            $("#ddlSecurityPayMode").attr('style', 'border:1px solid #eee !important;');
            $("#ddlSecurityPayMode").css({
                "background-color": "#fff"
            });
            $("#txtSecurityPayAmnt").attr('style', 'border:1px solid #eee !important;');
            $("#txtSecurityPayAmnt").css({
                "background-color": "#fff"
            });
            $("#txtSecurityPayAmntWords").attr('style', 'border:1px solid #eee !important;');
            $("#txtSecurityPayAmntWords").css({
                "background-color": "#fff"
            });

            $(".seqrityhide").show();
        }
        if ($("#txtIsSecurityAmntPaid").val() == "1") {

            $("#txtPaymentSecurity").val("Security");
            $("#txtSecurityAmntPeriod").val("");
            $("#txtSecurityAmntPeriod").prop('disabled', true);
            $("#txtSecurityAmnt").val("");
            $("#txtSecurityAmnt").prop('disabled', false);
            $("#txtSecurityAmntInWords").val("");
            $("#txtSecurityAmntInWords").prop('disabled', false);


            $("#txtSecurityAmntPeriod").attr('style', 'border:1px solid #eee !important;');
            $("#txtSecurityAmntPeriod").css({
                "background-color": "#eee"
            });
            $("#txtSecurityAmnt").attr('style', 'border:1px solid #eee !important;');
            $("#txtSecurityAmnt").css({
                "background-color": "#fff"
            });
            $("#txtSecurityAmntInWords").attr('style', 'border:1px solid #eee !important;');
            $("#txtSecurityAmntInWords").css({
                "background-color": "#fff"
            });


            $("#ddlSecurityPayMode").attr('style', 'border:1px solid #eee !important;');
            $("#ddlSecurityPayMode").css({
                "background-color": "#fff"
            });
            $("#txtSecurityPayAmnt").attr('style', 'border:1px solid #eee !important;');
            $("#txtSecurityPayAmnt").css({
                "background-color": "#fff"
            });
            $("#txtSecurityPayAmntWords").attr('style', 'border:1px solid #eee !important;');
            $("#txtSecurityPayAmntWords").css({
                "background-color": "#fff"
            });

            $(".seqrityhide").show();
        }
    });
    /*Payment Mode function START HERE*/
    $("#txtRentPayBank").prop('disabled', true);
    $("#txtRentPayBranch").prop('disabled', true);
    $("#txtRentPayDDNo").prop('disabled', true);
    $("#txtRentPayDDDate").prop('disabled', true);
    $("#ddlRentPayMode").bind("change", function (e) {
        if ($("#ddlRentPayMode").val() == "0" || $("#ddlRentPayMode").val() == "2") {
            $("#txtRentPayBank").prop('disabled', true);
            $("#txtRentPayBranch").prop('disabled', true);
            $("#txtRentPayDDNo").prop('disabled', true);
            $("#txtRentPayDDDate").prop('disabled', true);

            $("#txtRentPayBank").attr('style', 'border:1px solid #eee !important;');
            $("#txtRentPayBank").css({
                "background-color": "#eee"
            });
            $("#txtRentPayBranch").attr('style', 'border:1px solid #eee !important;');
            $("#txtRentPayBranch").css({
                "background-color": "#eee"
            });
            $("#txtRentPayDDNo").attr('style', 'border:1px solid #eee !important;');
            $("#txtRentPayDDNo").css({
                "background-color": "#eee"
            });
            $("#txtRentPayDDDate").attr('style', 'border:1px solid #eee !important;');
            $("#txtRentPayDDDate").css({
                "background-color": "#eee"
            });
        } else {
            $("#txtRentPayBank").prop('disabled', false);
            $("#txtRentPayBranch").prop('disabled', false);
            $("#txtRentPayDDNo").prop('disabled', false);
            $("#txtRentPayDDDate").prop('disabled', false);

            $("#txtRentPayBank").attr('style', 'border:1px solid #eee !important;');
            $("#txtRentPayBank").css({
                "background-color": "#fff"
            });
            $("#txtRentPayBranch").attr('style', 'border:1px solid #eee !important;');
            $("#txtRentPayBranch").css({
                "background-color": "#fff"
            });
            $("#txtRentPayDDNo").attr('style', 'border:1px solid #eee !important;');
            $("#txtRentPayDDNo").css({
                "background-color": "#fff"
            });
            $("#txtRentPayDDDate").attr('style', 'border:1px solid #eee !important;');
            $("#txtRentPayDDDate").css({
                "background-color": "#fff"
            });
        }
    });
    /*Bank Mode Payment*/
    $("#txtSecurityPayBank").prop('disabled', true);
    $("#txtSecurityPayBranch").prop('disabled', true);
    $("#txtSecurityPayDDNo").prop('disabled', true);
    $("#txtSecurityPayDDDate").prop('disabled', true);
    $("#ddlSecurityPayMode").bind("change", function (e) {
        if ($("#ddlSecurityPayMode").val() == "0" || $("#ddlSecurityPayMode").val() == "2") {
            $("#txtSecurityPayBank").prop('disabled', true);
            $("#txtSecurityPayBranch").prop('disabled', true);
            $("#txtSecurityPayDDNo").prop('disabled', true);
            $("#txtSecurityPayDDDate").prop('disabled', true);
        } else {
            $("#txtSecurityPayBank").prop('disabled', false);
            $("#txtSecurityPayBranch").prop('disabled', false);
            $("#txtSecurityPayDDNo  ").prop('disabled', false);
            $("#txtSecurityPayDDDate").prop('disabled', false);
        }
    });
    /*Payment Mode function END HERE*/
    $('#btnUIDVerify').click(function () {
        var text = "";
        var opt = "";
        var VerificationTypeID = $("#ddlVerificationTypeID").val();
        if (VerificationTypeID == 0) {
            text += "<br /> -Please Select VerificationTypeID.";
            $("#ddlVerificationTypeID").attr('style', 'border:1px solid #d03100 !important;');
            $("#ddlVerificationTypeID").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#ddlVerificationTypeID").attr('style', '1px solid #eee !important;');
            $("#ddlVerificationTypeID").css({
                "background-color": "#ffffff"
            });
        }
        var UIDVerifyID = $("#txtAadhaarUIDNumber").val();
        if (UIDVerifyID == "" || UIDVerifyID == null) {
            text += "<br /> -Please Select AadhaarUIDNumber.";
            $("#txtAadhaarUIDNumber").attr('style', 'border:1px solid #d03100 !important;');
            $("#txtAadhaarUIDNumber").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#txtAadhaarUIDNumber").attr('style', '1px solid #eee !important;');
            $("#txtAadhaarUIDNumber").css({
                "background-color": "#ffffff"
            });
        }
        if (opt == "1"){
            alertPopup("Please Fill The Following Information.", text);
            return false;
        }
            openWindow(1, 2, 'UIDCasteCertificate1');
            return true;
        
        //var Adhaar = $('#txtAadhaarUIDNumber').val();
        //openWindow(1, 2, 'UIDCasteCertificate1');
        //return true;
    });

    $("#txtMaintenanceChargePM").on("keyup", function () {
        var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
            val = this.value;
        if (!valid) {
            console.log("Invalid input!");
            this.value = val.substring(0, val.length - 1);
        }
    }).change(function () {
        sum();
    });
    $("#txtRentChargePM").on("keyup", function () {
        var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
            val = this.value;
        if (!valid) {
            console.log("Invalid input!");
            this.value = val.substring(0, val.length - 1);
        }
    }).change(function () {
        $("#txtRentPayAmnt").val(this.value);
        sum();
    });
    $("#txtTotalRentAmntPM").on("keyup", function () {
        var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
            val = this.value;
        if (!valid) {
            console.log("Invalid input!");
            this.value = val.substring(0, val.length - 1);
        }
    }).change(function () {
        $("#txtTotalRentAmntInWordsPM").val(toWords(this.value).toUpperCase()+'Only')
    });

    $("#txtSecurityAmnt").on("keyup", function () {
        var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
            val = this.value;
        if (!valid) {
            console.log("Invalid input!");
            this.value = val.substring(0, val.length - 1);
        }
    }).change(function () {
        //$("#txtSecurityAmntInWords").val(toWords(this.value).toUpperCase());
        //$("#txtSecurityPayAmnt").val(this.value);
        //$("#txtSecurityPayAmntWords").val(toWords(this.value).toUpperCase());
    });
    $("#txtRentPayAmnt").on("keyup", function () {
        var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
            val = this.value;
        if (!valid) {
            console.log("Invalid input!");
            this.value = val.substring(0, val.length - 1);
        }
    }).change(function () {
        $("#txtRentPayAmntWords").val(toWords(this.value).toUpperCase()+'ONLY')
    });
    $("#txtSecurityPayAmnt").on("keyup", function () {
        var valid = /^\d{0,13}(\.\d{0,2})?$/.test(this.value),
            val = this.value;
        if (!valid) {
            console.log("Invalid input!");
            this.value = val.substring(0, val.length - 1);
        }
    }).change(function () {
        $("#txtSecurityPayAmntWords").val(toWords(this.value).toUpperCase()+'ONLY')
    });

    window.CallParent = function () {
        var Element = $('#ddlApplicantType').val();
        if (Element == 1) {
            var ID = 2
            BindAadhaarData(ID);
        } else if (Element == 2) {
            var ID = 1
            BindAadhaarData(ID);
        }

    }

    //PremisesType Chage Function
    //$("#tblItem").attr('disabled', true);
    //$("#ddlPremisesTypeID").bind("change", function (e) {
    //    if ($("#ddlPremisesTypeID").val() == "0") {
    //        $("#tblItem :input").attr('disabled', true);
    //    }
    //    else {
    //        $("#tblItem :input").attr('disabled', false);
    //    }
    //});
});
// Applicant Type on Click Function
function submitApplicantType(e) {
    //debugger;
    var text = "";
    var ApplicatantType = $('#ddlApplicantType').val();
    if (ApplicatantType == "0") {
        text += "Please Select Applicatant Type. ";
        $("#ddlApplicantType").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlApplicantType").css({
            "background-color": "#fff2ee"
        });
        $("#errorMsg").show();
        $("#errorMsg").val(text);
    } else {
        $("#ddlApplicantType").attr('style', 'border:1px solid #eee !important;');
        $("#ddlApplicantType").css({
            "background-color": "#ffffff"
        });
        var qs = getQueryStrings();
        var uid = qs["UID"];
        var SvcID = qs["SvcID"];
        var DPT = qs["DPT"];
        GetDatalocalAdhar(uid);
        $('#myModal').modal('hide');
    }
}
// Bind Local User Aadhaar Data based on Applicant Type
function GetDatalocalAdhar(uid) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/Deeds/RentDeed.aspx/GetDetailAdhaar",
        data: "{ UID: '" + uid + "'}",
        dataType: "json",
        success: function (r) {
            var Element = $('#ddlApplicantType').val();
            var obj = JSON.parse(r.d);
            //console.log(obj);
            if (Element == 1) {
                debugger;
                $('#txtTenantName').val(obj[0]["residentName"]);
                $('#txtTenantName').prop("disabled", true);
                if (obj[0]["dateOfBirth"] != "") {
                    var t_DOB = obj[0]["dateOfBirth"];
                    var D1 = t_DOB.split('-');
                    var calday = D1[2];
                    var calmon = D1[1];
                    var calyear = D1[0];
                    D_DOB = calday.toString() + "-" + calmon.toString() + "-" + calyear;
                    $('#txtTenantDOB').val(D_DOB);
                    $('#txtTenantDOB').prop("disabled", true);
                }
                
                if (obj[0]["gender"] != "") {
                    if (obj[0]["gender"] == "M") {
                        $('#ddlTenantGenderID').val("M");
                    } else if (obj[0]["gender"] == "F") {
                        $('#ddlTenantGenderID').val("F");
                    } else {
                        $('#ddlTenantGenderID').val("T");
                    }
                    $('#ddlTenantGenderID').prop("disabled", true);
                }
                if (obj[0]["emailId"] != "" && obj[0]["emailId"] != null) {
                    $('#txtTenantEmail').val(obj[0]["emailId"])
                    $('#txtTenantEmail').prop("disabled", true)
                }
                //$('#txtTenantEmail').val(obj[0]["emailId"])
                //$('#txtTenantEmail').prop("disabled", true);
                if (obj[0]["phone"] != "" && obj[0]["phone"] != null) {
                    $('#txtTenantMobile').val(obj[0]["phone"])
                    $('#txtTenantMobile').prop("disabled", true)
                }

                //if (obj[0]["houseNumberLocal"] != "" && obj[0]["houseNumberLocal"] != null) {
                //    $('#txtTenantRentPlaceAddr').val(obj[0]["houseNumberLocal"])
                //    $('#txtTenantRentPlaceAddr').prop("disabled", true)
                //}

                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null) {
                    $('#txtTenantStateID').show();
                    $('#txtTenantStateID').val(obj[0]["state"])
                    $('#txtTenantStateID').prop("disabled", true);
                    $('#ddlTenantStateID').hide();
                } else {
                    $('#ddlTenantStateID').show();
                }
                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null) {
                    $('#txtTenantDistID').show();
                    $('#txtTenantDistID').val(obj[0]["district"])
                    $('#txtTenantDistID').prop("disabled", true);
                    $('#ddlTenantDistID').hide();
                } else {
                    $('#ddlTenantDistID').show();
                }
                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null) {
                    $('#txtTenantDistBlockID').show();
                    $('#txtTenantDistBlockID').val(obj[0]["subDistrict"])
                    $('#txtTenantDistBlockID').prop("disabled", true);
                    $('#ddlTenantDistBlockID').hide();
                } else {
                    $('#ddlTenantDistBlockID').show();
                }

                if (obj[0]["pincode"] != "" && obj[0]["pincode"] != null) {
                    $('#txtTenantPinCode').val(obj[0]["pincode"])
                    $('#txtTenantPinCode').prop("disabled", true)
                }
                //$('#txtTenantPinCode').val(obj[0]["pincode"])
                //$('#txtTenantPinCode').prop("disabled", true);

                //parmanent Address:
                if (obj[0]["careOf"] != "" && obj[0]["careOf"] != null) {
                    $('#txtTenantPrmntAddrLine1').val(obj[0]["careOf"])
                    $('#txtTenantPrmntAddrLine1').prop("disabled", true)
                }
                if (obj[0]["houseNumber"] != "" && obj[0]["houseNumber"] != null) {
                    $('#txtTenantPrmntAddrLine2').val(obj[0]["houseNumber"])
                    $('#txtTenantPrmntAddrLine2').prop("disabled", true)
                }
                if (obj[0]["locality"] != "" && obj[0]["locality"] != null) {
                    $('#txtTenantPrmntStreetName').val(obj[0]["locality"])
                    $('#txtTenantPrmntStreetName').prop("disabled", true)
                }
                if (obj[0]["landmark"] != "" && obj[0]["landmark"] != null) {
                    $('#txtTenantPrmntStreetLandMark').val(obj[0]["landmark"])
                    $('#txtTenantPrmntStreetLandMark').prop("disabled", true)
                }
                if (obj[0]["locality"] != "" && obj[0]["locality"] != null) {
                    $('#txtTenantPrmntStreetLocality').val(obj[0]["locality"])
                    $('#txtTenantPrmntStreetLocality').prop("disabled", true)
                }
                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["vtc"] != "" && obj[0]["vtc"] != null && obj[0]["state"] != "" && obj[0]["state"] != null) {
                    $('#txtTenantPrmntStateID').show();
                    $('#txtTenantPrmntStateID').val(obj[0]["state"])
                    $('#txtTenantPrmntStateID').prop("disabled", true);
                    $('#ddlTenantPrmntStateID').hide();
                } else {
                    $('#ddlTenantPrmntStateID').show();
                }
                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["vtc"] != "" && obj[0]["vtc"] != null && obj[0]["state"] != "" && obj[0]["state"] != null) {
                    $('#txtTenantPrmntDistD').show();
                    $('#txtTenantPrmntDistD').val(obj[0]["district"])
                    $('#txtTenantPrmntDistD').prop("disabled", true);
                    $('#ddlTenantPrmntDistD').hide();
                } else {
                    $('#ddlTenantPrmntDistD').show();
                }
                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["vtc"] != "" && obj[0]["vtc"] != null && obj[0]["state"] != "" && obj[0]["state"] != null) {
                    $('#txtTenantPrmntBlockD').show();
                    $('#txtTenantPrmntBlockD').val(obj[0]["subDistrict"])
                    $('#txtTenantPrmntBlockD').prop("disabled", true);
                    $('#ddlTenantPrmntBlockD').hide();
                } else {
                    $('#ddlTenantPrmntBlockD').show();
                }
                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["vtc"] != "" && obj[0]["vtc"] != null && obj[0]["state"] != "" && obj[0]["state"] != null) {
                    $('#txtTenantPrmntCityID').show();
                    $('#txtTenantPrmntCityID').val(obj[0]["vtc"])
                    $('#txtTenantPrmntCityID').prop("disabled", true);
                    $('#ddlTenantPrmntCityID').hide();
                } else {
                    $('#ddlTenantPrmntCityID').show();
                }

                if (obj[0]["pincode"] != "" && obj[0]["pincode"] != null) {
                    $('#txtTenantPrmntPinCode').val(obj[0]["pincode"])
                    $('#txtTenantPrmntPinCode').prop("disabled", true)
                }
                //$('#txtTenantPrmntPinCode').val(obj[0]["pincode"])
                //$('#txtTenantPrmntPinCode').prop("disabled", true);
            } else if (Element == 2) {
                $('#txtLandlordName').val(obj[0]["residentName"]);
                $('#txtLandlordName').prop("disabled", true);
                $('#txtLandlordDOB').val(obj[0]["dateOfBirth"]);
                $('#txtLandlordDOB').prop("disabled", true);
                if (obj[0]["gender"] != "") {
                    if (obj[0]["gender"] == "M") {
                        $('#ddlLandlordGenderID').val("M");
                    } else if (obj[0]["gender"] == "F") {
                        $('#ddlLandlordGenderID').val("F");
                    } else {
                        $('#ddlLandlordGenderID').val("T");
                    }
                    $('#ddlLandlordGenderID').prop("disabled", true);
                }
                if (obj[0]["emailId"] != "" && obj[0]["emailId"] != null) {
                    $('#txtLandlordEmail').val(obj[0]["emailId"])
                    $('#txtLandlordEmail').prop("disabled", true)
                }
                //$('#txtLandlordEmail').val(obj[0]["emailId"])
                //$('#txtLandlordEmail').prop("disabled", true);
                if (obj[0]["phone"] != "" && obj[0]["phone"] != null) {
                    $('#txtLandlordMobile').val(obj[0]["phone"])
                    $('#txtLandlordMobile').prop("disabled", true)
                }
                //$('#txtLandlordMobile').val(obj[0]["phone"])
                //$('#txtLandlordMobile').prop("disabled", true);
                if (obj[0]["houseNumber"] != "" && obj[0]["houseNumber"] != null) {
                    $('#txtLandlordRentPlaceAddr').val(obj[0]["houseNumber"])
                    $('#txtLandlordRentPlaceAddr').prop("disabled", true)
                }
                //$('#txtLandlordRentPlaceAddr').val(obj[0]["houseNumber"])
                //$('#txtLandlordRentPlaceAddr').prop("disabled", true);
                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null) {
                    $('#txtLandlordStateID').show();
                    $('#txtLandlordStateID').val(obj[0]["state"])
                    $('#txtLandlordStateID').prop("disabled", true);
                    $('#ddlLandlordStateID').hide();
                } else {
                    $('#ddlLandlordStateID').show();
                }
                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null) {
                    $('#txtLandlordDistID').show();
                    $('#txtLandlordDistID').val(obj[0]["district"])
                    $('#txtLandlordDistID').prop("disabled", true);
                    $('#ddlLandlordDistID').hide();
                } else {
                    $('#ddlLandlordDistID').show();
                }
                if (obj[0]["district"] != "" && obj[0]["district"] != null && obj[0]["subDistrict"] != "" && obj[0]["subDistrict"] != null && obj[0]["state"] != "" && obj[0]["state"] != null) {
                    $('#txtLandlordDistBlockID').show();
                    $('#txtLandlordDistBlockID').val(obj[0]["subDistrict"])
                    $('#txtLandlordDistBlockID').prop("disabled", true);
                    $('#ddlLandlordDistBlockID').hide();
                } else {
                    $('#ddlLandlordDistBlockID').show();
                }

                if (obj[0]["pincodeLocal"] != "" && obj[0]["pincodeLocal"] != null) {
                    $('#txtLandlordPinCode').val(obj[0]["pincodeLocal"])
                    $('#txtLandlordPinCode').prop("disabled", true)
                }
                //$('#txtLandlordPinCode').val(obj[0]["pincodeLocal"])
                //$('#txtLandlordPinCode').prop("disabled", true);
            }
        }
    });
}
// Bind Aadhaar Data on verification
function BindAadhaarData(ID) {
    if ($('#HFUIDData').val() != "" && $('#HFUIDData').val() != null) {
        var obj = jQuery.parseJSON($('#HFUIDData').val());
        //console.log(obj);
        if (ID == 2) {
            $('#txtLandlordName').val(obj["residentName"]);
            $('#txtLandlordName').prop("disabled", true);
            $('#txtLandlordDOB').val(obj["dateOfBirth"]);
            $('#txtLandlordDOB').prop("disabled", true);
            if (obj["gender"] != "") {
                if (obj["gender"] == "M") {
                    $('#ddlLandlordGenderID').val("M");
                } else if (obj["gender"] == "F") {
                    $('#ddlLandlordGenderID').val("F");
                } else {
                    $('#ddlLandlordGenderID').val("T");
                }
                $('#ddlLandlordGenderID').prop("disabled", true);
            }
            if (obj["emailId"] != "" && obj["emailId"] != null) {
                $('#txtLandlordEmail').val(obj["emailId"])
                $('#txtLandlordEmail').prop("disabled", true)
            }
            //$('#txtLandlordEmail').val(obj["emailId"])
            //$('#txtLandlordEmail').prop("disabled", true);
            if (obj["phone"] != "" && obj["phone"] != null) {
                $('#txtLandlordMobile').val(obj["phone"])
                $('#txtLandlordMobile').prop("disabled", true)
            }
            //$('#txtLandlordMobile').val(obj["phone"])
            //$('#txtLandlordMobile').prop("disabled", true);
            if (obj["houseNumber"] != "" && obj["houseNumber"] != null) {
                $('#txtLandlordRentPlaceAddr').val(obj["houseNumber"])
                $('#txtLandlordRentPlaceAddr').prop("disabled", true)
            }
            //$('#txtLandlordRentPlaceAddr').val(obj["houseNumber"])
            //$('#txtLandlordRentPlaceAddr').prop("disabled", true);
            if (obj["state"] != "" && obj["state"] != null) {
                $('#txtLandlordStateID').show();
                $('#txtLandlordStateID').val(obj["state"])
                $('#txtLandlordStateID').prop("disabled", true);
                $('#ddlLandlordStateID').hide();
            } else {
                $('#ddlLandlordStateID').Show();
            }
            if (obj["subDistrict"] != "" && obj["subDistrict"] != null) {
                $('#txtLandlordDistID').show();
                $('#txtLandlordDistID').val(obj["subDistrict"])
                $('#txtLandlordDistID').prop("disabled", true);
                $('#ddlLandlordDistID').hide();
            } else {
                $('#ddlLandlordDistID').Show();
            }
            if (obj["vtc"] != "" && obj["vtc"] != null) {
                $('#txtLandlordDistBlockID').show();
                $('#txtLandlordDistBlockID').val(obj["vtc"])
                $('#txtLandlordDistBlockID').prop("disabled", true);
                $('#ddlLandlordDistBlockID').hide();
            } else {
                $('#ddlLandlordDistBlockID').Show();
            }

            if (obj["pincodeLocal"] != "" && obj["pincodeLocal"] != null) {
                $('#txtLandlordPinCode').val(obj["pincodeLocal"])
                $('#txtLandlordPinCode').prop("disabled", true)
            }
            //$('#txtLandlordPinCode').val(obj["pincodeLocal"])
            //$('#txtLandlordPinCode').prop("disabled", true);
        } else if (ID == 1) {
            $('#txtTenantName').val(obj["residentName"]);
            $('#txtTenantName').prop("disabled", true);
            $('#txtTenantDOB').val(obj["dateOfBirth"]);
            $('#txtTenantDOB').prop("disabled", true);
            if (obj["gender"] != "") {
                if (obj["gender"] == "M") {
                    $('#ddlTenantGenderID').val("M");
                } else if (obj["gender"] == "F") {
                    $('#ddlTenantGenderID').val("F");
                } else {
                    $('#ddlTenantGenderID').val("T");
                }
                $('#ddlTenantGenderID').prop("disabled", true);
            }
            if (obj["emailId"] != "" && obj["emailId"] != null) {
                $('#txtTenantEmail').val(obj["emailId"])
                $('#txtTenantEmail').prop("disabled", true)
            }
            //$('#txtTenantEmail').val(obj["emailId"])
            //$('#txtTenantEmail').prop("disabled", true);
            if (obj["phone"] != "" && obj["phone"] != null) {
                $('#txtTenantMobile').val(obj["phone"])
                $('#txtTenantMobile').prop("disabled", true)
            }
            //$('#txtTenantMobile').val(obj["phone"])
            //$('#txtTenantMobile').prop("disabled", true);


            //if (obj["houseNumber"] != "" && obj["houseNumber"] != null) {
            //    $('#txtTenantRentPlaceAddr').val(obj["houseNumber"])
            //    $('#txtTenantRentPlaceAddr').prop("disabled", true)
            //}

            if (obj["state"] != "" && obj["state"] != null) {
                $('#txtTenantStateID').show();
                $('#txtTenantStateID').val(obj["state"])
                $('#txtTenantStateID').prop("disabled", true);
                $('#ddlTenantStateID').hide();
            } else {
                $('#ddlTenantStateID').Show();
            }
            if (obj["subDistrict"] != "" && obj["subDistrict"] != null) {
                $('#txtTenantDistID').show();
                $('#txtTenantDistID').val(obj["subDistrict"])
                $('#txtTenantDistID').prop("disabled", true);
                $('#ddlTenantDistID').hide();
            } else {
                $('#ddlTenantDistID').Show();
            }
            if (obj["vtc"] != "" && obj["vtc"] != null) {
                $('#txtTenantDistBlockID').show();
                $('#txtTenantDistBlockID').val(obj["vtc"])
                $('#txtTenantDistBlockID').prop("disabled", true);
                $('#ddlTenantDistBlockID').hide();
            } else {
                $('#ddlTenantDistBlockID').Show();
            }
            if (obj["pincodeLocal"] != "" && obj["pincodeLocal"] != null) {
                $('#txtTenantPinCode').val(obj["pincodeLocal"])
                $('#txtTenantPinCode').prop("disabled", true)
            }
            //$('#txtTenantPinCode').val(obj["pincodeLocal"])
            //$('#txtTenantPinCode').prop("disabled", true);
            //parmanent Address:
            if (obj["careOf"] != "" && obj["careOf"] != null) {
                $('#txtTenantPrmntAddrLine1').val(obj["careOf"])
                $('#txtTenantPrmntAddrLine1').prop("disabled", true)
            }
            if (obj["houseNumber"] != "" && obj["houseNumber"] != null) {
                $('#txtTenantPrmntAddrLine2').val(obj["houseNumber"])
                $('#txtTenantPrmntAddrLine2').prop("disabled", true)
            }
            if (obj["locality"] != "" && obj["locality"] != null) {
                $('#txtTenantPrmntStreetName').val(obj["locality"])
                $('#txtTenantPrmntStreetName').prop("disabled", true)
            }
            if (obj["landmark"] != "" && obj["landmark"] != null) {
                $('#txtTenantPrmntStreetLandMark').val(obj["landmark"])
                $('#txtTenantPrmntStreetLandMark').prop("disabled", true)
            }
            if (obj["locality"] != "" && obj["locality"] != null) {
                $('#txtTenantPrmntStreetLocality').val(obj["locality"])
                $('#txtTenantPrmntStreetLocality').prop("disabled", true)
            }
            if (obj["state"] != "" && obj["state"] != null) {
                $('#txtTenantPrmntStateID').show();
                $('#txtTenantPrmntStateID').val(obj["state"])
                $('#txtTenantPrmntStateID').prop("disabled", true);
                $('#ddlTenantPrmntStateID').hide();
            } else {
                $('#ddlTenantPrmntStateID').Show();
            }
            if (obj["district"] != "" && obj["district"] != null) {
                $('#txtTenantPrmntDistD').show();
                $('#txtTenantPrmntDistD').val(obj["district"])
                $('#txtTenantPrmntDistD').prop("disabled", true);
                $('#ddlTenantPrmntDistD').hide();
            } else {
                $('#ddlTenantPrmntDistD').Show();
            }
            if (obj["subDistrict"] != "" && obj["subDistrict"] != null) {
                $('#txtTenantPrmntBlockD').show();
                $('#txtTenantPrmntBlockD').val(obj["subDistrict"])
                $('#txtTenantPrmntBlockD').prop("disabled", true);
                $('#ddlTenantPrmntBlockD').hide();
            } else {
                $('#ddlTenantPrmntBlockD').Show();
            }
            if (obj["vtc"] != "" && obj["vtc"] != null) {
                $('#txtTenantPrmntCityID').show();
                $('#txtTenantPrmntCityID').val(obj["vtc"])
                $('#txtTenantPrmntCityID').prop("disabled", true);
                $('#ddlTenantPrmntCityID').hide();
            } else {
                $('#ddlTenantPrmntCityID').Show();
            }

            if (obj["pincode"] != "" && obj["pincode"] != null) {
                $('#txtTenantPrmntPinCode').val(obj["pincode"])
                $('#txtTenantPrmntPinCode').prop("disabled", true)
            }
            //$('#txtTenantPrmntPinCode').val(obj["pincode"])
            //$('#txtTenantPrmntPinCode').prop("disabled", true);
        }
    }
}

function getQueryStrings() {
    var assoc = {};
    var decode = function (s) {
        return decodeURIComponent(s.replace(/\+/g, " "));
    };
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

function openWindow(UIDVal, value, SessionName) {
    //validateUID(UIDVal) != false
    if (true) {
        //if (UIDVal == "1") {
        //code = UIDVal;
        //}

        //CheckLocalAadhar($("#UID").val());
        var UID = $("#txtAadhaarUIDNumber").val();
        var EID = "0";
        var left = (screen.width / 2) - (560 / 2);
        var top = (screen.height / 2) - (400 / 2);

        window.open('/UID/Default.aspx?SvcID=403&aadhaarNumber=' + UID + '&kycTypesToUse=OTP', 'open_window',
            ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        window.focus();
    }
    return false;
}

function GetState() {

    var SelState = $('#ddlTenantStateID');
    var SelState1 = $('#ddlLandlordStateID');
    var SelState2 = $('#ddlTenantPrmntStateID');
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/Deeds/RentDeed.aspx/StateData",
        data: '{}',
        dataType: "json",
        success: function (r) {
            SelState.empty().append('<option selected="selected" value="0">-Select State-</option>');
            SelState1.empty().append('<option selected="selected" value="0">-Select State-</option>');
            SelState2.empty().append('<option selected="selected" value="0">-Select State-</option>');
            $.each(r.d, function () {
                $(SelState).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                $(SelState1).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                $(SelState2).append('<option value = "' + this.Id + '">' + this.Name + '</option>');
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
    } else {
        return false;
    }
}

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
        "TenantAadhaarUIDNumber": "",
        "TenantAadhaarVerified": "",
        "LandlordAadhaarUIDNumber": "",
        "LandlordAadhaarVerified": "",
        "TenantName": "",
        "TenantDOB": "",
        "TenantGenderID": "",
        "TenantEmail": "",
        "TenantMobile": "",
        "TenantRentPlaceAddr": "",
        "TenantStateID": "",
        "TenantDistID": "",
        "TenantDistBlockID": "",
        "TenantPinCode": "",
        "LandlordName": "",
        "LandlordDOB": "",
        "LandlordGenderID": "",
        "LandlordEmail": "",
        "LandlordMobile": "",
        "LandlordRentPlaceAddr": "",
        "LandlordStateID": "",
        "LandlordDistID": "",
        "LandlordDistBlockID": "",
        "LandlordPinCode": "",
        "TenantPrmntAddrLine1": "",
        "TenantPrmntAddrLine2": "",
        "TenantPrmntStreetName": "",
        "TenantPrmntStreetLandMark": "",
        "TenantPrmntStreetLocality": "",
        "TenantPrmntStateID": "",
        "TenantPrmntDistD": "",
        "TenantPrmntBlockD": "",
        "TenantPrmntCityID": "",
        "TenantPrmntPinCode": "",
        "PeriodOfRentInMonth": "",
        "RentPayableDatePM": "",
        "RentPayableGraceDatePM": "",
        "MaintenanceChargePM": "",
        "TotalRentAmntPM": "",
        "TotalRentAmntInWordsPM": "",
        "DeedPlace": "",
        "DeedDate": "",
        "IsSecurityAmntPaid": "",
        "SecurityAmntPeriod": "",
        "SecurityAmnt": "",
        "SecurityAmntInWords": "",
        "PremisesTypeID": "",
        "HouseProperty": "",
        "RentPayMode": "",
        "RentPayBank": "",
        "RentPayBranch": "",
        "RentPayDDNo": "",
        "RentPayDDDate": "",
        "RentPayAmnt": "",
        "RentPayAmntWords": "",
        "SecurityPayMode": "",
        "SecurityPayBank": "",
        "SecurityPayBranch": "",
        "SecurityPayDDNo": "",
        "SecurityPayDDDate": "",
        "SecurityPayAmnt": "",
        "SecurityPayAmntWords": "",
        "Witness1Name": "",
        "Witness1Address": "",
        "Witness2Name": "",
        "Witness2Address": "",
        "CreatedBy": "",
        "Createdon": "",
        "MoodifiedBy": "",
        "Modifiedon": "",
        "IsActive": "",
        "AppID": "",
        "IsVarified": "",
        "RentChargePM": ""
    };
    //debugger;
    //console.log(obj);
    var text = "",
        tDis = "",
        tSubDis = "",
        LDis = "",
        LSubDis = "";
    var ApplicatantType = $('#ddlApplicantType').val();
    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];

    objUser.VerificationTypeID = $('#ddlVerificationTypeID').val();
    // 1 - Tenant
    // 2 - Owner
    if (ApplicatantType == 1) {
        objUser.LandlordAadhaarUIDNumber = $('#txtAadhaarUIDNumber').val();
        objUser.TenantAadhaarVerified = "1";
        objUser.TenantAadhaarUIDNumber = uid;
        if ($('#txtTenantDistID').val() != '') objUser.DistrictName = $('#txtTenantDistID').val();
        else objUser.DistrictName = $("#ddlTenantDistID").val();
        if ($('#txtTenantDistBlockID').val() != '') objUser.TalukaName = $('#txtTenantDistBlockID').val();
        else objUser.TalukaName = $("#ddlTenantDistBlockID").val();
    } else {
        objUser.TenantAadhaarUIDNumber = $('#txtAadhaarUIDNumber').val();
        objUser.LandlordAadhaarVerified = "1";
        objUser.LandlordAadhaarUIDNumber = uid;
        if ($('#txtLandlordDistID').val() != '') objUser.DistrictName = $('#txtLandlordDistID').val();
        else objUser.DistrictName = $("#ddlLandlordDistID").val();
        if ($('#txtLandlordDistBlockID').val() != '') objUser.TalukaName = $('#txtLandlordDistBlockID').val();
        else objUser.TalukaName = $("#ddlLandlordDistBlockID").val();
    }

    objUser.TenantName = $("#txtTenantName").val();
    objUser.TenantDOB = $("#txtTenantDOB").val();
    objUser.TenantGenderID = $("#ddlTenantGenderID").val();
    objUser.TenantEmail = $("#txtTenantEmail").val();
    objUser.TenantMobile = $("#txtTenantMobile").val();
    objUser.TenantRentPlaceAddr = $("#txtTenantRentPlaceAddr").val();
    objUser.TenantStateID = $("#txtTenantStateID").val();
    objUser.TenantDistID = $("#txtTenantDistID").val();
    objUser.TenantDistBlockID = $("#txtTenantDistBlockID").val();
    objUser.TenantPinCode = $("#txtTenantPinCode").val();
    objUser.LandlordName = $("#txtLandlordName").val();
    objUser.LandlordDOB = $("#txtLandlordDOB").val();
    objUser.LandlordGenderID = $("#ddlLandlordGenderID").val();
    objUser.LandlordEmail = $("#txtLandlordEmail").val();
    objUser.LandlordMobile = $("#txtLandlordMobile").val();
    objUser.LandlordRentPlaceAddr = $("#txtLandlordRentPlaceAddr").val();
    objUser.LandlordStateID = $("#txtLandlordStateID").val();
    objUser.LandlordDistID = $("#txtLandlordDistID").val();
    objUser.LandlordDistBlockID = $("#txtLandlordDistBlockID").val();
    objUser.LandlordPinCode = $("#txtLandlordPinCode").val();
    objUser.TenantPrmntAddrLine1 = $("#txtTenantPrmntAddrLine1").val();
    objUser.TenantPrmntAddrLine2 = $("#txtTenantPrmntAddrLine2").val();
    objUser.TenantPrmntStreetName = $("#txtTenantPrmntStreetName").val();
    objUser.TenantPrmntStreetLandMark = $("#txtTenantPrmntStreetLandMark").val();
    objUser.TenantPrmntStreetLocality = $("#txtTenantPrmntStreetLocality").val();
    objUser.TenantPrmntStateID = $("#txtTenantPrmntStateID").val();
    objUser.TenantPrmntDistD = $("#txtTenantPrmntDistD").val();
    objUser.TenantPrmntBlockD = $("#txtTenantPrmntBlockD").val();
    objUser.TenantPrmntCityID = $("#txtTenantPrmntCityID").val();
    objUser.TenantPrmntPinCode = $("#txtTenantPrmntPinCode").val();
    objUser.PeriodOfRentInMonth = $("#txtPeriodOfRent").val();
    objUser.RentPayableDatePM = $("#txtRentPayableDatePM").val();
    objUser.RentPayableGraceDatePM = $("#txtRentPayableGraceDatePM").val();
    objUser.MaintenanceChargePM = $("#txtMaintenanceChargePM").val();
    objUser.TotalRentAmntPM = $("#txtTotalRentAmntPM").val();
    objUser.TotalRentAmntInWordsPM = $("#txtTotalRentAmntInWordsPM").val();
    objUser.DeedPlace = $("#txtDeedPlace").val();
    objUser.DeedDate = $("#txtDeedDate").val();
    objUser.IsSecurityAmntPaid = $("#txtIsSecurityAmntPaid").val();
    objUser.SecurityAmntPeriod = $("#txtSecurityAmntPeriod").val();
    objUser.SecurityAmnt = $("#txtSecurityAmnt").val();
    objUser.SecurityAmntInWords = $("#txtSecurityAmntInWords").val();
    objUser.PremisesTypeID = $("#ddlPremisesTypeID").val();
    objUser.HouseProperty = $("#hdfSuspectSave").val()
    objUser.RentPayMode = $("#ddlRentPayMode").val();
    objUser.RentPayBank = $("#txtRentPayBank").val();
    objUser.RentPayBranch = $("#txtRentPayBranch").val();
    objUser.RentPayDDNo = $("#txtRentPayDDNo").val();
    objUser.RentPayDDDate = $("#txtRentPayDDDate").val();
    objUser.RentPayAmnt = $("#txtRentPayAmnt").val();
    objUser.RentPayAmntWords = $("#txtRentPayAmntWords").val();
    objUser.SecurityPayMode = $("#ddlSecurityPayMode").val();
    objUser.SecurityPayBank = $("#txtSecurityPayBank").val();
    objUser.SecurityPayBranch = $("#txtSecurityPayBranch").val();
    objUser.SecurityPayDDNo = $("#txtSecurityPayDDNo").val();
    objUser.SecurityPayDDDate = $("#txtSecurityPayDDDate").val();
    objUser.SecurityPayAmnt = $("#txtSecurityPayAmnt").val();
    objUser.SecurityPayAmntWords = $("#txtSecurityPayAmntWords").val();
    objUser.Witness1Name = $("#txtWitness1Name").val();
    objUser.Witness1Address = $("#txtWitness1Address").val();
    objUser.Witness2Name = $("#txtWitness2Name").val();
    objUser.Witness2Address = $("#txtWitness2Address").val();
    objUser.CreatedBy = uid;
    objUser.Createdon = "";
    objUser.IsActive = true;
    objUser.AppID = "";
    objUser.IsVarified = false;
    objUser.RentChargePM = $("#txtRentChargePM").val();

    var temp = 'Ravi';
    var obj = {
        "prefix": "'" + temp + "'",
        "Data": JSON.stringify(objUser, null, 4)
    };

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/WebAppUK/Deeds/RentDeed.aspx/HouseRent",
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
            window.location.href = "/WebAppUK/Deeds/OutputForRentDeed.aspx?SvcID=" + svcid + '&AppID=' + obj.AppID + '&UID=' + uid;
        }

    }); // end of Then function of main Data Insert Function

    return false;

}

function ValidateForm() {
    //debugger;
    var text = "";
    var opt = "";
    debugger;
    var VerificationTypeID = $("#ddlVerificationTypeID").val();
    var TenantGenderID = $("#ddlTenantGenderID").val();

    if (VerificationTypeID == '-Select-' || VerificationTypeID == "0")
    {
        text += "<br /> -Please Select Verification Type. ";
        $("#ddlVerificationTypeID").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlVerificationTypeID").css({
            "background-color": "#fff2ee"});
        opt = 1;
    } else {
        $("#ddlVerificationTypeID").attr('style', 'border:1px solid #eee !important;');
        $("#ddlVerificationTypeID").css({ "background-color": "#ffffff"});
    }
 
    if (TenantGenderID == '-Select-' || TenantGenderID == "0") {
        text += "<br /> -Please Select Tenant Gender. ";
        $("#ddlTenantGenderID").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlTenantGenderID").css({"background-color": "#fff2ee"});
        opt = 1;
    } else {
        $("#ddlTenantGenderID").attr('style', 'border:1px solid #eee !important;');
        $("#ddlTenantGenderID").css({"background-color": "#ffffff"
        });
    }
    var LandlordGenderID = $("#ddlLandlordGenderID").val();
    if (LandlordGenderID == '-Select-' || LandlordGenderID == "0") {
        text += "<br /> -Please Select Landlord Gender. ";
        $("#ddlLandlordGenderID").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlLandlordGenderID").css({"background-color": "#fff2ee"});
        opt = 1;
    }
    else {
        $("#ddlLandlordGenderID").attr('style', 'border:1px solid #eee !important;');
        $("#ddlLandlordGenderID").css({"background-color": "#ffffff"});
    }
    var PremisesTypeID = $("#ddlPremisesTypeID").val();
    if (PremisesTypeID == '-Select-' || PremisesTypeID == "0") {
        text += "<br /> -Please Select Premises Type. ";
        $("#ddlPremisesTypeID").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlPremisesTypeID").css({ "background-color": "#fff2ee"});
        opt = 1;
    }
    else {
        $("#ddlPremisesTypeID").attr('style', 'border:1px solid #eee !important;');
        $("#ddlPremisesTypeID").css({ "background-color": "#ffffff" });
    }
    var RentPayMode = $("#ddlRentPayMode").val();
    if (RentPayMode == '-Select-' || RentPayMode == "0") {
        text += "<br /> -Please Select Rent Pay Mode. ";
        $("#ddlRentPayMode").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlRentPayMode").css({ "background-color": "#fff2ee"});
        opt = 1;
    } else {
        $("#ddlRentPayMode").attr('style', 'border:1px solid #eee !important;');
        $("#ddlRentPayMode").css({"background-color": "#ffffff"});
    }
    var IsSecurityAmntPaid = $("#txtIsSecurityAmntPaid").val(); 
    var SecurityPayMode = $("#ddlSecurityPayMode").val();

    var AadhaarUIDNumber = $("#txtAadhaarUIDNumber").val();
    if (AadhaarUIDNumber == '' || AadhaarUIDNumber == null) {
        text += "<br /> -Please Select AadhaarUIDNumber.";
        $("#txtAadhaarUIDNumber").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtAadhaarUIDNumber").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#txtAadhaarUIDNumber").attr('style', '1px solid #eee !important;');
        $("#txtAadhaarUIDNumber").css({ "background-color": "#ffffff"});
    }
    var TenantName = $("#txtTenantName").val();
    if (TenantName == '' || TenantName == null) {
        text += "<br /> -Please Select TenantName.";
        $("#txtTenantName").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtTenantName").css({ "background-color": "#fff2ee"  });opt = 1;
    } else {
        $("#txtTenantName").attr('style', '1px solid #eee !important;');
        $("#txtTenantName").css({ "background-color": "#ffffff"
        });
    }
    var TenantDOB = $("#txtTenantDOB").val();
    if (TenantDOB == '' || TenantDOB == null) {
        text += "<br /> -Please Select TenantDOB.";
        $("#txtTenantDOB").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtTenantDOB").css({"background-color": "#fff2ee"});
        opt = 1;
    } else {
        $("#txtTenantDOB").attr('style', '1px solid #eee !important;');
        $("#txtTenantDOB").css({ "background-color": "#ffffff"});
    }
    var TenantEmail = $("#txtTenantEmail").val();
    if (TenantEmail == '' || TenantEmail == null) {
        text += "<br /> -Please Select TenantEmail.";
        $("#txtTenantEmail").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtTenantEmail").css({"background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#txtTenantEmail").attr('style', '1px solid #eee !important;');
        $("#txtTenantEmail").css({ "background-color": "#ffffff" });
    }
    var TenantMobile = $("#txtTenantMobile").val();
    if (TenantMobile == '' || TenantMobile == null) {
        text += "<br /> -Please Select TenantMobile.";
        $("#txtTenantMobile").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtTenantMobile").css({ "background-color": "#fff2ee"});
        opt = 1;
    } else {
        $("#txtTenantMobile").attr('style', '1px solid #eee !important;');
        $("#txtTenantMobile").css({ "background-color": "#ffffff"});
    }
    debugger;
    var TenantRentPlaceAddr = $("#txtTenantRentPlaceAddr").val();
    if (TenantRentPlaceAddr == '' || TenantRentPlaceAddr == null) {
        text += "<br /> -Please Select TenantRentPlaceAddr.";
        $("#txtTenantRentPlaceAddr").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtTenantRentPlaceAddr").css({"background-color": "#fff2ee"
        });
        opt = 1;
    } else {
        $("#txtTenantRentPlaceAddr").attr('style', '1px solid #eee !important;');
        $("#txtTenantRentPlaceAddr").css({ "background-color": "#ffffff" });
    }
    var TenantPinCode = $("#txtTenantPinCode").val();
    if (TenantPinCode == '' || TenantPinCode == null) {
        text += "<br /> -Please Select TenantPinCode.";
        $("#txtTenantPinCode").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtTenantPinCode").css({"background-color": "#fff2ee"});
        opt = 1;
    } else {
        $("#txtTenantPinCode").attr('style', '1px solid #eee !important;');
        $("#txtTenantPinCode").css({ "background-color": "#ffffff"});
    }
    var LandlordName = $("#txtLandlordName").val();
    if (LandlordName == '' || LandlordName == null) {
        text += "<br /> -Please Select LandlordName.";
        $("#txtLandlordName").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtLandlordName").css({ "background-color": "#fff2ee"
        });
        opt = 1;
    } else {
        $("#txtLandlordName").attr('style', '1px solid #eee !important;');
        $("#txtLandlordName").css({ "background-color": "#ffffff"});
    }
    var LandlordDOB = $("#txtLandlordDOB").val();
    if (LandlordDOB == '' || LandlordDOB == null) {
        text += "<br /> -Please Select LandlordDOB.";
        $("#txtLandlordDOB").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtLandlordDOB").css({ "background-color": "#fff2ee"  });
        opt = 1;
    } else {
        $("#txtLandlordDOB").attr('style', '1px solid #eee !important;');
        $("#txtLandlordDOB").css({
            "background-color": "#ffffff"
        });
    }
    var LandlordMobile = $("#txtLandlordMobile").val();
    if (LandlordMobile == '' || LandlordMobile == null) {
        text += "<br /> -Please Select LandlordMobile.";
        $("#txtLandlordMobile").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtLandlordMobile").css({ "background-color": "#fff2ee"});
        opt = 1;
    } else {
        $("#txtLandlordMobile").attr('style', '1px solid #eee !important;');
        $("#txtLandlordMobile").css({"background-color": "#ffffff" });
    }
    var LandlordRentPlaceAddr = $("#txtLandlordRentPlaceAddr").val();
    if (LandlordRentPlaceAddr == '' || LandlordRentPlaceAddr == null) {
        text += "<br /> -Please Select LandlordRentPlaceAddr.";
        $("#txtLandlordRentPlaceAddr").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtLandlordRentPlaceAddr").css({ "background-color": "#fff2ee"  });
        opt = 1;
    } else {
        $("#txtLandlordRentPlaceAddr").attr('style', '1px solid #eee !important;');
        $("#txtLandlordRentPlaceAddr").css({ "background-color": "#ffffff"});
    }
    var LandlordPinCode = $("#txtLandlordPinCode").val();
    if (LandlordPinCode == '' || LandlordPinCode == null) {
        text += "<br /> -Please Select LandlordPinCode.";
        $("#txtLandlordPinCode").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtLandlordPinCode").css({ "background-color": "#fff2ee"});
        opt = 1;
    } else {
        $("#txtLandlordPinCode").attr('style', '1px solid #eee !important;');
        $("#txtLandlordPinCode").css({ "background-color": "#ffffff" });
    }
    var TenantPrmntAddrLine1 = $("#txtTenantPrmntAddrLine1").val();
    if (TenantPrmntAddrLine1 == '' || TenantPrmntAddrLine1 == null) {
        text += "<br /> -Please Select TenantPrmntAddrLine1.";
        $("#txtTenantPrmntAddrLine1").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtTenantPrmntAddrLine1").css({ "background-color": "#fff2ee"});
        opt = 1;
    } else {
        $("#txtTenantPrmntAddrLine1").attr('style', '1px solid #eee !important;');
        $("#txtTenantPrmntAddrLine1").css({ "background-color": "#ffffff"});
    }
    //var TenantPrmntAddrLine2 = $("#txtTenantPrmntAddrLine2").val(); if (TenantPrmntAddrLine2 == '' || TenantPrmntAddrLine2 == null) { text += "<br /> -Please Select TenantPrmntAddrLine2."; $("#txtTenantPrmntAddrLine2").attr('style', 'border:1px solid #d03100 !important;'); $("#txtTenantPrmntAddrLine2").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtTenantPrmntAddrLine2").attr('style', '1px solid #eee !important;'); $("#txtTenantPrmntAddrLine2").css({ "background-color": "#ffffff" }); }
    var TenantPrmntStreetName = $("#txtTenantPrmntStreetName").val();
    if (TenantPrmntStreetName == '' || TenantPrmntStreetName == null) {
        text += "<br /> -Please Select TenantPrmntStreetName.";
        $("#txtTenantPrmntStreetName").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtTenantPrmntStreetName").css({ "background-color": "#fff2ee"  });
        opt = 1;
    } else {
        $("#txtTenantPrmntStreetName").attr('style', '1px solid #eee !important;');
        $("#txtTenantPrmntStreetName").css({ "background-color": "#ffffff"});
    }
    //var TenantPrmntStreetLandMark = $("#txtTenantPrmntStreetLandMark").val(); if (TenantPrmntStreetLandMark == '' || TenantPrmntStreetLandMark == null) { text += "<br /> -Please Select TenantPrmntStreetLandMark."; $("#txtTenantPrmntStreetLandMark").attr('style', 'border:1px solid #d03100 !important;'); $("#txtTenantPrmntStreetLandMark").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtTenantPrmntStreetLandMark").attr('style', '1px solid #eee !important;'); $("#txtTenantPrmntStreetLandMark").css({ "background-color": "#ffffff" }); }
    var TenantPrmntStreetLocality = $("#txtTenantPrmntStreetLocality").val();
    if (TenantPrmntStreetLocality == '' || TenantPrmntStreetLocality == null) {
        text += "<br /> -Please Select TenantPrmntStreetLocality.";
        $("#txtTenantPrmntStreetLocality").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtTenantPrmntStreetLocality").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#txtTenantPrmntStreetLocality").attr('style', '1px solid #eee !important;');
        $("#txtTenantPrmntStreetLocality").css({ "background-color": "#ffffff" });
    }
    var TenantPrmntPinCode = $("#txtTenantPrmntPinCode").val();
    if (TenantPrmntPinCode == '' || TenantPrmntPinCode == null) {
        text += "<br /> -Please Select TenantPrmntPinCode.";
        $("#txtTenantPrmntPinCode").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtTenantPrmntPinCode").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#txtTenantPrmntPinCode").attr('style', '1px solid #eee !important;');
        $("#txtTenantPrmntPinCode").css({ "background-color": "#ffffff" });
    }
    var PeriodOfRent = $("#txtPeriodOfRent").val();
    if (PeriodOfRent == '' || PeriodOfRent == null) {
        text += "<br /> -Please Select PeriodOfRent.";
        $("#txtPeriodOfRent").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtPeriodOfRent").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#txtPeriodOfRent").attr('style', '1px solid #eee !important;');
        $("#txtPeriodOfRent").css({
            "background-color": "#ffffff"
        });
    }
    var RentPayableDatePM = $("#txtRentPayableDatePM").val();
    if (RentPayableDatePM == '' || RentPayableDatePM == null) {
        text += "<br /> -Please Select RentPayableDatePM.";
        $("#txtRentPayableDatePM").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtRentPayableDatePM").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#txtRentPayableDatePM").attr('style', '1px solid #eee !important;');
        $("#txtRentPayableDatePM").css({ "background-color": "#ffffff"
        });
    }
    

    var RentAmntPM = $("#txtRentChargePM").val();

    if (RentAmntPM == '' || RentAmntPM == null) {
        text += "<br /> -Please Select TotalRentAmntPM.";
        $("#txtRentChargePM").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtRentChargePM").css({ "background-color": "#fff2ee"});
        opt = 1;
    } else {
        $("#txtRentChargePM").attr('style', '1px solid #eee !important;');
        $("#txtRentChargePM").css({  "background-color": "#ffffff"});
    }



    var TotalRentAmntPM = $("#txtTotalRentAmntPM").val();
    if (TotalRentAmntPM == '' || TotalRentAmntPM == null) {
        text += "<br /> -Please Select TotalRentAmntPM.";
        $("#txtTotalRentAmntPM").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtTotalRentAmntPM").css({
            "background-color": "#fff2ee"
        });
        opt = 1;
    } else {
        $("#txtTotalRentAmntPM").attr('style', '1px solid #eee !important;');
        $("#txtTotalRentAmntPM").css({
            "background-color": "#ffffff"
        });
    }
    var TotalRentAmntInWordsPM = $("#txtTotalRentAmntInWordsPM").val();
    if (TotalRentAmntInWordsPM == '' || TotalRentAmntInWordsPM == null) {
        text += "<br /> -Please Select TotalRentAmntInWordsPM.";
        $("#txtTotalRentAmntInWordsPM").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtTotalRentAmntInWordsPM").css({
            "background-color": "#fff2ee"
        });
        opt = 1;
    } else {
        $("#txtTotalRentAmntInWordsPM").attr('style', '1px solid #eee !important;');
        $("#txtTotalRentAmntInWordsPM").css({
            "background-color": "#ffffff"
        });
    }
    var DeedPlace = $("#txtDeedPlace").val();
    if (DeedPlace == '' || DeedPlace == null) {
        text += "<br /> -Please Select DeedPlace.";
        $("#txtDeedPlace").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtDeedPlace").css({
            "background-color": "#fff2ee"
        });
        opt = 1;
    } else {
        $("#txtDeedPlace").attr('style', '1px solid #eee !important;');
        $("#txtDeedPlace").css({
            "background-color": "#ffffff"
        });
    }
    var DeedDate = $("#txtDeedDate").val();
    if (DeedDate == '' || DeedDate == null) {
        text += "<br /> -Please Select DeedDate.";
        $("#txtDeedDate").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtDeedDate").css({
            "background-color": "#fff2ee"
        });
        opt = 1;
    } else {
        $("#txtDeedDate").attr('style', '1px solid #eee !important;');
        $("#txtDeedDate").css({
            "background-color": "#ffffff"
        });
    }


    if (IsSecurityAmntPaid == 1) {
        //var SecurityAmntPeriod = $("#txtSecurityAmntPeriod").val(); if (SecurityAmntPeriod == '' || SecurityAmntPeriod == null) { text += "<br /> -Please Select SecurityAmntPeriod."; $("#txtSecurityAmntPeriod").attr('style', 'border:1px solid #d03100 !important;'); $("#txtSecurityAmntPeriod").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtSecurityAmntPeriod").attr('style', '1px solid #eee !important;'); $("#txtSecurityAmntPeriod").css({ "background-color": "#ffffff" }); }
        var SecurityAmnt = $("#txtSecurityAmnt").val();
        if (SecurityAmnt == '' || SecurityAmnt == null) {
            text += "<br /> -Please Select SecurityAmnt.";
            $("#txtSecurityAmnt").attr('style', 'border:1px solid #d03100 !important;');
            $("#txtSecurityAmnt").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#txtSecurityAmnt").attr('style', '1px solid #eee !important;');
            $("#txtSecurityAmnt").css({
                "background-color": "#ffffff"
            });
        }
        var SecurityAmntInWords = $("#txtSecurityAmntInWords").val();
        if (SecurityAmntInWords == '' || SecurityAmntInWords == null) {
            text += "<br /> -Please Select SecurityAmntInWords.";
            $("#txtSecurityAmntInWords").attr('style', 'border:1px solid #d03100 !important;');
            $("#txtSecurityAmntInWords").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#txtSecurityAmntInWords").attr('style', '1px solid #eee !important;');
            $("#txtSecurityAmntInWords").css({
                "background-color": "#ffffff"
            });
        }


        if (SecurityPayMode == '-Select-' || SecurityPayMode == "0") {
            text += "<br /> -Please Select Security Pay Mode. ";
            $("#ddlSecurityPayMode").attr('style', 'border:1px solid #d03100 !important;');
            $("#ddlSecurityPayMode").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#ddlSecurityPayMode").attr('style', 'border:1px solid #eee !important;');
            $("#ddlSecurityPayMode").css({
                "background-color": "#ffffff"
            });
        }

        if (SecurityPayMode == "0" || SecurityPayMode == "2") {
            $("#txtSecurityPayBank").attr('style', '1px solid #eee !important;');
            $("#txtSecurityPayBank").css({ "background-color": "#eee " });
        
            $("#txtSecurityPayDDNo").attr('style', '1px solid #eee !important;');
            $("#txtSecurityPayDDNo").css({"background-color": "#eee "});
            $("#txtSecurityPayDDDate").attr('style', '1px solid #eee !important;');
            $("#txtSecurityPayDDDate").css({ "background-color": "#eee "});
            
        }
        else {
            var SecurityPayBank = $("#txtSecurityPayBank").val();
            if (SecurityPayBank == '' || SecurityPayBank == null || SecurityPayBank == 'undefined') {
                text += "<br /> -Please Select Security Pay Bank.";
                $("#txtSecurityPayBank").attr('style', 'border:1px solid #d03100 !important;');
                $("#txtSecurityPayBank").css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $("#txtSecurityPayBank").attr('style', '1px solid #eee !important;');
                $("#txtSecurityPayBank").css({ "background-color": "#ffffff"});
            }
            //var SecurityPayBranch = $("#txtSecurityPayBranch").val(); if (SecurityPayBranch == '' || SecurityPayBranch == null) { text += "<br /> -Please Select Security Pay Branch."; $("#txtSecurityPayBranch").attr('style', 'border:1px solid #d03100 !important;'); $("#txtSecurityPayBranch").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtSecurityPayBranch").attr('style', '1px solid #eee !important;'); $("#txtSecurityPayBranch").css({ "background-color": "#ffffff" }); }
            var SecurityPayDDNo = $("#txtSecurityPayDDNo").val();
            if (SecurityPayDDNo == '' || SecurityPayDDNo == null || SecurityPayDDNo == 'undefined') {
                text += "<br /> -Please Select Security Pay DD Number.";
                $("#txtSecurityPayDDNo").attr('style', 'border:1px solid #d03100 !important;');
                $("#txtSecurityPayDDNo").css({"background-color": "#fff2ee" });
                opt = 1;
            } else {
                $("#txtSecurityPayDDNo").attr('style', '1px solid #eee !important;');
                $("#txtSecurityPayDDNo").css({  "background-color": "#ffffff" });
            }
            var SecurityPayDDDate = $("#txtSecurityPayDDDate").val();
            if (SecurityPayDDDate == '' || SecurityPayDDDate == null || SecurityPayDDDate == 'undefined') {
                text += "<br /> -Please Select Security Pay DD Date.";
                $("#txtSecurityPayDDDate").attr('style', 'border:1px solid #d03100 !important;');
                $("#txtSecurityPayDDDate").css({ "background-color": "#fff2ee"});
                opt = 1;
            } else {
                $("#txtSecurityPayDDDate").attr('style', '1px solid #eee !important;');
                $("#txtSecurityPayDDDate").css({  "background-color": "#ffffff"
                });
            }
        }

        var SecurityPayAmnt = $("#txtSecurityPayAmnt").val();
        if (SecurityPayAmnt == '' || SecurityPayAmnt == null) {
            text += "<br /> -Please Select SecurityPayAmnt.";
            $("#txtSecurityPayAmnt").attr('style', 'border:1px solid #d03100 !important;');
            $("#txtSecurityPayAmnt").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#txtSecurityPayAmnt").attr('style', '1px solid #eee !important;');
            $("#txtSecurityPayAmnt").css({
                "background-color": "#ffffff"
            });
        }
        var SecurityPayAmntWords = $("#txtSecurityPayAmntWords").val();
        if (SecurityPayAmntWords == '' || SecurityPayAmntWords == null) {
            text += "<br /> -Please Select SecurityPayAmntWords.";
            $("#txtSecurityPayAmntWords").attr('style', 'border:1px solid #d03100 !important;');
            $("#txtSecurityPayAmntWords").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#txtSecurityPayAmntWords").attr('style', '1px solid #eee !important;');
            $("#txtSecurityPayAmntWords").css({
                "background-color": "#ffffff"
            });
        }

    }
    if (IsSecurityAmntPaid == 2) {
        var SecurityAmnt = $("#txtSecurityAmnt").val();
        if (SecurityAmnt == '' || SecurityAmnt == null) {
            text += "<br /> -Please Select SecurityAmnt.";
            $("#txtSecurityAmnt").attr('style', 'border:1px solid #d03100 !important;');
            $("#txtSecurityAmnt").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#txtSecurityAmnt").attr('style', '1px solid #eee !important;');
            $("#txtSecurityAmnt").css({
                "background-color": "#ffffff"
            });
        }
        var SecurityAmntInWords = $("#txtSecurityAmntInWords").val();
        if (SecurityAmntInWords == '' || SecurityAmntInWords == null) {
            text += "<br /> -Please Select SecurityAmntInWords.";
            $("#txtSecurityAmntInWords").attr('style', 'border:1px solid #d03100 !important;');
            $("#txtSecurityAmntInWords").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#txtSecurityAmntInWords").attr('style', '1px solid #eee !important;');
            $("#txtSecurityAmntInWords").css({
                "background-color": "#ffffff"
            });
        }

        if (SecurityPayMode == '-Select-' || SecurityPayMode == "0") {
            text += "<br /> -Please Select Security Pay Mode. ";
            $("#ddlSecurityPayMode").attr('style', 'border:1px solid #d03100 !important;');
            $("#ddlSecurityPayMode").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#ddlSecurityPayMode").attr('style', 'border:1px solid #eee !important;');
            $("#ddlSecurityPayMode").css({
                "background-color": "#ffffff"
            });
        }
        if (SecurityPayMode == "0" || SecurityPayMode == "2") {
            $("#txtSecurityPayBank").attr('style', '1px solid #eee !important;');
            $("#txtSecurityPayBank").css({
                "background-color": "#eee "
            });
            //$("#txtSecurityPayBranch").attr('style', '1px solid #eee !important;'); $("#txtSecurityPayBranch").css({ "background-color": "#eee " });
            $("#txtSecurityPayDDNo").attr('style', '1px solid #eee !important;');
            $("#txtSecurityPayDDNo").css({
                "background-color": "#eee "
            });
            $("#txtSecurityPayDDDate").attr('style', '1px solid #eee !important;');
            $("#txtSecurityPayDDDate").css({
                "background-color": "#eee "
            });
            opt = 1;
        } else {
            var SecurityPayBank = $("#txtSecurityPayBank").val();
            if (SecurityPayBank == '' || SecurityPayBank == null) {
                text += "<br /> -Please Select Security Pay Bank.";
                $("#txtSecurityPayBank").attr('style', 'border:1px solid #d03100 !important;');
                $("#txtSecurityPayBank").css({
                    "background-color": "#fff2ee"
                });
                opt = 1;
            } else {
                $("#txtSecurityPayBank").attr('style', '1px solid #eee !important;');
                $("#txtSecurityPayBank").css({
                    "background-color": "#ffffff"
                });
            }
            //var SecurityPayBranch = $("#txtSecurityPayBranch").val(); if (SecurityPayBranch == '' || SecurityPayBranch == null) { text += "<br /> -Please Select Security Pay Branch."; $("#txtSecurityPayBranch").attr('style', 'border:1px solid #d03100 !important;'); $("#txtSecurityPayBranch").css({ "background-color": "#fff2ee" }); opt = 1; } else { $("#txtSecurityPayBranch").attr('style', '1px solid #eee !important;'); $("#txtSecurityPayBranch").css({ "background-color": "#ffffff" }); }
            var SecurityPayDDNo = $("#txtSecurityPayDDNo").val();
            if (SecurityPayDDNo == '' || SecurityPayDDNo == null) {
                text += "<br /> -Please Select Security Pay DD Number.";
                $("#txtSecurityPayDDNo").attr('style', 'border:1px solid #d03100 !important;');
                $("#txtSecurityPayDDNo").css({
                    "background-color": "#fff2ee"
                });
                opt = 1;
            } else {
                $("#txtSecurityPayDDNo").attr('style', '1px solid #eee !important;');
                $("#txtSecurityPayDDNo").css({
                    "background-color": "#ffffff"
                });
            }
            var SecurityPayDDDate = $("#txtSecurityPayDDDate").val();
            if (SecurityPayDDDate == '' || SecurityPayDDDate == null) {
                text += "<br /> -Please Select Security Pay DD Date.";
                $("#txtSecurityPayDDDate").attr('style', 'border:1px solid #d03100 !important;');
                $("#txtSecurityPayDDDate").css({
                    "background-color": "#fff2ee"
                });
                opt = 1;
            } else {
                $("#txtSecurityPayDDDate").attr('style', '1px solid #eee !important;');
                $("#txtSecurityPayDDDate").css({
                    "background-color": "#ffffff"
                });
            }
        }

        var SecurityPayAmnt = $("#txtSecurityPayAmnt").val();
        if (SecurityPayAmnt == '' || SecurityPayAmnt == null) {
            text += "<br /> -Please Select SecurityPayAmnt.";
            $("#txtSecurityPayAmnt").attr('style', 'border:1px solid #d03100 !important;');
            $("#txtSecurityPayAmnt").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#txtSecurityPayAmnt").attr('style', '1px solid #eee !important;');
            $("#txtSecurityPayAmnt").css({
                "background-color": "#ffffff"
            });
        }
        var SecurityPayAmntWords = $("#txtSecurityPayAmntWords").val();
        if (SecurityPayAmntWords == '' || SecurityPayAmntWords == null) {
            text += "<br /> -Please Select SecurityPayAmntWords.";
            $("#txtSecurityPayAmntWords").attr('style', 'border:1px solid #d03100 !important;');
            $("#txtSecurityPayAmntWords").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#txtSecurityPayAmntWords").attr('style', '1px solid #eee !important;');
            $("#txtSecurityPayAmntWords").css({
                "background-color": "#ffffff"
            });
        }

    }

    debugger;
    if (RentPayMode == "1" || RentPayMode == "3") {
        var RentPayBank = $("#txtRentPayBank").val();
        if (RentPayBank == '' || RentPayBank == null) {
            text += "<br /> -Please Select Rent Pay Bank.";
            $("#txtRentPayBank").attr('style', 'border:1px solid #d03100 !important;');
            $("#txtRentPayBank").css({ "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#txtRentPayBank").attr('style', '1px solid #eee !important;');
            $("#txtRentPayBank").css({  "background-color": "#ffffff"
            });
        }
        var RentPayBranch = $("#txtRentPayBranch").val();
        if (RentPayBranch == '' || RentPayBranch == null) {
            text += "<br /> -Please Select Rent Pay Branch.";
            $("#txtRentPayBranch").attr('style', 'border:1px solid #d03100 !important;');
            $("#txtRentPayBranch").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#txtRentPayBranch").attr('style', '1px solid #eee !important;');
            $("#txtRentPayBranch").css({
                "background-color": "#ffffff"
            });
        }
        var RentPayDDNo = $("#txtRentPayDDNo").val();
        if (RentPayDDNo == '' || RentPayDDNo == null) {
            text += "<br /> -Please Select Rent Pay DD Number.";
            $("#txtRentPayDDNo").attr('style', 'border:1px solid #d03100 !important;');
            $("#txtRentPayDDNo").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#txtRentPayDDNo").attr('style', '1px solid #eee !important;');
            $("#txtRentPayDDNo").css({
                "background-color": "#ffffff"
            });
        }
        var RentPayDDDate = $("#txtRentPayDDDate").val();
        if (RentPayDDDate == '' || RentPayDDDate == null) {
            text += "<br /> -Please Select Rent Pay DD Date.";
            $("#txtRentPayDDDate").attr('style', 'border:1px solid #d03100 !important;');
            $("#txtRentPayDDDate").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#txtRentPayDDDate").attr('style', '1px solid #eee !important;');
            $("#txtRentPayDDDate").css({
                "background-color": "#ffffff"
            });
        }

    }
    if (RentPayMode == "0" || RentPayMode == "2") {
    debugger;
        $("#txtRentPayBank").attr('style', '1px solid #eee !important;');
        $("#txtRentPayBank").css({ "background-color": "#eee " });
        $("#txtRentPayBranch").attr('style', '1px solid #eee !important;');
        $("#txtRentPayBranch").css({  "background-color": "#eee " });
        $("#txtRentPayDDNo").attr('style', '1px solid #eee !important;');
        $("#txtRentPayDDNo").css({"background-color": "#eee " });
        $("#txtRentPayDDDate").attr('style', '1px solid #eee !important;');
        $("#txtRentPayDDDate").css({  "background-color": "#eee " });
    }

    var RentPayAmnt = $("#txtRentPayAmnt").val();
    if (RentPayAmnt == '' || RentPayAmnt == null) {
        text += "<br /> -Please Select Rent Pay Amount.";
        $("#txtRentPayAmnt").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtRentPayAmnt").css({"background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#txtRentPayAmnt").attr('style', '1px solid #eee !important;');
        $("#txtRentPayAmnt").css({  "background-color": "#ffffff" });
    }
    var RentPayAmntWords = $("#txtRentPayAmntWords").val();
    if (RentPayAmntWords == '' || RentPayAmntWords == null) {
        text += "<br /> -Please Select Rent Pay Amount in Words.";
        $("#txtRentPayAmntWords").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtRentPayAmntWords").css({ "background-color": "#fff2ee"  });
        opt = 1;
    } else {
        $("#txtRentPayAmntWords").attr('style', '1px solid #eee !important;');
        $("#txtRentPayAmntWords").css({ "background-color": "#ffffff"});
    }


    var Witness1Name = $("#txtWitness1Name").val();
    if (Witness1Name == '' || Witness1Name == null) {
        text += "<br /> -Please Select Witness1Name.";
        $("#txtWitness1Name").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtWitness1Name").css({ "background-color": "#fff2ee"
        });
        opt = 1;
    } else {
        $("#txtWitness1Name").attr('style', '1px solid #eee !important;');
        $("#txtWitness1Name").css({
            "background-color": "#ffffff"
        });
    }
    var Witness1Address = $("#txtWitness1Address").val();
    if (Witness1Address == '' || Witness1Address == null) {
        text += "<br /> -Please Select Witness1Address.";
        $("#txtWitness1Address").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtWitness1Address").css({
            "background-color": "#fff2ee"
        });
        opt = 1;
    } else {
        $("#txtWitness1Address").attr('style', '1px solid #eee !important;');
        $("#txtWitness1Address").css({
            "background-color": "#ffffff"
        });
    }
    var Witness2Name = $("#txtWitness2Name").val();
    if (Witness2Name == '' || Witness2Name == null) {
        text += "<br /> -Please Select Witness2Name.";
        $("#txtWitness2Name").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtWitness2Name").css({
            "background-color": "#fff2ee"
        });
        opt = 1;
    } else {
        $("#txtWitness2Name").attr('style', '1px solid #eee !important;');
        $("#txtWitness2Name").css({
            "background-color": "#ffffff"
        });
    }
    var Witness2Address = $("#txtWitness2Address").val();
    if (Witness2Address == '' || Witness2Address == null) {
        text += "<br /> -Please Select Witness2Address.";
        $("#txtWitness2Address").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtWitness2Address").css({
            "background-color": "#fff2ee"
        });
        opt = 1;
    } else {
        $("#txtWitness2Address").attr('style', '1px solid #eee !important;');
        $("#txtWitness2Address").css({
            "background-color": "#ffffff"
        });
    }

    var TenantStateID = $("#txtTenantStateID").val();
    if ((TenantStateID == "" || TenantStateID == null) && $("#ddlTenantStateID").val() == 0) {
        $("#txtTenantStateID").hide();
        text += "<br /> -Please Select Tenant State.";
        $("#ddlTenantStateID").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlTenantStateID").css({
            "background-color": "#fff2ee"
        });
        opt = 1;
    } else {
        if ($("#ddlTenantStateID").val() != 0) {
            $("#txtTenantStateID").hide();
            $("#ddlTenantStateID").attr('style', '1px solid #eee !important;');
            $("#ddlTenantStateID").css({
                "background-color": "#ffffff"
            });
        }
    }

    var LandlordStateID = $("#txtLandlordStateID").val();
    if ((LandlordStateID == "" || LandlordStateID == null) && $("#ddlLandlordStateID").val() == 0) {
        $("#txtLandlordStateID").hide();
        text += "<br /> -Please Select Landlord State.";
        $("#ddlLandlordStateID").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlLandlordStateID").css({
            "background-color": "#fff2ee"
        });
        opt = 1;
    } else {
        if ($("#ddlLandlordStateID").val() != 0) {
            $("#txtLandlordStateID").hide();
            $("#ddlLandlordStateID").attr('style', '1px solid #eee !important;');
            $("#ddlLandlordStateID").css({
                "background-color": "#ffffff"
            });
        }
    }

    var TenantPrmntStateID = $("#txtTenantPrmntStateID").val();
    if ((TenantPrmntStateID == "" || TenantPrmntStateID == null) && $("#ddlTenantPrmntStateID").val() == 0) {
        $("#txtTenantPrmntStateID").hide();
        text += "<br /> -Please Select TenantPrmnt State.";
        $("#ddlTenantPrmntStateID").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlTenantPrmntStateID").css({
            "background-color": "#fff2ee"
        });
        opt = 1;
    } else {
        if ($("#ddlTenantPrmntStateID").val() != 0) {
            $("#txtTenantPrmntStateID").hide();
            $("#ddlTenantPrmntStateID").attr('style', '1px solid #eee !important;');
            $("#ddlTenantPrmntStateID").css({
                "background-color": "#ffffff"
            });
        }
    }

    var TenantDistID = $("#txtTenantDistID").val();
    if (TenantDistID == "" || TenantDistID == null) {
        $("#txtTenantDistID").hide();
        $("#ddlTenantDistID").show();
        if ($("#ddlTenantDistID").val() == 0) {
            text += "<br /> -Please Select Tenant District.";
            $("#ddlTenantDistID").attr('style', 'border:1px solid #d03100 !important;');
            $("#ddlTenantDistID").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#ddlTenantDistID").attr('style', 'border:1px solid #eee !important;');
            $("#ddlTenantDistID").css({
                "background-color": "#fff"
            });
        }
    } else {
        $("#ddlTenantDistID").hide();
        $("#txtTenantDistID").attr('style', '1px solid #eee !important;');
        $("#txtTenantDistID").css({
            "background-color": "##eee"
        });
    }

    var LandlordDistID = $("#txtLandlordDistID").val();
    if (LandlordDistID == "" || LandlordDistID == null) {
        $("#txtLandlordDistID").hide();
        $("#ddlLandlordDistID").show();
        if ($("#ddlLandlordDistID").val() == 0) {
            text += "<br /> -Please Select Landlord District.";
            $("#ddlLandlordDistID").attr('style', 'border:1px solid #d03100 !important;');
            $("#ddlLandlordDistID").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#ddlLandlordDistID").attr('style', 'border:1px solid #eee !important;');
            $("#ddlLandlordDistID").css({
                "background-color": "#fff"
            });
        }
    } else {
        $("#ddlLandlordDistID").hide();
        $("#txtLandlordDistID").attr('style', '1px solid #eee !important;');
        $("#txtLandlordDistID").css({
            "background-color": "##eee"
        });
    }

    var TenantPrmntDistD = $("#txtTenantPrmntDistD").val();
    if (TenantPrmntDistD == "" || TenantPrmntDistD == null) {
        $("#txtTenantPrmntDistD").hide();
        $("#ddlTenantPrmntDistD").show();
        if ($("#ddlTenantPrmntDistD").val() == 0) {
            text += "<br /> -Please Select Tenant Prmnt District.";
            $("#ddlTenantPrmntDistD").attr('style', 'border:1px solid #d03100 !important;');
            $("#ddlTenantPrmntDistD").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#ddlTenantPrmntDistD").attr('style', 'border:1px solid #eee !important;');
            $("#ddlTenantPrmntDistD").css({
                "background-color": "#fff"
            });
        }
    } else {
        $("#ddlTenantPrmntDistD").hide();
        $("#txtTenantPrmntDistD").attr('style', '1px solid #eee !important;');
        $("#txtTenantPrmntDistD").css({
            "background-color": "##eee"
        });
    }

    var TenantDistBlockID = $("#txtTenantDistBlockID").val();
    if (TenantDistBlockID == "" || TenantDistBlockID == null) {
        $("#txtTenantDistBlockID").hide();
        $("#ddlTenantDistBlockID").show();
        if ($("#ddlTenantDistBlockID").val() == 0) {
            text += "<br /> -Please Select Tenant Block.";
            $("#ddlTenantDistBlockID").attr('style', 'border:1px solid #d03100 !important;');
            $("#ddlTenantDistBlockID").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#ddlTenantDistBlockID").attr('style', 'border:1px solid #eee !important;');
            $("#ddlTenantDistBlockID").css({
                "background-color": "#fff"
            });
        }
    } else {
        $("#ddlTenantDistBlockID").hide();
        $("#txtTenantDistBlockID").attr('style', '1px solid #eee !important;');
        $("#txtTenantDistBlockID").css({
            "background-color": "##eee"
        });
    }

    var LandlordDistBlockID = $("#txtLandlordDistBlockID").val();
    if (LandlordDistBlockID == "" || LandlordDistBlockID == null) {
        $("#txtLandlordDistBlockID").hide();
        $("#ddlLandlordDistBlockID").show();
        if ($("#ddlLandlordDistBlockID").val() == 0) {
            text += "<br /> -Please Select Landlord Block.";
            $("#ddlLandlordDistBlockID").attr('style', 'border:1px solid #d03100 !important;');
            $("#ddlLandlordDistBlockID").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#ddlLandlordDistBlockID").attr('style', 'border:1px solid #eee !important;');
            $("#ddlLandlordDistBlockID").css({
                "background-color": "#fff"
            });
        }
    } else {
        $("#ddlLandlordDistBlockID").hide();
        $("#txtLandlordDistBlockID").attr('style', '1px solid #eee !important;');
        $("#txtLandlordDistBlockID").css({
            "background-color": "##eee"
        });
    }

    var TenantPrmntBlockD = $("#txtTenantPrmntBlockD").val();
    if (TenantPrmntBlockD == "" || TenantPrmntBlockD == null) {
        $("#txtTenantPrmntBlockD").hide();
        $("#ddlTenantPrmntBlockD").show();
        if ($("#ddlTenantPrmntBlockD").val() == 0) {
            text += "<br /> -Please Select Tenant Prmnt Block.";
            $("#ddlTenantPrmntBlockD").attr('style', 'border:1px solid #d03100 !important;');
            $("#ddlTenantPrmntBlockD").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#ddlTenantPrmntBlockD").attr('style', 'border:1px solid #eee !important;');
            $("#ddlTenantPrmntBlockD").css({
                "background-color": "#fff"
            });
        }
    } else {
        $("#ddlTenantPrmntBlockD").hide();
        $("#txtTenantPrmntBlockD").attr('style', '1px solid #eee !important;');
        $("#txtTenantPrmntBlockD").css({
            "background-color": "##eee"
        });
    }


    var TenantPrmntCityID = $("#txtTenantPrmntCityID").val();
    if (TenantPrmntCityID == "" || TenantPrmntCityID == null) {
        $("#txtTenantPrmntCityID").hide();
        $("#ddlTenantPrmntCityID").show();
        if ($("#ddlTenantPrmntCityID").val() == 0) {
            text += "<br /> -Please Select Vendee Tenant Prmnt Village/City.";
            $("#ddlTenantPrmntCityID").attr('style', 'border:1px solid #d03100 !important;');
            $("#ddlTenantPrmntCityID").css({
                "background-color": "#fff2ee"
            });
            opt = 1;
        } else {
            $("#ddlTenantPrmntCityID").attr('style', 'border:1px solid #eee !important;');
            $("#ddlTenantPrmntCityID").css({
                "background-color": "#fff"
            });
        }
    } else {
        $("#ddlTenantPrmntCityID").hide();
        $("#txtTenantPrmntCityID").show();
        $("#txtTenantPrmntCityID").attr('style', '1px solid #eee !important;');
        $("#txtTenantPrmntCityID").css({
            "background-color": "##eee"
        });
    }


    //debugger;
    if (opt == "1") {
        alertPopup("Please Fill The Following Information.", text);
        return false;
    }
    return true;
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
    var Tenantmobileno = $("#txtTenantMobile").val();
    var Landlmobileno = $("#txtLandlordMobile").val();
    
   
    if (Tenantmobileno != null) {
        if (isNaN(Tenantmobileno) || Tenantmobileno.indexOf(" ") != -1) {
            text += "<br /> Please Enter A Valid Mobile Number.";
            opt = 1;
        }
        if (Tenantmobileno.length > 10 || Tenantmobileno.length < 10) {
            text += "<br /> Mobile No. Should Be Atleast 10 Digit.";
            opt = 1;
        }
        if (!(Tenantmobileno.charAt(0) == "9" || Tenantmobileno.charAt(0) == "8" || Tenantmobileno.charAt(0) == "7")) {
            text += "<br /> Mobile No. Should Start With 9 ,8 or 7.";
            opt = 1;
        }
    }
   else if  (Landlmobileno != null) {
        if (isNaN(Landlmobileno) || Landlmobileno.indexOf(" ") != -1) {
            text += "<br /> Please Enter A Valid Mobile Number.";
            opt = 1;
        }
        if (Landlmobileno.length > 10 || Landlmobileno.length < 10) {
            text += "<br /> Mobile No. Should Be Atleast 10 Digit.";
            opt = 1;
        }
        if (!(Landlmobileno.charAt(0) == "9" || Landlmobileno.charAt(0) == "8" || Landlmobileno.charAt(0) == "7")) {
            text += "<br /> Mobile No. Should Start With 9 ,8 or 7.";
            opt = 1;
        }
    }
    if (opt == "1") {
        alertPopup("Please Fill The Following Information.", text);
        $("#txtTenantMobile").val("");
        $("#txtLandlordMobile").val("");

        return false;
    }
    return true;
}

// Add Dynamic Table Row
function AddSuspect(DeleteString) {
    //debugger;
    if (validateSuspectValues(DeleteString) == true) {
        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";
        var strItemName = "";
        var strNoOfQty = "";
        var Str = "";
        var SrNo = "";

        if (DeleteString == "") {

            strItemName = $('#txtItem').val();
            strNoOfQty = $('#txtQty').val();
            var hdfsuspact = $('#hdfSuspect').val();
            strTempString = hdfsuspact + "#" + SrNo + "," + strItemName + "," + strNoOfQty + "#";
        } else {
            strTempString = $('#hdfSuspect').val();
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblSuspect' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sr. No. </th>";
        Str = Str + "<th style='text-align: center;'> Name of Item</th>";
        Str = Str + "<th style='text-align: center;'>No. Of Items</th>";
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
            strItemName = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            strNoOfQty = RemStr;
            var DeleteString = "#" + SrNo + "," + strItemName + "," + strNoOfQty + "#";

            Str = Str + "<tr>";
            Str = Str + "<td style='width:65px' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strItemName + "</td>";
            Str = Str + "<td style='' >" + strNoOfQty + "</td>";
            Str = Str + "<td align='center' style='width:85px'><input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";
            strSuspect = strSuspect + "#" + SrNo + "," + strItemName + "," + strNoOfQty + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + strItemName + "," + strNoOfQty + "#";
            var HeirsDXML = strSaveSuspect;
            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);
        }

        $("#thtxtAccused").hide();
        $("#thtxtAddress").hide();
        $("#thadd").hide();

        Str = Str + "</table>";
        $("#divSuspect").html(Str);
        $("#hdfSuspect").val(strSuspect);
        $("#hdfSuspectSave").val(strSaveSuspect);
        $("hdfSuspectString").val(intCount);

        strItemName = $('#txtItem').val("").focus();
        strNoOfQty = $('#txtQty').val("");

    }
    //alert($("#hdfSuspectSave").val())
}

// Delete Dynamic Table Row
function DelString(DeleteString) {
    var Msg = "Do you want remove this Suspect?";
    if (confirm(Msg)) {
        var strString = $('#hdfSuspect').val();
        strString = strString.replace(DeleteString, "");
        $('#hdfSuspect').val(strString);
        AddSuspect(DeleteString);
    }
}

// Valildate Dynamic Table Row
function validateSuspectValues(DeleteString) {
    //debugger;
    if (DeleteString != '') {
        return true;
    }
    var strName = "",
        strNoOfQty = "",
        text = "",
        opt = "";
    var txtItem = $("#txtItem").val();
    if (txtItem == "") {
        text += "<br /> -Please Select Item.";
        $("#txtItem").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtItem").css({
            "background-color": "#fff2ee"
        });
        opt = 1;
    } else {
        $("#txtItem").attr('style', '1px solid #eee !important;');
        $("#txtItem").css({
            "background-color": "#ffffff"
        });
    }
    var strNoOfQty = $("#txtQty").val();
    if (strNoOfQty == "") {
        text += "<br /> -Please Select Qty.";
        $("#txtQty").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtQty").css({
            "background-color": "#fff2ee"
        });
        opt = 1;
    } else {
        $("#txtQty").attr('style', '1px solid #eee !important;');
        $("#txtQty").css({
            "background-color": "#ffffff"
        });
    }
    if (opt == "1") {
        return false;
    }
    return true;
}

// American Numbering System
var th = ['', 'thousand', 'million', 'billion', 'trillion'];
// uncomment this line for English Number System
// var th = ['','thousand','million', 'milliard','billion'];

var dg = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
var tn = ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'];
var tw = ['twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];

function toWords(s) {
    s = s.toString();
    s = s.replace(/[\, ]/g, '');
    if (s != parseFloat(s))
        return '';
    var x = s.indexOf('.');
    if (x == -1) x = s.length;
    if (x > 15) return 'too big';
    var n = s.split('');
    var str = '';
    var sk = 0;
    for (var i = 0; i < x; i++) {
        if ((x - i) % 3 == 2) {
            if (n[i] == '1') {
                str += tn[Number(n[i + 1])] + ' ';
                i++;
                sk = 1;
            } else if (n[i] != 0) {
                str += tw[n[i] - 2] + ' ';
                sk = 1;
            }
        } else if (n[i] != 0) {
            str += dg[n[i]] + ' ';
            if ((x - i) % 3 == 0) str += 'hundred ';
            sk = 1;
        }
        if ((x - i) % 3 == 1) {
            if (sk) str += th[(x - i - 1) / 3] + ' ';
            sk = 0;
        }
    }
    if (x != s.length) {
        var y = s.length;
        str += 'Only ';
        for (var i = x + 1; i < y; i++) str += dg[n[i]] + ' ';
    }
    return str.replace(/\s+/g, ' ');
}

function sum() {
    var txtFirstNumberValue = $("#txtMaintenanceChargePM").val();
    var txtSecondNumberValue = $("#txtRentChargePM").val()
    if (txtFirstNumberValue == "")
        txtFirstNumberValue = 0;
    if (txtSecondNumberValue == "")
        txtSecondNumberValue = 0;

    var result = parseFloat(txtFirstNumberValue) + parseFloat(txtSecondNumberValue);
    if (!isNaN(result)) {
        $("#txtTotalRentAmntPM").val(result);
        $("#txtTotalRentAmntInWordsPM").val(toWords(result).toUpperCase()+'ONLY');
        $("#txtRentPayAmnt").val(result);
        $("#txtRentPayAmntWords").val(toWords(result).toUpperCase()+'ONLY');
    }
}

