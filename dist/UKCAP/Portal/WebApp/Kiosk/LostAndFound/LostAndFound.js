$(document).ready(function ()
{
    $('#btnSubmit').prop('disabled', true);
    $("#divDeclaration").hide(800);

    $("#AllDetails").hide();
   

    $('#txtVehicleNo').prop('disabled', true);

    GetState();

    $('#txtLostFoundDate').datetimepicker({
        //viewMode: 'years',
        //minDate: new Date(),
        //controlType: 'select'
    });

    //$('#ddlItemType').change(function ()
    $('#ddlItemType').bind("change", function (e)
    {
        if ($('#ddlItemType').val() == "Vehicle")
        {
            $('#txtVehicleNo').val('');
            $('#txtVehicleNo').prop('disabled', false);
        }
        else
        {
            $('#txtVehicleNo').val('-');
            $('#txtVehicleNo').prop('disabled', true);
        }
    });
});

function LostFound()
{
   // document.forms[0].submit();
    $("#AllDetails").show('400');
}

function Declaration(chk)
{
    $('#btnSubmit').prop('disabled', true);
    if (chk)
    {
        var name = $('#txtFullName').val();
        if (name == '' || name == null)
        {
            alertPopup("Declaration Check", "Please Enter Your Full Name.");
            $('#chkDeclaration').prop('checked', false);
        }
        else
        {
            $("#lblName").html(name);
            $('#btnSubmit').prop('disabled', false);
            $("#divDeclaration").show(800);
        }
    }
    else
    {
        $("#lblName").html("");
        $('#btnSubmit').prop('disabled', true);
        $("#divDeclaration").hide(800);
    }
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
    debugger;
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
    debugger;
    var SelSubDistrict = $('#ddlTaluka').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",        
        url: "/WebApp/Registration/KioskRegistration.aspx/GetVillage",
        data: '{"prefix":"","SubDistrictCode":"' + SelSubDistrict + '"}',
        dataType: "json",
        success: function (response)
        {
            debugger;
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

// Logic For Add More //

//**************add more function for Servant details.***************************
function AddLostFoundItem(DeleteString)
{
    if (validateValues(DeleteString) == true)
    {
        var Str = "";
        var SrNo = "";
        var strItem = "";
        var strManufacturer = "";
        var strModel = "";
        var strUniqueNo = "";
        var strLFDate = "";
        var strLFPlace = "";
        var strItemDesc = "";
        var strVehicleNo = "";

        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";

        if (DeleteString == "")
        {
            strItem = $('#ddlItemType option:selected').text();
            strManufacturer = $('#txtManufacture').val();
            strModel = $('#txtModel').val();
            strUniqueNo = $('#txtUniqueNo').val();
            strLostFoundDate = $('#txtLostFoundDate').val();
            strLostFoundPlace = $('#txtLostFoundPlace').val();
            strItemDescription = $('#txtItemDescription').val();
            strVehicleNo = $('#txtVehicleNo').val();

            strTempString = document.getElementById("hdfLostFound").value + "#" + SrNo + "," + strItem + "," + strManufacturer + "," + strModel + "," + strUniqueNo + "," + strLostFoundDate + "," + strLostFoundPlace + "," + strItemDescription + "," + strVehicleNo + "#";
        }
        else
        {
            strTempString = document.getElementById("hdfLostFound").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblAddMore' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sl.No.</th>";
        Str = Str + "<th style='text-align: center;'>Item</th>";
        Str = Str + "<th style='text-align: center;'>Manufacturer</th>";
        Str = Str + "<th style='text-align: center;'>Model</th>";
        Str = Str + "<th style='text-align: center;'>Serial No. / IMEI No. / Chasis No.</th>";
        Str = Str + "<th style='text-align: center;'>Lost / Found Date</th>";
        Str = Str + "<th style='text-align: center;'>Lost / Found Place</th>";
        Str = Str + "<th style='text-align: center;'>Item Description</th>";
        Str = Str + "<th style='text-align: center;'>Vehicle No</th>";
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
            strItem = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strManufacturer = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strModel = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strUniqueNo = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strLostFoundDate = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strLostFoundPlace = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strItemDescription = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strVehicleNo = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            strVehicleNo = RemStr;

            var DeleteString = "#" + SrNo + "," + strItem + "," + strManufacturer + "," + strModel + "," + strUniqueNo + "," + strLostFoundDate + "," + strLostFoundPlace + "," + strItemDescription + "," + strVehicleNo + "#";

            Str = Str + "<tr>";
            Str = Str + "<td style='width:65px' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strItem + "</td>";
            Str = Str + "<td style='' >" + strManufacturer + "</td>";
            Str = Str + "<td style='' >" + strModel + "</td>";
            Str = Str + "<td style='' >" + strUniqueNo + "</td>";
            Str = Str + "<td style='' >" + strLostFoundDate + "</td>";
            Str = Str + "<td style='' >" + strLostFoundPlace + "</td>";
            Str = Str + "<td style='' >" + strItemDescription + "</td>";
            Str = Str + "<td style='' >" + strVehicleNo + "</td>";
            Str = Str + "<td align='center' style='width:85px'><input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelStringS(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";

            strSuspect = strSuspect + "#" + SrNo + "," + strItem + "," + strManufacturer + "," + strModel + "," + strUniqueNo + "," + strLostFoundDate + "," + strLostFoundPlace + "," + strItemDescription + "," + strVehicleNo + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + strItem + "," + strManufacturer + "," + strModel + "," + strUniqueNo + "," + strLostFoundDate + "," + strLostFoundPlace + "," + strItemDescription + "," + strVehicleNo + "#";

            var HeirsDXMLS = strSaveSuspect;

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);
        }

        Str = Str + "</table>";
        $("#divmore").show();
        document.getElementById('divmore').innerHTML = Str;
        document.getElementById("hdfLostFound").value = strSuspect;
        document.getElementById("hdfLostFoundSave").value = strSaveSuspect;
        document.getElementById("hdfLostFoundString").value = intCount;

        strItem = $('#ddlItemType option:selected').focus();
        strManufacturer = $('#txtManufacture').val('');
        strModel = $('#txtModel').val('');
        strUniqueNo = $('#txtUniqueNo').val('');
        strLostFoundDate = $('#txtLostFoundDate').val('');
        strLostFoundPlace = $('#txtLostFoundPlace').val('');
        strItemDescription = $('#txtItemDescription').val('');
        strVehicleNo = $('#txtVehicleNo').val('');
    }
}

function DelStringS(DeleteString)
{
    var Msg = "Do you want remove this Entry?";
    if (confirm(Msg))
    {
        var strString = document.getElementById('hdfLostFound').value;
        strString = strString.replace(DeleteString, "");
        document.getElementById('hdfLostFound').value = strString;
        AddLostFoundItem(DeleteString);
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

    var Item = $('#ddlItemType option:selected').text();
    if (Item == "--Select--")
    {
        text += "<BR>" + " \u002A" + " Please Select Item From List.";
        //$('#ddlItemType').attr('style', 'color:red !important;');
        //$('#ddlItemType').css({ "color": "red !important;" });
        $('#ddlItemType').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlItemType').css({ "background-color": "#fff2ee" });

        opt = 1;
    } else
    {
        $('#ddlItemType').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlItemType').css({ "background-color": "#ffffff" });
    }

    var Manufacturer = $('#txtManufacture').val();
    if (Manufacturer == "" || Manufacturer == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Manufacture Name.";
        $('#txtManufacture').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtManufacture').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtManufacture').attr('style', '1px solid #cdcdcd !important;');
        $('#txtManufacture').css({ "background-color": "#ffffff" });
    }

    var Model = $('#txtModel').val();
    if (Model == "" || Model == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Model Name.";
        $('#txtModel').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtModel').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtModel').attr('style', '1px solid #cdcdcd !important;');
        $('#txtModel').css({ "background-color": "#ffffff" });
    }

    var UniqueNo = $('#txtUniqueNo').val();
    if (UniqueNo == "" || UniqueNo == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Serial No. / IMEI No. / Chasis No.";
        $('#txtUniqueNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtUniqueNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtUniqueNo').attr('style', '1px solid #cdcdcd !important;');
        $('#txtUniqueNo').css({ "background-color": "#ffffff" });
    }

    var LostFoundDate = $('#txtLostFoundDate').val();
    if (LostFoundDate == "" || LostFoundDate == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Lost / Found Date.";
        $('#txtLostFoundDate').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtLostFoundDate').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        opt = 0;
        $('#txtLostFoundDate').attr('style', '1px solid #cdcdcd !important;');
        $('#txtLostFoundDate').css({ "background-color": "#ffffff" });
    }

    var LostFoundPlace = $('#txtLostFoundPlace').val();
    if (LostFoundPlace == "" || LostFoundPlace == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Lost / Found Place.";
        $('#txtLostFoundPlace').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtLostFoundPlace').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtLostFoundPlace').attr('style', '1px solid #cdcdcd !important;');
        $('#txtLostFoundPlace').css({ "background-color": "#ffffff" });
    }

    var ItemDescription = $('#txtItemDescription').val();
    if (ItemDescription == "" || ItemDescription == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Item Description.";
        $('#txtItemDescription').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtItemDescription').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtItemDescription').attr('style', '1px solid #cdcdcd !important;');
        $('#txtItemDescription').css({ "background-color": "#ffffff" });
    }

    var VehicleNo = $('#txtVehicleNo').val();
    if ($('#ddlItemType').val() == "Vehicle")
    {
        if (VehicleNo == "" || VehicleNo == null)
        {
            text += "<BR>" + " \u002A" + " Please Enter Vehicle No.";
            $('#txtVehicleNo').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtVehicleNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else
        {
            $('#txtVehicleNo').attr('style', '1px solid #cdcdcd !important;');
            $('#txtVehicleNo').css({ "background-color": "#ffffff" });
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
    debugger;
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

    var temp = "Gunwant";
    var AppID = "";
    var rtnurl = "";

    var TypeOfService = $("input:radio[name='RegisterType']:checked").val();

    var datavar = {
        'ServiceID': svcid,
        'ServiceType': TypeOfService,
        'CitizenName': $('#txtFullName').val(),
        'MobileNo': $('#txtMobileNo').val(),
        'EmailId': $('#txtEmailId').val(),
        'AddressLine1': $('#txtAddressLine1').val(),
        'AddressLine2': $('#txtAddressLine2').val(),
        'RoadStreetName': $('#txtRoadStreetName').val(),
        'LandMark': $('#txtLandMark').val(),
        'Locality': $('#txtLocality').val(),
        'State': $('#ddlState').val(),
        'District': $('#ddlDistrict').val(),
        'BlockTaluka': $('#ddlTaluka').val(),
        'PanchayatVillage': $('#ddlVillage').val(),
        'PinCode': $('#txtPinCode').val(),

        'HeirsDXML': document.getElementById("hdfLostFoundSave").value,
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/LostAndFound/LostFoundRegistration.aspx/InsertLostFoundData',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response)
            {
            },
            error: function (a, b, c)
            {
                $("#btnSubmit").prop('disabled', false);
                result = false;
                alertPopup("Could Not Save the Application, Please try again.", "5. " + a.responseText);
            }
        })
    ).then(function (data, textStatus, jqXHR)
    {
        debugger;
        var obj = jQuery.parseJSON(data.d);
        var html = "";
        var status = obj.Status;

        AppID = obj.AppID;
        result = true;
        if (AppID == "" || AppID == null)
        {
            alertPopup("Form Validation Failed", "Error While Saving Application., <BR> Either You Have Used MobileNumber or AadhaarNumber Which Has Been Used Earlier.");
            //rtnurl = "/Account/Login";
            //window.location.href = rtnurl;
            //return;
        }
        else
        {
            if (status == "Success")
            {
                alertPopup("Lost And Found", "Lost And Found Request Saved Successfully. <br> Your Reference ID : " + obj.AppID);
                window.location.href = '/WebApp/Kiosk/LostAndFound/LFAttachment.aspx?SvcID=463&AppID=' + obj.AppID;
            }
        }
    });// end of Then function of main Data Insert Function
    return false;
}
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
    var EmailID = $("#txtEmailId");
    if (EmailID.val() != '') {
        var emailmatch = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (!emailmatch.test(EmailID.val())) {
            $("#txtEmailId").val('');
            EmailID.attr('style', 'border:1px solid #d03100 !important;');
            EmailID.css({ "background-color": "#fff2ee" });
            alertPopup("Email Validation", "<BR>" + " \u002A" + " Please Enter EmailID In Proper Format.")
        }
    }
}
function checkpincode() {
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