$(document).ready(function ()
{
    $("#btnSubmit2").prop('disabled', true);

    EL("File1").addEventListener("change", readFile, false);
    EL("File2").addEventListener("change", readFile2, false);

    $('#txtEstDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        //maxDate: '-1d',
        minDate: '0',
        yearRange: "-100:+1",
        onSelect: function (date)
        { }
    });

    $('#txtAppDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        //maxDate: '-1d',
        minDate: '0',
        yearRange: "-1:+1",
        onSelect: function (date)
        { }
    });

    $('#DateOfBirth').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '-1',
        yearRange: "-100:+40",
        onSelect: function (date)
        {
            GetAge();
        }
    });

    $("#divDeclaration").hide(800);
    GetCircleList();
    fnSearchData();
 
});

function EL(id) { return document.getElementById(id); } // Get el by ID helper function

function readFile()
{
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

function GetDivisionList() {
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


function showPosition()
{
debugger;
    if (navigator.geolocation)
    {
        navigator.geolocation.getCurrentPosition(function (position)
        {
            var positionLT = "(" + position.coords.latitude + ")";
            var positionLG = "(" + position.coords.longitude + ")";

            //document.getElementById("txtGPSLoc").innerHTML = positionInfo;
            $("#txtGPSLocLong").val(positionLT);
            $("#txtGPSLocLati").val(positionLG);
        });
    } else
    {
        alert("Sorry, your browser does not support HTML5 geolocation.");
    }
}

function GeoLocation()
{
    var latitudeAndLongitude = document.getElementById("latitudeAndLongitude"),
        location = {
            latitude: '',
            longitude: ''
        };

    if (navigator.geolocation)
    {
        navigator.geolocation.getCurrentPosition(showPosition);
    }
    else
    {
        latitudeAndLongitude.innerHTML = "Geolocation is not supported by this browser.";
    }

    function showPosition(position)
    {
        location.latitude = position.coords.latitude;
        location.longitude = position.coords.longitude;
        //latitudeAndLongitude.innerHTML = "Latitude: " + position.coords.latitude +
        //    "<br>Longitude: " + position.coords.longitude;

        var positionLT = "(" + position.coords.latitude + ")";
        var positionLG = "(" + position.coords.longitude + ")";
        $("#txtGPSLocLong").val(positionLT);
        $("#txtGPSLocLati").val(positionLG);

        var geocoder = new google.maps.Geocoder();
        var latLng = new google.maps.LatLng(location.latitude, location.longitude);

        if (geocoder)
        {
            geocoder.geocode({ 'latLng': latLng }, function (results, status)
            {
                if (status == google.maps.GeocoderStatus.OK)
                {
                    console.log(results[0].formatted_address);
                    $('#address').html('Address:' + results[0].formatted_address);
                }
                else
                {
                    $('#address').html('Geocoding failed: ' + status);
                    console.log("Geocoding failed: " + status);
                }
            }); //geocoder.geocode()
        }
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
                    $('#txtFullName').val(obj[0]["ApplicantName"]);
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

    window.location.href = '/WebAppUK/Forest/SawMill/LicenseForm.aspx?SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr + '&UID=' + uid + '';
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

    if ($('#ddlRenewalType').val() == "-Select-" || $('#ddlRenewalType').val() == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select Type of Renewal From List.";
        $('#ddlRenewalType').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlRenewalType').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlRenewalType').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlRenewalType').css({ "background-color": "#ffffff" });
    }

    if ($('#ddlIndustryType').val() == "-Select-" || $('#ddlIndustryType').val() == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select Type of Industry From List.";
        $('#ddlIndustryType').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlIndustryType').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlIndustryType').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlIndustryType').css({ "background-color": "#ffffff" });
    }

    if ($('#txtIndustryName').val() == "" || $('#txtIndustryName').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Name of the Industry.";
        $('#txtIndustryName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtIndustryName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtIndustryName').attr('style', '1px solid #cdcdcd !important;');
        $('#txtIndustryName').css({ "background-color": "#ffffff" });
    }

    if ($('#txtAppDate').val() == "" || $('#txtAppDate').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Date of Application.";
        $('#txtAppDate').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtAppDate').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtAppDate').attr('style', '1px solid #cdcdcd !important;');
        $('#txtAppDate').css({ "background-color": "#ffffff" });
    }

    if ($('#txtTanPanNo').val() == "" || $('#txtTanPanNo').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Date of Application.";
        $('#txtTanPanNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtTanPanNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtTanPanNo').attr('style', '1px solid #cdcdcd !important;');
        $('#txtTanPanNo').css({ "background-color": "#ffffff" });
    }

    if ($('#txtGPSLocLong').val() == "" || $('#txtGPSLocLong').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter GPS Degree Latitute Location.";
        $('#txtGPSLocLong').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtGPSLocLong').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtGPSLocLong').attr('style', '1px solid #cdcdcd !important;');
        $('#txtGPSLocLong').css({ "background-color": "#ffffff" });
    }

    if ($('#txtGPSLocLati').val() == "" || $('#txtGPSLocLati').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter GPS Minute Latitute Location.";
        $('#txtGPSLocLati').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtGPSLocLati').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtGPSLocLati').attr('style', '1px solid #cdcdcd !important;');
        $('#txtGPSLocLati').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor1LatdSecond').val() == "" || $('#txtCornor1LatdSecond').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter GPS Second Latitute Location.";
        $('#txtCornor1LatdSecond').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor1LatdSecond').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCornor1LatdSecond').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor1LatdSecond').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor1LongDegree').val() == "" || $('#txtCornor1LongDegree').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter GPS Degree Longitude Location.";
        $('#txtCornor1LongDegree').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor1LongDegree').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCornor1LongDegree').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor1LongDegree').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor1LongMinute').val() == "" || $('#txtCornor1LongMinute').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter GPS Minute Longitude Location.";
        $('#txtCornor1LongMinute').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor1LongMinute').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCornor1LongDegree').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor1LongDegree').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor1LongSecond').val() == "" || $('#txtCornor1LongSecond').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter GPS Second Longitude Location.";
        $('#txtCornor1LongSecond').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor1LongSecond').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCornor1LongSecond').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor1LongSecond').css({ "background-color": "#ffffff" });
    }


    if ($('#txtIPropMDName').val() == "" || $('#txtIPropMDName').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Proprietor/Managing Director Name.";
        $('#txtIPropMDName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtIPropMDName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtIPropMDName').attr('style', '1px solid #cdcdcd !important;');
        $('#txtIPropMDName').css({ "background-color": "#ffffff" });
    }

    if ($('#txtIPropMDUIDNo').val() == "" || $('#txtIPropMDUIDNo').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Prop./MD Aadhaar No.";
        $('#txtIPropMDUIDNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtIPropMDUIDNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtIPropMDUIDNo').attr('style', '1px solid #cdcdcd !important;');
        $('#txtIPropMDUIDNo').css({ "background-color": "#ffffff" });
    }

    if ($('#txtEstDate').val() == "" || $('#txtEstDate').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Establishment Date.";
        $('#txtEstDate').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtEstDate').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtEstDate').attr('style', '1px solid #cdcdcd !important;');
        $('#txtEstDate').css({ "background-color": "#ffffff" });
    }

    if ($('#txtIndusRegNo').val() == "" || $('#txtIndusRegNo').val() == 0)
    {
        text += "<BR>" + " \u002A" + " Please Enter Registration No.";
        $('#txtIndusRegNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtIndusRegNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtIndusRegNo').attr('style', '1px solid #cdcdcd !important;');
        $('#txtIndusRegNo').css({ "background-color": "#ffffff" });
    }

    if ($('#txtIndusAddress').val() == "" || $('#txtIndusAddress').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Industry Address.";
        $('#txtIndusAddress').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtIndusAddress').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtIndusAddress').attr('style', '1px solid #cdcdcd !important;');
        $('#txtIndusAddress').css({ "background-color": "#ffffff" });
    }

    if ($('#txtIndusAddressPin').val() == "" || $('#txtIndusAddressPin').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Industry Pincode.";
        $('#txtIndusAddressPin').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtIndusAddressPin').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtIndusAddressPin').attr('style', '1px solid #cdcdcd !important;');
        $('#txtIndusAddressPin').css({ "background-color": "#ffffff" });
    }

    if ($('#txtIndusLandlineNo').val() == "" || $('#txtIndusLandlineNo').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Industry Landline No.";
        $('#txtIndusLandlineNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtIndusLandlineNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtIndusLandlineNo').attr('style', '1px solid #cdcdcd !important;');
        $('#txtIndusLandlineNo').css({ "background-color": "#ffffff" });
    }

    if ($('#ddlNotIndusArea').val() == "-Select-" || $('#ddlNotIndusArea').val() == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select Notified Industrial Area From List.";
        $('#ddlNotIndusArea').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlNotIndusArea').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlNotIndusArea').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlNotIndusArea').css({ "background-color": "#ffffff" });
    }

    if ($('#ddlMunicipalArea').val() == "-Select-" || $('#ddlMunicipalArea').val() == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select Whether Municipal Area From List.";
        $('#ddlMunicipalArea').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlMunicipalArea').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlMunicipalArea').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlMunicipalArea').css({ "background-color": "#ffffff" });
    }

    if ($('#txtMDMobileNo').val() == "" || $('#txtMDMobileNo').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Prop./MD Mobile No.";
        $('#txtMDMobileNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtMDMobileNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtMDMobileNo').attr('style', '1px solid #cdcdcd !important;');
        $('#txtMDMobileNo').css({ "background-color": "#ffffff" });
    }

    if ($('#txtMDEMailID').val() == "" || $('#txtMDEMailID').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Prop./MD Email ID.";
        $('#txtMDEMailID').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtMDEMailID').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtMDEMailID').attr('style', '1px solid #cdcdcd !important;');
        $('#txtMDEMailID').css({ "background-color": "#ffffff" });
    }

    if ($('#ddlWoodType').val() == "-Select-" || $('#ddlWoodType').val() == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select Type of Wood From List.";
        $('#ddlWoodType').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlWoodType').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlWoodType').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlWoodType').css({ "background-color": "#ffffff" });
    }

    if ($('#txtSpeciesWood').val() == "" || $('#txtSpeciesWood').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Species of Wood used.";
        $('#txtSpeciesWood').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtSpeciesWood').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtSpeciesWood').attr('style', '1px solid #cdcdcd !important;');
        $('#txtSpeciesWood').css({ "background-color": "#ffffff" });
    }

    if ($('#txtWoodUsed').val() == "" || $('#txtWoodUsed').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Type of Wood Used.";
        $('#txtWoodUsed').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtWoodUsed').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtWoodUsed').attr('style', '1px solid #cdcdcd !important;');
        $('#txtWoodUsed').css({ "background-color": "#ffffff" });
    }

    if ($('#txtWoodSource').val() == "" || $('#txtWoodSource').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Source of Wood.";
        $('#txtWoodSource').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtWoodSource').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtWoodSource').attr('style', '1px solid #cdcdcd !important;');
        $('#txtWoodSource').css({ "background-color": "#ffffff" });
    }

    if ($('#txtInstallCap').val() == "" || $('#txtInstallCap').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Installed Capacity.";
        $('#txtInstallCap').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtInstallCap').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtInstallCap').attr('style', '1px solid #cdcdcd !important;');
        $('#txtInstallCap').css({ "background-color": "#ffffff" });
    }

    if ($('#txtIEqupUsed').val() == "" || $('#txtIEqupUsed').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Equipments Used.";
        $('#txtIEqupUsed').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtIEqupUsed').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtIEqupUsed').attr('style', '1px solid #cdcdcd !important;');
        $('#txtIEqupUsed').css({ "background-color": "#ffffff" });
    }

    if ($('#txtPowerConsump').val() == "" || $('#txtPowerConsump').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Power Consumption.";
        $('#txtPowerConsump').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtPowerConsump').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtPowerConsump').attr('style', '1px solid #cdcdcd !important;');
        $('#txtPowerConsump').css({ "background-color": "#ffffff" });
    }

    if ($('#txtSawUsedType').val() == "" || $('#txtSawUsedType').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Type of Saw Used.";
        $('#txtSawUsedType').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtSawUsedType').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtSawUsedType').attr('style', '1px solid #cdcdcd !important;');
        $('#txtSawUsedType').css({ "background-color": "#ffffff" });
    }

    if ($('#txtSawDimension').val() == "" || $('#txtSawDimension').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Dimension of Saw.";
        $('#txtSawDimension').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtSawDimension').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtSawDimension').attr('style', '1px solid #cdcdcd !important;');
        $('#txtSawDimension').css({ "background-color": "#ffffff" });
    }

    if ($('#txtProdManuf').val() == "" || $('#txtProdManuf').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Products Manufacture.";
        $('#txtProdManuf').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtProdManuf').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtProdManuf').attr('style', '1px solid #cdcdcd !important;');
        $('#txtProdManuf').css({ "background-color": "#ffffff" });
    }

    if ($('#txtAnnualConsump').val() == "" || $('#txtAnnualConsump').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Averg./Est. Wood Consumption(p.a.)";
        $('#txtAnnualConsump').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtAnnualConsump').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtAnnualConsump').attr('style', '1px solid #cdcdcd !important;');
        $('#txtAnnualConsump').css({ "background-color": "#ffffff" });
    }

    if ($('#txtIndusBankName').val() == "" || $('#txtIndusBankName').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Bank Name.";
        $('#txtIndusBankName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtIndusBankName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtIndusBankName').attr('style', '1px solid #cdcdcd !important;');
        $('#txtIndusBankName').css({ "background-color": "#ffffff" });
    }

    if ($('#txtIndusACNo').val() == "" || $('#txtIndusACNo').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Account Number.";
        $('#txtIndusACNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtIndusACNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtIndusACNo').attr('style', '1px solid #cdcdcd !important;');
        $('#txtIndusACNo').css({ "background-color": "#ffffff" });
    }

    if ($('#txtIndusIFSCCode').val() == "" || $('#txtIndusIFSCCode').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Account IFS Code.";
        $('#txtIndusIFSCCode').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtIndusIFSCCode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtIndusIFSCCode').attr('style', '1px solid #cdcdcd !important;');
        $('#txtIndusIFSCCode').css({ "background-color": "#ffffff" });
    }

    if ($('#txtIndusBankPlace').val() == "" || $('#txtIndusBankPlace').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Bank Place.";
        $('#txtIndusBankPlace').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtIndusBankPlace').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtIndusBankPlace').attr('style', '1px solid #cdcdcd !important;');
        $('#txtIndusBankPlace').css({ "background-color": "#ffffff" });
    }

    if ($('#ddlCircle').val() == "-Select-" || $('#ddlCircle').val() == "0") {
        text += "<BR>" + " \u002A" + " Please Select Circle From List.";
        $('#ddlCircle').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlCircle').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlCircle').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlCircle').css({ "background-color": "#ffffff" });
    }
    if ($('#ddlDivision').val() == "-Select-" || $('#ddlDivision').val() == "0") {
        text += "<BR>" + " \u002A" + " Please Select division From List.";
        $('#ddlDivision').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlDivision').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlDivision').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlDivision').css({ "background-color": "#ffffff" });
    }

    if ($('#ddlRange').val() == "-Select-" || $('#ddlRange').val() == "0") {
        text += "<BR>" + " \u002A" + " Please Select Range From List.";
        $('#ddlRange').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlRange').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlRange').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlRange').css({ "background-color": "#ffffff" });
    }


    var BoardAgreement = $("input:radio[name='BoardAgreement']:checked").val();
    if (BoardAgreement == "" || BoardAgreement == null)
    {
        text += "<BR>" + " \u002A" + " Please Select Whether Access and Benefit sharing agreement done with producer /State Biodiversity Board.";
        $('#BA').attr('style', 'color:red !important;');
        opt = 1;
    } else
    {
        $('#BA').attr('style', 'color:white !important;');
    }

    var ConcentEstablish = $("input:radio[name='ConcentEstablish']:checked").val();
    if (ConcentEstablish == "" || ConcentEstablish == null)
    {
        text += "<BR>" + " \u002A" + " Please Select Whether Consent to Establish & Constent to Operate granted by Uttarakhand State Pollution Control Board.";
        $('#CA').attr('style', 'color:red !important;');
        opt = 1;
    } else
    {
        $('#CA').attr('style', 'color:white !important;');
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

    if ($('#txtEstDate').val() != '')
    {
        var EstDate = $('#txtEstDate').val().split("/");
        EstDate = EstDate[2] + "-" + EstDate[1] + "-" + EstDate[0];
    }
    else
    {
        var EstDate = "";
    }

    if ($('#txtAppDate').val() != '')
    {
        var AppDate = $('#txtAppDate').val().split("/");
        AppDate = AppDate[2] + "-" + AppDate[1] + "-" + AppDate[0];
    }
    else
    {
        var AppDate = "";
    }

    var BoardAgreement = $("input:radio[name='BoardAgreement']:checked").val();
    var ConcentEstablish = $("input:radio[name='ConcentEstablish']:checked").val();

    var datavar = {
        'ServiceID': svcid,
        'ProfileID': uid,
        'RenewalType': $('#ddlRenewalType').val(),
        'IndustryType': $('#ddlIndustryType').val(),
        'IndustryName': $('#txtIndustryName').val(),
        'ApplicationDate': AppDate,
        'TanPanNo': $('#txtTanPanNo').val(),
        'Latitude': $('#txtGPSLocLong').val() + '#' + $('#txtGPSLocLati').val() + '#' + $('#txtCornor1LatdSecond').val(),
        'Longitude': $('#txtCornor1LongDegree').val() + '#' + $('#txtCornor1LongMinute').val() + '#' + $('#txtCornor1LongSecond').val(),
        'MDName': $('#txtIPropMDName').val(),
        'MDAadhaarNo': $('#txtIPropMDUIDNo').val(),
        'EstbDate': EstDate,
        'RegNo': $('#txtIndusRegNo').val(),
        'Address': $('#txtIndusAddress').val(),
        'Pincode': $('#txtIndusAddressPin').val(),
        'OfficeNo': $('#txtIndusLandlineNo').val(),
        'IndustrialArea': $('#ddlNotIndusArea').val(),
        'MunicipalArea': $('#ddlMunicipalArea').val(),
        'MDMobileNo': $('#txtMDMobileNo').val(),
        'MDEMailID': $('#txtMDEMailID').val(),
        'WoodType': $('#ddlWoodType').val(),
        'WoodSpecies': $('#txtSpeciesWood').val(),
        'WoodUsed': $('#txtWoodUsed').val(),
        'WoodSource': $('#txtWoodSource').val(),
        'InstalledCapacity': $('#txtInstallCap').val(),
        'EquipmentsUsed': $('#txtIEqupUsed').val(),
        'PowerConsumption': $('#txtPowerConsump').val(),
        'SawType': $('#txtSawUsedType').val(),
        'SawDimension': $('#txtSawDimension').val(),
        'Manufracture': $('#txtProdManuf').val(),
        'WoodConsumption': $('#txtAnnualConsump').val(),
        'BankName': $('#txtIndusBankName').val(),
        'AccountNo': $('#txtIndusACNo').val(),
        'IFSCCode': $('#txtIndusIFSCCode').val(),
        'Place': $('#txtIndusBankPlace').val(),
        'BoardAgreement': BoardAgreement,
        'ConcentEstablish': ConcentEstablish,
        'Image': $('#HFb64').val(),
        'Sign': $('#HFb64Sign').val(),
        'Circle': $('#ddlCircle').val(),
        'Division': $('#ddlDivision').val(),
        'Range': $('#ddlRange').val()

    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebAppUK/Forest/SawMill/LicenseForm.aspx/InsertSawMillData',
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

// ********************* VALIDATION CHECK ****************** //

function ValiateEmail() {
    var EmailID = $("#txtMDEMailID");
    if (EmailID.val() != '') {
        var emailmatch = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (!emailmatch.test(EmailID.val())) {
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

function Declaration(chk)
{
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
            $("#lblUName").text(name);
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