$(document).ready(function ()
{
    $("#btnSubmit2").prop('disabled', true);
    $("#divDeclaration").hide(800);

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

    //$("#divDeclaration").hide(800);

    fnSearchData();

    GetDistrict();
    GetCircleList();
});

function GetSupportingDocument() {
    debugger;
    var SCODE = $('#ddlDocTypes').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/Forest/Construction/ConstructionNocForm.aspx/GetSupportingDocument",
        data: '{"prefix":"","DCode":"' + SCODE + '"}',
        dataType: "json",
        success: function (r) {
            var ddl = $("[id*=ddlSupporting]");
            ddl.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                $("[id*=ddlSupporting]").append('<option value = "' + this.DocID + '">' + this.DocName + '</option>');
            });
        }
    });
}
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

function GetDistrict()
{
    var SelState = "5";//$('#ddlState').val();
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
            var ddlDistrict1 = $("[id=ddlDistrict]");
            ddlDistrict1.empty().append('<option selected="selected" value="0">--Select--</option>');
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

function GetTaluka()
{
    debugger;
    var SelBlock2 = $("#ddlDistrict option:selected").val(); //$('#ddlDistrict').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict",
        data: '{"prefix":"","DistrictCode":"' + SelBlock2 + '"}',
        dataType: "json",
        success: function (response)
        {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            var ddlBlock1 = $("[id=ddlTaluka]");
            ddlBlock1.empty().append('<option selected="selected" value="0">--Select--</option>');
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
    GetUKBlock();

}

function GetVillage()
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

    GetUKPanchayat();
}


function GetUKBlock() {
    var SelBlock1 = $('#ddlDistrict').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKBlock",
        data: '{"prefix":"","DistrictCode":"' + SelBlock1 + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=ddlBlock]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select Block-</option>');
            $.each(r.d, function () {
                $("[id*=ddlBlock]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
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
            var ddlCustomers = $("[id*=ddlGramPanchayat]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select Gram Panchayat-</option>');
            $.each(r.d, function () {
                $("[id*=ddlGramPanchayat]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
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

    window.location.href = '/WebAppUK/Forest/trekking/trackingform.aspx?SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr + '&UID=' + uid + '';
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

    if ($('#ddlConstPurpose').val() == "-Select-" || $('#ddlConstPurpose').val() == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select Construction Purpose From List.";
        $('#ddlConstPurpose').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlConstPurpose').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlConstPurpose').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlConstPurpose').css({ "background-color": "#ffffff" });
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

    if ($('#txtEmailID').val() == "" || $('#txtEmailID').val() == null)
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


    var IDProof = $('#ddlIDProofType').val();
    if (IDProof == "-Select-" || IDProof == "0") {
        text += "<BR>" + " \u002A" + " Please Select Valid ID From List.";
        $('#ddlIDProofType').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlIDProofType').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlIDProofType').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlIDProofType').css({ "background-color": "#ffffff" });
    }

    if ($('#txtAadhaarNo').val() == "" || $('#txtAadhaarNo').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter ID Number.";
        $('#txtAadhaarNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtAadhaarNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtAadhaarNo').attr('style', '1px solid #cdcdcd !important;');
        $('#txtAadhaarNo').css({ "background-color": "#ffffff" });
    }
    var IDProofDetail = $('#txtAadhaarNo').val();

    if (IDProof == "AadhaarCard") {
        debugger;
        if (checkUID(IDProofDetail) == false) {
            text += "<BR>" + " \u002A" + " Please Enter Valid 12 Digit Aadhar no ";
            $('#txtAadhaarNo').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtAadhaarNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtAadhaarNo').attr('style', '1px solid #cdcdcd !important;');
            $('#txtAadhaarNo').css({ "background-color": "#ffffff" });
        }
    }
    if (IDProof == "PAN") {
        debugger;
        if (checkPAN(IDProofDetail) == false) {
            text += "<BR>" + " \u002A" + " Please Enter Valid PAN no ";
            $('#txtAadhaarNo').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtAadhaarNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtAadhaarNo').attr('style', '1px solid #cdcdcd !important;');
            $('#txtAadhaarNo').css({ "background-color": "#ffffff" });
        }
    }



    if ($('#txtAreaHrctre').val() == "" || $('#txtAreaHrctre').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Area (in hectare).";
        $('#txtAreaHrctre').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtAreaHrctre').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtAreaHrctre').attr('style', '1px solid #cdcdcd !important;');
        $('#txtAreaHrctre').css({ "background-color": "#ffffff" });
    }

    if ($('#txtMobileNo').val() == "" || $('#txtMobileNo').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Mobile Number.";
        $('#txtMobileNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtMobileNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtMobileNo').attr('style', '1px solid #cdcdcd !important;');
        $('#txtMobileNo').css({ "background-color": "#ffffff" });
    }

    if ($('#txtAerialDistance').val() == "" || $('#txtAerialDistance').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Aerial Distance from Notified Forest.";
        $('#txtAerialDistance').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtAerialDistance').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtAerialDistance').attr('style', '1px solid #cdcdcd !important;');
        $('#txtAerialDistance').css({ "background-color": "#ffffff" });
    }

    if ($('#txtFullConstDetail').val() == "" || $('#txtFullConstDetail').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Construction Site Address with khasra/khatauni.";
        $('#txtFullConstDetail').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFullConstDetail').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtFullConstDetail').attr('style', '1px solid #cdcdcd !important;');
        $('#txtFullConstDetail').css({ "background-color": "#ffffff" });
    }

    if ($('#txtFullAddressDetail').val() == "" || $('#txtFullAddressDetail').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Full Address with khasra/khatauni Detail.";
        $('#txtFullAddressDetail').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFullAddressDetail').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtFullAddressDetail').attr('style', '1px solid #cdcdcd !important;');
        $('#txtFullAddressDetail').css({ "background-color": "#ffffff" });
    }
    if ($('#txtLocationLand').val() == "" || $('#txtLocationLand').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter land Location.";
        $('#txtLocationLand').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtLocationLand').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtLocationLand').attr('style', '1px solid #cdcdcd !important;');
        $('#txtLocationLand').css({ "background-color": "#ffffff" });
    }

    
    if ($('#ddlDistrict').val() == "-Select-" || $('#ddlDistrict').val() == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select District From List.";
        $('#ddlDistrict').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlDistrict').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlDistrict').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlDistrict').css({ "background-color": "#ffffff" });
    }

    if ($('#ddlTaluka').val() == "-Select-" || $('#ddlTaluka').val() == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select taluka From List.";
        $('#ddlTaluka').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlTaluka').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlTaluka').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlTaluka').css({ "background-color": "#ffffff" });
    }

    if ($('#ddlBlock').val() == "-Select-" || $('#ddlBlock').val() == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select Block From List.";
        $('#ddlBlock').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlBlock').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlBlock').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlBlock').css({ "background-color": "#ffffff" });
    }

    if ($('#ddlThana').val() == "" || $('#ddlThana').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please enter Thana .";
        $('#ddlThana').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlThana').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlThana').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlThana').css({ "background-color": "#ffffff" });
    }
    if ($('#ddlGramPanchayat').val() == "-Select-" || $('#ddlGramPanchayat').val() == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select GramPanchayat From List.";
        $('#ddlGramPanchayat').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlGramPanchayat').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlGramPanchayat').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlGramPanchayat').css({ "background-color": "#ffffff" });
    }

    if ($('#ddlVillage').val() == "-Select-" || $('#ddlVillage').val() == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select Village From List.";
        $('#ddlVillage').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlVillage').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlVillage').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlVillage').css({ "background-color": "#ffffff" });
    }
    if ($('#ddlCircle').val() == "-Select-" || $('#ddlCircle').val() == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select Circle From List.";
        $('#ddlCircle').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlCircle').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlCircle').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlCircle').css({ "background-color": "#ffffff" });
    }
    if ($('#ddlDivision').val() == "-Select-" || $('#ddlDivision').val() == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select division From List.";
        $('#ddlDivision').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlDivision').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlDivision').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlDivision').css({ "background-color": "#ffffff" });
    }

    if ($('#ddlRange').val() == "-Select-" || $('#ddlRange').val() == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select Range From List.";
        $('#ddlRange').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlRange').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlRange').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlRange').css({ "background-color": "#ffffff" });
    }

    if ( $('#txtThaneNo').val() == "")
    {
        text += "<BR>" + " \u002A" + " Please Enter Thane No.";
        $('#txtThaneNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtThaneNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtThaneNo').attr('style', '1px solid #cdcdcd !important;');
        $('#txtThaneNo').css({ "background-color": "#ffffff" });
    }
    if ( $('#txtKhata').val() == "")
    {
        text += "<BR>" + " \u002A" + " Please Enter khata No.";
        $('#txtKhata').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtKhata').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtKhata').attr('style', '1px solid #cdcdcd !important;');
        $('#txtKhata').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor1LatdDegree').val() == "" || $('#txtCornor1LatdDegree').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Corner 1 Latitude Degree Coordinates.";
        $('#txtCornor1LatdDegree').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor1LatdDegree').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtCornor1LatdDegree').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor1LatdDegree').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor1LongDegree').val() == "" || $('#txtCornor1LongDegree').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Corner 1 Longitude Degree Coordinates.";
        $('#txtCornor1LongDegree').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor1LongDegree').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtCornor1LongDegree').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor1LongDegree').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor2LatdDegree').val() == "" || $('#txtCornor2LatdDegree').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Corner 2 Degree Latitude Coordinates.";
        $('#txtCornor2LatdDegree').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor2LatdDegree').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtCornor2LatdDegree').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor2LatdDegree').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor2LongDegree').val() == "" || $('#txtCornor2LongDegree').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Corner 2 Degree Longitude Coordinates.";
        $('#txtCornor2LongDegree').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor2LongDegree').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtCornor2LongDegree').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor2LongDegree').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor3LatdDegree').val() == "" || $('#txtCornor3LatdDegree').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Corner 3 Degree Latitude Coordinates.";
        $('#txtCornor3LatdDegree').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor3LatdDegree').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtCornor3LatdDegree').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor3LatdDegree').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor3LongDegree').val() == "" || $('#txtCornor3LongDegree').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Corner 3 Degree Longitude Coordinates.";
        $('#txtCornor3Long').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor3Long').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtCornor3LongDegree').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor3LongDegree').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor4LatdDegree').val() == "" || $('#txtCornor4LatdDegree').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Corner 4 Degree Latitude Coordinates.";
        $('#txtCornor4LatdDegree').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor4LatdDegree').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtCornor4LatdDegree').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor4LatdDegree').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor4LongDegree').val() == "" || $('#txtCornor4LongDegree').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Corner 4 Degree Longitude Coordinates.";
        $('#txtCornor4LongDegree').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor4LongDegree').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtCornor4LongDegree').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor4LongDegree').css({ "background-color": "#ffffff" });
    } 

    //@@

    if ($('#txtCornor1LatdMinute').val() == "" || $('#txtCornor1LatdMinute').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Corner 1 Latitude Minute Coordinates.";
        $('#txtCornor1LatdMinute').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor1LatdMinute').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtCornor1LatdMinute').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor1LatdMinute').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor1LongMinute').val() == "" || $('#txtCornor1LongMinute').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Corner 1 Longitude Minute Coordinates.";
        $('#txtCornor1LongMinute').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor1LongMinute').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtCornor1LongMinute').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor1LongMinute').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor2LatdMinute').val() == "" || $('#txtCornor2LatdMinute').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Corner 2 Minute Latitude Coordinates.";
        $('#txtCornor2LatdMinute').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor2LatdMinute').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtCornor2LatdMinute').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor2LatdMinute').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor2LongMinute').val() == "" || $('#txtCornor2LongMinute').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Corner 2 Minute Longitude Coordinates.";
        $('#txtCornor2LongMinute').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor2LongMinute').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtCornor2LongMinute').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor2LongMinute').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor3LatdMinute').val() == "" || $('#txtCornor3LatdMinute').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Corner 3 Minute Latitude Coordinates.";
        $('#txtCornor3LatdMinute').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor3LatdMinute').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtCornor3LatdMinute').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor3LatdMinute').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor3LongMinute').val() == "" || $('#txtCornor3LongMinute').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Corner 3 Minute Longitude Coordinates.";
        $('#txtCornor3Long').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor3Long').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtCornor3LongMinute').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor3LongMinute').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor4LatdMinute').val() == "" || $('#txtCornor4LatdMinute').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Corner 4 Minute Latitude Coordinates.";
        $('#txtCornor4LatdMinute').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor4LatdMinute').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtCornor4LatdMinute').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor4LatdMinute').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor4LongMinute').val() == "" || $('#txtCornor4LongMinute').val() == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Corner 4 Minute Longitude Coordinates.";
        $('#txtCornor4LongMinute').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor4LongMinute').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtCornor4LongMinute').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor4LongMinute').css({ "background-color": "#ffffff" });
    } 

    if ($('#txtCornor1LatdSecond').val() == "" || $('#txtCornor1LatdSecond').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Corner 1 Latitude Second Coordinates.";
        $('#txtCornor1LatdSecond').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor1LatdSecond').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCornor1LatdSecond').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor1LatdSecond').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor1LongSecond').val() == "" || $('#txtCornor1LongSecond').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Corner 1 Longitude Second Coordinates.";
        $('#txtCornor1LongSecond').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor1LongSecond').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCornor1LongSecond').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor1LongSecond').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor2LatdSecond').val() == "" || $('#txtCornor2LatdSecond').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Corner 2 Second Latitude Coordinates.";
        $('#txtCornor2LatdSecond').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor2LatdSecond').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCornor2LatdSecond').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor2LatdSecond').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor2LongSecond').val() == "" || $('#txtCornor2LongSecond').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Corner 2 Second Longitude Coordinates.";
        $('#txtCornor2LongSecond').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor2LongSecond').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCornor2LongSecond').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor2LongSecond').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor3LatdSecond').val() == "" || $('#txtCornor3LatdSecond').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Corner 3 Second Latitude Coordinates.";
        $('#txtCornor3LatdSecond').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor3LatdSecond').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCornor3LatdSecond').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor3LatdSecond').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor3LongSecond').val() == "" || $('#txtCornor3LongSecond').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Corner 3 Second Longitude Coordinates.";
        $('#txtCornor3Long').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor3Long').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCornor3LongSecond').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor3LongSecond').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor4LatdSecond').val() == "" || $('#txtCornor4LatdSecond').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Corner 4 Second Latitude Coordinates.";
        $('#txtCornor4LatdSecond').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor4LatdSecond').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCornor4LatdSecond').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor4LatdSecond').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCornor4LongSecond').val() == "" || $('#txtCornor4LongSecond').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Corner 4 Second Longitude Coordinates.";
        $('#txtCornor4LongSecond').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCornor4LongSecond').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCornor4LongSecond').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCornor4LongSecond').css({ "background-color": "#ffffff" });
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
   
    var datavar = {
        'ServiceID': svcid,
        'ProfileID': uid,
        'ConstPurpose': $('#ddlConstPurpose').val(),
        'ApplicantName': $('#txtApplicantName').val(),
        'EmailID': $('#txtEmailID').val(),
        'MobileNo': $('#txtMobileNo').val(),
        'AadhaarNo': $('#txtAadhaarNo').val(),
        'Area': $('#txtAreaHrctre').val(),
        'AerialDistance': $('#txtAerialDistance').val(),
        'FullConstDetail': $('#txtFullConstDetail').val(),
        'FullAddressDetail': $('#txtFullAddressDetail').val(),

        'LocationLand': $('#txtLocationLand').val(),
       
        'District':  $("#ddlDistrict option:selected").text() ,
        'Taluka': $("#ddlTaluka option:selected").text() ,
        'Block': $("#ddlBlock option:selected").text() ,
        'Thana': $('#ddlThana').val() ,
    'GramPanchayat': $("#ddlGramPanchayat option:selected").text() ,
    'Village': $("#ddlVillage option:selected").text() ,
    'Circle': $("#ddlCircle option:selected").text() ,
        'Division': $("#ddlDivision option:selected").text() ,
        'Range': $("#ddlRange option:selected").text()  ,
        'ThaneNo': $('#txtThaneNo').val(),
        'Khata': $('#txtKhata').val(),
        
        'Cornor1Latd': $('#txtCornor1LatdDegree').val(),
        'Cornor1Long': $('#txtCornor1LongDegree').val(),
        'Cornor2Latd': $('#txtCornor2LatdDegree').val(),
        'Cornor2Long': $('#txtCornor2LongDegree').val(),
        'Cornor3Latd': $('#txtCornor3LatdDegree').val(),
        'Cornor3Long': $('#txtCornor3LongDegree').val(),
        'Cornor4Latd': $('#txtCornor4LatdDegree').val(),
        'Cornor4Long': $('#txtCornor4LongDegree').val(),

        'Cornor1LatdMinute': $('#txtCornor1LatdMinute').val(),
        'Cornor1LongMinute': $('#txtCornor1LongMinute').val(),
        'Cornor2LatdMinute': $('#txtCornor2LatdMinute').val(),
        'Cornor2LongMinute': $('#txtCornor2LongMinute').val(),
        'Cornor3LatdMinute': $('#txtCornor3LatdMinute').val(),
        'Cornor3LongMinute': $('#txtCornor3LongMinute').val(),
        'Cornor4LatdMinute': $('#txtCornor4LatdMinute').val(),
        'Cornor4LongMinute': $('#txtCornor4LongMinute').val(),

        'Cornor1LatdSecond': $('#txtCornor1LatdSecond').val(),
        'Cornor1LongSecond': $('#txtCornor1LongSecond').val(),
        'Cornor2LatdSecond': $('#txtCornor2LatdSecond').val(),
        'Cornor2LongSecond': $('#txtCornor2LongSecond').val(),
        'Cornor3LatdSecond': $('#txtCornor3LatdSecond').val(),
        'Cornor3LongSecond': $('#txtCornor3LongSecond').val(),
        'Cornor4LatdSecond': $('#txtCornor4LatdSecond').val(),
        'Cornor4LongSecond': $('#txtCornor4LongSecond').val(),

        'FallsOutside': $("input:radio[name='FallsOutside']:checked").val(),
        'HaveNationalPark': $("input:radio[name='HaveNationalPark']:checked").val(),
        'WLSSituated': $("input:radio[name='WLSSituated']:checked").val(),
        'EcoSensitiveZone': $("input:radio[name='EcoSensitiveZone']:checked").val(),
        'OtherArea': $("input:radio[name='OtherArea']:checked").val(),

        'Image': $('#HFb64').val(),
        'Sign': $('#HFb64Sign').val(),
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebAppUK/Forest/Construction/ConstructionNocForm.aspx/InsertConstructionNocData',
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
    var IdentityDetail = $('#ddlIDProofType').val();
    var identityno = $("#txtAadhaarNo").val();
    if (IdentityDetail == 'AadhaarCard')
    {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57))
        {
            $("#txtAadhaarNo").val("");
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
                $("#txtAadhaarNo").val("");
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

function fuShowHideDiv2(divID, isTrue) {
    debugger;
    //alert(divID);
    if (isTrue == "1") {
        $('#' + divID).show(500);
    }
    if (isTrue == "0") {
        $('#' + divID).hide(500);
    }
}
