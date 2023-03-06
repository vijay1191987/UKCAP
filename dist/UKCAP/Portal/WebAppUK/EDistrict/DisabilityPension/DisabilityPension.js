$(document).ready(function () {

    $("#btnSubmit").prop('disabled', true);
    $("#divDeclaration").hide(800);

    EL("File1").addEventListener("change", readFile, false);

    $('#txtDOB').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {
            GetAge();
        }
    });

    fnSearchData();
    GetState();

    $("[name='Address']").change(function () {
        FetchState(this.value);
    });

});

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

            $('#txtAddressLine1').val(Address1);
            $('#txtAddressLine2').val(Address2);
            $('#txtRoadStreetName').val(Street);
            $('#txtLandMark').val(Landmark);
            $('#txtLocality').val(Locality);
            $('#txtPinCode').val(PinCode);

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
                                    var ddlCustomers = $("[id*=ddlVillage]");
                                    ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
                                    $.each(r.d, function () {
                                        $("[id*=ddlVillage]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                    });

                                    $('#ddlVillage').val(Village);
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


function EL(id) { return document.getElementById(id); } // Get el by ID helper function

function readFile() {
    if (this.files && this.files[0]) {
        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfPhoto').val(sizekb);
        if (sizekb < 10 || sizekb > 50) {
            alert('The size of the photograph should fall between 20KB to 50KB. Your Photo Size is ' + sizekb + 'kb.');
            return false;
        }
        var ftype = this;
        var fileupload = ftype.value;
        if (fileupload == '') {
            alert("Photograph only allows file types of PNG, JPG, JPEG. ");
            return;
        }
        else {
            var Extension = fileupload.substring(fileupload.indexOf('.') + 1);
            if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") { }
            else {
                alert("Photograph only allows file types of PNG, JPG, JPEG. ");
                return;
            }
        }

        var FR = new FileReader();
        FR.onload = function (e) {
            EL("myImg").src = e.target.result;
            EL("HFb64").value = e.target.result;
        };
        FR.readAsDataURL(this.files[0]);
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
                    $('#txtApplicantName').val(obj[0]["ApplicantName"]);
                    $('#HDNFNM').val(obj[0]["ApplicantName"]);
                    $('#txtFatherName').val(obj[0]["FatherName"]);
                    $('#ddlGender').val(obj[0]["Gender"]);
                    $('#txtApplicantMobileNo').val(obj[0]["MobileNo"]);
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

                    $('#txtDOB').val(DOB);
                    GetAge();

                    if (obj[0]['ApplicantImageStr'] != null && obj[0]['ApplicantImageStr'] != "") {
                        if (obj[0]['ApplicantImageStr'].indexOf('data:image/jpeg;base64,') !== -1 || obj[0]['ApplicantImageStr'].indexOf('data:image/png;base64,') !== -1) {
                            document.getElementById('myImg').setAttribute('src', obj[0]['ApplicantImageStr']);
                            $('#HFb64').val(obj[0]['ApplicantImageStr']);
                        } else {
                            document.getElementById('myImg').setAttribute('src', 'data:image/jpeg;base64,' + obj[0]['ApplicantImageStr']);
                            $('#HFb64').val(obj[0]['ApplicantImageStr']);
                        }
                    }
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
    var SelState = $('#ddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/StateData",
        data: '{}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=ddlState]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });

            $('#ddlState').val("05");
            GetUKDistrict();

        }
    });
}


function GetUKDistrict() {
    var SelState = $('#ddlState').val();
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
            var ddlCustomers = $("[id*=ddlBlock]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                $("[id*=ddlBlock]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}


function GetUKPanchayat() {
    var SelSubDistrict = $('#ddlBlock').val();
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


function ValidateForm() {
    var text = "";
    var opt = "";

    if (EL("myImg").src.indexOf("photo.png") != -1) {
        text += "<BR>" + " \u002A" + " Please Upload Applicant Photograph.";
        $('#myImg').attr('style', 'border:1px solid #d03100 !important;');
        $('#myImg').css({ "background-color": "#fff2ee" });
        $('#myImg').css({ "height": "220px" });
        opt = 1;
    } else {
        $('#myImg').attr('style', 'border:0 !important;');
        $('#myImg').css({ "background-color": "" });
        $('#myImg').css({ "height": "220px" });
    }

    //if ($('#File1').val() == "" || $('#File1').val()==null)
    //{
    //    text += "<BR>" + " \u002A" + " Please Upload Applicant Photograph.";
    //    $('#myImg').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#myImg').css({ "background-color": "#fff2ee" });
    //    $('#myImg').css({ "height": "220px" });
    //    opt = 1;
    //} else
    //{
    //    $('#myImg').attr('style', 'border:0 !important;');
    //    $('#myImg').css({ "background-color": "" });
    //    $('#myImg').css({ "height": "220px" });
    //}

    var txtApplicantName = $('#txtApplicantName').val();
    if (txtApplicantName == "" || txtApplicantName == null) {
        text += "<BR>" + " \u002A" + " Please Enter Applicant Name.";
        $('#txtApplicantName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtApplicantName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtApplicantName').attr('style', '1px solid #cdcdcd !important;');
        $('#txtApplicantName').css({ "background-color": "#ffffff" });
    }

    var txtFatherName = $('#txtFatherName').val();
    if (txtFatherName == "" || txtFatherName == null) {
        text += "<BR>" + " \u002A" + " Please Enter Father's Name.";
        $('#txtFatherName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFatherName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtFatherName').attr('style', '1px solid #cdcdcd !important;');
        $('#txtFatherName').css({ "background-color": "#ffffff" });
    }

    var txtMotherName = $('#txtMotherName').val();
    if (txtMotherName == "" || txtMotherName == null) {
        text += "<BR>" + " \u002A" + " Please Enter Mother's Name.";
        $('#txtMotherName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtMotherName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtMotherName').attr('style', '1px solid #cdcdcd !important;');
        $('#txtMotherName').css({ "background-color": "#ffffff" });
    }

    var CDOB = $('#txtDOB').val();
    if (CDOB == "" || CDOB == null) {
        text += "<BR>" + " \u002A" + " Please Enter Date Of Birth.";
        $('#txtDOB').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtDOB').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtDOB').attr('style', '1px solid #cdcdcd !important;');
        $('#txtDOB').css({ "background-color": "#ffffff" });
    }

    var ddlGender = $('#ddlGender').val();
    if (ddlGender == "-Select-" || ddlGender == "0") {
        text += "<BR>" + " \u002A" + " Please Select Gender From List.";
        $('#ddlGender').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlGender').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlGender').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlGender').css({ "background-color": "#ffffff" });
    }

    var ddlCaste = $('#ddlCaste').val();
    if (ddlCaste == "-Select-" || ddlCaste == "0") {
        text += "<BR>" + " \u002A" + " Please Select Caste From List.";
        $('#ddlCaste').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlCaste').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlCaste').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlCaste').css({ "background-color": "#ffffff" });
    }

    var ddlSubCaste = $('#ddlSubCaste').val();
    if (ddlSubCaste == "-Select-" || ddlSubCaste == "0") {
        text += "<BR>" + " \u002A" + " Please Select Sub Caste From List.";
        $('#ddlSubCaste').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlSubCaste').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlSubCaste').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlSubCaste').css({ "background-color": "#ffffff" });
    }

    var txtMobileNo = $('#txtMobileNo').val();
    if (txtMobileNo == "" || txtMobileNo == null) {
        text += "<BR>" + " \u002A" + " Please Enter Mobile Number.";
        $('#txtMobileNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtMobileNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtMobileNo').attr('style', '1px solid #cdcdcd !important;');
        $('#txtMobileNo').css({ "background-color": "#ffffff" });
    }

    var txtEmailID = $('#txtEmailID').val();
    if (txtEmailID == "" || txtEmailID == null) {
        text += "<BR>" + " \u002A" + " Please Enter Email ID.";
        $('#txtEmailID').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtEmailID').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtEmailID').attr('style', '1px solid #cdcdcd !important;');
        $('#txtEmailID').css({ "background-color": "#ffffff" });
    }

    var ddlDisabilityType = $('#ddlDisabilityType').val();
    if (ddlDisabilityType == "-Select-" || ddlDisabilityType == "0") {
        text += "<BR>" + " \u002A" + " Please Choose Disability Type From List.";
        $('#ddlDisabilityType').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlDisabilityType').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlDisabilityType').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlDisabilityType').css({ "background-color": "#ffffff" });
    }

    var txtDisablityPcent = $('#txtDisablityPcent').val();
    if (txtDisablityPcent == "" || txtDisablityPcent == null) {
        text += "<BR>" + " \u002A" + " Please Enter Percentage of Disability.";
        $('#txtDisablityPcent').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtDisablityPcent').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtDisablityPcent').attr('style', '1px solid #cdcdcd !important;');
        $('#txtDisablityPcent').css({ "background-color": "#ffffff" });
    }

    var txtResidenceDuration = $('#txtResidenceDuration').val();
    if (txtResidenceDuration == "" || txtResidenceDuration == null) {
        text += "<BR>" + " \u002A" + " Please Ebter Duration of residence in Uttarakhand.";
        $('#txtResidenceDuration').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtResidenceDuration').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtResidenceDuration').attr('style', '1px solid #cdcdcd !important;');
        $('#txtResidenceDuration').css({ "background-color": "#ffffff" });
    }

    var Area = $('#ddlAreaType').val();
    if (Area == "-Select-" || Area == "0") {
        text += "<BR>" + " \u002A" + " Please Select Area From List.";
        $('#ddlAreaType').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlAreaType').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlAreaType').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlAreaType').css({ "background-color": "#ffffff" });
    }

    var Address = $('#txtAddressLine1').val();
    if (Address == "" || Address == null) {
        text += "<BR>" + " \u002A" + " Please Enter Full Address.";
        $('#txtAddressLine1').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtAddressLine1').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAddressLine1').attr('style', '1px solid #cdcdcd !important;');
        $('#txtAddressLine1').css({ "background-color": "#ffffff" });
    }

    var txtRoadStreetName = $('#txtRoadStreetName').val();
    if (txtRoadStreetName == "" || txtRoadStreetName == null) {
        text += "<BR>" + " \u002A" + " Please Enter Road/Street/Name.";
        $('#txtRoadStreetName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRoadStreetName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtRoadStreetName').attr('style', '1px solid #cdcdcd !important;');
        $('#txtRoadStreetName').css({ "background-color": "#ffffff" });
    }

    var txtLandMark = $('#txtLandMark').val();
    if (txtLandMark == "" || txtLandMark == null) {
        text += "<BR>" + " \u002A" + " Please Enter LandMark.";
        $('#txtLandMark').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtLandMark').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtLandMark').attr('style', '1px solid #cdcdcd !important;');
        $('#txtLandMark').css({ "background-color": "#ffffff" });
    }

    var txtLocality = $('#txtLocality').val();
    if (txtLocality == "" || txtLocality == null) {
        text += "<BR>" + " \u002A" + " Please Enter Locality.";
        $('#txtLocality').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtLocality').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtLocality').attr('style', '1px solid #cdcdcd !important;');
        $('#txtLocality').css({ "background-color": "#ffffff" });
    }

    var State = $('#ddlState').val();
    if (State == "-Select-" || State == "0") {
        text += "<BR>" + " \u002A" + " Please Select State From List.";
        $('#ddlState').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlState').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlState').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlState').css({ "background-color": "#ffffff" });
    }

    var District = $('#ddlDistrict').val();
    if (District == "-Select-" || District == "0") {
        text += "<BR>" + " \u002A" + " Please Select District From List.";
        $('#ddlDistrict').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlDistrict').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlDistrict').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlDistrict').css({ "background-color": "#ffffff" });
    }

    var BlockTaluka = $('#ddlBlock').val();
    if (BlockTaluka == "0" || BlockTaluka == "-Select-") {
        text += "<BR>" + " \u002A" + " Please Select Block/Taluka/Tehsil From List.";
        $('#ddlBlock').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlBlock').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlBlock').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlBlock').css({ "background-color": "#ffffff" });
    }

    var ddlVillage = $('#ddlVillage').val();
    if (ddlVillage == "-Select-" || ddlVillage == "0") {
        text += "<BR>" + " \u002A" + " Please Select Panchayat/Village/City From List.";
        $('#ddlVillage').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlVillage').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlVillage').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlVillage').css({ "background-color": "#ffffff" });
    }

    var ddlPostOffice = $('#ddlPostOffice').val();
    if (ddlPostOffice == "-Select-" || ddlPostOffice == "0") {
        text += "<BR>" + " \u002A" + " Please Select Post Office From List.";
        $('#ddlPostOffice').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlPostOffice').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlPostOffice').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlPostOffice').css({ "background-color": "#ffffff" });
    }

    var ddlPoliceStn = $('#ddlPoliceStn').val();
    if (ddlPoliceStn == "-Select-" || ddlPoliceStn == "0") {
        text += "<BR>" + " \u002A" + " Please Choose Police Station From List.";
        $('#ddlPoliceStn').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlPoliceStn').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlPoliceStn').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlPoliceStn').css({ "background-color": "#ffffff" });
    }

    var Pincode = $('#txtPinCode').val();
    if (Pincode == "" || Pincode == null) {
        text += "<BR>" + " \u002A" + " Please Enter Pincode.";
        $('#txtPinCode').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtPinCode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtPinCode').attr('style', '1px solid #cdcdcd !important;');
        $('#txtPinCode').css({ "background-color": "#ffffff" });
    }


    var isBooFamily = $("input:radio[name='BOO']:checked").val();
    if (isBooFamily == undefined) {
        text += "<BR>" + " \u002A" + " Do you come under the BOO Family?.";
        $('#idBooFamily').attr('style', 'color:red !important;');
        opt = 1;
    }
    else {
        $('#idBooFamily').attr('style', 'color:black !important;');

        if (isBooFamily == "1") {
            if ($('#txtMonthlyIncome').val() == "" || $('#txtMonthlyIncome').val() == null) {
                text += "<BR>" + " \u002A" + " Please Enter Monthly Income.";
                $('#txtMonthlyIncome').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtMonthlyIncome').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#txtMonthlyIncome').attr('style', '1px solid #cdcdcd !important;');
                $('#txtMonthlyIncome').css({ "background-color": "#ffffff" });
            }
        }
    }

    var isAssistance = $("input:radio[name='GetAssistance']:checked").val();
    if (isAssistance == undefined) {
        text += "<BR>" + " \u002A" + " Is There Any Other Type of Assistance Being Received by the Applicant?.";
        $('#isAssistance').attr('style', 'color:red !important;');
        opt = 1;
    }
    else {
        $('#isAssistance').attr('style', 'color:black !important;');

        if (isAssistance == "1") {
            if ($('#txtResidenceYrs').val() == "" || $('#txtResidenceYrs').val() == null) {
                text += "<BR>" + " \u002A" + " Please Enter Duration of Residence in Uttarakhand.";
                $('#txtResidenceYrs').attr('style', 'border:1px solid #d03100 !important;');
                $('#txtResidenceYrs').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#txtResidenceYrs').attr('style', '1px solid #cdcdcd !important;');
                $('#txtResidenceYrs').css({ "background-color": "#ffffff" });
            }

            if ($('#ddlResidenceType').val() == "0" || $('#ddlResidenceType').val() == "-Select-") {
                text += "<BR>" + " \u002A" + " Please Choose Residence Type From List.";
                $('#ddlResidenceType').attr('style', 'border:1px solid #d03100 !important;');
                $('#ddlResidenceType').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#ddlResidenceType').attr('style', '1px solid #cdcdcd !important;');
                $('#ddlResidenceType').css({ "background-color": "#ffffff" });
            }
        }
    }

    var ddlBankOffice = $('#ddlBankOffice').val();
    if (ddlBankOffice == "0" || ddlBankOffice == "-Select-") {
        text += "<BR>" + " \u002A" + " Please Choose Bank / Post Office From List.";
        $('#ddlBankOffice').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlBankOffice').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlBankOffice').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlBankOffice').css({ "background-color": "#ffffff" });
    }

    var ddlBankBranch = $('#ddlBankBranch').val();
    if (ddlBankBranch == "-Select-" || ddlBankBranch == "0") {
        text += "<BR>" + " \u002A" + " Please Choose Bank Branch From List.";
        $('#ddlBankBranch').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlBankBranch').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlBankBranch').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlBankBranch').css({ "background-color": "#ffffff" });
    }

    var txtAccountNo = $('#txtAccountNo').val();
    if (txtAccountNo == "" || txtAccountNo == null) {
        text += "<BR>" + " \u002A" + " Please Enter Account Number.";
        $('#txtAccountNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtAccountNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAccountNo').attr('style', '1px solid #cdcdcd !important;');
        $('#txtAccountNo').css({ "background-color": "#ffffff" });
    }

    var txtIFSCode = $('#txtIFSCode').val();
    if (txtIFSCode == "" || txtIFSCode == null) {
        text += "<BR>" + " \u002A" + " Please Enter IFS Code.";
        $('#txtIFSCode').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtIFSCode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtIFSCode').attr('style', '1px solid #cdcdcd !important;');
        $('#txtIFSCode').css({ "background-color": "#ffffff" });
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}


function SubmitData() {
    //document.getElementById('btnSubmit').addEventListener('click', g207, false);

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


    if ($('#txtDOB').val() != '') {
        var DOB = $('#txtDOB').val().split("/");
        DOB = DOB[2] + "-" + DOB[1] + "-" + DOB[0];
    }
    else {
        var DOB = "";
    }

    var isBooFamily = $("input:radio[name='BOO']:checked").val();
    var isAssistance = $("input:radio[name='GetAssistance']:checked").val();

    var datavar = {
        'ServiceID': svcid,
        'ProfileID': uid,
        'ApplicantName': $('#txtApplicantName').val(),
        'FatherName': $('#txtFatherName').val(),
        'MotherName': $('#txtMotherName').val(),
        'DOB': DOB,
        'Gender': $('#ddlGender').val(),
        'AadhaarNo': $('#txtAadhaarNo').val(),
        'Cast': $('#ddlCaste').val(),
        'SubCast': $('#ddlSubCaste').val(),
        'MobileNo': $('#txtMobileNo').val(),
        'EmailID': $('#txtEmailID').val(),
        'DisablityType': $('#ddlDisabilityType').val(),
        'DisablityPcent': $('#txtDisablityPcent').val(),
        'YrsInUK': $('#txtResidenceDuration').val(),
        'Area': $('#ddlAreaType').val(),
        'FullAddress1': $('#txtAddressLine1').val(),
        'FullAddress2': $('#txtAddressLine2').val(),
        'RoadStreetName': $('#txtRoadStreetName').val(),
        'LandMark': $('#txtLandMark').val(),
        'Locality': $('#txtLocality').val(),
        'State': $('#ddlState').val(),
        'District': $('#ddlDistrict').val(),
        'Block': $('#ddlBlock').val(),
        'Panchayat': $('#ddlVillage').val(),
        'PostOffice': $('#ddlPostOffice').val(),
        'PoliceStn': $('#ddlPoliceStn').val(),
        'Pincode': $('#txtPinCode').val(),
        'isBooFamily': isBooFamily,
        'Income': $('#txtMonthlyIncome').val(),
        'isAssistance': isAssistance,
        'ResidenceYrs': $('#txtResidenceYrs').val(),
        'ResidenceType': $('#ddlResidenceType').val(),
        'BankPostOffice': $('#ddlBankOffice').val(),
        'BankBranch': $('#ddlBankBranch').val(),
        'AccountNo': $('#txtAccountNo').val(),
        'IFSCode': $('#txtIFSCode').val(),
        'Image': $('#HFb64').val(),
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebAppUK/EDistrict/DisabilityPension/DisabilityPensionForm.aspx/InsertDisabilityPensionData',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) { },
            error: function (a, b, c) {
                $('#g207').hide();
                $("#btnSubmit").prop('disabled', false);
                result = false;
                alertPopup("<BR> Could Not Save the Application, Please try again.", "5. " + a.responseText);
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
            alertPopup("Form Validation Failed", "<BR> Error While Saving Application., <BR> Something Went Wrong, Please Try Again!!!.");
            //rtnurl = "/Account/Login";
            //window.location.href = rtnurl;
            //return;
        }
        else {
            if (status == "Success") {
                //alertPopup("Tracking Application", "<BR> Your Birth Certificate Application has been saved successfully. <br> Your Application ID : " + obj.AppID);
                $('#g207').hide();
                //window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=505&AppID=' + obj.AppID;
                window.location.href = '/WebAppUK/ProgressBar/ProgressBar.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID + '&UID=' + qs["UID"] + '&ProfileID= ' + qs["ProfileID"] + '&KeyField=' + qs["KeyField"];
            }
        }
    });// end of Then function of main Data Insert Function
    return false;
}


function ReturnSubmit() {
    var qs = getQueryStrings();
    var uid = qs["UID"];
    window.location = '/WebAppUK/DashboardV3/Dashboard.aspx?UID=' + uid;
}


function Reset() {
    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];
    var dpt = qs["DPT"];
    var dist = qs["DIST"];
    var blk = qs["BLK"];
    var pan = qs["PAN"];
    var ofc = qs["OFC"];
    var ofr = qs["OFR"];

    window.location.href = '/WebAppUK/Edistrict/DisabilityPension/DisabilityPensionForm.aspx?SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr + '&UID=' + uid + '';
}


function Declaration(chk) {
    $('#btnSubmit').prop('disabled', true);
    if (chk) {
        var name = $('#HDNFNM').val();
        if (name == '' || name == null) {
            alertPopup("Declaration Check", "Please Enter Your Full Name.");
            $('#chkDeclaration').prop('checked', false);
        }
        else {
            $("#lblUName").html(name);
            $('#btnSubmit').prop('disabled', false);
            $("#divDeclaration").show(800);
        }
    }
    else {
        $("#lblUName").html("");
        $('#btnSubmit').prop('disabled', true);
        $("#divDeclaration").hide(800);
    }
}

// ********************* VALIDATION CHECK ****************** //

function AlphaNumeric(e) {
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


function ValiateEmail() {
    var EmailID = $("#txtEmailID");
    if (EmailID.val() != '') {
        var emailmatch = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (!emailmatch.test(EmailID.val())) {
            $("#txtEmailID").val('');
            EmailID.attr('style', 'border:2px solid #d03100 !important;');
            EmailID.css({ "background-color": "#fff2ee" });
            alertPopup("Email Validation", "<BR>" + " \u002A" + " Please Enter EmailID In Proper Format.")
        }
        else {
            EmailID.attr('style', 'border:2px solid green !important;');
            EmailID.css({ "background-color": "#ffffff" });
        }
    }
}


function CheckPinCode() {
    var text = "";
    var opt = "";
    var mobileno = $("#txtPinCode").val();
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
        $("#txtPinCode").val("");

        return false;
    }
    return true;
}


function PinCodeValidation(ControlID) {
    var PinCode = $(ControlID).val();
    if (PinCode.length >= 6) {
        $(ControlID).attr('style', 'border:2px solid green !important;');
        $(ControlID).css({ "background-color": "#ffffff" });
        return true;
    }
    else {
        alertPopup("Pincode Validation", "<BR> Please Enter 6 Digit Pincode.");
        $(ControlID).val('');
        $(ControlID).attr('style', 'border:2px solid red !important;');
        $(ControlID).css({ "background-color": "#fff2ee" });
        return false;
    }
}

function AadhaarValidation(ControlID) {
    var Aadhaar = $(ControlID).val();
    if (Aadhaar.length >= 12) {
        $(ControlID).attr('style', 'border:2px solid green !important;');
        $(ControlID).css({ "background-color": "#ffffff" });
        return true;
    }
    else {
        alertPopup("Aadhaar Validation", "<BR> Please Enter 12 Digit Aadhaar Number.");
        $(ControlID).val('');
        $(ControlID).attr('style', 'border:2px solid red !important;');
        $(ControlID).css({ "background-color": "#fff2ee" });
        return false;
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


function MobileValidation(ContrlID) {
    var text = "";
    var opt = "";

    var mobileno = $(ContrlID).val();

    if (isNaN(mobileno) || mobileno.indexOf(" ") != -1) {
        text += "<br/>" + " \u002A" + " Please Enter A Valid Mobile Number.";
        //alertPopup("Mobile Number", "</BR> Please Enter Valid Mobile Number.");
        $(ContrlID).attr('style', 'border:2px solid red !important;');
        $(ContrlID).css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    if (mobileno.length > 10 || mobileno.length < 10) {
        text += "<br/>" + " \u002A" + " Mobile No. Should Be Atleast 10 Digit.";
        //alertPopup("Mobile Number", "</BR> Mobile No. Should Be 10 Digit.");
        $(ContrlID).attr('style', 'border:2px solid red !important;');
        $(ContrlID).css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    if (!(mobileno.charAt(0) == "6" || mobileno.charAt(0) == "9" || mobileno.charAt(0) == "8" || mobileno.charAt(0) == "7")) {
        text += "<br/>" + " \u002A" + " Mobile No. Should Start With 6,7,8 or 9.";
        //alertPopup("Mobile Number", "</BR> Mobile No. Should Starts Sith 9 ,8 or 7");
        $(ContrlID).attr('style', 'border:2px solid red !important;');
        $(ContrlID).css({ "background-color": "#fff2ee" });
        opt = 1;
    }

    if (opt == "1") {
        alertPopup("Mobile Information.", text);
        $(ContrlID).val("");
        return false;
    }
    $(ContrlID).attr('style', 'border:2px solid green !important;');
    $(ContrlID).css({ "background-color": "#ffffff" });
    return true;
}


function ValidateIFSCode() {

    var text = "";
    var opt = "";

    var reg = /^[A-Za-z]{4}[0][A-Za-z0-9]{6}$/;

    var ifsc = document.getElementById('txtIFSCode').value;

        if (ifsc.match(reg)) {
            $('#txtIFSCode').attr('style', 'border:1px solid #ddd !important;');
            $('#txtIFSCode').css({ "background-color": "#ffffff" });
        }
        else {
            text += "<br/>" + " \u002A" + " Please Enter Correct IFS Code(IFSC0XXXXXX).";
            $('#txtIFSCode').attr('style', 'border:1px solid red !important;');
            $('#txtIFSCode').css({ "background-color": "#fff2ee" });
            $('#txtIFSCode').val('');
            opt = 1;
        }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
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
        var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);
        if (fullDate.getDate() <= 9) {
            var twoDigitDay = ((fullDate.getDate().length + 1) === 1) ? (fullDate.getDate() + 1) : '0' + (fullDate.getDate());
        }
        else {
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
    var cald = new Date(calyear, calmon - 1, calday);
    var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) - Date.UTC(calyear, calmon, calday, 0, 0, 0);
    var dife = datediff(curd, cald);
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