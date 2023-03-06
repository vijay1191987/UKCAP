$(document).ready(function ()
{
    $("#btnSubmit").prop('disabled', true);
    $("#divDeclaration").hide(800);

    EL("File1").addEventListener("change", readFile, false);

    GetState();
    fnSearchData();
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

            $('#txtAddress1').val(Address1);
            $('#txtAddress2').val(Address2);
            $('#txtRoadStreetName').val(Street);
            $('#txtLandMark').val(Landmark);
            $('#txtLocality').val(Locality);
            $('#txtPincode').val(PinCode);

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
                                    var ddlCustomers = $("[id*=ddlPanchayat]");
                                    ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
                                    $.each(r.d, function () {
                                        $("[id*=ddlPanchayat]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                    });

                                    $('#ddlPanchayat').val(Village);
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
                    $('#txtFatherName').val(obj[0]["FatherName"]);
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

                    $('#txtDOB').val(DOB);
                    GetAge();

                    if (obj[0]['ApplicantImageStr'] != null && obj[0]['ApplicantImageStr'] != "")
                    {
                        if (obj[0]['ApplicantImageStr'].indexOf('data:image/jpeg;base64,') !== -1 ||
                            obj[0]['ApplicantImageStr'].indexOf('data:image/png;base64,') !== -1)
                        {
                            document.getElementById('myImg').setAttribute('src', obj[0]['ApplicantImageStr']);
                            $('#HFb64').val(obj[0]['ApplicantImageStr']);
                        } else
                        {
                            document.getElementById('myImg').setAttribute('src', 'data:image/jpeg;base64,' + obj[0]['ApplicantImageStr']);
                            $('#HFb64').val(obj[0]['ApplicantImageStr']);
                        }
                    }
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


function GetState()
{
    var SelState = $('#ddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/StateData",
        data: '{}',
        dataType: "json",
        success: function (r)
        {
            var ddlCustomers = $("[id*=ddlState]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function ()
            {
                $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });

            $('#ddlState').val("05");
            GetUKDistrict();

        }
    });
}


function GetUKDistrict()
{
    var SelState = $('#ddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKDistrict",
        data: '{"prefix":"","StateCode":"' + SelState + '"}',
        dataType: "json",
        success: function (r)
        {
            var ddlCustomers = $("[id*=ddlDistrict]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function ()
            {
                $("[id*=ddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}


function GetUKBlock()
{
    var SelBlock = $('#ddlDistrict').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKBlock",
        data: '{"prefix":"","DistrictCode":"' + SelBlock + '"}',
        dataType: "json",
        success: function (r)
        {
            var ddlCustomers = $("[id*=ddlBlock]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function ()
            {
                $("[id*=ddlBlock]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}


function GetUKPanchayat()
{
    var SelSubDistrict = $('#ddlBlock').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebAppUK/DomicileCertificate/DomicileForm.aspx/GetUKPanchayat",
        data: '{"prefix":"","SubDistrictCode":"' + SelSubDistrict + '"}',
        dataType: "json",
        success: function (r)
        {
            var ddlCustomers = $("[id*=ddlPanchayat]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(r.d, function ()
            {
                $("[id*=ddlPanchayat]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

/* For Angular

var app = angular.module('appmodule', []);

app.controller('ctrl', function ()
{

});

app.filter('words', function ()
{
    function isInteger(x)
    {
        return x % 1 === 0;
    }

    return function (value)
    {
        if (value && isInteger(value))
            return toWords(value);
        return value;
    };
});


var th = ['', 'Thousand', 'Lakh', 'Million', 'Billion', 'Trillion'];
var dg = ['Zero', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine'];
var tn = ['Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen'];
var tw = ['Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'];


function toWords(s)
{
    s = s.toString();
    s = s.replace(/[\, ]/g, '');
    if (s != parseFloat(s)) return 'Not a Number!!!';
    var x = s.indexOf('.');
    if (x == -1) x = s.length;
    if (x > 15) return 'Too Big!!!';
    var n = s.split('');
    var str = '';
    var sk = 0;
    for (var i = 0; i < x; i++) 
    {
        if ((x - i) % 3 == 2) 
        {
            if (n[i] == '1') 
            {
                str += tn[Number(n[i + 1])] + ' ';
                i++;
                sk = 1;
            }
            else if (n[i] != 0) 
            {
                str += tw[n[i] - 2] + ' ';
                sk = 1;
            }
        }
        else if (n[i] != 0) 
        {
            str += dg[n[i]] + ' ';
            if ((x - i) % 3 == 0) str += 'Hundred ';
            sk = 1;
        }


        if ((x - i) % 3 == 1)
        {
            if (sk) str += th[(x - i - 1) / 3] + ' ';
            sk = 0;
        }
    }
    if (x != s.length)
    {
        var y = s.length;
        str += 'point ';
        for (var i = x + 1; i < y; i++) str += dg[n[i]] + ' ';
    }
    return str.replace(/\s+/g, ' ');
}

app.$inject = ['$scope'];

window.toWords = toWords;
*/

function Rs(amount) {
    var words = new Array();
    words[0] = 'Zero';
    words[1] = 'One';
    words[2] = 'Two';
    words[3] = 'Three';
    words[4] = 'Four';
    words[5] = 'Five';
    words[6] = 'Six';
    words[7] = 'Seven';
    words[8] = 'Eight';
    words[9] = 'Nine';
    words[10] = 'Ten';
    words[11] = 'Eleven';
    words[12] = 'Twelve';
    words[13] = 'Thirteen';
    words[14] = 'Fourteen';
    words[15] = 'Fifteen';
    words[16] = 'Sixteen';
    words[17] = 'Seventeen';
    words[18] = 'Eighteen';
    words[19] = 'Nineteen';
    words[20] = 'Twenty';
    words[30] = 'Thirty';
    words[40] = 'Forty';
    words[50] = 'Fifty';
    words[60] = 'Sixty';
    words[70] = 'Seventy';
    words[80] = 'Eighty';
    words[90] = 'Ninety';

    var op;

    amount = amount.toString();
    var atemp = amount.split(".");
    var number = atemp[0].split(",").join("");
    var n_length = number.length;
    var words_string = "";
    if (n_length <= 9) {
        var n_array = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0);
        var received_n_array = new Array();
        for (var i = 0; i < n_length; i++) {
            received_n_array[i] = number.substr(i, 1);
        }
        for (var i = 9 - n_length, j = 0; i < 9; i++ , j++) {
            n_array[i] = received_n_array[j];
        }
        for (var i = 0, j = 1; i < 9; i++ , j++) {
            if (i == 0 || i == 2 || i == 4 || i == 7) {
                if (n_array[i] == 1) {
                    n_array[j] = 10 + parseInt(n_array[j]);
                    n_array[i] = 0;
                }
            }
        }
        value = "";
        for (var i = 0; i < 9; i++) {
            if (i == 0 || i == 2 || i == 4 || i == 7) {
                value = n_array[i] * 10;
            } else {
                value = n_array[i];
            }
            if (value != 0) {
                words_string += words[value] + " ";
            }
            if ((i == 1 && value != 0) || (i == 0 && value != 0 && n_array[i + 1] == 0)) {
                words_string += "Crores ";
            }
            if ((i == 3 && value != 0) || (i == 2 && value != 0 && n_array[i + 1] == 0)) {
                words_string += "Lakhs ";
            }
            if ((i == 5 && value != 0) || (i == 4 && value != 0 && n_array[i + 1] == 0)) {
                words_string += "Thousand ";
            }
            if (i == 6 && value != 0 && (n_array[i + 1] != 0 && n_array[i + 2] != 0)) {
                words_string += "Hundred and ";
            } else if (i == 6 && value != 0) {
                words_string += "Hundred ";
            }
        }
        words_string = words_string.split(" ").join(" ");
    }
    return words_string;
}
function RsPaise(n) { 
    nums = n.toString().split('.')
    var whole = Rs(nums[0])
    if (nums[1] == null) nums[1] = 0;
    if (nums[1].length == 1) nums[1] = nums[1] + '0';
    if (nums[1].length > 2) { nums[1] = nums[1].substring(2, length - 1) }
    if (nums.length == 2) {
        if (nums[0] <= 9) { nums[0] = nums[0] * 10 } else { nums[0] = nums[0] };
        var fraction = Rs(nums[1])
        if (whole == '' && fraction == '') { op = 'Zero only'; }
        if (whole == '' && fraction != '') { op = 'paise ' + fraction + ' only'; }
        if (whole != '' && fraction == '') { op = 'Rupees ' + whole + ' only'; }
        if (whole != '' && fraction != '') { op = 'Rupees ' + whole + 'and paise ' + fraction + ' only'; }
        //amt = document.getElementById('txtIncome').value;
        //var amt = "";
        amt = $('#txtIncome').val();
        if (amt > 999999999.99) { op = 'Oops!!! The amount is too big to convert'; }
        if (isNaN(amt) == true) { op = 'Error : Amount in number appears to be incorrect. Please Check.'; }
        //document.getElementById('lblIncomeWords').innerHTML = op;
        $('#lblIncomeWords').text(op);
    }
}
//RsPaise(Math.round(document.getElementById('txtIncome').value * 100) / 100);
//RsPaise(Math.round($('#txtIncome').val() * 100) / 100); /add on/onchange="RsPaise(Math.round($('#txtIncome').val() * 100) / 100);"
//window.onload = RsPaise();

function ValidateForm()
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

    var FullName = $('#txtFullName').val();
    if (FullName == "" || FullName == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Full Name.";
        $('#txtFullName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFullName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtFullName').attr('style', '1px solid #cdcdcd !important;');
        $('#txtFullName').css({ "background-color": "#ffffff" });
    }

    var FatherName = $('#txtFatherName').val();
    if (FatherName == "" || FatherName == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Father Name.";
        $('#txtFatherName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtFatherName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtFatherName').attr('style', '1px solid #cdcdcd !important;');
        $('#txtFatherName').css({ "background-color": "#ffffff" });
    }

    var MotherName = $('#txtMotherName').val();
    if (MotherName == "" || MotherName == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Mother Name.";
        $('#txtMotherName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtMotherName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtMotherName').attr('style', '1px solid #cdcdcd !important;');
        $('#txtMotherName').css({ "background-color": "#ffffff" });
    }

    var Gender = $('#ddlGender').val();
    if (Gender == "-Select-" || Gender == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select Gender From List.";
        $('#ddlGender').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlGender').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlGender').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlGender').css({ "background-color": "#ffffff" });
    }

    var AadhaarNo = $('#txtAadhaarNo').val();
    if (AadhaarNo == "" || AadhaarNo == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Aadhaar Number.";
        $('#txtAadhaarNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtAadhaarNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtAadhaarNo').attr('style', '1px solid #cdcdcd !important;');
        $('#txtAadhaarNo').css({ "background-color": "#ffffff" });
    }

    var Occupation = $('#txtOccupation').val();
    if (Occupation == "" || Occupation == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Your Occupation.";
        $('#txtOccupation').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtOccupation').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtOccupation').attr('style', '1px solid #cdcdcd !important;');
        $('#txtOccupation').css({ "background-color": "#ffffff" });
    }

    var MobileNo = $('#txtMobileNo').val();
    if (MobileNo == "" || MobileNo == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Mobile No.";
        $('#txtMobileNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtMobileNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtMobileNo').attr('style', '1px solid #cdcdcd !important;');
        $('#txtMobileNo').css({ "background-color": "#ffffff" });
    }

    var EmailID = $('#txtEmailID').val();
    if (EmailID == "" || EmailID == null)
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

    var Income = $('#txtIncome').val();
    if (Income == "" || Income == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Your Annual Income.";
        $('#txtIncome').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtIncome').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtIncome').attr('style', '1px solid #cdcdcd !important;');
        $('#txtIncome').css({ "background-color": "#ffffff" });
    }

    var Area = $('#ddlArea').val();
    if (Area == "-Select-" || Area == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select Area From List.";
        $('#ddlArea').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlArea').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlArea').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlArea').css({ "background-color": "#ffffff" });
    }

    var Address = $('#txtAddress1').val();
    if (Address == "" || Address == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Full Address.";
        $('#txtAddress1').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtAddress1').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtAddress1').attr('style', '1px solid #cdcdcd !important;');
        $('#txtAddress1').css({ "background-color": "#ffffff" });
    }

    var RoadStreetName = $('#txtRoadStreetName').val();
    if (RoadStreetName == "" || RoadStreetName == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Road/Street Name.";
        $('#txtRoadStreetName').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRoadStreetName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtRoadStreetName').attr('style', '1px solid #cdcdcd !important;');
        $('#txtRoadStreetName').css({ "background-color": "#ffffff" });
    }

    var LandMark = $('#txtLandMark').val();
    if (LandMark == "" || LandMark == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Landmark.";
        $('#txtLandMark').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtLandMark').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtLandMark').attr('style', '1px solid #cdcdcd !important;');
        $('#txtLandMark').css({ "background-color": "#ffffff" });
    }

    var Locality = $('#txtLocality').val();
    if (Locality == "" || Locality == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Your Locality.";
        $('#txtLocality').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtLocality').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtLocality').attr('style', '1px solid #cdcdcd !important;');
        $('#txtLocality').css({ "background-color": "#ffffff" });
    }

    var State = $('#ddlState').val();
    if (State == "-Select-" || State == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select State From List.";
        $('#ddlState').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlState').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlState').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlState').css({ "background-color": "#ffffff" });
    }

    var District = $('#ddlDistrict').val();
    if (District == "-Select-" || District == "0")
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

    var BlockTaluka = $('#ddlBlock').val();
    if (BlockTaluka == "0" || BlockTaluka == "-Select-")
    {
        text += "<BR>" + " \u002A" + " Please Select Block/Taluka/Tehsil From List.";
        $('#ddlBlock').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlBlock').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlBlock').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlBlock').css({ "background-color": "#ffffff" });
    }

    var GramPanchayat = $('#ddlPanchayat').val();
    if (GramPanchayat == "-Select-" || GramPanchayat == "0")
    {
        text += "<BR>" + " \u002A" + " Please Select Gram Panchayat From List.";
        $('#ddlPanchayat').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlPanchayat').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#ddlPanchayat').attr('style', '1px solid #cdcdcd !important;');
        $('#ddlPanchayat').css({ "background-color": "#ffffff" });
    }

    var Pincode = $('#txtPincode').val();
    if (Pincode == "" || Pincode == null)
    {
        text += "<BR>" + " \u002A" + " Please Enter Pincode.";
        $('#txtPincode').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtPincode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else
    {
        $('#txtPincode').attr('style', '1px solid #cdcdcd !important;');
        $('#txtPincode').css({ "background-color": "#ffffff" });
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
    //document.getElementById('btnSubmit').addEventListener('click', g207, false);
    if (!ValidateForm())
    {
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

    var datavar = {
        'ServiceID': svcid,
        'ProfileID': uid,
        'ApplicantName': $('#txtFullName').val(),
        'FatherName': $('#txtFatherName').val(),
        'MotherName': $('#txtMotherName').val(),
        'Gender': $('#ddlGender').val(),
        'Income': $('#txtIncome').val(),
        'IncomeInWords': $('#lblIncomeWords').text(),
        'Occupation': $('#txtOccupation').val(),
        'AadhaarNo': $('#txtAadhaarNo').val(),
        'MobileNo': $('#txtMobileNo').val(),
        'EmailID': $('#txtEmailID').val(),
        'Area': $('#ddlArea').val(),
        'FullAddress1': $('#txtAddress1').val(),
        'FullAddress2': $('#txtAddress2').val(),
        'RoadStreetName': $('#txtRoadStreetName').val(),
        'Landmark': $('#txtLandMark').val(),
        'Locality': $('#txtLocality').val(),
        'State': $('#ddlState').val(),
        'District': $('#ddlDistrict').val(),
        'Block': $('#ddlBlock').val(),
        'Panchayat': $('#ddlPanchayat').val(),
        'Pincode': $('#txtPincode').val(),
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
            url: '/WebAppUK/EDistrict/IncomeCertificate/IncomeForm.aspx/InsertIncomeCertificateData',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response)
            { },
            error: function (a, b, c)
            {
                $('#g207').hide();
                $("#btnSubmit").prop('disabled', false);
                result = false;
                alertPopup("<BR> Could Not Save the Application, Please try again.", "5. " + a.responseText);
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
            $('#g207').hide();
            $("#btnSubmit").prop('disabled', false);
            result = false;
            alertPopup("Form Submission Failed", "<BR> Something Went Wrong. <BR> Error While Saving Application. <BR> Please Try Again!!!.");
            //rtnurl = "/Account/Login";
            //window.location.href = rtnurl;
            //return;
        }
        else
        {
            if (status == "Success")
            {
                //alertPopup("Tracking Application", "<BR> Your Cast Certificate Application has been saved successfully. <br> Your Application ID : " + obj.AppID);
                $('#g207').hide();
                //window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=505&AppID=' + obj.AppID;
                window.location.href = '/WebAppUK/ProgressBar/ProgressBar.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID + '&UID=' + qs["UID"] + '&ProfileID= ' + qs["ProfileID"] + '&KeyField=' + qs["KeyField"];
            }
        }
    });// end of Then function of main Data Insert Function
    return false;
}


// ********************* VALIDATION CHECK ****************** //


function ValiateEmail()
{
    var EmailID = $("#txtPartnerEmailID");
    if (EmailID.val() != '')
    {
        var emailmatch = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (!emailmatch.test(EmailID.val()))
        {
            $("#txtPartnerEmailID").val('');
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


function EmailValidation()
{
    var emailid = document.getElementById('txtEmailID').value;
    //var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-z/A-Z]+\.)+[a-z/A-Z]{1,3})(\]?))$/;
    //var reg = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    //var reg = /[a-zA-Z0-9\.\-]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
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
        text += "<br/>" + " \u002A" + " Mobile No. Should Start With 6,7,8 or 9.";
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


function ReturnSubmit()
{
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

    window.location.href = '/WebAppUK/Edistrict/IncomeCertificate/IncomeForm.aspx?SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr + '&UID=' + uid + '';
}

function Declaration(chk)
{
    $('#btnSubmit').prop('disabled', true);
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
            $("#lblUName").html(name);
            $('#btnSubmit').prop('disabled', false);
            $("#divDeclaration").show(800);
        }
    }
    else
    {
        $("#lblUName").html("");
        $('#btnSubmit').prop('disabled', true);
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


function ForDecimalNumber(e) {
    var regex = new RegExp("[0-9.]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);
    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}

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


function AlphaNumeric(e)
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


function AlphaNumericNoSpace(e)
{
    var regex = new RegExp("[A-Za-z0-9]");
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


function ValidateAlpha(evt)
{
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
    {
        return false;
    }
    return true;
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
        $("#txtAgeDetail").val("Years: " + Age.years + " | Months: " + Age.months + " | Days: " + Age.days);
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