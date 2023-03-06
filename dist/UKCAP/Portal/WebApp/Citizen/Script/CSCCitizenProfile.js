$(document).ready(function () {

    $('#ContentPlaceHolder1_btnProceed').prop('disabled', true);
    //$('#ContentPlaceHolder1_btnValidateOTP').hide();

    $('input:radio').click(function () //$('radio').click(function ()
    {
        if ($(this).attr('value') == 'rbtNewCitizen') {
            $('#divCitizenProfile').hide(800);
            $('#divOTP').hide(800);
            $('#txtSearchData').val('');
            $('#txtSearchData').prop('disabled', false);
            $('#txtSearchData').attr('placeholder', 'Proceed With New Citizen Registration.');
            $('#ContentPlaceHolder1_btnProceed').prop('disabled', false);
        }
        else if ($(this).attr('value') == 'rbtMobile') {
            $('#divCitizenProfile').hide(800);
            $('#divOTP').hide(800);
            $('#txtSearchData').val('');
            $('#txtSearchData').prop('disabled', false);
            $('#txtSearchData').attr('placeholder', 'Enter Citizen Mobile Number.');
            $('#ContentPlaceHolder1_btnProceed').prop('disabled', false);
        }
        else if ($(this).attr('value') == 'rbtAppID') {
            $('#txtSearchData').val('');
            $('#txtSearchData').prop('disabled', false);
            $('#txtSearchData').attr('placeholder', 'Enter Citizen Application ID.');
            $('#ContentPlaceHolder1_btnProceed').prop('disabled', false);
        }
        else {
            $('#txtSearchData').val('');
            $('#divCitizenProfile').hide(800);
            $('#divOTP').hide(800);
            $('#txtSearchData').prop('disabled', true);
            $('#ContentPlaceHolder1_btnProceed').prop('disabled', true);
        }
    });

    //$('#divSearch').hide();
    $('#divCitizenProfile').hide();
    GetState();
    var StateControl = "ctl00$ContentPlaceHolder1$Address1$ddlState";
    var DistrictControl = "ctl00$ContentPlaceHolder1$Address1$ddlDistrict";
    var TalukaControl = "ctl00$ContentPlaceHolder1$Address1$ddlTaluka";
    var VillageControl = "ctl00$ContentPlaceHolder1$Address1$ddlVillage";

    var StateControl2 = "ctl00$ContentPlaceHolder1$Address2$ddlState";
    var DistrictControl2 = "ctl00$ContentPlaceHolder1$Address2$ddlDistrict";
    var TalukaControl2 = "ctl00$ContentPlaceHolder1$Address2$ddlTaluka";
    var VillageControl2 = "ctl00$ContentPlaceHolder1$Address2$ddlVillage";

    //GetDistrictV2("", "ctl00$ContentPlaceHolder1$Address1$ddlState", "ctl00$ContentPlaceHolder1$Address1$ddlDistrict");

    $("[name='" + StateControl + "']").bind("change", function (e) { return OUAT_GetDistrict("", $("[name='" + StateControl + "']").val(), DistrictControl); });
    $("[name='" + DistrictControl + "']").bind("change", function (e) { return OUAT_GetSubDistrict("", DistrictControl, TalukaControl); });
    $("[name='" + TalukaControl + "']").bind("change", function (e) { return OUAT_GetVillage("", TalukaControl, VillageControl); });

    $("[name='" + StateControl2 + "']").bind("change", function (e) { return OUAT_GetDistrict("", $("[name='" + StateControl2 + "']").val(), DistrictControl2); });
    $("[name='" + DistrictControl2 + "']").bind("change", function (e) { return OUAT_GetSubDistrict("", DistrictControl2, TalukaControl2); });
    $("[name='" + TalukaControl2 + "']").bind("change", function (e) { return OUAT_GetVillage("", TalukaControl2, VillageControl2); });

    EL("File1").addEventListener("change", readFile, false);

    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });

    //$("#divCitizenProfile").hide();

    /*commented on 2017-02-03 for implementing for editing*/
    //if (qs['ProfileID'] == '0000000000000') {
    //    $('#MobileNo').val(qs['M']);
    //    $('#MobileNo').prop('disabled', true);
    //}

    var qs = getQueryStrings();
    if (false && qs["ProfileID"] != null) // 2018-05-23 Logic commented to shift the Profile search to another function.
    {
        $('#MobileNo').val(qs['M']);
        $('#MobileNo').prop('disabled', true);

        ProfileID = qs["ProfileID"];
        $.when(
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/webapp/kiosk/forms/basicdetail.aspx/GetUIDKeyField',
                //data: '{"prefix": ""}',
                //data: '{"UID": '+uid+'}',
                data: '{"prefix":"","UID":"' + ProfileID + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                },
                error: function (a, b, c) {
                    alert("1." + a.responseText);
                }
            })
        ).then(function (data, textStatus, jqXHR) {
            //var arr = eval(data.d);
            //var arr = jQuery.parseJSON(data.d);
            JSONData = data.d;
            //var html = "";
            //var name = arr[0].Name; // 2017-01-31: Logic commented for editing the Profile
            //var JSONData = name; // 2017-01-31: Logic commented for editing the Profile
            $("#HFUIDData").val(JSONData);

            if ($("#HFUIDData").val() != "") {
                $("#HFResponseType").val("1");
                BindProfileV2(JSONData, 1);//function to call with 1 in case of Citizen Profile Data
            }
        });// end of Then function of main Data Insert Function
        ///////////
    }
    //else {
    //    //alert('shhsd');
    //    $("#HFResponseType").val("0");
    //    BindProfile($("#HFUIDData").val(), 0);//function to call with 0 in case of eKYC Data
    //}

    if (false && $("#HFUIDData").val() != "") {
        //alert($("#HFUIDData").val());
        $("#divNonAadhar").hide();
        $("#divSearch").hide();
        $("#divBasicInfo").show();
        $("#divAddress").show();
        $("#divBtn").show();
        $("#ddlSearch").prop("disabled", true);
        $("txtSearchData").prop("disabled", true);
        $("#btnSearch").prop("disabled", true);
        $("#fulPhoto").hide();

        var obj = jQuery.parseJSON($("#HFUIDData").val());

        if (obj["dateOfBirth"] != "") {
            var t_DOB = obj["dateOfBirth"];
            t_DOB = t_DOB.replace(/-/g, "/");
            $('#DOB').val(t_DOB);
            $('#DOB').prop("disabled", true);

            var t_DOB = $("#DOB").val();
            t_DOB = t_DOB.replace("-", "/");
            var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
            var selectedYear = S_date.getFullYear(); // selected year

            //var Age = calage(S_date);
            var Age = calage1(t_DOB);
            $('#Age').val(Age);
        }

        document.getElementById('ProfilePhoto').setAttribute('src', 'data:image/png;base64,' + obj["photo"]);

        $("#FirstName").val(obj["residentName"]);
        $('#FirstName').prop("disabled", true);
        $("txtSearchData").val(obj["aadhaarNumber"]);
        $('txtSearchData').prop("disabled", true);
        $("#FatherName").val(obj["careOf"]);
        if (obj["careOf"] != null) {
            $('#FatherName').prop("disabled", true);
        }
        //obj["careOfLocal"];

        obj["district"];
        //obj["districtLocal"];
        $('#EmailID').val(obj["emailId"]);

        if (obj["gender"] != "") {
            if (obj["gender"] == "M") {
                $('#ddlGender').val("M");
                $('#ddlSalutation').val("1");
            }
            else if (obj["gender"] == "F") {
                $('#ddlGender').val("F");
                $('#ddlSalutation').val("2");
            }
            else {
                $('#ddlGender').val("T");
                $('#ddlSalutation').val("3");
            }
            $('#ddlGender').prop("disabled", true);
        }

        $("[name='ctl00$ContentPlaceHolder1$AddressLine1']").val(obj["houseNumber"]);
        $("[name='ctl00$ContentPlaceHolder1$AddressLine1']").prop("disabled", true);

        //$("[name='ctl00$ContentPlaceHolder1$AddressLine2']").val(obj["houseNumber"]);
        $("[name='ctl00$ContentPlaceHolder1$AddressLine2']").prop("disabled", true);

        $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").val(obj["street"]);
        $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").prop("disabled", true);

        //obj["houseNumberLocal"];
        $("[name='ctl00$ContentPlaceHolder1$LandMark']").val(obj["landmark"]);
        $("[name='ctl00$ContentPlaceHolder1$LandMark']").prop("disabled", true);
        //obj["landmarkLocal"];
        //obj["language"];
        $("[name='ctl00$ContentPlaceHolder1$Locality']").val(obj["locality"]);
        $("[name='ctl00$ContentPlaceHolder1$Locality']").prop("disabled", true);
        //obj["localityLocal"];
        //obj["phone"];
        $('#phoneno').val(obj["phone"]);
        $('#MobileNo').val(obj["phone"]);
        $("[name='ctl00$ContentPlaceHolder1$PinCode']").val(obj["pincode"]);
        $("[name='ctl00$ContentPlaceHolder1$PinCode']").prop("disabled", true);

        if (obj["state"] != "") {
            $('#txtState').val(obj["state"]);
            $('#txtState').prop("disabled", true);
        }
        $('#txtDistrict').val(obj["district"]);
        $('#txtBlock').val(obj["subDistrict"]);
        $('#txtPanchayat').val(obj["vtc"]);
        $('#txtDistrict').prop("disabled", true);
        $('#txtBlock').prop("disabled", true);
        $('#txtPanchayat').prop("disabled", true);

        //obj["pincodeLocal"];
        //obj["postOffice"];
        //obj["postOfficeLocal"];
        //obj["residentName"];
        //obj["residentNameLocal"];

        //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlState'] option").prop('selected', false).filter(function () {
        //    return $(this).text() == obj["state"];
        //}).prop('selected', true);

        //// Now set dropdown selected option to the one as per State.
        //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlState'] option").map(function () {
        //    if ($(this).text() == obj["state"]) return this;
        //}).attr('selected', 'selected');

        //selectByText(obj["state"]);

        obj["state"];
        //obj["stateLocal"];
        $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").val(obj["street"]);
        //obj["streetLocal"];
        obj["subDistrict"];
        //obj["subDistrictLocal"];

        //if (Age < 18) {
        //    $('#DOB').val('');
        //    alertPopup("Please fill following information.", 'To fill the application applicant age should be 18 years.');
        //    $('#Age').val('');
        //    return false;
        //} else if (Age > 125) {
        //    $('#Age').val('');
        //    alertPopup("Please fill following information.", 'To fill the application applicant age should be less than 125 years.');
        //    $('#Age').val('');
        //    return false;
        //}

        //alert($("#DOB").val());
        //alert(Age);

        //GetStateAsPerUID(obj["state"], obj["district"], obj["subDistrict"], obj["vtc"]);
        objState = obj["state"], objDistrict = obj["district"], objTaluka = obj["subDistrict"], objVillage = obj["vtc"];
    }//end of UID Data
    //else {
    //    alert('Profile already registered with Mobile No.' + qs['M']+". Use "+qs['M']+" as Login Id to access the portal");//fnGetCitizenDetails();
    //}
});

function ValidateOption() {
    debugger;
    //$("#divAuth").hide();
    var t_NewCitizen = false;
    var t_SearchMobile = false;
    var t_SearchAppID = false;

    $('#ContentPlaceHolder1_btnProceed').prop('disabled', false);
    $('#ContentPlaceHolder1_btnProceed').show(800);

    if ($('#ContentPlaceHolder1_rbtNewCitizen').is(":checked")) {
        // it is checked
        t_NewCitizen = true;
    }
    else if ($('#ContentPlaceHolder1_rbtMobile').is(":checked")) {
        t_SearchMobile = true;
    }
    else if ($('#ContentPlaceHolder1_rbtAppID').is(":checked")) {
        t_SearchAppID = true;
    }
}

function ValidateDetail() {
    debugger;
    var t_NewCitizen = false;
    var t_SearchMobile = false;
    var t_SearchAppID = false;

    var t_Key = "";
    var t_Value = "";

    if ($('#ContentPlaceHolder1_rbtNewCitizen').is(":checked")) {
        // it is checked
        t_Key = "N";
        t_NewCitizen = true;
    }
    else if ($('#ContentPlaceHolder1_rbtMobile').is(":checked")) {
        t_Key = "M";
        t_SearchMobile = true;
    }
    else if ($('#ContentPlaceHolder1_rbtAppID').is(":checked")) {
        var t_Key = "A";
        t_SearchAppID = true;
    }

    t_Value = $('#txtSearchData').val();

    if (t_Value == null || t_Value == "") {
        alertPopup("Form Validation", "<BR>Please Enter Mobile Number.")
        return false;
    }

    if (t_Key == "N") {
        $('#btn').show();
        $('#divOTP').show(800);
        $('#ContentPlaceHolder1_btnProceed').hide(800);
    }

    if (t_Key == "M" || t_SearchMobile == true) {
        $.when(
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Citizen/Forms/CSCCitizenProfile.aspx/CSCSearchData',
                //data: '{"prefix": ""}',
                //data: '{"UID": '+uid+'}',
                data: '{"prefix":"","Key":"' + t_Key + '","Value":"' + t_Value + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                },
                error: function (a, b, c) {
                    alert("1." + a.responseText);
                }
            })
        ).then(function (data, textStatus, jqXHR) {
            if (data.d == null || data.d == "") {
                alertPopup("No Data Found!!!", "<br> Data Not Found For " + t_Value + " <Br> Please Use Another No.!!!");
                $("#HFUIDData").val("");
                $('#divCitizenProfile').hide();
                return false;
            }
            //var arr = eval(data.d);
            //var arr = jQuery.parseJSON(data.d);
            JSONData = data.d;
            //var html = "";
            //var name = arr[0].Name; // 2017-01-31: Logic commented for editing the Profile
            //var JSONData = name; // 2017-01-31: Logic commented for editing the Profile
            $("#HFUIDData").val(JSONData);

            if ($("#HFUIDData").val() != "") {
                $("#HFResponseType").val("1");
                BindProfileV2(JSONData, 1);//function to call with 1 in case of Citizen Profile Data
            }
        });// end of Then function of main Data Insert Function
    }

    return false;
}

function OUAT_GetDistrict(category, StateControl, DistrictControl) {
    //var SelIndex = $("[name='" + StateControl + "']").val(); //This Logic is commented to bind the Districts Directly from State, using a hard coded value of the State.
    var SelIndex = StateControl;

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
        data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("[name='" + DistrictControl + "']").empty();
            $("[name='" + DistrictControl + "']").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("[name='" + DistrictControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

/**
 * This Function is used in Pages or Javascript files as
 * 1. OfficeOfficer.js file in OfficeOfficer.aspx file.
 * @param {} category
 * @param {} DistrictControl
 * @param {} TalukaControl
 * @returns {}
 */
function OUAT_GetSubDistrict(category, DistrictControl, TalukaControl) {
    var SelIndex = $("[name='" + DistrictControl + "']").val();
    //ResetControlsAsPerSubDistrict();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict',
        data: '{"prefix":"' + category + '","DistrictCode":"' + SelIndex + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("[name='" + TalukaControl + "']").empty();
            $("[name='" + TalukaControl + "']").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("[name='" + TalukaControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("3." + a.responseText);
        }
    });
}
/**
 * This Function is used in Pages or Javascript files as
 * 1. OfficeOfficer.js file in OfficeOfficer.aspx file.
 * @param {} category
 * @param {} TalukaControl
 * @param {} VillageControl
 * @returns {}
 */
function OUAT_GetVillage(category, TalukaControl, VillageControl) {
    var SelIndex = $("[name='" + TalukaControl + "']").val();

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Registration/KioskRegistration.aspx/GetVillage',
        data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("[name='" + VillageControl + "']").empty();
            $("[name='" + VillageControl + "']").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("[name='" + VillageControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });
}

function fnGetCitizenDetails() {
    var qs = getQueryStrings();
    if (qs["URL"] != null && qs["URL"] != "") {
        var ProfileID = qs["UID"];

        if (ProfileID != null && ProfileID != "") {
            $.when(
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Citizen/Forms/CitizenProfile.aspx/GetCitizenProfileData',
                    data: '{"prefix": "","Data":"' + ProfileID + '"}',
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
                $("#ContentPlaceHolder1_HFProfileID").val(ProfileID);

                var obj = jQuery.parseJSON(data.d);

                result = true;

                if (result /*&& jqXHRData_IMG_result*/) {
                    $("#FirstName").val(obj["residentName"]);
                    $('#FirstName').prop("disabled", true);

                    //$("txtSearchData").val(obj["aadhaarNumber"]);
                    //$('txtSearchData').prop("disabled", true);

                    $("#FatherName").val(obj["careOf"]);
                    $('#FatherName').prop("disabled", true);

                    //obj["careOfLocal"];

                    obj["district"];
                    //obj["districtLocal"];
                    $('#EmailID').val(obj["emailId"]);

                    if (obj["gender"] != "") {
                        if (obj["gender"] == "M") {
                            $('#ddlGender').val("M");
                            $('#ddlSalutation').val("Mr.");
                        }
                        else if (obj["gender"] == "F") {
                            $('#ddlGender').val("F");
                            $('#ddlSalutation').val("Mrs");
                        }
                        else {
                            $('#ddlGender').val("T");
                            $('#ddlSalutation').val("Other");
                        }
                        $('#ddlGender').prop("disabled", true);
                    }

                    $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val(obj["houseNumber"]);
                    $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").prop("disabled", true);

                    //$("[name='ctl00$ContentPlaceHolder1$AddressLine2']").val(obj["houseNumber"]);
                    $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").prop("disabled", true);

                    $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(obj["street"]);
                    $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").prop("disabled", true);

                    //obj["houseNumberLocal"];
                    $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val(obj["landmark"]);
                    $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").prop("disabled", true);
                    //obj["landmarkLocal"];
                    //obj["language"];
                    $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val(obj["locality"]);
                    $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").prop("disabled", true);
                    //obj["localityLocal"];
                    //obj["phone"];
                    $('#phoneno').val(obj["phone"]);
                    $('#MobileNo').val(obj["Mobile"]);
                    $("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']").val(obj["pincode"]);
                    $("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']").prop("disabled", true);

                    if (obj["state"] != "") {
                        $('#txtState').val(obj["state"]);
                        $('#txtState').prop("disabled", true);
                    }
                    $('#txtDistrict').val(obj["district"]);
                    $('#txtBlock').val(obj["subDistrict"]);
                    $('#txtPanchayat').val(obj["vtc"]);
                    $('#txtDistrict').prop("disabled", true);
                    $('#txtBlock').prop("disabled", true);
                    $('#txtPanchayat').prop("disabled", true);

                    obj["state"];
                    //obj["stateLocal"];
                    $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(obj["street"]);
                    //obj["streetLocal"];
                    obj["subDistrict"];
                    //obj["subDistrictLocal"];

                    $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val(obj["phouseNumber"]);
                    $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").prop("disabled", true);

                    //$("[name='ctl00$ContentPlaceHolder1$AddressLine2']").val(obj["houseNumber"]);
                    $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").prop("disabled", true);

                    $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val(obj["pstreet"]);
                    $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").prop("disabled", true);
                    $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val(obj["plandmark"]);
                    $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").prop("disabled", true);
                    $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val(obj["plocality"]);
                    $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").prop("disabled", true);
                    $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val(obj["ppincode"]);
                    $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").prop("disabled", true);

                    GetStateUIDPermanent(obj["state"], obj["district"], obj["subDistrict"]);
                    GetStateUID(obj["pstate"], obj["pdistrict"], obj["psubDistrict"]);
                    //objState = obj["state"], objDistrict = obj["district"], objTaluka = obj["subDistrict"], objVillage = obj["vtc"];
                }

                //alert("Basic detail saved from Aadhaar.");
                //    window.location.href = url + '?UID=' + AppID + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;
            });// end of Then function of main Data Insert Function
        }
    }
}

function EL(id) { return document.getElementById(id); } // Get el by ID helper function

function readFile() {
    if (this.files && this.files[0]) {
        //if (this.files[0].size > '5000') { alert('The Applicant Phograph size should be less than 5000 Bytes.'); return false; }
        //var imgType = this.files[0].type;
        //if (imgType != 'jpg' || imgType != 'jpeg') { alert('The Applicant Phograph image type should be .jpeg or .jpg'); return false; }

        //var PhotoUpload1 = $("#myImg");

        //var Photoarray = ['JPEG', ' PNG', ' TIFF', 'JPG'];
        //var Extension = PhotoUpload1.val().substring(PhotoUpload1.val().lastIndexOf('.') + 1).toUpperCase();

        //if (Photoarray.indexOf(Extension) <= -1) {
        //    alert("Photo must be in JPEG / PNG form.");
        //    return false;
        //}

        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfPhoto').val(sizekb);
        if (sizekb < 5 || sizekb > 50) {
            // $('#imgupload').attr('src', null);
            alert('The size of the photograph should fall between 5KB to 50KB. Your Photo Size is ' + sizekb + 'kb.');
            return false;
        }

        var FR = new FileReader();
        FR.onload = function (e) {
            EL("ContentPlaceHolder1_myImg").src = e.target.result;
            EL("ContentPlaceHolder1_HFb64").value = e.target.result;

            //var img = new Image;
            //img.onload = function () {
            //    var width = img.width;
            //    var height = img.height;
            //    var aspratio = parseInt(height) / parseInt(width);
            //    //if (width != 160) {
            //    //    //$('#imgupload').attr('src', null);
            //    //    alert('The width of the photograph should be 160 pixels.');
            //    //}
            //    //if (aspratio < 1.25 || aspratio > 1.33) {
            //    //    //$('#imgupload').attr('src', null);
            //    //    alert('The height of the photograph should fall between 200 to 212 pixels.');
            //    //}

            //};
            //img.src = FR.result;
        };
        FR.readAsDataURL(this.files[0]);
    }
}

//EL("myImg").addEventListener("change", readFile, false);

var objState = "", objDistrict = "", objTaluka = "", objVillage = "";

function fnCopyAddress() {
    if (chkAddress.checked) {
        var objState = "ContentPlaceHolder1_Address1_ddlState";
        var objDistrict = "ContentPlaceHolder1_Address1_ddlDistrict";
        var objTaluka = "ContentPlaceHolder1_Address1_ddlTaluka";
        var objVillage = "ContentPlaceHolder1_Address1_ddlVillage";

        GetStateUID($("#" + objState).val(), $("#" + objDistrict).val(), $("#" + objTaluka).val(), $("#" + objVillage).val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val($("#ContentPlaceHolder1_Address1_AddressLine1").val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val($("#ContentPlaceHolder1_Address1_AddressLine2").val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val($("#ContentPlaceHolder1_Address1_RoadStreetName").val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val($("#ContentPlaceHolder1_Address1_LandMark").val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val($("#ContentPlaceHolder1_Address1_Locality").val());
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlState']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage']").val(obj["pincode"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val($("#ContentPlaceHolder1_Address1_PinCode").val());
    }
    else {
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val("");
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlState']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage']").val(obj["pincode"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val("");

        var AddState = "ContentPlaceHolder1_Address2_ddlState";
        var AddDistrict = "ContentPlaceHolder1_Address2_ddlDistrict";
        var AddTaluka = "ContentPlaceHolder1_Address2_ddlTaluka";
        var AddVillage = "ContentPlaceHolder1_Address2_ddlVillage";

        GetStateV2("", AddState);
        $("[id*=" + AddState + "]").val("0");

        $("[id*=" + AddDistrict + "]").empty();
        $("[id*=" + AddDistrict + "]").append('<option value = "0">-Select-</option>');

        $("[id*=" + AddTaluka + "]").empty();
        $("[id*=" + AddTaluka + "]").append('<option value = "0">-Select-</option>');

        $("[id*=" + AddVillage + "]").empty();
        $("[id*=" + AddVillage + "]").append('<option value = "0">-Select-</option>');
    }
}

function GetStateUIDPermanent(p_State, p_District, p_SubDistrict, p_Village) {
    if (p_State != "") {
        var category = "";
        var t_StateVal = "";
        var t_DistrictVal = "";
        var t_SubDistrictVal = "";
        var t_VillageVal = "";

        var AddState = "ContentPlaceHolder1_Address1_ddlState";
        var AddDistrict = "ContentPlaceHolder1_Address1_ddlDistrict";
        var AddTaluka = "ContentPlaceHolder1_Address1_ddlTaluka";
        var AddVillage = "ContentPlaceHolder1_Address1_ddlVillage";

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Registration/KioskRegistration.aspx/GetState',
            data: '{"prefix": ""}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";
                $("[id*=" + AddState + "]").empty();
                $("[id*=" + AddState + "]").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[id*=" + AddState + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    //console.log(this.Id + ',' + this.Name);
                });

                $('#' + AddState).val(p_State);
                //t_StateVal = selectByTextCitizen(AddState, p_State);

                //$('#ddlTaluka').val();

                //GetDistrict(p_District);

                var SelIndex = p_State;//$("#ddlState").val();

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
                    data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response) {
                        var Category = eval(response.d);
                        var html = "";
                        var catCount = 0;
                        $("[id*=" + AddDistrict + "]").empty();
                        $("[id*=" + AddDistrict + "]").append('<option value = "0">-Select-</option>');
                        $.each(Category, function () {
                            $("[id*=" + AddDistrict + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                            //console.log(this.Id + ',' + this.Name);
                            catCount++;
                        });

                        $('#' + AddDistrict).val(p_District);
                        //t_DistrictVal = selectByTextCitizen(AddDistrict, p_District);

                        if (p_District != "") {
                            //selectByText("ddlDistrict", p_District);

                            //GetSubDistrict(p_SubDistrict);

                            var SelIndex = p_District;//$("#ddlDistrict").val();

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: '/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict',
                                data: '{"prefix":"' + category + '","DistrictCode":"' + SelIndex + '"}',
                                processData: false,
                                dataType: "json",
                                success: function (response) {
                                    var Category = eval(response.d);
                                    var html = "";
                                    var catCount = 0;
                                    $("[id*=" + AddTaluka + "]").empty();
                                    $("[id*=" + AddTaluka + "]").append('<option value = "0">-Select-</option>');
                                    $.each(Category, function () {
                                        $("[id*=" + AddTaluka + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                        //console.log(this.Id + ',' + this.Name);
                                        catCount++;
                                    });

                                    t_SubDistrictVal = selectByTextCitizen(AddTaluka, p_SubDistrict);

                                    var SelIndex = t_SubDistrictVal;//$("#ddlTaluka").val();

                                    if (SelIndex != null && SelIndex != "") {
                                        $.ajax({
                                            type: "POST",
                                            contentType: "application/json; charset=utf-8",
                                            url: '/WebApp/Registration/KioskRegistration.aspx/GetVillage',
                                            data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
                                            processData: false,
                                            dataType: "json",
                                            success: function (response) {
                                                var Category = eval(response.d);
                                                var html = "";
                                                var catCount = 0;
                                                $("[id*=" + AddVillage + "]").empty();
                                                $("[id*=" + AddVillage + "]").append('<option value = "0">-Select-</option>');
                                                $.each(Category, function () {
                                                    $("[id*=" + AddVillage + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                                    //console.log(this.Id + ',' + this.Name);
                                                    catCount++;
                                                });

                                                t_VillageVal = selectByTextCitizen(AddVillage, p_Village);
                                            },
                                            error: function (a, b, c) {
                                                alert("4." + a.responseText);
                                            }
                                        });
                                    }
                                },
                                error: function (a, b, c) {
                                    alert("3." + a.responseText);
                                }
                            });
                        }
                    },
                    error: function (a, b, c) {
                        alert("2." + a.responseText);
                    }
                });
            },
            error: function (a, b, c) {
                alert("1." + a.responseText);
            }
        });
    }
}

function GetStateUID(p_State, p_District, p_SubDistrict, p_Village) {
    if (p_State != "") {
        var category = "";
        var t_StateVal = "";
        var t_DistrictVal = "";
        var t_SubDistrictVal = "";
        var t_VillageVal = "";

        var AddState = "ContentPlaceHolder1_Address2_ddlState";
        var AddDistrict = "ContentPlaceHolder1_Address2_ddlDistrict";
        var AddTaluka = "ContentPlaceHolder1_Address2_ddlTaluka";
        var AddVillage = "ContentPlaceHolder1_Address2_ddlVillage";

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Registration/KioskRegistration.aspx/GetState',
            data: '{"prefix": ""}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";
                $("[id*=" + AddState + "]").empty();
                $("[id*=" + AddState + "]").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[id*=" + AddState + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    //console.log(this.Id + ',' + this.Name);
                });

                //$("[id*=ddlState]").text(p_Value);
                t_StateVal = selectByTextCitizen(AddState, p_State);

                //$('#ddlTaluka').val();

                //GetDistrict(p_District);

                var SelIndex = t_StateVal;//$("#ddlState").val();

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
                    data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response) {
                        var Category = eval(response.d);
                        var html = "";
                        var catCount = 0;
                        $("[id*=" + AddDistrict + "]").empty();
                        $("[id*=" + AddDistrict + "]").append('<option value = "0">-Select-</option>');
                        $.each(Category, function () {
                            $("[id*=" + AddDistrict + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                            //console.log(this.Id + ',' + this.Name);
                            catCount++;
                        });

                        t_DistrictVal = selectByTextCitizen(AddDistrict, p_District);

                        if (t_DistrictVal != "") {
                            //selectByText("ddlDistrict", p_District);

                            //GetSubDistrict(p_SubDistrict);

                            var SelIndex = t_DistrictVal;//$("#ddlDistrict").val();

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: '/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict',
                                data: '{"prefix":"' + category + '","DistrictCode":"' + SelIndex + '"}',
                                processData: false,
                                dataType: "json",
                                success: function (response) {
                                    var Category = eval(response.d);
                                    var html = "";
                                    var catCount = 0;
                                    $("[id*=" + AddTaluka + "]").empty();
                                    $("[id*=" + AddTaluka + "]").append('<option value = "0">-Select-</option>');
                                    $.each(Category, function () {
                                        $("[id*=" + AddTaluka + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                        //console.log(this.Id + ',' + this.Name);
                                        catCount++;
                                    });

                                    t_SubDistrictVal = selectByTextCitizen(AddTaluka, p_SubDistrict);

                                    var SelIndex = t_SubDistrictVal;//$("#ddlTaluka").val();

                                    if (SelIndex != null && SelIndex != "") {
                                        $.ajax({
                                            type: "POST",
                                            contentType: "application/json; charset=utf-8",
                                            url: '/WebApp/Registration/KioskRegistration.aspx/GetVillage',
                                            data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
                                            processData: false,
                                            dataType: "json",
                                            success: function (response) {
                                                var Category = eval(response.d);
                                                var html = "";
                                                var catCount = 0;
                                                $("[id*=" + AddVillage + "]").empty();
                                                $("[id*=" + AddVillage + "]").append('<option value = "0">-Select-</option>');
                                                $.each(Category, function () {
                                                    $("[id*=" + AddVillage + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                                    //console.log(this.Id + ',' + this.Name);
                                                    catCount++;
                                                });

                                                t_VillageVal = selectByTextCitizen(AddVillage, p_Village);
                                            },
                                            error: function (a, b, c) {
                                                alert("4." + a.responseText);
                                            }
                                        });
                                    }
                                },
                                error: function (a, b, c) {
                                    alert("3." + a.responseText);
                                }
                            });
                        }
                    },
                    error: function (a, b, c) {
                        alert("2." + a.responseText);
                    }
                });
            },
            error: function (a, b, c) {
                alert("1." + a.responseText);
            }
        });
    }
}

function selectByTextCitizen(p_Control, txt) {
    //$("[id*=ddlState] option")
    //.filter(function () { return $.trim($(this).text()) == txt; })
    //.attr('selected', true);

    //var t_Value = $("#" + txt + "").val();
    var t_Value = txt;
    //$("[id*=" + p_Control + "] option").prop('selected', false).filter(function () {
    //    //return $(this).text().toLowerCase() == txt.toLowerCase();
    //    if ($(this).val().toLowerCase() == txt.toLowerCase()) {
    //        t_Value = $(this).val();
    //        return t_Value;
    //    }
    //}).prop('selected', true);

    //alert(t_Value);
    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }

    //$("[id*=" + p_Control + "] option").each(function () {
    //    if ($(this).text() == theText) {
    //        //$(this).attr('selected', 'selected');
    //        t_Value = $(this).val();
    //    }
    //});

    //$("[id*=" + p_Control + "]").val(t_Value);

    return t_Value;
}

function ValidateForm() {
    var text = "";
    var opt = "";

    /// Basic Information
    var Salutation = $("#ddlSalutation option:selected").text();
    var FullName = $("#FirstName");
    var FatherName = $("#FatherName");
    var MobileNo = $("#MobileNo");
    var EmailID = $("#EmailID");
    var DOB = $("#DOB");
    var Age = $("#Age");
    var Gender = $("#ddlGender option:selected").text();

    //Permanent  address
    var AddressLine1 = $("#ContentPlaceHolder1_Address1_AddressLine1");
    var AddressLine2 = $("#ContentPlaceHolder1_Address1_AddressLine2");
    var RoadStreetName = $("#ContentPlaceHolder1_Address1_RoadStreetName");
    var LandMark = $("#ContentPlaceHolder1_Address1_LandMark");
    var Locality = $("#ContentPlaceHolder1_Address1_Locality");
    var State = $("#ContentPlaceHolder1_Address1_ddlState option:selected").text();
    var District = $("#ContentPlaceHolder1_Address1_ddlDistrict option:selected").text();
    var Taluka = $("#ContentPlaceHolder1_Address1_ddlTaluka option:selected").text();
    var Village = $("#ContentPlaceHolder1_Address1_ddlVillage option:selected").text();
    var Pincode = $("#ContentPlaceHolder1_Address1_PinCode");

    //Present  address
    var PreAddressLine1 = $("#ContentPlaceHolder1_Address2_AddressLine1");
    var PreAddressLine2 = $("#ContentPlaceHolder1_Address2_AddressLine2");
    var PreRoadStreetName = $("#ContentPlaceHolder1_Address2_RoadStreetName");
    var PreLandMark = $("#ContentPlaceHolder1_Address2_LandMark");
    var PreLocality = $("#ContentPlaceHolder1_Address2_Locality");
    //CoPrententPlaceHolder1_Address1_ddlState
    var PreState = $("#ContentPlaceHolder1_Address2_ddlState option:selected").text();
    var PreDistrict = $("#ContentPlaceHolder1_Address2_ddlDistrict option:selected").text();
    var PreTaluka = $("#ContentPlaceHolder1_Address2_ddlTaluka option:selected").text();
    var PreVillage = $("#ContentPlaceHolder1_Address2_ddlVillage option:selected").text();
    var PrePincode = $("#ContentPlaceHolder1_Address2_PinCode");

    if (EL("ContentPlaceHolder1_myImg").src.indexOf("photo.png") != -1) {
        text += "<br /> -Please upload Applicant Photograph.";
        opt = 1;
    }
    if ((Salutation == '' || Salutation == 'Select Title')) {
        text += "<br /> -Please Select title. ";
        opt = 1;
    }
    if ((Gender == '' || Gender == 'Select Gender')) {
        text += "<br /> -Please Select Gender. ";
        opt = 1;
    }
    if (FullName.val() == '') {
        text += "<br /> -Please Enter Full Name. ";
        opt = 1;
    }

    if (FatherName.val() == '') {
        text += "<br /> -Please Enter Father Name. ";
        opt = 1;
    }
    if (DOB.val() == '') {
        text += "<br /> -Please Enter Date of Birth. ";
        opt = 1;
    }

    if (MobileNo.val() != '') {
        var mobmatch1 = /^[789]\d{9}$/;
        if (!mobmatch1.test(MobileNo.val())) {
            text += "<br /> -Please Enter valid mobile Number.";
            opt = 1;
        }
    }
    if (MobileNo.val() == '') {
        text += "<br /> -Please Enter Mobile No. ";
        opt = 1;
    }

    //if (EmailID.val() == '') {
    //    text += "<br /> -Please enter EMail ID. ";
    //    opt = 1;
    //}

    if (EmailID.val() != '') {
        var ss = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (!ss.test(EmailID.val())) {
            text += "<br /> - Please Enter valid EmailID";
            //text += "<br /> -  Please enter valid Confirm EmailID.";
            opt = 1;
        }
    }

    if (AddressLine1 != null && AddressLine1.val() == '') {
        text += "<br /> -Please Enter  Address in Permanent Address. ";
        opt = 1;
    }
    if (RoadStreetName != null && RoadStreetName.val() == '') {
        text += "<br /> -Please Enter Road/Street Name in Permanent Address. ";
        opt = 1;
    }
    if (Locality != null && Locality.val() == '') {
        text += "<br /> -Please Enter  Locality  in Permanent Address. ";
        opt = 1;
    }

    if ((State == '0' || State == '-Select-')) {
        text += "<br /> -Please Select State in Permanent Address.";
        opt = 1;
    }

    if ((District == '-Select-' || District == 'Select District')) {
        text += "<br /> -Please Select District in Permanent Address.";
        opt = 1;
    }

    if ((Taluka == '-Select-' || Taluka == 'Select Block')) {
        text += "<br /> -Please Select Taluka in Permanent Address.";
        opt = 1;
    }

    if ((Village == '-Select-' || Village == 'Select Panchayat')) {
        text += "<br /> -Please Select Panchayat in Permanent Address.";
        opt = 1;
    }
    if (Pincode != null && Pincode.val() == '') {
        text += "<br /> -Please Enter Pincode in Permanent Address.";
        opt = 1;
    }
    //Present Address
    if (PreAddressLine1 != null && PreAddressLine1.val() == '') {
        text += "<br /> -Please Enter  Address in Present Address. ";
        opt = 1;
    }
    if (PreRoadStreetName != null && PreRoadStreetName.val() == '') {
        text += "<br /> -Please Enter Road/Street Name in present Address. ";
        opt = 1;
    }
    if (PreLocality != null && PreLocality.val() == '') {
        text += "<br /> -Please Enter Locality in Present Address. ";
        opt = 1;
    }

    if ((PreState == '0' || PreState == '-Select-')) {
        text += "<br /> -Please Select State in Present Address.";
        opt = 1;
    }

    if ((PreDistrict == '-Select-' || PreDistrict == 'Select District')) {
        text += "<br /> -Please Select District in Present Address.";
        opt = 1;
    }

    if ((PreTaluka == '-Select-' || PreTaluka == 'Select Block')) {
        text += "<br /> -Please Select Taluka in Present Address.";
        opt = 1;
    }

    if ((PreVillage == '-Select-' || PreVillage == 'Select Panchayat')) {
        text += "<br /> -Please Select Village in Present Address.";
        opt = 1;
    }
    if (PrePincode != null && PrePincode.val() == '') {
        text += "<br /> -Please Enter Pincode in Present Address.";
        opt = 1;
    }

    var pinmatch = /^[0-9]\d{5}$/;
    if (Pincode != null && Pincode.val() != '') {
        if (!pinmatch.test(Pincode.val())) {
            text += "<br /> -Please Enter valid Pincode.";
            opt = 1;
        }
    }

    //var PhotoUpload1 = $("#myImg");

    //var Photoarray = ['JPEG', ' PNG', ' TIFF', 'JPG'];
    //var Extension = PhotoUpload1.val().substring(PhotoUpload1.val().lastIndexOf('.') + 1).toUpperCase();

    //if (Photoarray.indexOf(Extension) <= -1) {
    //    _err_mag += "<br /> - Photo must be in JPEG / PNG form.";
    //    opt = 1;
    //}

    //var sizekb = $('#HFSizeOfPhoto').val();
    //sizekb = sizekb.toFixed(0);

    ////alert(sizekb);

    //if (sizekb < 5 || sizekb > 50) {
    //    _err_mag += "<br /> - The size of the photograph should fall between 5KB to 50KB. Your Photo Size is " + sizekb + "kb.";
    //    opt = 1;
    //}

    if (opt == "1") {
        alertPopup("Please fill following information.", '<BR>' + text);
        return false;
    }

    return true;
}

function SubmitData() {
    //alert($('#ContentPlaceHolder1_HFProfileID').val());
    if (!ValidateForm()) {
        return;
    }
    var hdncsrf = $('#ContentPlaceHolder1_CSRFVal').val();

    //if (csrfSession != hdncsrf) {
    //    window.location.href='/Account/Login';
    //    return false;
    //}

    var temp = "Mohan";
    var AppID = "";
    var result = false;
    var DOBArr = $('#DOB').val().split("/");
    var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

    //var obj = jQuery.parseJSON($("#HFUIDData").val());

    var qs = getQueryStrings();

    if (qs["URL"] != null && qs["URL"] != "") {
        var url = qs["URL"];
        var svcid = qs["SvcID"];
        var dpt = qs["DPT"];
        var dist = qs["DIST"];
        var blk = qs["BLK"];
        var pan = qs["PAN"];
        var ofc = qs["OFC"];
        var ofr = qs["OFR"];
        var SkipValidation = qs["SV"];
    }

    qs = null;

    var obj = "";
    var UserImage = "";

    if ($("#HFUIDData").val() != "") {
        obj = jQuery.parseJSON($("#HFUIDData").val());
        UserImage = obj["photo"];
    }

    var qs = getQueryStrings();
    //if (qs["ProfileID"] != null && qs["ProfileID"] != "") {
    if (EL("ContentPlaceHolder1_HFb64").value != null && EL("ContentPlaceHolder1_HFb64").value != "") {
        UserImage = EL("ContentPlaceHolder1_HFb64").value;
    }
    //}

    var datavar = {
        'aadhaarNumber': '',
        'action': '',
        'residentName': $('#FirstName').val(),
        'residentNameLocal': $('#FirstName').val(),
        'careOf': $('#FatherName').val(),
        'careOfLocal': $('#FatherName').val(),
        'dateOfBirth': DOBConverted,
        'gender': $('#ddlGender').val(),
        'phone': $('#phoneno').val(),
        'Mobile': $('#MobileNo').val(),
        'emailId': $('#EmailID').val(),

        'houseNumber': $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val(),
        'houseNumberLocal': $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val(),

        'landmark': $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val(),
        'landmarkLocal': $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val(),

        'locality': $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val(),
        'localityLocal': $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val(),

        'street': $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(),
        'streetLocal': $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(),

        'postOffice': $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").val(),
        'postOfficeLocal': $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").val(),

        'responseCode': '',
        'language': '1',

        'state': $('#ContentPlaceHolder1_Address1_ddlState option:selected').text(),
        'stateLocal': $('#ContentPlaceHolder1_Address1_ddlState option:selected').text(),
        'district': $('#ContentPlaceHolder1_Address1_ddlDistrict option:selected').text(),
        'districtLocal': $('#ContentPlaceHolder1_Address1_ddlDistrict option:selected').text(),
        'subDistrict': $('#ContentPlaceHolder1_Address1_ddlTaluka option:selected').text(),
        'subDistrictLocal': $('#ContentPlaceHolder1_Address1_ddlTaluka option:selected').text(),
        'Village': $('#ContentPlaceHolder1_Address1_ddlVillage option:selected').text(),
        'pincode': $('#ContentPlaceHolder1_Address1_PinCode').val(),
        'pincodeLocal': $('#ContentPlaceHolder1_Address1_PinCode').val(),
        'Image': UserImage,
        //'Image': obj["photo"],
        //'Image': $('#ContentPlaceHolder1_HFb64').val(),
        'phouseNumber': $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val(),
        'plandmark': $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val(),
        'plocality': $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val(),
        'pstreet': $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val(),
        'ppincode': $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val(),
        'ppostOffice': $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val(),

        'pstate': $('#ContentPlaceHolder1_Address2_ddlState').val(),
        'pdistrict': $('#ContentPlaceHolder1_Address2_ddlDistrict').val(),
        'psubDistrict': $('#ContentPlaceHolder1_Address2_ddlTaluka').val(),
        'pvillage': $('#ContentPlaceHolder1_Address2_ddlVillage').val(),

        'JSONData': '',
        'CitizenProfileID': $('#ContentPlaceHolder1_HFProfileID').val(),

        'statecode': $('#ContentPlaceHolder1_Address1_ddlState').val(),
        'districtcode': $('#ContentPlaceHolder1_Address1_ddlDistrict').val(),
        'subDistrictcode': $('#ContentPlaceHolder1_Address1_ddlTaluka').val(),
        'Villagecode': $('#ContentPlaceHolder1_Address1_ddlVillage').val(),
        'SV': SkipValidation
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Citizen/Forms/CSCCitizenProfile.aspx/InsertCitizenProfile',
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
        var intStatus = obj.intStatus;
        var StatusMessage = obj.Status;
        AppID = obj.AppID;
        result = false;

        if (intStatus == 1) {
            result = true;
        }
        else if (intStatus == 2 || intStatus == 3 || intStatus == 4) {
            result = false;

            alert(StatusMessage);
        }

        if (result /*&& jqXHRData_IMG_result*/) {
            var qs = getQueryStrings();
            if (qs["SvcID"] == null) {
                alert("Profile Updated Sucessfully.");
                window.location.href = '/WebAppUK/DashboardV3/Dashboard.aspx?UID=' + qs["UID"] + '&KeyField=' + qs["KeyField"] + '&ProfileID=' + qs["ProfileID"];
                return false;
            }
            if (qs["SvcID"] == '992') {
                alert("Citizen Profile Created Sucessfully.");
                window.location.href = '/WebAppUK/DashboardV3/Dashboard.aspx?UID=' + AppID + '&ProfileID=' + AppID;
                return false;
            }
            if (qs["SvcID"] == '386') {
                alert("Basic detail saved from Aadhaar. Please fill the Complaint details.");
                window.location.href = '/WebApp/Kiosk/Complaint/Complaint.aspx?UID=' + AppID + '&SvcID=386';
                return false;
            }
            if (qs["SvcID"] == '387') {
                alert("Basic detail saved from Aadhaar. Please fill Habisha Brata details.");
                window.location.href = '/WebApp/Kiosk/Habisha/Habisha.aspx?UID=' + AppID + '&SvcID=387';
                return false;
            }

            if (qs["URL"] != null && qs["URL"] != "") {
                var url = qs["URL"];
                var svcid = qs["SvcID"];
                var dpt = qs["DPT"];
                var dist = qs["DIST"];
                var blk = qs["BLK"];
                var pan = qs["PAN"];
                var ofc = qs["OFC"];
                var ofr = qs["OFR"];

                alert("Basic detail saved.");
                window.location.href = url + '?UID=' + AppID + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;
            }
        }
    });
    return false;
}

function BindProfileV2(JSONData, ProfileType) {
    var qs = getQueryStrings();

    if (JSONData != "") {
        //alert($("#HFUIDData").val());
        $("#divNonAadhar").hide();
        //$("#divSearch").hide();
        $("#divBasicInfo").show();
        $("#divAddress").show();
        $('#divCitizenProfile').show();
        $("#divBtn").show();
        $("#ddlSearch").prop("disabled", true);
        $("txtSearchData").prop("disabled", true);
        $("#btnSearch").prop("disabled", true);
        //$('#MobileNo').prop('disabled', true);
        //$('#divSearch').hide();
        if (ProfileType == 1) {
            $("#fulPhoto").show();
        }
        else {
            $("#fulPhoto").hide();
        }

        var obj = jQuery.parseJSON(JSONData);

        if (obj["dateOfBirth"] != "") {
            var t_DOB = obj["dateOfBirth"];

            if (ProfileType == 1) {
                var D1 = t_DOB.split('-');
                var calday = D1[2];
                var calmon = D1[1];
                var calyear = D1[0];

                t_DOB = calday.toString() + "/" + calmon.toString() + "/" + calyear;
            }

            t_DOB = t_DOB.replace(/-/g, "/");
            $('#DOB').val(t_DOB);
            $('#DOB').prop("disabled", true);

            var t_DOB = $("#DOB").val();
            t_DOB = t_DOB.replace("-", "/");
            var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
            var selectedYear = S_date.getFullYear(); // selected year

            //var Age = calage(S_date);
            var Age = calage1(t_DOB);
            $('#Age').val(Age);
        }

        if (ProfileType == 1) {
            if (obj["Image"] != null && obj["Image"] != "") {
                if (obj["Image"].indexOf('data:image/jpeg;base64,') !== -1) {
                    document.getElementById('ContentPlaceHolder1_myImg').setAttribute('src', obj["Image"]);
                    $('#ContentPlaceHolder1_HFb64').val(obj["Image"]);
                }
                else {
                    document.getElementById('ContentPlaceHolder1_myImg').setAttribute('src', 'data:image/jpeg;base64,' + obj["Image"]);
                    $('#ContentPlaceHolder1_HFb64').val(obj["Image"]);
                }
            }
            else { $('#fulPhoto').show(); }
        }
        else {
            document.getElementById('ContentPlaceHolder1_myImg').setAttribute('src', 'data:image/png;base64,' + obj["photo"]);
            $('#ContentPlaceHolder1_HFb64').val(obj["photo"]);
        }

        $("#FirstName").val(obj["residentName"]);
        $('#FirstName').prop("disabled", true);

        if (qs["ProfileID"] != null) {
            $("txtSearchData").val(qs["ProfileID"]);
            //$('#ddlSearch').val("C");
            $('txtSearchData').prop("disabled", true);
        }
        else {
            $("txtSearchData").val(obj["aadhaarNumber"]);
            $('txtSearchData').prop("disabled", true);
        }
        $("#FatherName").val(obj["careOf"]);
        if (obj["careOf"] != null) {
            $('#FatherName').prop("disabled", true);
        }
        else { $('#FatherName').prop("disabled", false); }
        //obj["careOfLocal"];

        obj["district"];
        //obj["districtLocal"];
        $('#EmailID').val(obj["emailId"]);

        if (obj["gender"] != "") {
            if (obj["gender"] == "M") {
                $('#ddlGender').val("M");
                $('#ddlSalutation').val("1");
            }
            else if (obj["gender"] == "F") {
                $('#ddlGender').val("F");
                $('#ddlSalutation').val("2");
            }
            else {
                $('#ddlGender').val("T");
                $('#ddlSalutation').val("3");
            }
            $('#ddlGender').prop("disabled", true);
        }

        /*
        2016-11-22: Logic altered to enable these text boxes in case value from UID is blank, based on which, user cannot submit the form.
        */
        if (obj["houseNumber"] != null && obj["houseNumber"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val(obj["houseNumber"]);
            //$("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").prop("disabled", true);
        }

        if (obj["postOffice"] != null && obj["postOffice"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").val(obj["postOffice"]);
            //$("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").prop("disabled", true);
        }

        if (obj["street"] != null && obj["street"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(obj["street"]);
            //$("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").prop("disabled", true);
        }

        if (obj["landmark"] != null && obj["landmark"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val(obj["landmark"]);
            //$("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").prop("disabled", true);
        }
        /*
        2016-11-22: Logic altered to enable these text boxes in case value from UID is blank, based on which, user cannot submit the form.
        */

        //obj["houseNumberLocal"];
        //obj["landmarkLocal"];
        //obj["language"];

        /*2016-12-20: Logic altered to enable these text boxes in case value from UID is blank, based on which, user cannot submit the form.*/
        if (obj["locality"] != null && obj["locality"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val(obj["locality"]);
            //$("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").prop("disabled", true);
        }

        //obj["localityLocal"];
        //obj["phone"];
        $('#phoneno').val(obj["phone"]);

        $('#MobileNo').val(obj["Mobile"]);
        if (obj["Mobile"] != null && obj["Mobile"] != "") {
            $('#MobileNo').val(obj["Mobile"]);
            $('#MobileNo').prop("disabled", true);
        }
        else { $('#MobileNo').prop("disabled", false); }

        if (obj["Mobile"] == null) {
            $('#MobileNo').val(obj["phone"]);
        }

        $("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']").prop("disabled", true);

        if (obj["state"] != "") {
            $('#txtState').val(obj["state"]);
            $('#txtState').prop("disabled", true);
        }
        $('#txtDistrict').val(obj["district"]);
        $('#txtBlock').val(obj["subDistrict"]);

        if (ProfileType == 1) {
            $('#txtPanchayat').val(obj["Village"]);
        }
        else {
            $('#txtPanchayat').val(obj["vtc"]);
        }
        $('#txtDistrict').prop("disabled", true);
        $('#txtBlock').prop("disabled", true);
        $('#txtPanchayat').prop("disabled", true);
        //alert(obj["aadhaarNumber"]);
        $("#ContentPlaceHolder1_HFProfileID").val(obj["aadhaarNumber"]);
        //alert($("#ContentPlaceHolder1_HFProfileID").val());
        //obj["pincodeLocal"];
        //obj["postOffice"];
        //obj["postOfficeLocal"];
        //obj["residentName"];
        //obj["residentNameLocal"];

        //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlState'] option").prop('selected', false).filter(function () {
        //    return $(this).text() == obj["state"];
        //}).prop('selected', true);

        //// Now set dropdown selected option to the one as per State.
        //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlState'] option").map(function () {
        //    if ($(this).text() == obj["state"]) return this;
        //}).attr('selected', 'selected');

        //selectByText(obj["state"]);

        obj["state"];
        //obj["stateLocal"];
        $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").val(obj["street"]);
        //obj["streetLocal"];
        obj["subDistrict"];
        //obj["subDistrictLocal"];

        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val(obj["phouseNumber"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val(obj["ppostOffice"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val(obj["plandmark"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val(obj["plocality"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val(obj["pstreet"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val(obj["ppincode"]);

        //GetStateAsPerUID("", "", "", "");

        //$('#ddlState').val(obj["pstate"]),
        //$('#ddlDistrict').val(obj["pdistrict"]),
        //$('#ddlTaluka').val(obj["psubDistrict"]),
        //$('#ddlVillage').val(obj["pvillage"]),

        if (ProfileType == 1) {
            GetStateAsPerUIDUsingCode(obj["statecode"], obj["districtcode"], obj["subDistrictcode"], obj["Villagecode"], 'ContentPlaceHolder1_Address1_ddlState', 'ContentPlaceHolder1_Address1_ddlDistrict', 'ContentPlaceHolder1_Address1_ddlTaluka', 'ContentPlaceHolder1_Address1_ddlVillage');

            GetStateAsPerUIDUsingVAL(obj["pstate"], obj["pdistrict"], obj["psubDistrict"], obj["pvillage"]);
        }
        //else {
        //    GetStateAsPerUID(obj["state"], obj["district"], obj["subDistrict"], obj["vtc"]);
        //}

        //objState = obj["state"], objDistrict = obj["district"], objTaluka = obj["subDistrict"], objVillage = obj["vtc"];
    }//end of UID Data
}

function GetStateAsPerUIDUsingCode(p_State, p_District, p_SubDistrict, p_Village, StateControl, DistControl, SubDistControl, VillageControl) {
    if (p_State != "") {
        var category = "";
        var t_StateVal = "";
        var t_DistrictVal = "";
        var t_SubDistrictVal = "";
        var t_VillageVal = "";

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Registration/KioskRegistration.aspx/GetState',
            data: '{"prefix": ""}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";
                $("[id*=" + StateControl + "]").empty();
                $("[id*=" + StateControl + "]").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[id*=" + StateControl + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    //console.log(this.Id + ',' + this.Name);
                });

                //$("[id*=ddlState]").text(p_Value);
                t_StateVal = selectByVal(StateControl, p_State);

                //$('#ddlTaluka').val();

                //GetDistrict(p_District);

                var SelIndex = t_StateVal;//$("#ddlState").val();

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
                    data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response) {
                        var Category = eval(response.d);
                        var html = "";
                        var catCount = 0;
                        $("[id=" + DistControl + "]").empty();
                        $("[id=" + DistControl + "]").append('<option value = "0">-Select-</option>');
                        $.each(Category, function () {
                            $("[id=" + DistControl + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                            //console.log(this.Id + ',' + this.Name);
                            catCount++;
                        });

                        //var district = '0' + p_District;

                        //$(DistControl).val(district);
                        t_DistrictVal = selectByVal(DistControl, p_District);

                        if (p_District != "") {
                            //selectByText("ddlDistrict", p_District);

                            //GetSubDistrict(p_SubDistrict);

                            var SelIndex = p_District;//$("#ddlDistrict").val();

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: '/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict',
                                data: '{"prefix":"' + category + '","DistrictCode":"' + SelIndex + '"}',
                                processData: false,
                                dataType: "json",
                                success: function (response) {
                                    var Category = eval(response.d);
                                    var html = "";
                                    var catCount = 0;
                                    $("[id=" + SubDistControl + "]").empty();
                                    $("[id=" + SubDistControl + "]").append('<option value = "0">-Select-</option>');
                                    $.each(Category, function () {
                                        $("[id=" + SubDistControl + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                        //console.log(this.Id + ',' + this.Name);
                                        catCount++;
                                    });

                                    t_SubDistrictVal = selectByVal(SubDistControl, p_SubDistrict);

                                    var SelIndex = t_SubDistrictVal;//$("#ddlTaluka").val();

                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: '/WebApp/Registration/KioskRegistration.aspx/GetVillage',
                                        data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
                                        processData: false,
                                        dataType: "json",
                                        success: function (response) {
                                            var Category = eval(response.d);
                                            var html = "";
                                            var catCount = 0;
                                            $("[id=" + VillageControl + "]").empty();
                                            $("[id=" + VillageControl + "]").append('<option value = "0">-Select-</option>');
                                            $.each(Category, function () {
                                                $("[id=" + VillageControl + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                                //console.log(this.Id + ',' + this.Name);
                                                catCount++;
                                            });

                                            t_VillageVal = selectByVal(VillageControl, p_Village);
                                        },
                                        error: function (a, b, c) {
                                            alert("4." + a.responseText);
                                        }
                                    });
                                },
                                error: function (a, b, c) {
                                    alert("3." + a.responseText);
                                }
                            });
                        }
                    },
                    error: function (a, b, c) {
                        alert("2." + a.responseText);
                    }
                });
            },
            error: function (a, b, c) {
                alert("1." + a.responseText);
            }
        });
    }
}

function GetStateAsPerUIDUsingVAL(p_State, p_District, p_SubDistrict, p_Village) {
    if (p_State != "") {
        var category = "";
        var t_StateVal = "";
        var t_DistrictVal = "";
        var t_SubDistrictVal = "";
        var t_VillageVal = "";

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Registration/KioskRegistration.aspx/GetState',
            data: '{"prefix": ""}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";
                $("[id*=ddlState]").empty();
                $("[id*=ddlState]").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    //console.log(this.Id + ',' + this.Name);
                });
                //$("[id*=ddlState]").text(p_Value);
                t_StateVal = selectByVal("ddlState", p_State);
                //$('#ddlTaluka').val();
                //GetDistrict(p_District);
                var SelIndex = t_StateVal;//$("#ddlState").val();

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
                    data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response) {
                        var Category = eval(response.d);
                        var html = "";
                        var catCount = 0;
                        $("[id=ContentPlaceHolder1_Address2_ddlDistrict]").empty();
                        $("[id=ContentPlaceHolder1_Address2_ddlDistrict]").append('<option value = "0">-Select-</option>');
                        $.each(Category, function () {
                            $("[id=ContentPlaceHolder1_Address2_ddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                            //console.log(this.Id + ',' + this.Name);
                            catCount++;
                        });

                        t_DistrictVal = selectByVal("ContentPlaceHolder1_Address2_ddlDistrict", p_District);

                        if (t_DistrictVal != "") {
                            //selectByText("ddlDistrict", p_District);
                            //GetSubDistrict(p_SubDistrict);
                            var SelIndex = t_DistrictVal;//$("#ddlDistrict").val();
                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: '/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict',
                                data: '{"prefix":"' + category + '","DistrictCode":"' + SelIndex + '"}',
                                processData: false,
                                dataType: "json",
                                success: function (response) {
                                    var Category = eval(response.d);
                                    var html = "";
                                    var catCount = 0;
                                    $("[id=ContentPlaceHolder1_Address2_ddlTaluka]").empty();
                                    $("[id=ContentPlaceHolder1_Address2_ddlTaluka]").append('<option value = "0">-Select-</option>');
                                    $.each(Category, function () {
                                        $("[id=ContentPlaceHolder1_Address2_ddlTaluka]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                        //console.log(this.Id + ',' + this.Name);
                                        catCount++;
                                    });

                                    t_SubDistrictVal = selectByVal("ContentPlaceHolder1_Address2_ddlTaluka", parseInt(p_SubDistrict));

                                    var SelIndex = t_SubDistrictVal;//$("#ddlTaluka").val();

                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: '/WebApp/Registration/KioskRegistration.aspx/GetVillage',
                                        data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
                                        processData: false,
                                        dataType: "json",
                                        success: function (response) {
                                            var Category = eval(response.d);
                                            var html = "";
                                            var catCount = 0;
                                            $("[id=ContentPlaceHolder1_Address2_ddlVillage]").empty();
                                            $("[id=ContentPlaceHolder1_Address2_ddlVillage]").append('<option value = "0">-Select-</option>');
                                            $.each(Category, function () {
                                                $("[id=ContentPlaceHolder1_Address2_ddlVillage]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                                //console.log(this.Id + ',' + this.Name);
                                                catCount++;
                                            });

                                            t_VillageVal = selectByVal("ContentPlaceHolder1_Address2_ddlVillage", p_Village);
                                        },
                                        error: function (a, b, c) {
                                            alert("4." + a.responseText);
                                        }
                                    });
                                },
                                error: function (a, b, c) {
                                    alert("3." + a.responseText);
                                }
                            });
                        }
                    },
                    error: function (a, b, c) {
                        alert("2." + a.responseText);
                    }
                });
            },
            error: function (a, b, c) {
                alert("1." + a.responseText);
            }
        });
    }
}

function selectByVal(p_Control, txt) {
    var t_Value = txt;

    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }
    return t_Value;
}

function calage(dob) {
    var D1 = dob.split('/');
    var calday = D1[0];
    var calmon = D1[1];
    var calyear = D1[2];

    var curd = new Date(curyear, curmon - 1, curday);
    var cald = new Date(calyear, calmon - 1, calday);
    var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) - Date.UTC(calyear, calmon, calday, 0, 0, 0);
    var dife = datediff(curd, cald);
    return dife[0];
}

var AppID = "";

function fnGenOTP() {

    debugger;
    var temp = "Gunwant";
    var result = false;
    var MobileNo = $("#txtSearchData").val();

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Citizen/Forms/RegisterMobile.aspx/GenerateOTP',
            data: '{"prefix": "","Data":"' + MobileNo + '"}',
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                alert("2." + a.responseText);
            }
        })).then(function (data, textStatus, jqXHR) {
            debugger;
            var obj = jQuery.parseJSON(data.d);
            var html = "";
            var strMobile = "";
            AppID = obj.AppID;
            var temp = AppID.split('_');
            strMobile = temp[3];
            result = true;

            if (result /*&& jqXHRData_IMG_result*/) {
                alert('The 6 digit OTP code has been SMS to ' + strMobile + ' \Please Enter the no. to verify');

                $('#ContentPlaceHolder1_btnOTP').attr('value', 'ReGenerate OTP');
                $('#divValidateOTP').show(800);
            }
            else {
                alert('Sorry! Something went wrong, please try again.');
                $('#ContentPlaceHolder1_btnOTP').attr('value', 'ReGenerate OTP');
            }
        });

    return false;
}

function fnValidateOTP() {

    debugger;
    var temp = "Mohan";
    var MobileNo = $("#txtSearchData").val();
    var result = false;
    //var temp = AppID.split('_');
    //var strMobile = temp[0];
    //var UID = temp[0];
    //var OTP = temp[1];
    AppID = AppID;
    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Citizen/Forms/ValidateUser.aspx/ValidateCitizenOTP',
            data: '{"prefix": "","Data":"' + AppID + '","EnteredOTP":"' + $('#txtOTP').val() + '"}',
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                alert("2." + a.responseText);
            }
        })).then(function (data, textStatus, jqXHR) {

            var obj = jQuery.parseJSON(data.d);
            var html = "";
            var strMobile = "";
            var strReturn = obj.AppID;
            var temp = strReturn.split('_');
            //var cnt = temp[6];
            var cnt = temp[0];
            result = true;

            if (cnt == 1) {
                alert("OTP successfully validated");
                $('#divSearch').hide(800);
                $('#MobileNo').val(MobileNo);
                $('#MobileNo').prop('disabled', true);
                $('#divCitizenProfile').show(800);
            }
            else {
                alert(" OTP Validation Failed!!! \n Please Enter Correct 6 Digit OTP Sent on " + MobileNo + " \n Received as SMS from Uttrakhand Common Application Portal.");
                $('#MobileNo').val('');
                $('#MobileNo').prop('disabled', false);
                $('#divSearch').show(800);
                $('#divCitizenProfile').hide(800);
            }
        });

    return false;
}

function ValidateMobile() {

    $('#divMsg').hide();
    var MobileNo = $("#txtSearchData").val();
    var length = MobileNo.length;
    $("#divMsgTitle").text("Validate Form!");
    $("#divMsgDtls").text("Please enter 10 digit mobile number.");
    if ($("#txtSearchData").val() == "") {
        alert("Please enter 10 digit mobile number.");
        $("#txtSearchData").focus();
        $('#divMsg').show();
        return false;
    }

    if (eval(length) < 10) {
        alert("Mobile number should be 10 digit");
        $("#txtSearchData").focus();
        $("#txtSearchData").val("");
        $('#divMsg').show();
        return false;
    }

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Citizen/Forms/RegisterMobile.aspx/ValidateMobile',
            data: '{"prefix": "","Data":"' + MobileNo + '"}',
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                alert("2." + a.responseText);
            }
        })).then(function (data, textStatus, jqXHR) {
            debugger;
            var obj = jQuery.parseJSON(data.d);
            var html = "";
            var strMobile = "";
            AppID = obj.AppID;

            if (obj.Status == "Error") {
                result = false;
            }

            if (AppID != null && AppID != "") {

                if (AppID == MobileNo)
                    result = true;
            }

            if (result /*&& jqXHRData_IMG_result*/) {
                $("#txtMobile").prop('disabled', true);
                $('#divOTP').show();
                $('#divbtnOTP').show();
                $('#btnValidateOTP').show();
                $('#btnOTP').val("Re-validate Mobile No.");
                $("#divMsgTitle").text("Information!");
                $("#divMsgDtls").text("6 Digit OTP Code has been Sent  to  your registered mobile no.");
                $('#divMsg').show();
                fnGenOTP();
            }
            else {
                alert('Your Mobile is not registered , please fill your profile to Register your Mobile Number.');
                $("#txtSearchData").val(MobileNo);
                $("#divCitizenProfile").show();
                $("#divSearch").hide();
                $("#HFOTPDone").val("Y");
                $("#HFMobileNo").val(MobileNo);
            }
        });
    return false;
}