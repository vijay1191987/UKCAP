<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="IncomeForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.IncomeCertificate.IncomeForm" %>


<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/jquery-ui-1.11.4.min.js"></script>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>--%>
    <script src="../js/AngularJS_v1.6.4.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <script src="../../PortalScripts/ServiceLanguage.js"></script>
    <link href="../../PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <link href="../css/style.admin.css" type="text/css" rel="stylesheet" />
    <link href="../css/common.css" rel="stylesheet" />


    <script src="UkIncome.js"></script>
    
    <script type="text/javascript">
        function ReturnSubmit() {
            debugger;
            var qs = getQueryStrings();
            var uid = qs["UID"];
            window.location = '/WebApp/Citizen/Forms/Dashboard.aspx?UID=' + uid;
        }

    </script>
    <script type="text/javascript">
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
    </script>

    <script type="text/javascript">
        function ChangeLanguage(p_Lang) {
            debugger;

            var t_Lang = p_Lang;

            if (p_Lang == null) t_Lang = document.getElementById('HFCurrentLang').value;

            //if (document.getElementById('HFCurrentLang').value != "") t_Lang = document.getElementById('HFCurrentLang').value;

            if (t_Lang == "1") t_Lang = "2";
            else t_Lang = "1";

            document.getElementById('HFCurrentLang').value = t_Lang;
            document.forms[0].submit();
            return true;
        }
    </script>






    <script type="text/javascript">
        var a = ['', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine'];
        var b = ['Hundred', 'Thousand', 'Lakh', 'Crore'];
        var c_0 = ['Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen', 'Seventeen', 'Eighteen', 'Ninteen'];
        var d = ['Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'];

        function convertNumToWord(number) {
            debugger;
            var number = $("#txtincome").val();
            if (number < 1) {
                //alertPopup('Cannot convert more than nine digits');
                $('#txtincomeinword').val('');
            }
            else {
                var c, rm;
                c = 1;
                string = '';
                number == 0 && (string = 'Zero');
                while (number != 0) {
                    switch (c) {
                        case 1:
                            rm = number % 100;
                            pass(rm);
                            number > 100 && number % 100 != 0 && display('And ');
                            number = ~~(number / 100);
                            break;
                        case 2:
                            rm = number % 10;
                            if (rm != 0) {
                                display(' ');
                                display(b[0]);
                                display(' ');
                                pass(rm);
                            }

                            number = ~~(number / 10);
                            break;
                        case 3:
                            rm = number % 100;
                            if (rm != 0) {
                                display(' ');
                                display(b[1]);
                                display(' ');
                                pass(rm);
                            }

                            number = ~~(number / 100);
                            break;
                        case 4:
                            rm = number % 100;
                            if (rm != 0) {
                                display(' ');
                                display(b[2]);
                                display(' ');
                                pass(rm);
                            }

                            number = ~~(number / 100);
                            break;
                        case 5:
                            rm = number % 100;
                            if (rm != 0) {
                                display(' ');
                                display(b[3]);
                                display(' ');
                                pass(rm);
                            }

                            number = ~~(number / 100);
                    }
                    ++c;

                }

                $('#txtincomeinword').val(string);

            }

        }

        function display(s) {

            var t;
            t = string;
            string = s;
            string += t;
        }

        function pass(number) {

            var q, rm;
            number < 10 && display(a[number]);
            number > 9 && number < 20 && display(c_0[number - 10]);
            if (number > 19) {
                rm = number % 10;
                if (rm == 0) {
                    q = ~~(number / 10);
                    display(d[q - 2]);
                }
                else {
                    q = ~~(number / 10);
                    display(a[rm]);
                    display(' ');
                    display(d[q - 2]);
                }
            }
        }
    </script>

    <%--     <script type="text/javascript">

        function Declaration(chk) {
            if (chk) {
                if ($('#txtfullname').val() == "" || $('#txtfullname').val() == null) {
                    alertPopup("Declaration Validation", "<BR><BR> Please Enter Beneficiary Name.")
                    $("#BenfName").html("");
                    $('#btnsubmit').prop('disabled', true);
                }
                else {
                    $("#BenfName").html($('#txtfullname').val());
                    $('#btnsubmit').prop('disabled', false);
                }
            }
            else {
                $("#BenfName").html("");
                $('#btnsubmit').prop('disabled', true);
            }
        }
    </script>--%>


    <script type="text/javascript">
        $(document).ready(function () {
            var qs = getQueryStrings();

            if (qs["UID"] != null && qs["UID"] != "") {
                $('#btnSubmit').prop('disabled', true);
            }
        });

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

        function Declaration(chk) {
            if (chk) {
                var qs = getQueryStrings();
                var uid = qs["UID"];

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/webapp/kiosk/forms/basicdetail.aspx/GetDeclaration',
                    data: '{"prefix":"","UID":"' + uid + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response) {
                        var arr = eval(response.d);
                        var html = "";
                        var name = arr[0].Name;
                        $("#BenfName").html(name);
                        if (qs["UID"] != null && qs["UID"] != "") {
                            $('#btnSubmit').prop('disabled', false);
                        }
                    },
                    error: function (a, b, c) {
                        alert("1." + a.responseText);
                    }
                });
            }
            else {
                $("#BenfName").html("");
                $('#btnSubmit').prop('disabled', true);
            }
        }
    </script>


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <%-- <div class="col-lg-12">
                <h2 class="form-heading" style="width: 98%; margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>INCOME CERTIFICATE </h2>
            </d
            <div class="clearfix">
                            <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                    <h2 class="form-heading" style="width: 98%; margin: 15px auto;">
                        <span class="col-lg-10 p0" style="font-family: Arial !important; font-size: 22px;"><i class="fa fa-pencil-square-o fa-fw"></i>INCOME CERTIFICATE <%--{{resourcesData.lblOISFTitle}}--%>
                        </span>
                        <span class="col-lg-2 p0" style="font-size: 15px;">Language : 
                                    <input type="button" id="btnLang" class="btn-link" style="height:25px; color:#fff;" runat="server" onclick="javascript: return ChangeLanguage();" /><i class="fa fa-hand-o-up"></i></span>
                        <span class="clearfix"></span>
                    </h2>
                </div>
                <div class="col-lg-12 mtop20">
                    <div class="col-md-12 box-container ">
                        <div class="box-heading">
                            <h4 class="box-title register-num"><%--Beneficiary Details--%>{{resourcesData.lblBeneficiaryDetails}}</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory"><%--Full Name of Beneficiary--%>{{resourcesData.lblapplicantfullname}}</label>
                                    <input type="text" id="txtfullname" placeholder="Beneficiary Name" class="form-control" onkeypress="return ForName(event, this);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory"><%--Father/Husband Name--%>{{resourcesData.lblAppFatherName}}</label>
                                    <input type="text" id="txtfathername" placeholder="Father/Husband Name" class="form-control" onkeypress="return ForName(event, this);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory"><%--Mother Name--%>{{resourcesData.lblAppMotherName}}</label>
                                    <input type="text" id="txtmothername" placeholder="Mother Name" class="form-control" onkeypress="return ForName(event, this);" />
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1 pright0">
                                <div class="form-group">
                                    <label class="manadatory"><%--Gender--%>{{resourcesData.lblAppGender}}</label>
                                    <select class="form-control" id="ddlgender">
                                        <option value="0">-Select-</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Transgender">Transgender</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1 pright0">
                                <div class="form-group">
                                    <label class="manadatory"><%--Mobile--%>{{resourcesData.mobileno}}</label>
                                    <input type="text" id="txtmobile" placeholder="Mobile" maxlength="10" class="form-control" onchange="checkmobile();" onkeypress="return isNumber(event, this);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory"><%--Email ID--%>{{resourcesData.lblAppEmail}}</label>
                                    <input type="text" id="txtmail" placeholder="Email ID" maxlength="50" class="form-control" onchange="email();" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory"><%--Occupation--%>{{resourcesData.lblAppOccupation}}</label>
                                    <input type="text" id="txtoccupation" placeholder="Occupation" class="form-control" maxlength="100" onkeypress="return ValidateAlpha(event, this);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory"><%--Monthly Income in Number--%>{{resourcesData.lblmonthlyincome}}</label>
                                    <input type="text" id="txtincome" placeholder="Income in Number" class="form-control" maxlength="8" onkeypress="return isNumber(event, this);" onchange="convertNumToWord();" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory"><%--Monthly Income in Words--%>{{resourcesData.lblmonthlyincomeinword}}</label>
                                    <input type="text" id="txtincomeinword" placeholder="Income in Words" class="form-control" readonly="true" maxlength="200" onkeypress="return ValidateAlpha(event, this);" />
                                </div>
                            </div>


                            <div class="clearfix"></div>
                        </div>
                    </div>

                    <div class="col-md-12 box-container ">
                        <div class="box-heading">
                            <h4 class="box-title register-num"><%--Beneficiary Address Details--%>{{resourcesData.lblBeneficiaryAddressDetails}}</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <%--<div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Location Type</label>
                                <select class="form-control" name="locationtype" id="ddllocationtype" onchange="Locationchange();">
                                    <option value="0">-Select Location Type-</option>
                                    <option value="urban">Urban</option>
                                    <option value="rural">Rural</option>
                                </select>
                            </div>
                        </div>--%>

                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory"><%--Address Line-1 (Care of)--%>{{resourcesData.addressLine1}}</label>
                                    <input type="text" id="txtAddress1" placeholder="First Line Address" class="form-control" onkeypress="return AlphaNumeric(event, this);" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory"><%--Address Line-2 (Building)--%>{{resourcesData.addressLine2}}</label>
                                    <input type="text" id="txtAddress2" placeholder="Second Line Address" class="form-control" maxlength="100" onkeypress="return AlphaNumeric(event, this);" />
                                </div>
                            </div>


                            <div class="clearfix"></div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory"><%--State--%>{{resourcesData.lblAppState}}</label>
                                    <select class="form-control" name="district" id="ddlState" onchange="GetState();">
                                        <option value="0">-Select State-</option>

                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory"><%--District--%>{{resourcesData.district}}</label>
                                    <select class="form-control" name="district" id="ddlDistrict" onchange="GetUKBlock();">
                                        <option value="0">-Select District-</option>

                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory"><%--Block/Taluka/Sub district--%>{{resourcesData.taluka}}</label>
                                    <select class="form-control" name="taluka" id="ddlBlock" onchange="GetUKPanchayat();">
                                        <option value="0">-Select Taluka-</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2" id="divPanchayat">
                                <div class="form-group">
                                    <label class="manadatory"><%--Gram/Panchayat--%>{{resourcesData.lblAppVillage}}</label>
                                    <select class="form-control" name="panchayat" id="ddlpanchayat" >
                                        <option value="0">-Select Panchayat-</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory"><%--Pincode--%>{{resourcesData.lblAppPincode}}</label>
                                    <input type="text" placeholder="Pincode" class="form-control" maxlength="6" id="txtpincode" onchange="checkpincode();" onkeypress="return isNumber(event, this);" />
                                </div>
                            </div>
                            <div class="clearfix"></div>

                        </div>
                    </div>

                    <div class="col-md-12 box-container" id="Div2">
                        <div class="box-heading">
                            <h4 class="box-title register-num"><%--Declaration--%>{{resourcesData.lblDeclaration}}</h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-sm-6 col-md-6 col-lg-12">
                                <p class="text-justify">
                                    <input type="checkbox" name="checkbox" id="FormDeclaration" runat="server" onclick="javascript: Declaration(this.checked);" />
                                    <b>{{resourcesData.lblstatement}}
                                    </b>
                                </p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>

                    <div class="col-md-12 box-container">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <input type="button" id="btnSubmit" class="btn btn-success" value="Submit" onclick="SubmitIncomeCertificate();" />
                            <input type="button" name="Button1" value="Cancel" id="Button1" class="btn btn-danger" onclick="ReturnSubmit();" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
</asp:Content>
