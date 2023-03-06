<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="CitizenForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.RD.CitizenForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/AddressScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Kiosk/RD/CitizenForms.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Citizen/Script/ValidateUser.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            debugger;
           
            var d = $.datepicker.formatDate('dd.mm.yy', new Date());
            $('#lblasondate').text(d);
            $('#DescribeOtherDisease').hide();

          
            $('#DOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                onSelect: function (date) {
                    debugger;
                    var todaydate = $.datepicker.formatDate('dd/mm/yy', new Date());
                    var Age = calcDobAge(date);
                    var Age = calcExSerDur(date, todaydate);
                    $('#Age').val(Age.years);
                    $("#Year").val(Age.years);
                    $("#Month").val(Age.months);
                    $("#Day").val(Age.days);
                    if (Age.years < "60" || Age.years=="0") {
                        //$('#DOB').val('');
                        //alert('Test')
                        ValiateSCAge(Age.years)
                    }
                   
                    //else {
                    //    var dob = $("#DOB");
                    //    dob.attr('style', 'border:2px solid green !important;');
                    //    dob.css({ "background-color": "#ffffff" });
                    //}
                }
            });

            $("#btnSubmit").prop('disabled', true);

            $(function () {
                $("#Photo").change(function () {
                    if (this.files && this.files[0]) {
                        var reader = new FileReader();
                        reader.onload = imageIsLoaded;
                        reader.readAsDataURL(this.files[0]);
                    }
                });
            });

            function imageIsLoaded(e) {
                $('#imgPhoto').attr('src', e.target.result);
            };

            m_ServiceID = $('#HFServiceID').val();

            var bool = 0;
            function ckhInfo() {
                if (bool == 1) {
                    bool = 0;
                    $('#divInfo').slideDown(500);
                }
                else {
                    bool = 1;
                    $('#divInfo').slideUp(500);
                }
            }

            $('#Others').change(function () {
                if (this.checked)
                    //$('#DescribeOtherDisease').fadeIn('slow');
                    $('#DescribeOtherDisease').show(800);
                else
                    //$('#DescribeOtherDisease').fadeOut('slow');
                    $('#DescribeOtherDisease').hide(800);
            });
        });
    </script>
   
    <script type="text/javascript">
        function Declaration(chk) {
            debugger;
            $('#btnSubmit').prop('disabled', true);
            if (chk) {
                             var name = $('#FirstName').val();
                              $("#lblName").html(name);
                              $('#btnSubmit').prop('disabled', false);
                //show hide concept
                             
                                      $("#DeclarationChk").show(800);
                                 

               
            }
            else {
                $("#lblName").html("");
                $('#btnSubmit').prop('disabled', true);
                $("#DeclarationChk").hide(800);
            }
        }
      
    </script>


    <script type="text/javascript">
        window.CallParent = function () {
            ParentBindProfile();
        }
    </script>

    <script type="text/javascript">
        function ChangeLanguage(p_Lang) {
            var t_Lang = p_Lang;
            if (p_Lang == null) t_Lang = document.getElementById('HFCurrentLang').value;
            if (t_Lang == "1") t_Lang = "2";
            else t_Lang = "1";
            document.getElementById('HFCurrentLang').value = t_Lang;
            document.forms[0].submit();
            return true;
        }
    </script>

    <style type="text/css">
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        #divInfo li {
            margin-left: 5px;
            display: flex;
        }

             #divInfo li:before {
                content: "";
                display: flex;
                font-family: FontAwesome;
                font-weight: normal;
                padding-right: 5px;
            }

        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .table > tbody > tr > th {
            padding: 5px !important;
            text-align: center;
            vertical-align: middle !important;
        }

        .table > tbody > tr > td {
            padding: 10px !important;
        }

        .othrinfohd {
            background-color: #ececec !important;
        }

        .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
            font-size: x-large;
        }

            .form-heading span {
                font-size: 25px;
                padding-left: 0;
            }

        #instn p {
            line-height: 20px;
            color: #777;
            display: flex;
        }

        #instn .mleft10 {
            margin-left: 10px !important;
        }

        #instn li {
            color: #777;
            display: flex;
        }

        .msgBox {
            width: 600px !important;
            overflow: auto;
            height: 300px;
        }

        .msgBoxContent {
            width: 468px !important;
        }

        .msgError {
            background-color: yellow;
        }

        .div.msgBoxImage {
            margin: 5px 5px 0 5px;
            display: inline-block;
            float: left;
            height: 75px;
            width: 75px;
        }

        #divOtherInfo label {
            display: inline !important;
        }

        p {
            color: #000000 !important;
            font-family: Arial !important;
        }

        .modalBackground {
            background-color: #000;
            filter: alpha(opacity=90);
            opacity: 0.6;
            left: 0;
            position: absolute;
            top: 0;
            width: 100%;
            z-index: 10000;
            height: 1000%;
        }

        #progressbar12 {
            width: 300px;
            height: 14px;
            background-color: #00aeff;
            filter: progid:DXImageTransform.Microsoft.gradient(GradientType=1,startColorstr=#00aeff, endColorstr=#ff0000);
            background-image: -moz-linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: -webkit-linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: -o-linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: -ms-linear-gradient(left, #00aeff 40%, #ff0000 80%,#2fff00 100%);
            background-image: -webkit-gradient(linear, left bottom, right bottom, color-stop(40%,#00aeff), color-stop(80%,#ff0000),color-stop(100%,#2fff00));
        }

        .text-danger {
            color: maroon !important;
            font-size: 20px;
            font-family: Arial;
        }

        .form-controlTemp {
            background: none repeat scroll 0 0 #fff;
            border: 1px solid #cdcdcd !important;
            border-radius: 0;
            box-shadow: 0 0 0;
            color: #333;
            padding: 3px 5px !important;
            display: block;
            width: 100%;
            height: 34px;
            font-size: 14px;
            line-height: 1.42857143;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 311px;">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="form-heading" style="font-size: 22px; color: #820000; font-weight: bold !important;">Form for Identity Card of Senior Citizen</h2>
                <span class="col-lg-2 p0 text-right" style="font-size: 15px;display:none">Language : 
                           <input type="button" id="btnLang" runat="server" class="btn-link" onclick="javascript: return ChangeLanguage();" value="Odia" /><i class="fa fa-hand-o-up"></i></span>
                <span class="clearfix"></span>
            </div>
            
            <div class="clearfix"></div>
            
        </div>
        <div class="row" style="display:none;">
            <div class="col-md-12 box-container">
                    <div class="box-heading ">
                        <h4 class="box-title manadatory">Aadhaar Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <div class="row">
                                <div class="form-group col-lg-3">
                                    <select class="form-control" data-val="true" data-val-number="search application" data-val-required="Please select search type" id="ddlSearch" name="Search">
                                        <option value="0">Select Search Type</option>
                                        <option selected="" value="U">Aadhaar Number</option>
                                      
                                    </select>
                                </div>
                                  <!--<option value="C">Citizen Profile ID</option> onclick="return openWindow(1, 2, 'UIDCasteCertificate1');"
                                        <option value="A">Application ID</option>-->
                                <div class="form-group col-lg-4">
                                    <input class="form-control" placeholder="Enter 12 digit Aadhaar Number" name="txtAadhaar" type="text" value="" id="UID" maxlength="12" onkeypress="return isNumberKey(event);" autofocus="" />
                                </div>
                                <div class="form-group col-lg-2 text-left">
                                    <input type="submit" name="" value="Fetch Data from UID" onclick="return ValidateAadhaar(1, 2, 'UIDCasteCertificate1');" id="btnSearch" class="btn btn-primary" />
                                </div>
                                <div id="divNonAadhar" class="form-group col-lg-3 text-right" style="white-space: nowrap; margin-top: 10px; display: none;"><a href="#" onclick="fnNonUID();" title="Click if Aadhaar UID is not available">I don't have Aadhaar No.</a></div>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>

        </div>
        <div class="row">
            <div class="col-md-9 p0">
            <!---------police station panel----------->
            <div class="col-md-12 box-container">
                <div class="box-heading ">
                    <h4 class="box-title">Police Station Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlDistrict1">District</label>
                                    <select name="" id="PddlDistrict1" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select District"
                                        onchange="GetDistrictPloiceStations();">
                                        <option value="0">-Select-</option>
                                        <option value="61">Dehradun</option>
                                        <option value="68">Hardwar</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-8">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlps">Police Station</label>
                                    <select id="Pddlps" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select Police Station.">
                                        <option value="0">-Select-</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <!-------End Here--------->                
            <div id="divDetails" class="col-md-12 box-container">
                    <div class="box-heading" id="Div4">
                        <h4 class="box-title">Senior Citizen Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <%-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Name of Police Station</label>
                                <input id="PoliceStationName" class="form-control" placeholder="Name of Police Station" type="text" maxlength="40" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
                            </div>
                        </div>--%>
                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-9">
                            <div class="form-group">
                                <label class="manadatory" for="firstname">Name of the Senior Citizen</label>
                                <input id="FirstName" class="form-control" placeholder="Full Name of Applicant" name="FirstName" type="text" maxlength="40" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
                            </div>

                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Gender</label>
                                <select class="form-control" data-val="true" data-val-number="Gender" data-val-required="Please select gender." id="ddlGender" name="Gender" style="">
                                    <option value="0">Select</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Transgender">Transgender</option>
                                </select>
                            </div>
                        </div>
                          <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="SpouseName" id="FOrSChk">Relation With</label>
                               <span>
                              <input type="radio" name="FOrS" id="RBTNFather"  value="Father" />Father
                                          
                            </span>
                            <span>
                                 <input type="radio" name="FOrS" id="RBTNSpouse" value="Spouse" />  Spouse                                           
                                          
                            </span>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="SpouseName">Father's/Spouse Name</label>
                                <input id="SpouseName" class="form-control" placeholder="Name of Spouse" type="text" maxlength="30" onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="DOB">Date of Birth</label>
                                <input id="DOB" class="form-control" placeholder="DOB" name="DOB" maxlength="12" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="margin-bottom: 15px;">
                            <div class="form-group">
                                <label for="Age">Age as on <asp:Label ID="lblasondate" runat="server" /></label>
                                <div class="col-xs-4 pleft0 pright0">
                                    <input id="Year" class="form-control mtop0" placeholder="Year" name="Year" value="" maxlength="3" autofocus="" readonly="readonly" />
                                </div>
                                <div class="col-xs-4 pleft0 pright0">
                                    <input id="Month" class="form-control mtop0" placeholder="Month" name="Month" value="" maxlength="3" autofocus="" readonly="readonly" />
                                </div>
                                <div class="col-xs-4 pleft0 ">
                                    <input id="Day" class="form-control mtop0" placeholder="Day" name="Day" value="" maxlength="3" autofocus="" readonly="readonly" />
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="MobileNo">Mobile Number</label>
                                <input id="MobileNo" class="form-control inputbox_bluebdr" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeypress="return isNumberKey(event);" onchange="MobileValidation('MobileNo');" type="text" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label for="LandLineNo">LandLine No</label>
                                <input id="txtlandlineno" class="form-control inputbox_bluebdr" maxlength="15" name="LandLineNo" placeholder="LandLine Number" type="text" autocomplete="off" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="EmailID">Email ID</label>
                                <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="30" onchange="ValiateEmail();" />
                            </div>
                        </div>
                        
                        <!-------------New field added------------>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="Bloodgroup">Blood Group</label>
                                <select class="form-control" data-val="true" data-val-number="Bgroup" id="ddlBloodGroup" name="Bgroup">
                                    <option value="Select BloodGroup">--Select Blood Group--</option>
                                    <option value="A+">A+</option>
                                    <option value="A-">A-</option>
                                    <option value="B+">B+</option>
                                    <option value="B-">B-</option>
                                    <option value="AB+">AB+</option>
                                    <option value="AB-">AB-</option>
                                    <option value="O+">O+</option>
                                    <option value="O-">O-</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none;">
                            <div class="form-group">
                                <label for="MotherName">Mother Name</label>
                                <input id="txtMotherName" class="form-control inputbox_bluebdr" maxlength="50" name="Mother" placeholder="Mother Name" type="text" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none;">
                            <div class="form-group">
                                <label for="FatherName">Father Name</label>
                                <input id="txtFatherName" class="form-control inputbox_bluebdr" maxlength="50" name="Father" placeholder="Father Name" type="text" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display:none;">
                            <div class="form-group">
                                <label for="nationality">
                                    Nationality</label>
                                <select class="form-control" data-val="true" data-val-number="Nationality" id="Nationality" name="Nationality">
                                    <option selected="" value="Indian">Indian</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label for="Religion">Religion</label>
                                <select class="form-control" data-val="true" data-val-number="Religion" id="ddlReligion" name="Religion">
                                    <option value="Select Religion">--Select Religion--</option>
                                    <option value="Hindu">Hindu</option>
                                    <option value="Islam">Islam</option>
                                    <option value="Jain">Jain</option>
                                    <option value="Sikh">Sikh</option>
                                    <option value="Christian">Christian</option>
                                    <option value="Budhist">Budhist</option>
                                    <option value="Other">Other's</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label for="Category">Category</label>
                                <select class="form-control" data-val="true" data-val-number="Category" id="ddlCategory" name="Category">
                                    <option value="Select Category">--Select Category--</option>
                                    <option value="SC">SC</option>
                                    <option value="ST">ST</option>
                                    <option value="General">General</option>
                                </select>
                            </div>
                        </div>
                        <!------End-------->
                        
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 p0">
                <div id="divPhoto" class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Applicant Photograph</h4>
                    </div>
                    <div class="box-body box-body-open p0">
                        <div class="col-lg-12">
                            <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 220px" id="myImg" />
                            <input class="camera" id="ApplicantImage" name="Photoupload" type="file" />
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div id="divSign" class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title manadatory">Applicant Signature</h4>
                    </div>
                    <div class="box-body box-body-open p0">
                        <div class="col-lg-12">
                            <img class="form-control" src="/WebApp/Kiosk/OISF/img/signature.png" name="signaturecustomer" style="height: 150px" id="mySign" />
                            <input class="camera" id="ApplicantSign" name="Photoupload" type="file" />
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <div class="row">   
             <!-----Relative details tab-----> 
             <div >
            <div class="col-lg-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title">Relative Details (In case of Emergency) <span style="float:right">
                        <span id="Relativechk">Is any of your relative staying in same city? 
                            <span>
                              <input type="radio" name="RelativeY" id="RBTNRelativeY"  value="Yes" />Yes
                                          
                            </span>
                            <span>
                                 <input type="radio" name="RelativeY" id="RBTNRelativeN" value="No" />  No                                           
                                          
                            </span> </span></span> </h4>
                </div>
                <div class="box-body box-body-open p0 pbottom0" id="DivRelativeDetails" style="display: none">
                    <div class="form-group error" id="divmore" runat="server" style="display: none;">
                    </div>
                    <div id="divSuspect">
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered" style="width: 100%; margin: 0 auto;">
                            <tbody>
                                <tr>
                                    <%--<th style="width: 5%;">S.No</th>--%>
                                    <th style="width: 25%;">Name of Relative</th>
                                    <th>Relation</th>
                                    <th style="width: 35%;">Address</th>
                                    <th>Mobile No</th>
                                    <th>Action</th>
                                </tr>
                                <tr>
                                    <%-- <td>1</td>--%>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Full Name of Relative" id="txtNOR" maxlength="100" onkeypress="return ValidateAlpha(event);" /></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Relation" id="txtRelation" maxlength="100" onkeypress="return ValidateAlpha(event);" /></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Full Address of Relative" id="txtAddress" maxlength="100" onkeypress="return AlphaNumeric(event, this);" /></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Mobile No." id="txtMobileno" maxlength="10" onkeypress="return isNumberKey(event);" onchange="MobileValidation('txtMobileno');" /></td>
                                    <td>
                                        <input type="button" class="btn btn-info" id="btnAdd" value="Save" onclick="AddSuspect('');" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
                </div>
             <!-----Medical history details tab---->
        <div id="" class="col-md-12 box-container" >

                <div class="box-heading">
                    <h4 class="box-title">Medical History <span style="float:right"><span id="Medicalchk">Do you have Medical History? <span>
                        <input type="radio" name="RBTNMedical" id="RBTNMedicalY" value="Yes" />Yes </span>
                        <span><input type="radio" name="RBTNMedical" id="RBTNMedicalN" value="No" />No </span> </span></span></h4>
                </div>
                <div class="box-body box-body-open" id="DivMedicalHistory" style="display: none">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display:none;">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="BloodGroup" id="BloodGroup" />Blood Group</label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="Arthritis" id="Arthritis" />Arthritis</label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="Diabetes" id="Diabetes" />Diabetes</label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="RespiratoryDiseases" id="RespiratoryDiseases" />Respiratory Diseases</label>
                        </div>
                    </div>
                    
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="InfluenzaPneumonia" id="InfluenzaPneumonia" />Influenza and Pneumonia</label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="HeartDisease" id="HeartDisease" />Heart Disease</label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="Osteoporosis" id="Osteoporosis" />Osteoporosis</label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="Cancer" id="Cancer" />Cancer</label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="AlzheimerDisease" id="AlzheimerDisease" />Alzheimer's disease</label>
                        </div>
                    </div>
                    
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="Others" id="Others" />Others</label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" id="DescribeOtherDisease" style="margin-top:-7px;">
                        <div class="">
                            <input id="OtherDisease" class="form-control" placeholder="Any other disease describe here" type="text" maxlength="100" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-9">
                        <div class="form-group">
                            <label for="">Name of Family Doctor</label>
                            <input id="FamilyDoctorName" class="form-control" placeholder="Name of Family Doctor" type="text" maxlength="100" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-3">
                        <div class="form-group">
                            <label>Mobile No.</label>
                            <input id="FamilyDoctorNo" class="form-control" placeholder="Mobile No" type="text" maxlength="10" onkeypress="return isNumberKey(event);" onchange="MobileValidation('FamilyDoctorNo');" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-10">
                        <div class="form-group">
                            <label for="">Full Address of Family Doctor</label>
                            <input id="FamilyDoctorAddress" class="form-control" placeholder="Full Address of Family Doctor" type="text" maxlength="100" onchange="return checkLength(this);" onkeypress="return AlphaNumeric(event, this);" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
                        <div class="form-group">
                            <label>Pincode</label>
                            <input id="FamilyDoctorPincode" class="form-control" placeholder="Pincode" type="text" maxlength="6" onkeypress="return isNumberKey(event);" onchange="return PinCodeValidation('FamilyDoctorPincode');" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
             <div class="clearfix"></div>
             </div>
        
        <div class="row">            
            <div class="clearfix"></div>
            
            <div class="clearfix"></div>
            <div class="col-lg-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title">Servant/Driver/Watchman/Tenant Details
                    </h4>
                </div>
                <div class="box-body box-body-open mt0 ptop0 pbottom0">
                     <div class="form-group error" id="divmoreS" runat="server" style="display: none;">
                    </div>
                    <div id="divSuspectS">
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered" style="width: 100%; margin: 0 auto;">
                            <tbody>
                                <tr>
                                   
                                    <th>Person Type</th>
                                    <th style="width: 20%;">Name of Person</th>
                                    <th style="width: 35%;">Address</th>
                                    <th>Mobile No</th>
                                    <th>Action</th>
                                </tr>
                                <tr>
                                    
                                    <td>
                                        <select class="form-control" id="SddlPersonType">
                                            <option value="Select">Select</option>
                                            <option value="Servant">Servant</option>
                                            <option value="Driver">Driver</option>
                                            <option value="Watchman">Watchman</option>
                                            <option value="Tenant">Tenant</option>
                                        </select></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Full Name of Person" id="txtSNameOfPerson" maxlength="100" onkeypress="return ValidateAlpha(event);" /></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Full Address of Person" id="txtSAddress" 
                                            maxlength="100" onkeypress="return AlphaNumeric(event, this);" /></td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Mobile No." id="txtSMobile" maxlength="10" onkeypress="return isNumberKey(event);" onchange="MobileValidation('txtSMobile');" /></td>
                                    <td>
                                        <input type="button" class="btn btn-info" id="btnAddS" onclick="AddServantSuspect('');" value="Save" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">
                         <input type="checkbox" id="chkDeclaration" onclick="javascript: Declaration(this.checked);" />
                        
                        Declaration</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="text-danger text-danger-green mt0" id="DeclarationChk" style="display:none;">
                        <p class="text-justify ng-binding">
                           I, <b><span id="lblName" style="text-transform: uppercase;"></span></b>
                            <span id="lblDeclaration" class="ng-binding">hereby affirm that the information given by me in the application is complete and true to the best of my knowledge and belief.
                                 </span><!--and that I have made the application with the consent and approval of my parents/guardian.--->
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div id="divBtn" class="row">
            <div class="col-md-12 box-container" style="margin-top: 5px;">
                <div class="box-body box-body-open" style="text-align: center;">
                    <input type="button" id="btnSubmit" class="btn btn-success" value="Register &amp; Proceed" title="Proceed to Upload Necessary Document" onclick="SubmitData();" />
                    <input type="submit" name="" value="Cancel" id="Button1" title="Refresh the page" class="btn btn-danger" />
                    <asp:Button ID="BtnHome" runat="server" Text="Home" CssClass="btn btn-primary" title="Back to Home Page" OnClick="BtnHome_Click" />
                </div>
            </div>
            <div class="clearfix">
            </div>
        </div>
    </div>

     <!---new fields added here-->
          <asp:HiddenField ID="hdfSuspect" runat="server" />
          <asp:HiddenField ID="hdfSuspectSave" runat="server" />
          <asp:HiddenField ID="hdfSuspectString" runat="server" />

          <asp:HiddenField ID="hdfSuspectS" runat="server" />
          <asp:HiddenField ID="hdfSuspectSaveS" runat="server" />
          <asp:HiddenField ID="hdfSuspectStringS" runat="server" />
    <!--End here-->

    <asp:HiddenField ID="HFServiceID" runat="server" Value="388" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFUIDData" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFb64Sign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFSizeOfSign" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />
     <asp:HiddenField ID="HDFDistrict" runat="server" ClientIDMode="Static" />
     <asp:HiddenField ID="HDFPS" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HDFLoginID" runat="server" ClientIDMode="Static" />
</asp:Content>
