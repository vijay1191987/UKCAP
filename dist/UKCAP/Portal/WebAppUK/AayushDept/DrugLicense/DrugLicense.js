$(document).ready(function () {
    $("#btnSubmit2").prop('disabled', true);

    EL("File1").addEventListener("change", readFile, false);
    EL("File2").addEventListener("change", readFile2, false);

    //$('#txtFirmDOR').datepicker({
    //    dateFormat: "dd/mm/yy",
    //    changeMonth: true,
    //    changeYear: true,
    //    //maxDate: '-1d',
    //    maxDate: '0',
    //    yearRange: "-40:+40",
    //    onSelect: function (date)
    //    { }
    //});

    $('#txtExpiryDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '-1',
        yearRange: "-100:+40",
        onSelect: function (date) {
          
        }
    });

    $('#txtCExpirydate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '-1',
        yearRange: "-100:+40",
        onSelect: function (date) {

        }
    });
    $('#txtYExpiryDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '-1',
        yearRange: "-100:+40",
        onSelect: function (date) {

        }
    });

    
    $("#divDeclaration").hide(800);


    fnSearchData();
    GetUKDistrict();

    $("[name='Address']").change(function () {
        FetchState(this.value);
    });

});
function dispanel() {
    debugger;
    var dvalue = $('#ddlLicenseType').val();
    if (dvalue == 1) {
        $("#txtLicenseNo").prop('disabled', true);
    }
    else {
        $("#txtLicenseNo").prop('disabled', false);
    }

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

            if (State.length = 1) {
                State = '0' + obj[0].State;
                $('#drpStateName').val(State);
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

            $('#txtFullAddress').val(Address1 + ', ' + Address2 + ', ' + Street + ', ' + Locality + ', ' + Landmark);
            $('#txtPincode').val(PinCode);

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKDistrict",
                data: '{"prefix":"","StateCode":"' + State + '"}',
                processData: false,
                dataType: "json",
                success: function (r) {
                    var ddlCustomers = $("[id*=drpDistrictName]");
                    ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
                    $.each(r.d, function () {
                        $("[id*=drpDistrictName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    });

                    $('#drpDistrictName').val(District);

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKBlock",
                        data: '{"prefix":"","DistrictCode":"' + District + '"}',
                        dataType: "json",
                        success: function (r) {
                            var ddlCustomers = $("[id*=drpSubDistrictName]");
                            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
                            $.each(r.d, function () {
                                $("[id*=drpSubDistrictName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                            });

                            $('#drpSubDistrictName').val(Taluka);

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKPanchayat",
                                data: '{"prefix":"","SubDistrictCode":"' + Taluka + '"}',
                                dataType: "json",
                                success: function (r) {
                                    var ddlCustomers = $("[id*=drpGramPanchayatName]");
                                    ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
                                    $.each(r.d, function () {
                                        $("[id*=drpGramPanchayatName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                    });

                                    $('#drpGramPanchayatName').val(Village);
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
            if (Extension == "png" || Extension == "jpeg" || Extension == "jpg")
            { }
            else
            {
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

function readFile2() {
    if (this.files && this.files[0]) {
        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfSign').val(sizekb);
        if (sizekb < 5 || sizekb > 20) {
            alert('The size of the signature should fall between 10KB to 20KB. Your signature Size is ' + sizekb + 'kb.');
            return false;
        }

        var ftype = this; //document.getElementById('File1');
        var fileupload = ftype.value;
        if (fileupload == '') {
            alert("Signature only allows file types of PNG, JPG, JPEG. ");
            return;
        }
        else {
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
        FR.onload = function (e) {
            EL("mySign").src = e.target.result;
            EL("HFb64Sign").value = e.target.result;
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

function getTrakkingDays() {
    if ($('#ddlArea').val() != "0") {
        var Duration = $('#ddlArea').val();
        var TrackngDays = Duration.split("-");
        TrackngDays = TrackngDays[1];
    }
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
                    $('#txtFullName').val(obj[0]["ApplicantName"]);
                    $('#HDNFNM').val(obj[0]["ApplicantName"]);
                    $('#txtFatherSpouseName').val(obj[0]["FatherName"]);
                    $('#ddlGender').val(obj[0]["Gender"]);
                    $('#txtMobileNo').val(obj[0]["MobileNo"]);
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

                    $('#DateOfBirth').val(DOB);
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
    var SelState = $('#drpStateName').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/StateData",
        data: '{}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=drpStateName]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                $("[id*=drpStateName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });

            $('#drpStateName').val("05");
            GetUKDistrict();

        }
    });
}


function GetUKDistrict() {
    var SelState = "05";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKDistrict",
        data: '{"prefix":"","StateCode":"' + SelState + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=drpDistrictName]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
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
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
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
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function () {
                $("[id*=drpGramPanchayatName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

// Logic For Add More //

//**************add more function for Patent details.***************************
function AddPatentDetail(DeleteString) {
    if (validateValues(DeleteString) == true) {
        var Str = "";
        var SrNo = "";
        var txtIngredients = "";
        var txtLatin = "";
        var txtPart = "";
        var txtQuantity = "";
        var txtClassical = "";
        var txtRefrence = "";

        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";

        if (DeleteString == "") {
            txtIngredients = $('#txtIngredients').val();
            txtLatin = $('#txtLatin').val();
            txtPart = $('#txtPart').val();
            txtQuantity = $('#txtQuantity').val();
            txtClassical = $('#txtClassical').val();
            txtRefrence = $('#txtRefrence').val();

            strTempString = document.getElementById("hdfPatent").value + "#" + SrNo + "," + txtIngredients + "," + txtLatin + "," + txtPart + "," + txtQuantity + "," + txtClassical + "," + txtRefrence + "#";
        }
        else {
            strTempString = document.getElementById("hdfPatent").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblAddMore' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center; width: 14%'>Sl.No.</th>";
        Str = Str + "<th style='text-align: center; width: 14%'>Ingredients</th>";
        Str = Str + "<th style='text-align: center; width: 14% '>Latin Name</th>";
        Str = Str + "<th style='text-align: center; width: 14%'>Part Used</th>";
        Str = Str + "<th style='text-align: center; width: 14%'>Quantity</th>";
        Str = Str + "<th style='text-align: center; width: 14%'>Classical Properties/Users</th>";
        Str = Str + "<th style='text-align: center; width: 14%'>Refrence book with page no</th>";

        Str = Str + "<th style='text-align: center;'>Action</th>";
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
            txtIngredients = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            txtLatin = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            txtPart = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            txtQuantity = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            txtClassical = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            txtRefrence = RemStr;

            var DeleteString = "#" + SrNo + "," + txtIngredients + "," + txtLatin + "," + txtPart + "," + txtQuantity + "," + txtClassical + "," + txtRefrence + "#";

            Str = Str + "<tr>";
            Str = Str + "<td style='' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + txtIngredients + "</td>";
            Str = Str + "<td style='' >" + txtLatin + "</td>";
            Str = Str + "<td style='' >" + txtPart + "</td>";
            Str = Str + "<td style='' >" + txtQuantity + "</td>";
            Str = Str + "<td style='' >" + txtClassical + "</td>";
            Str = Str + "<td style='' >" + txtRefrence + "</td>";
            Str = Str + "<td align='center' style='width:150px'><input type='button' style='min-width:20px' class='btn-outline-danger' value='DELETE' onclick='DelStringPatent(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";

            strSuspect = strSuspect + "#" + SrNo + "," + txtIngredients + "," + txtLatin + "," + txtPart + "," + txtQuantity + "," + txtClassical + "," + txtRefrence + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + txtIngredients + "," + txtLatin + "," + txtPart + "," + txtQuantity + "," + txtClassical + "," + txtRefrence + "#";

            var HeirsDXMLS = strSaveSuspect;

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);
        }

        Str = Str + "</table>";
        $("#divmore").show();
        document.getElementById('divmore').innerHTML = Str;
        document.getElementById("hdfPatent").value = strSuspect;
       

        var tbody = $("#divPartnerDetail tbody");

        if (tbody.children().length >= 1) {
            $("#divPartnerDetail").show(800);
            //$("#btnSubmit2").prop('disabled', false);
        }


        txtIngredients = $('#txtIngredients').val('');
        txtLatin = $('#txtLatin').val('');
        txtPart = $('#txtPart').val('');
        txtQuantity = $('#txtQuantity').val('');
        txtClassical = $('#txtClassical').val('');
        txtRefrence = $('#txtRefrence').val('');

    }
}


function DelStringPatent(DeleteString) {
    var Msg = "Do you want remove this Entry?";
    if (confirm(Msg)) {
        var strString = document.getElementById('hdfPatent').value;
        strString = strString.replace(DeleteString, "");
        document.getElementById('hdfPatent').value = strString;
        AddPatentDetail(DeleteString);
    }

    var tbody = $("#divmore tbody");

    if (tbody.children().length == 1) {
        $("#divPartnerDetail").hide(800);
        $("#btnSubmit2").prop('disabled', true);
    }
}


function validateValues(DeleteString) {
    if (DeleteString != '') {
        return true;
    }

    var text = "";
    var opt = "";


    if ($('#txtIngredients').val() == "" || $('#txtIngredients').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Ingredients Name.";
        $('#txtIngredients').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtIngredients').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtIngredients').attr('style', '1px solid #cdcdcd !important;');
        $('#txtIngredients').css({ "background-color": "#ffffff" });
    }

    if ($('#txtLatin').val() == "" || $('#txtLatin').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Latin Name.";
        $('#txtLatin').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtLatin').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtLatin').attr('style', '1px solid #cdcdcd !important;');
        $('#txtLatin').css({ "background-color": "#ffffff" });
    }

    if ($('#txtPart').val() == "" || $('#txtPart').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Part Ussed";
        $('#txtPart').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtPart').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtPart').attr('style', '1px solid #cdcdcd !important;');
        $('#txtPart').css({ "background-color": "#ffffff" });
    }

    if ($('#txtQuantity').val() == "" || $('#txtQuantity').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Quantity";
        $('#txtQuantity').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtQuantity').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtQuantity').attr('style', '1px solid #cdcdcd !important;');
        $('#txtQuantity').css({ "background-color": "#ffffff" });
    }

    if ($('#txtClassical').val() == "" || $('#txtClassical').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Classical Properties/Users";
        $('#txtClassical').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtClassical').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtClassical').attr('style', '1px solid #cdcdcd !important;');
        $('#txtClassical').css({ "background-color": "#ffffff" });
    }

    if ($('#txtRefrence').val() == "" || $('#txtRefrence').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Refrence book with page no";
        $('#txtRefrence').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRefrence').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtRefrence').attr('style', '1px solid #cdcdcd !important;');
        $('#txtRefrence').css({ "background-color": "#ffffff" });
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}



function AddClassicalDetail(DeleteString) {
    if (validateValuesC(DeleteString) == true) {
        var Str = "";
        var SrNo = "";
        var txtCMedicines = "";
        var txtCRefrence = "";
        var txtCPackSize = "";
        var txtCExpirydate = "";
      

        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";

        if (DeleteString == "") {
            txtCMedicines = $('#txtCMedicines').val();
            txtCRefrence = $('#txtCRefrence').val();
            txtCPackSize = $('#txtCPackSize').val();

            if ($('#txtCExpirydate').val() != '') {
                 txtCExpirydate = $('#txtCExpirydate').val().split("/");
                txtCExpirydate = txtCExpirydate[2] + "-" + txtCExpirydate[1] + "-" + txtCExpirydate[0];
            }
            else {
                 txtCExpirydate = "";
            }



            strTempString = document.getElementById("hdfClassical").value + "#" + SrNo + "," + txtCMedicines + "," + txtCRefrence + "," + txtCPackSize + "," + txtCExpirydate + "#";
        }
        else {
            strTempString = document.getElementById("hdfClassical").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblAddMore2' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center; width: 2%'>Sl.No.</th>";
        Str = Str + "<th style='text-align: center; width: 25%'>Name of Classical Medicines</th>";
        Str = Str + "<th style='text-align: center; width:25% '>Name of Refrence book with Page no</th>";
        Str = Str + "<th style='text-align: center; width: 20%'>Packing Size</th>";
        Str = Str + "<th style='text-align: center; width: 10%'>Expiry Date</th>";
        Str = Str + "<th style='text-align: center;'>Action</th>";
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
            txtCMedicines = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            txtCRefrence = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            txtCPackSize = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);
          
            txtCExpirydate = RemStr;

            var DeleteString = "#" + SrNo + "," + txtCMedicines + "," + txtCRefrence + "," + txtCPackSize + "," + txtCExpirydate + "#";

            Str = Str + "<tr>";
            Str = Str + "<td style='' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + txtCMedicines + "</td>";
            Str = Str + "<td style='' >" + txtCRefrence + "</td>";
            Str = Str + "<td style='' >" + txtCPackSize + "</td>";
            Str = Str + "<td style='' >" + txtCExpirydate + "</td>";
            Str = Str + "<td align='center' style='width:150px'><input type='button' style='min-width:20px' class='btn-outline-danger' value='DELETE' onclick='DelStringC(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";

            strSuspect = strSuspect + "#" + SrNo + "," + txtCMedicines + "," + txtCRefrence + "," + txtCPackSize + "," + txtCExpirydate + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + txtCMedicines + "," + txtCRefrence + "," + txtCPackSize + "," + txtCExpirydate + "#";

            var HeirsDXMLS = strSaveSuspect;

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);
        }

        Str = Str + "</table>";
        $("#divmoreC").show();
        document.getElementById('divmoreC').innerHTML = Str;
        document.getElementById("hdfClassical").value = strSuspect;


        var tbody = $("#divPartnerDetailC tbody");

        if (tbody.children().length >= 1) {
            $("#divPartnerDetailC").show(800);
            //$("#btnSubmit2").prop('disabled', false);
        }


        txtCMedicines = $('#txtCMedicines').val('');
        txtCRefrence = $('#txtCRefrence').val('');
        txtCPackSize = $('#txtCPackSize').val('');
        txtCExpirydate = $('#txtCExpirydate').val('');
    }
}


function DelStringC(DeleteString) {
    var Msg = "Do you want remove this Entry?";
    if (confirm(Msg)) {
        var strString = document.getElementById('hdfClassical').value;
        strString = strString.replace(DeleteString, "");
        document.getElementById('hdfClassical').value = strString;
        AddClassicalDetail(DeleteString);
    }

    var tbody = $("#divmoreC tbody");

    if (tbody.children().length == 1) {
        $("#divPartnerDetailC").hide(800);
        $("#btnSubmit2").prop('disabled', true);
    }
}


function validateValuesC(DeleteString) {
    if (DeleteString != '') {
        return true;
    }

    var text = "";
    var opt = "";

  

    if ($('#txtCMedicines').val() == "" || $('#txtCMedicines').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Name of Classical Medicines.";
        $('#txtCMedicines').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCMedicines').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCMedicines').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCMedicines').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCRefrence').val() == "" || $('#txtLatin').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Name of Refrence book with Page no.";
        $('#txtCRefrence').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCRefrence').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCRefrence').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCRefrence').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCPackSize').val() == "" || $('#txtPart').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Packing size";
        $('#txtCPackSize').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCPackSize').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCPackSize').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCPackSize').css({ "background-color": "#ffffff" });
    }

    if ($('#txtCExpirydate').val() == "" || $('#txtCExpirydate').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Quantity";
        $('#txtCExpirydate').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtCExpirydate').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtCExpirydate').attr('style', '1px solid #cdcdcd !important;');
        $('#txtCExpirydate').css({ "background-color": "#ffffff" });
    }

   
    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}


function AddLabelDetail(DeleteString) {
    if (validateValuesL(DeleteString) == true) {
        var Str = "";
        var SrNo = "";
        var txtYIngredients = "";
        var txtYLatin = "";
        var txtYPart = "";
        var txtYQuantity = "";


        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";

        if (DeleteString == "") {
            txtYIngredients = $('#txtYIngredients').val();
            txtYLatin = $('#txtYLatin').val();
            txtYPart = $('#txtYPart').val();
            txtYQuantity = $('#txtYQuantity').val();

            strTempString = document.getElementById("hdflabel").value + "#" + SrNo + "," + txtYIngredients + "," + txtYLatin + "," + txtYPart + "," + txtYQuantity + "#";
        }
        else {
            strTempString = document.getElementById("hdflabel").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblAddMore2' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center; width: 2%'>Sl.No.</th>";
        Str = Str + "<th style='text-align: center; width: 25%'>Ingredients</th>";
        Str = Str + "<th style='text-align: center; width:25% '>Latin Name</th>";
        Str = Str + "<th style='text-align: center; width: 20%'>Part Used</th>";
        Str = Str + "<th style='text-align: center; width: 10%'>Quantity</th>";
        Str = Str + "<th style='text-align: center;'>Action</th>";
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
            txtYIngredients = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            txtYLatin = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            txtYPart = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            txtYQuantity = RemStr;

            var DeleteString = "#" + SrNo + "," + txtYIngredients + "," + txtYLatin + "," + txtYPart + "," + txtYQuantity + "#";

            Str = Str + "<tr>";
            Str = Str + "<td style='' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + txtYIngredients + "</td>";
            Str = Str + "<td style='' >" + txtYLatin + "</td>";
            Str = Str + "<td style='' >" + txtYPart + "</td>";
            Str = Str + "<td style='' >" + txtYQuantity + "</td>";
            Str = Str + "<td align='center' style='width:150px'><input type='button' style='min-width:20px' class='btn-outline-danger' value='DELETE' onclick='DelStringL(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";

            strSuspect = strSuspect + "#" + SrNo + "," + txtYIngredients + "," + txtYLatin + "," + txtYPart + "," + txtYQuantity + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + txtYIngredients + "," + txtYLatin + "," + txtYPart + "," + txtYQuantity + "#";

            var HeirsDXMLS = strSaveSuspect;

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);
        }

        Str = Str + "</table>";
        $("#divmoreL").show();
        document.getElementById('divmoreL').innerHTML = Str;
        document.getElementById("hdflabel").value = strSuspect;


        var tbody = $("#divPartnerDetailL tbody");

        if (tbody.children().length >= 1) {
            $("#divPartnerDetailL").show(800);
            //$("#btnSubmit2").prop('disabled', false);
        }


        txtYIngredients = $('#txtYIngredients').val('');
        txtYLatin = $('#txtYLatin').val('');
        txtYPart = $('#txtYPart').val('');
        txtYQuantity = $('#txtYQuantity').val('');
    }
}


function DelStringL(DeleteString) {
    var Msg = "Do you want remove this Entry?";
    if (confirm(Msg)) {
        var strString = document.getElementById('hdfClassical').value;
        strString = strString.replace(DeleteString, "");
        document.getElementById('hdfClassical').value = strString;
        AddLabelDetail(DeleteString);
    }

    var tbody = $("#divmoreL tbody");

    if (tbody.children().length == 1) {
        $("#divPartnerDetailL").hide(800);
        $("#btnSubmit2").prop('disabled', true);
    }
}


function validateValuesL(DeleteString) {
    if (DeleteString != '') {
        return true;
    }

    var text = "";
    var opt = "";


    if ($('#txtYIngredients').val() == "" || $('#txtYIngredients').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Name Ingredients.";
        $('#txtYIngredients').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtYIngredients').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtYIngredients').attr('style', '1px solid #cdcdcd !important;');
        $('#txtYIngredients').css({ "background-color": "#ffffff" });
    }

    if ($('#txtYLatin').val() == "" || $('#txtYLatin').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Latin Name";
        $('#txtYLatin').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtYLatin').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtYLatin').attr('style', '1px solid #cdcdcd !important;');
        $('#txtYLatin').css({ "background-color": "#ffffff" });
    }

    if ($('#txtYPart').val() == "" || $('#txtYPart').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Part Used";
        $('#txtYPart').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtYPart').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtYPart').attr('style', '1px solid #cdcdcd !important;');
        $('#txtYPart').css({ "background-color": "#ffffff" });
    }

    if ($('#txtYQuantity').val() == "" || $('#txtYQuantity').val() == null) {
        text += "<BR>" + " \u002A" + " Please Enter Quantity";
        $('#txtYQuantity').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtYQuantity').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtYQuantity').attr('style', '1px solid #cdcdcd !important;');
        $('#txtYQuantity').css({ "background-color": "#ffffff" });
    }


    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function AddTestingDetail(DeleteString) {
    if (validateValuesL(DeleteString) == true) {
        var Str = "";
        var SrNo = "";
        var txtPR1 = "";
        var txtPR2 = "";
        var txtPR3 = "";
        var txtPR4 = "";
        var txtPR5 = "";
        var txtPR6 = "";
        var txtPR7 = "";
        var txtPRH = "";
        var txtPR8 = "";
        var txtPR9 = "";
        var txtPR10 = "";
        var txtPR11 = "";
        var txtPR12 = "";
        var txtPR13 = "";
        var txtPR14 = "";
        var txtPR15 = "";


        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";

        if (DeleteString == "") {
            txtPR1 = $('#txtPR1').val();
            txtPR2 = $('#txtPR2').val();
            txtPR3 = $('#txtPR3').val();
            txtPR4 = $('#txtPR4').val();
            txtPR5 = $('#txtPR5').val();
            txtPR6 = $('#txtPR6').val();
            txtPR7 = $('#txtPR7').val();
            txtPRH = $('#txtPRH').val();
            txtPR8 = $('#txtPR8').val();
            txtPR9 = $('#txtPR9').val();
            txtPR10 = $('#txtPR10').val();
            txtPR11 = $('#txtPR11').val();
            txtPR12 = $('#txtPR12').val();
            txtPR13 = $('#txtPR13').val();
            txtPR14 = $('#txtPR14').val();
            txtPR15 = $('#txtPR15').val();
            strTempString = document.getElementById("hdflabel").value + "#" + SrNo + "," + txtYIngredients + "," + txtYLatin + "," + txtYPart + "," + txtYQuantity + "#";
        }
        else {
            strTempString = document.getElementById("hdflabel").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblAddMore2' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center; width: 2%'>Sl.No.</th>";
        Str = Str + "<th style='text-align: center; width: 25%'>Name of Classical Medicines</th>";
        Str = Str + "<th style='text-align: center; width:25% '>Name of Refrence book with Page no</th>";
        Str = Str + "<th style='text-align: center; width: 20%'>Packing Size</th>";
        Str = Str + "<th style='text-align: center; width: 10%'>Expiry Date</th>";
        Str = Str + "<th style='text-align: center;'>Action</th>";
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
            txtYIngredients = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            txtYLatin = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            txtYPart = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            txtYQuantity = RemStr;

            var DeleteString = "#" + SrNo + "," + txtYIngredients + "," + txtYLatin + "," + txtYPart + "," + txtYQuantity + "#";

            Str = Str + "<tr>";
            Str = Str + "<td style='' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + txtCMedicines + "</td>";
            Str = Str + "<td style='' >" + txtCRefrence + "</td>";
            Str = Str + "<td style='' >" + txtCPackSize + "</td>";
            Str = Str + "<td style='' >" + txtCExpirydate + "</td>";
            Str = Str + "<td align='center' style='width:150px'><input type='button' style='min-width:20px' class='btn-outline-danger' value='DELETE' onclick='DelStringL(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";

            strSuspect = strSuspect + "#" + SrNo + "," + txtYIngredients + "," + txtYLatin + "," + txtYPart + "," + txtYQuantity + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + txtYIngredients + "," + txtYLatin + "," + txtYPart + "," + txtYQuantity + "#";

            var HeirsDXMLS = strSaveSuspect;

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);
        }

        Str = Str + "</table>";
        $("#divmoreL").show();
        document.getElementById('divmoreL').innerHTML = Str;
        document.getElementById("hdflabel").value = strSuspect;


        var tbody = $("#divPartnerDetailL tbody");

        if (tbody.children().length >= 1) {
            $("#divPartnerDetailL").show(800);
            //$("#btnSubmit2").prop('disabled', false);
        }


        txtYIngredients = $('#txtYIngredients').val('');
        txtYLatin = $('#txtYLatin').val('');
        txtYPart = $('#txtYPart').val('');
        txtYQuantity = $('#txtYQuantity').val('');
    }
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

    if (EL("mySign").src.indexOf("signature.png") != -1) //|| $('#HFb64Sign').val()==null
    {
        text += "<BR>" + " \u002A" + " Please Upload Applicant Signature.";
        $('#mySign').attr('style', 'border:1px solid #d03100 !important;');
        $('#mySign').css({ "background-color": "#fff2ee" });
        $('#mySign').css({ "height": "130px" });
        opt = 1;
    } else {
        $('#mySign').attr('style', '');
        $('#mySign').css({ "background-color": "" });
        $('#mySign').css({ "height": "130px" });
    }

    //var Division = $('#ddlDivision option:selected').text();
    var ddlLicenseType = $('#ddlLicenseType').val();
    if (ddlLicenseType == "-Select-" || ddlLicenseType == "0") {
        text += "<BR>" + " \u002A" + " Please Select License type.";
        $('#ddlLicenseType').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlLicenseType').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlLicenseType').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlLicenseType').css({ "background-color": "#ffffff" });
    }

    var txtFullName = $('#txtFullName').val();
    if (txtFullName == "" || txtFullName == null) {
        text += "<BR>" + " \u002A" + " Please Enter Full Name.";
        $('#txtFullName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFullName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtFullName').attr('style', '1px solid #cdcdcd !important;');
        $('#txtFullName').css({ "background-color": "#ffffff" });
    }

    var txtFirmName = $('#txtFirmName').val();
    if (txtFirmName == "" || txtFirmName == null) {
        text += "<BR>" + " \u002A" + " Please Enter First name.";
        $('#txtFirmName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFirmName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtFirmName').attr('style', '1px solid #cdcdcd !important;');
        $('#txtFirmName').css({ "background-color": "#ffffff" });
    }


    if (ddlLicenseType == "2") {
        var txtLicenseNo = $('#txtLicenseNo').val();
        if (txtLicenseNo == "" || txtLicenseNo == null) {
            text += "<BR>" + " \u002A" + " Please Enter FDR/NSC Number.";
            $('#txtLicenseNo').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtLicenseNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtLicenseNo').attr('style', '1px solid #cdcdcd !important;');
            $('#txtLicenseNo').css({ "background-color": "#ffffff" });
        }
    }

    var Gender = $('#ddlGender').val();
    if (Gender == "-Select-" || Gender == "0") {
        text += "<BR>" + " \u002A" + " Please Select Gender From List.";
        $('#ddlGender').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlGender').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlGender').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlGender').css({ "background-color": "#ffffff" });
    }

    var MobileNo = $('#txtMobileNo').val();
    if (MobileNo == "" || MobileNo == null) {
        text += "<BR>" + " \u002A" + " Please Enter Mobile Number.";
        $('#txtMobileNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtMobileNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtMobileNo').attr('style', '1px solid #cdcdcd !important;');
        $('#txtMobileNo').css({ "background-color": "#ffffff" });
    }

    //var OfficeNo = $('#txtOfficeNo').val();
    //if (OfficeNo == "" || OfficeNo == null)
    //{
    //    text += "<BR>" + " \u002A" + " Please Enter Office Number.";
    //    $('#txtOfficeNo').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#txtOfficeNo').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else
    //{
    //    $('#txtOfficeNo').attr('style', '1px solid #cdcdcd !important;');
    //    $('#txtOfficeNo').css({ "background-color": "#ffffff" });
    //}

    var EmailID = $('#txtEmailID').val();
    if (EmailID == "" || EmailID == null) {
        text += "<BR>" + " \u002A" + " Please Enter Your Email ID.";
        $('#txtEmailID').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtEmailID').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtEmailID').attr('style', '1px solid #cdcdcd !important;');
        $('#txtEmailID').css({ "background-color": "#ffffff" });
    }

    var FullAddress = $('#txtFullAddress').val();
    if (FullAddress == "" || FullAddress == null) {
        text += "<BR>" + " \u002A" + " Please Enter Full Address.";
        $('#txtFullAddress').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFullAddress').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtFullAddress').attr('style', '1px solid #cdcdcd !important;');
        $('#txtFullAddress').css({ "background-color": "#ffffff" });
    }

    var DistrictName = $('#drpDistrictName').val();
    if (DistrictName == "-Select-" || DistrictName == "0") {
        text += "<BR>" + " \u002A" + " Please Select District From List.";
        $('#drpDistrictName').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpDistrictName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#drpDistrictName').attr('style', '1px solid #cdcdcd !important;');
        $('#drpDistrictName').css({ "background-color": "#ffffff" });
    }

    var SubDistrictName = $('#drpSubDistrictName').val();
    if (SubDistrictName == "-Select-" || SubDistrictName == "0") {
        text += "<BR>" + " \u002A" + " Please Select Sub District From List.";
        $('#drpSubDistrictName').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpSubDistrictName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#drpSubDistrictName').attr('style', '1px solid #cdcdcd !important;');
        $('#drpSubDistrictName').css({ "background-color": "#ffffff" });
    }

    var GramPanchayatName = $('#drpGramPanchayatName').val();
    if (GramPanchayatName == "-Select-" || GramPanchayatName == "0") {
        text += "<BR>" + " \u002A" + " Please Select Gram Panchayat From List.";
        $('#drpGramPanchayatName').attr('style', 'border:1px solid #d03100 !important;');
        $('#drpGramPanchayatName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#drpGramPanchayatName').attr('style', '1px solid #cdcdcd !important;');
        $('#drpGramPanchayatName').css({ "background-color": "#ffffff" });
    }

    var Pincode = $('#txtPincode').val();
    if (Pincode == "" || Pincode == null) {
        text += "<BR>" + " \u002A" + " Please Enter Pincode.";
        $('#txtPincode').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtPincode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtPincode').attr('style', '1px solid #cdcdcd !important;');
        $('#txtPincode').css({ "background-color": "#ffffff" });
    }

    var tbody = $("#divPartnerDetail tbody");

    if (tbody.children().length >= 1) {
        $("#divPartnerDetail").show(800);
        //$("#btnSubmit2").prop('disabled', false);
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}


function SubmitData() {
    if (!ValidateForm()) {
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

    //if ($('#txtFirmDOR').val() != '')
    //{
    //    var DOR = $('#txtFirmDOR').val().split("/");
    //    DOR = DOR[2] + "-" + DOR[1] + "-" + DOR[0];
    //}
    //else
    //{
    //    var DOR = "";
    //}

    if ($('#txtExpiryDate').val() != '') {
        var DOB = $('#txtExpiryDate').val().split("/");
        DOB = DOB[2] + "-" + DOB[1] + "-" + DOB[0];
    }
    else {
        var DOB = "";
    }

    

    

    //var TypeOfService = $("input:radio[name='RegisterType']:checked").val();

    var datavar = {
        'ServiceID': svcid,
        'ProfileID': uid,
        'LicenseType': $('#ddlLicenseType').val(),
        'ApplicantName': $('#txtFullName').val(),
        'FirmName': $('#txtFirmName').val(),
        'LicenseNo': $('#txtLicenseNo').val(),
        'Gender': $('#ddlGender').val(),
        'EmailID': $('#txtEmailID').val(),
        'OfficeNo': $('#txtOfficeNo').val(),
        'MobileNo': $('#txtMobileNo').val(),
        'FullAddress': $('#txtFullAddress').val(),
        'District': $('#drpDistrictName').val(),
        'Block': $('#drpSubDistrictName').val(),
        'Panchayat': $('#drpGramPanchayatName').val(),
        'Pincode': $('#txtPincode').val(),
        'Image': $('#HFb64').val(),
        'Sign': $('#HFb64Sign').val(),

        'PProduct': $('#txtProduct').val(),
        'PComposition': $('#txtComposition').val(),
        'PSubCategory': $('#txtSubCategory').val(),
        'PUseInternal': $('#ddlUseInternal').val(),
        'PMUPreparation': $('#txtmuPreparation').val(),

        'PPreparation': $('#txtPreparation').val(),
        'PIndication': $('#txtIndication').val(),
        'PExpiryDate': DOB,
        'PackSize': $('#txtPackSize').val(),

        'YProduct': $('#txtYProduct').val(),
        'YComposition': $('#txtYComposition').val(),
        'YSubCategory': $('#txtYSubCategory').val(),
        'YUseInternal': $('#ddlYUseInternal').val(),
        'txtYIndication': $('#txtYIndication').val(),

        'YPreparation': $('#txtYPreparation').val(),
        'YPackSize': $('#txtYPackSize').val(),
        'YDose': $('#txtYDose').val(),
        'YPrecaution': $('#txtYPrecaution').val(),

            'BacterialCount' : $('#txtPR1').val(),
            'YestMould': $('#txtPR2').val(),
            'Ecoli': $('#txtPR3').val(),
            'Salminella': $('#txtPR4').val(),
            'PAeruginosa': $('#txtPR5').val(),
            'SAureus': $('#txtPR6').val(),
            'PestsideGroup': $('#txtPR7').val(),
            'HeavyMetals': $('#txtPRH').val(),
            'Lead': $('#txtPR8').val(),
            'Mercury': $('#txtPR9').val(),
            'Arsenic': $('#txtPR10').val(),
            'Cadmium': $('#txtPR11').val(),
            'AflatoxinB1': $('#txtPR12').val(),
            'AflatoxinG1': $('#txtPR13').val(),
            'AflatoxinB2': $('#txtPR14').val(),
            'AflatoxinG2': $('#txtPR15').val(),

            'PatentXML': document.getElementById("hdfPatent").value,
            'ClassicalXML': document.getElementById("hdfClassical").value,
            'LabelNameXML': document.getElementById("hdflabel").value,
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };
    debugger;
    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebAppUK/aayushdept/druglicense/newdruglicense.aspx/InsertDrugData',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response)
            { },
            error: function (a, b, c) {
                $('#g207').hide();
                $("#btnSubmit2").prop('disabled', false);
                result = false;
                alertPopup("<br>Could Not Save the Application, Please try again.", "5. " + a.responseText);
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
            $("#btnSubmit2").prop('disabled', false);
            result = false;
            alertPopup("Form Submission Failed", "<BR> Something Went Wrong. <BR> Error While Saving Application. <BR> Please Try Again!!!.");
            //rtnurl = "/Account/Login";
            //window.location.href = rtnurl;
            //return;
        }
        else {
            if (status == "Success") {
                //alertPopup("Tracking Application", "Your Contractor Registration Application has been saved successfully. <br> Your Application ID : " + obj.AppID);
                $('#g207').hide();
                //window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=466&AppID=' + obj.AppID;
                window.location.href = '/WebAppUK/ProgressBar/ProgressBar.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID + '&UID=' + qs["UID"] + '&ProfileID= ' + qs["ProfileID"] + '&KeyField=' + qs["KeyField"];
            }
        }
    });// end of Then function of main Data Insert Function
    return false;
}

// ********************* VALIDATION CHECK ****************** //


function ValiateEmail() {
    var EmailID = $("#txtPartnerEmailID");
    if (EmailID.val() != '') {
        var emailmatch = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (!emailmatch.test(EmailID.val())) {
            $("#txtPartnerEmailID").val('');
            EmailID.attr('style', 'border:1px solid #d03100 !important;');
            EmailID.css({ "background-color": "#fff2ee" });
            alertPopup("Email Validation", "<BR>" + " \u002A" + " Please Enter EmailID In Proper Format.")
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


function EmailValidation() {
    var emailid = document.getElementById('txtEmailID').value;
    //var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-z/A-Z]+\.)+[a-z/A-Z]{1,3})(\]?))$/;
    //var reg = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    //var reg = /[a-zA-Z0-9\.\-]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
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


function ValidateAadhaar(ContrlID) {

    var text = "";
    var opt = "";

    var AadhaarNo = $(ContrlID).val();

    if (AadhaarNo.length > 12 || AadhaarNo.length < 12) {
        text += "<br/>" + " \u002A" + " Aadhaar Number No. Should Be 12 Digit.";
        $(ContrlID).attr('style', 'border:2px solid red !important;');
        $(ContrlID).css({ "background-color": "#fff2ee" });
        opt = 1;
    }

    if (opt == "1") {
        alertPopup("Aadhaar Information.", text);
        $(ContrlID).val("");
        return false;
    }
    $(ContrlID).attr('style', 'border:2px solid green !important;');
    $(ContrlID).css({ "background-color": "#ffffff" });
    return true;
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
    if (!(mobileno.charAt(0) == "9" || mobileno.charAt(0) == "8" || mobileno.charAt(0) == "7")) {
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

    window.location.href = '/WebAppUK/Health/Contractor/ContractorRegistrationForm.aspx?SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr + '&UID=' + uid + '';
}


function Declaration(chk) {
    $('#btnSubmit2').prop('disabled', true);
    if (chk) {
        var name = $('#HDNFNM').val();
        if (name == '' || name == null) {
            alertPopup("Declaration Check", "Please Enter Your Full Name.");
            $('#chkDeclaration').prop('checked', false);
        }
        else {
            $("#lblUName").html(name);
            $('#btnSubmit2').prop('disabled', false);
            $("#divDeclaration").show(800);
        }
    }
    else {
        $("#lblUName").html("");
        $('#btnSubmit2').prop('disabled', true);
        $("#divDeclaration").hide(800);
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


function AlphaNumericNoSpace(e) {
    var regex = new RegExp("[A-Za-z0-9]");
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


function GetAge() {
    var t_DOB = $("#DateOfBirth").val();
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
            var twoDigitDay = ((fullDate.getDate().length + 1) === 1) ? (fullDate.getDate() + 1) : +(fullDate.getDate());
        }
        //var currentDate = fullDate.getDate() + "/" + twoDigitMonth + "/" + fullDate.getFullYear();
        var currentDate = twoDigitDay + "/" + twoDigitMonth + "/" + fullDate.getFullYear();

        var Age = calcExSerDur(t_DOB, currentDate);
        $('#txtAge').val(Age.years);
        $("#txtYear").val(Age.years);
        $("#txtMonth").val(Age.months);
        $("#txtDay").val(Age.days);
        $("#txtAgeDetail").val("Years: " + Age.years + " | Months: " + Age.months + " | Days: " + Age.days);
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