﻿<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication1.lokaseba_adhikar.forms.index" EnableSessionState="False" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/style.admin.css" rel="stylesheet" />
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
    <%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
    <%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
    <%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>
    <%@ Register Src="~/WebApp/Control/Declaration.ascx" TagPrefix="uc1" TagName="Declaration" %>
    <%--<%@ Register Src="~/WebApp/Control/ServiceInformation.ascx" TagPrefix="uc1" TagName="ServiceInformation" %>--%>

    <script type="text/javascript">
        $(window).load(function () {
            $('#myModal').modal('show');
        });
    </script>
    <script type="text/javascript">
        function CallingServerSideFunction() {
            PageMethods.SendOtpbtn();
        }
    </script>

    <script type="text/javascript">
         $(function () {
        $('#btnUpload').click(function () {
              var fileUpload = $("#FileUpload1").get(0);
              var files = fileUpload.files;
              var test = new FormData();
              for (var i = 0; i < files.length; i++) {
                 test.append(files[i].name, files[i]);
                         }
           $.ajax({
                  url: "UploadHandler.ashx",
                  type: "POST",
                  contentType: false,
                  processData: false,
                  data: test,
                 // dataType: "json",
           success: function (result) {
             alert(result);
              },
       error: function (err) {
      alert(err.statusText);
              }
         });
       });
   })
    </script>
    <style type="text/css">
        .slide-panel {
            position: relative;
        }

        .slide-panel-content {
            position: fixed;
            right: -575px;
            width: 574px;
            background-color: #fff;
            border: 5px solid #E64A19;
            padding: 0 20px 20px 5px;
            z-index: 10000;
            transition: all 0.5s ease;
        }

        .slide-panel-tab {
            background: #E64A19; /* For browsers that do not support gradients */
            /*background: #001A66;*/
            color: hsla(100, 100%, 100%, 1.0);
            padding: 18px 10px;
            display: block;
            position: fixed;
            top: 375px;
            border-top: 5px solid #fff;
            border-right: 5px solid #fff;
            border-left: 5px solid #fff;
            right: -45px;
            letter-spacing: 0.3em;
            transition: all 0.5s ease;
            -webkit-transform: rotate(-90deg);
            transform: rotate(-90deg);
            display: inline-block;
            /*border: none;*/
            z-index: 1000;
            cursor: pointer;
        }

        input[type="checkbox"] {
            display: none;
        }

            input[type="checkbox"]:checked + label + .slide-panel-content {
                right: 0;
            }

            input[type="checkbox"]:checked ~ label {
                right: 527px;
            }



        .rating-loading {
            width: 25px;
            height: 25px;
            font-size: 0;
            color: #fff;
            background: transparent url('../img/loading.gif') top left no-repeat;
            border: none;
        }

        /*
 * Stars & Input
 */

        .ratingStars .label {
            font-size: 40% !important;
            font-weight: normal !important;
        }

        .ratingStars .glyphicon {
            position: relative;
            top: 1px;
            display: inline-block;
            font-family: 'Glyphicons Halflings';
            font-style: normal;
            font-size: 22px;
            font-weight: 400;
            line-height: 1;
            -webkit-font-smoothing: antialiased;
        }

        .rating-container .rating-stars {
            position: relative;
            cursor: pointer;
            vertical-align: middle;
            display: inline-block;
            overflow: hidden;
            white-space: nowrap;
        }

        .rating-container .rating-input {
            position: absolute;
            cursor: pointer;
            width: 100%;
            height: 1px;
            bottom: 0;
            left: 0;
            font-size: 1px;
            border: none;
            background: none;
            padding: 0;
            margin: 0;
        }

        .rating-disabled .rating-input, .rating-disabled .rating-stars {
            cursor: not-allowed;
        }

        .rating-container .star {
            display: inline-block;
            margin: 0 3px;
            text-align: center;
        }

        .rating-container .empty-stars {
            color: #aaa;
        }

        .rating-container .filled-stars {
            position: absolute;
            left: 0;
            top: 0;
            margin: auto;
            color: #fde16d;
            white-space: nowrap;
            overflow: hidden;
            -webkit-text-stroke: 1px #777;
            text-shadow: 1px 1px #999;
        }

        .rating-rtl {
            float: right;
        }

        .rating-animate .filled-stars {
            transition: width 0.25s ease;
            -o-transition: width 0.25s ease;
            -moz-transition: width 0.25s ease;
            -webkit-transition: width 0.25s ease;
        }

        .rating-rtl .filled-stars {
            left: auto;
            right: 0;
            -moz-transform: matrix(-1, 0, 0, 1, 0, 0) translate3d(0, 0, 0);
            -webkit-transform: matrix(-1, 0, 0, 1, 0, 0) translate3d(0, 0, 0);
            -o-transform: matrix(-1, 0, 0, 1, 0, 0) translate3d(0, 0, 0);
            transform: matrix(-1, 0, 0, 1, 0, 0) translate3d(0, 0, 0);
        }

        .rating-rtl.is-star .filled-stars {
            right: 0.06em;
        }

        .rating-rtl.is-heart .empty-stars {
            margin-right: 0.07em;
        }

        /**
 * Sizes
 */
        .rating-xl {
            font-size: 4.89em;
        }

        .rating-lg {
            /*font-size: 3.91em;*/
        }

        .rating-md {
            font-size: 3.13em;
        }

        .rating-sm {
            font-size: 2.5em;
        }

        .rating-xs {
            font-size: 2em;
        }

        .rating-xl {
            font-size: 4.89em;
        }

        /**
 * Clear
 */
        .rating-container .clear-rating {
            color: #aaa;
            cursor: not-allowed;
            display: inline-block;
            vertical-align: middle;
            font-size: 50%;
        }

        .clear-rating-active {
            cursor: pointer !important;
        }

            .clear-rating-active:hover {
                color: #843534;
            }

        .rating-container .clear-rating {
            padding-right: 5px;
        }

        /**
 * Caption
 */
        .rating-container .caption {
            color: #999;
            display: inline-block;
            vertical-align: middle;
            font-size: 200%;
            margin-top: -0.6em;
        }

        .rating-container .caption {
            margin-left: 5px;
            margin-right: 0;
        }

        .rating-rtl .caption {
            margin-right: 5px;
            margin-left: 0;
        }

        /**
 * Print
 */
        @media print {
            .rating-container .clear-rating {
                display: none;
            }
        }

        .mdlHD {
            background-color: #3498db !important;
            text-align: center !important;
            color: #fff !important;
            font-size: 22px;
            padding: 10px;
        }

        .bdrRdusNne {
            border-radius: 0 !important;
            border: 14px solid #353535;
        }

        .txtContentPopup li {
            font-size: 13px !important;
        }

        .clseBTNMdl {
            background-color: #353535 !important;
            /* margin-right: 5px; */
            border-radius: 110px;
            font-size: 25px;
            padding: 5px !important;
            width: 35px !important;
            margin-top: -37px !important;
            margin-right: -36px !important;
            color: #fff;
            opacity: 1;
        }

            .clseBTNMdl:hover {
                color: #fff !important;
                text-decoration: none;
                cursor: pointer;
                filter: alpha(opacity=100);
                opacity: 1;
            }

        .md-perspective,
        .md-perspective body {
            height: 100%;
            overflow: hidden;
        }

            .md-perspective body {
                background: #222;
                -webkit-perspective: 600px;
                -moz-perspective: 600px;
                perspective: 600px;
            }

        .md-modal {
            position: fixed;
            top: 50%;
            left: 50%;
            width: 50%;
            max-width: 630px;
            min-width: 320px;
            height: auto;
            z-index: 2000;
            visibility: hidden;
            -webkit-backface-visibility: hidden;
            -moz-backface-visibility: hidden;
            backface-visibility: hidden;
            -webkit-transform: translateX(-50%) translateY(-50%);
            -moz-transform: translateX(-50%) translateY(-50%);
            -ms-transform: translateX(-50%) translateY(-50%);
            transform: translateX(-50%) translateY(-50%);
        }

        .md-show {
            visibility: visible;
        }

        .md-overlay {
            position: fixed;
            width: 100%;
            height: 100%;
            visibility: hidden;
            top: 0;
            left: 0;
            z-index: 1000;
            opacity: 0;
            background: rgba(143,27,15,0.8);
            -webkit-transition: all 0.3s;
            -moz-transition: all 0.3s;
            transition: all 0.3s;
        }

        .md-show ~ .md-overlay {
            opacity: 1;
            visibility: visible;
        }

        /* Content styles */
        .md-content {
            color: #fff;
            background: #e74c3c;
            position: relative;
            border-radius: 3px;
            margin: 0 auto;
        }

            .md-content h3 {
                margin: 0;
                padding: 0.4em;
                text-align: center;
                font-size: 2.4em;
                font-weight: 300;
                opacity: 0.8;
                background: rgba(0,0,0,0.1);
                border-radius: 3px 3px 0 0;
            }

            .md-content > div {
                padding: 15px 40px 30px;
                margin: 0;
                font-weight: 300;
                font-size: 1.15em;
            }

                .md-content > div p {
                    margin: 0;
                    padding: 10px 0;
                }

                .md-content > div ul {
                    margin: 0;
                    padding: 0 0 30px 20px;
                }

                    .md-content > div ul li {
                        padding: 5px 0;
                    }

            .md-content button {
                display: block;
                margin: 0 auto;
                font-size: 0.8em;
            }

        .bdrRdusRed {
            border-radius: 0 !important;
            border: 14px solid #d43f3a;
        }


        .clseBTNRed {
            background-color: #d43f3a !important;
            /* margin-right: 5px; */
            border-radius: 110px;
            font-size: 25px;
            padding: 5px !important;
            width: 35px !important;
            margin-top: -37px !important;
            margin-right: -36px !important;
            color: #fff;
            opacity: 1;
        }

            .clseBTNRed:hover {
                color: #fafafa !important;
                text-decoration: none;
                cursor: pointer;
                filter: alpha(opacity=100);
                opacity: 1;
            }

        .feedbackHD {
            background-color: #e53935 !important;
            opacity: 0.9;
            text-align: center !important;
            color: #fff !important;
            font-weight: 600;
            font-size: 22px;
            padding: 10px;
        }

        .feedbackHD2 {
            background-color: #30384D !important;
            opacity: 0.9;
            text-align: center !important;
            color: #fff !important;
            font-weight: 600;
            font-size: 22px;
            padding: 10px;
        }

        .blueBdr {
            background: #99CCFF; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(#99CCFF, #BFFFFF); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(#99CCFF, #BFFFFF); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(#99CCFF, #BFFFFF); /* For Firefox 3.6 to 15 */
            background: linear-gradient(#99CCFF, #BFFFFF); /* Standard syntax */
            border-radius: 0 !important;
            border: 14px solid #20202F;
        }



        .clseBTNBlue {
            background-color: #479DC7 !important;
            /* margin-right: 5px; */
            border-radius: 110px;
            font-size: 25px;
            padding: 5px !important;
            width: 35px !important;
            margin-top: -33px !important;
            /* z-index: 10000; */
            margin-right: -26px !important;
            color: #fff;
            opacity: 1;
        }

            .clseBTNBlue:hover {
                color: #fafafa !important;
                text-decoration: none;
                cursor: pointer;
                filter: alpha(opacity=100);
                opacity: 1;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="../../PortalScripts/star-rating.js"></script>
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <%--<script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>--%>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="index.js"></script>
    <script src="../js/RatingFeedBack.js"></script>
    <div id="slide-panel" class="slide-panel">

        <input type="checkbox" id="checker" value="feedback" />
        <label for="checker" class="slide-panel-tab">FEEDBACK <i class="fa fa-angle-double-right fa-fw"></i></label>
        <div class="slide-panel-content">
            <div data-area="input">
                <div class="box-body box-body-open">

                    <div class="form-group">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12  ratingStars">
                            <label class="ptop10 manadatory">
                                Rate us</label>
                            <input id="Rating" value="4" type="text" clientidmode="static" class="rating" data-min="0" data-max="5" data-step="0.2" data-size="lg"
                                required title="" runat="server">
                        </div>
                        <div class="clearfix"></div>

                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                        <label>
                            Mobile No.</label>
                        <input name="" id="MobileNumber" clientidmode="static" maxlength="10" onkeypress="return isNumber();" class="form-control" placeholder="Enter your mobile no." runat="server" />
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                        <label>
                            Email ID</label>
                        <input name="Email" type="text" id="mailid" clientidmode="static" runat="server" maxlength="30" placeholder="example@domain.com" class="form-control" onchange="EmailValidate();" />
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop20"></div>

                    <div class="clearfix"></div>
                    <div class="mtop20"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <label class="manadatory">
                            Feedback/Suggestion</label>
                        <textarea rows="4" cols="50" id="Feedbackcomment" clientidmode="static" runat="server" class="form-control" maxlength="5000"></textarea>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                       <%-- <input type="file" name="img">--%>
                        <input type="file" id="FileUpload1" />
                        <input type="button" id="btnUpload" value="Upload Files"/>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop20"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                        <input type="button" id="Submit" class="btn btn-danger" value="Submit" onclick="SubmitRatingData();">
                    </div>
                </div>
            </div>
        </div>
        <!-- close: slide-inner -->
    </div>
    <!--Start Model 3-->
    <div class="modal fade" id="myModal3" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content blueBdr">
                <div class="modal-header p0">
                    <button type="button" class="close clseBTNBlue" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title feedbackHD2"><i class="fa fa-feed fa-fw"></i>FEEDBACK </h4>
                </div>
                <div class="modal-body txtContentPopup">

                    <div class="box-body box-body-open">

                        <div class="form-group">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-3">
                                <label class="manadatory">
                                    Your Registered Mobile No.</label>
                                <input id="MobileNo" type="text" clientidmode="static" maxlength="10" class="form-control" placeholder="Registered Mobile No." name="MobileNo" onkeypress="return isNumber();" onchange="return  checkmobile();" runat="server">
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
                                <input type="button" class="form-control mtop20" id="btnsendotp" clientidmode="static" value="Verify" style="background-color: #9CD0FF; border: 1px solid #8ECAFF !important; border-radius: 5px; color: #004030;" runat="server" onclick="sendotp()" />

                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-3">
                                <input id="verifyOTP" clientidmode="static" type="text" maxlength="6" class="form-control mtop20" placeholder="Enter OTP" name="VerifyOtp" runat="server">
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
                                <input type="button" id="btnverifyotp" class="form-control mtop20" value="Verify OTP" style="background-color: #9CD0FF; border: 1px solid #8ECAFF !important; border-radius: 5px; color: #004030;" onclick="verifyotp()" />
                            </div>



                            <div class="clearfix"></div>
                            <div class="mtop15"></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                                <label class="manadatory">
                                    Service</label>
                                <select class="form-control" id="ddlservices" runat="server" onchange="OnchangeFunctionservice();" clientidmode="static">
                                    <option value="0">Select Service</option>

                                </select>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                                <label class="manadatory">
                                    Department</label>
                                <select class="form-control" id="ddldepartment" runat="server" clientidmode="static">
                                    <option value="0">Select Department</option>

                                </select>
                            </div>

                            <div class="clearfix"></div>
                            <div class="mtop15"></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4">
                                <label class="manadatory">
                                    Application ID</label>
                                <input id="applicationID" maxlength="100" clientidmode="static" class="form-control" placeholder="Enter your application id" name="ApplicationID" runat="server" onchange="getFeedbackData();">
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
                                <label class="manadatory">
                                    Type of Issue</label>
                                <select class="form-control" id="issueType" clientidmode="static" runat="server" onchange="othertype();">
                                    <option value="0">-Select Issues-</option>
                                    <option value="1">Payment Issue</option>
                                    <option value="2">Login Issue</option>
                                    <option value="3">Portal Issue</option>
                                    <option value="4">Others</option>
                                </select>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6" id="divhideshow">
                                <label class="manadatory">
                                    Describe</label>
                                <textarea id="otherIssue" rows="2" clientidmode="static" maxlength="200" cols="50" class="col-lg-12 form-control" runat="server"></textarea>
                            </div>
                            <div class="clearfix"></div>
                            <div class="mtop15"></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                                <label class="manadatory">
                                    Full Name</label>
                                <input id="FullName" clientidmode="static" runat="server" maxlength="50" class="form-control" name="FirstName" onkeypress="return ValidateAlpha(this);" />
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                                <label>
                                    Email ID</label>
                                <input id="emailid" clientidmode="static" maxlength="30" class="form-control" name="EmailID" placeholder="example@domain.com" onchange="email();" runat="server" />
                            </div>

                            <div class="clearfix"></div>
                            <div class="mtop15"></div>

                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <label class="manadatory">
                                    Feedback/Suggestion</label>
                                <textarea id="txtcomments" rows="3" maxlength="5000" cols="50" runat="server" clientidmode="static" class="col-lg-12 form-control" onkeypress="return AlphaNumeric(this);"></textarea>
                            </div>
                            <div class="clearfix"></div>
                            <div class="mtop15"></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <label class="manadatory">
                                    If you have any attachment!</label>
                                <input type="file" name="img" />
                                <asp:FileUpload type="file" runat="server" ID="FUpload" ClientIDMode="Static" onchange="return ValidateFileUpload()" CssClass="pull-right mtop20" />
                            </div>
                            <div class="clearfix"></div>
                            <div class="mtop20"></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                                <button type="button" id="btnSubmit" class="btn btn-info" value="Next =>>" onclick="SubmitFeedBackData();" runat="server" style="background-color: #00A3D9;" clientidmode="static">Submit</button>
                            </div>
                            <div class="clearfix"></div>
                            <div class="mtop20"></div>
                        </div>
                    </div>



                </div>
                <%-- <div class="modal-footer" style="padding: 10px 0 5px 0 !important; text-align: center !important;">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>--%>
            </div>
        </div>
    </div>
    <!-- close: Model 3 -->


    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content bdrRdusNne">
                <div class="modal-header">
                    <button type="button" class="close clseBTNMdl" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title mdlHD">IMPORTANT NOTICE</h4>
                </div>
                <div class="modal-body txtContentPopup">
                    <%--<h2 style="color: #2c3e50; font-size: 20px; font-weight: bold; margin: 10px 0 0 15px;"><i class="fa fa-bell-o"></i> Advertisement for written examination for the post of
Constables in 9th SIRB 2016-17
                        <img src="/g2c/img/NewAlt.gif" alt="Latest Updates" style="width: 25px; margin-top: -5px"></h2>
                    <ul>
                        <li style="list-style: none; margin-left: 15px !important; padding: 2px; margin-top: 10px;"><a href="/pdf/writtenExamination_IRBS_English.PDF" style="background-color: #42A5F5; color: #fff; padding: 5px 8px; border-radius: 2px; font-size: 12px;" target="_blank"><i class="fa fa-download mtop10"></i> Download PDF (English Version)</a> &nbsp;<a href="/pdf/writtenExamination_IRBS_Odia.PDF" style="background-color: #e53935; color: #fff; padding: 5px 8px; border-radius: 2px; font-size: 12px;" target="_blank"><i class="fa fa-download mtop10"></i> Download PDF (Odia Version)</a></li>
                    </ul>--%>
                    <h2 style="color: #2c3e50; font-size: 20px; font-weight: bold; margin: 10px 0 5px 15px;">
                        <img src="/g2c/img/NewAlt.gif" alt="Latest Updates" style="width: 25px; margin-top: -5px">
                        Admission Notice for OUAT UG - Common Entrance Examination 2017 <a href="/g2c/pdf/OUAT_UG_Admission_Notice_2017-18.PDF" style="background-color: #e53935; color: #fff; padding: 5px 8px; border-radius: 2px; font-size: 12px; font-weight: normal;" target="_blank"><i class="fa fa-download mtop10"></i>Downlad PDF</a></h2>
                    <div class="clearfix"></div>
                    <h2 style="color: #2c3e50; font-size: 20px; font-weight: bold; margin: 10px 0 5px 15px;">
                        <img src="/g2c/img/NewAlt.gif" alt="Latest Updates" style="width: 25px; margin-top: -5px">
                        OUAT UG Prospetus: 2017-18 <a href="/g2c/pdf/OUAT _UG_PROSPECTUS_2017-18.PDF" style="background-color: #e53935; color: #fff; padding: 5px 8px; border-radius: 2px; font-size: 12px; font-weight: normal;" target="_blank"><i class="fa fa-download mtop10"></i>Downlad PDF</a></h2>
                    <div class="clearfix"></div>
                    <h2 style="display: none; color: #2c3e50; font-size: 20px; font-weight: bold; margin: 10px 0 5px 15px;">
                        <img src="/g2c/img/NewAlt.gif" alt="Latest Updates" style="width: 25px; margin-top: -5px">
                        Notice of Written Examination for Recruitment of Constables in 9<sup>th</sup>SIRB held on 09.04.2017 </h2>
                    <ul>
                        <li style="display: none; list-style: none; margin-left: 15px !important; padding: 2px; margin-top: 10px;"><a href="/pdf/writtenExamination_IRBS_English.PDF" style="background-color: #e53935; color: #fff; padding: 5px 8px; border-radius: 2px; font-size: 12px;" target="_blank"><i class="fa fa-download mtop10"></i>Download PDF (English Version)</a> &nbsp; <a href="/pdf/writtenExamination_IRBS_Odia.PDF" style="background-color: #3498db; color: #fff; padding: 5px 8px; border-radius: 2px; font-size: 12px;" target="_blank"><i class="fa fa-download mtop10"></i>Download PDF (Odia Version)</a> </li>

                    </ul>
                    <div class="clearfix"></div>
                    <%-- <h2 style="color: #2c3e50; font-size: 20px; font-weight: bold; margin: 10px 0 8px 15px;"><img src="/g2c/img/NewAlt.gif" alt="Latest Updates" style="width: 25px; margin-top: -5px"> Guidance to Fill OMR Answer Sheet <a href="/pdf/guidance_for_omr_answersheet.pptx" style="background-color: #3498db; color: #fff; padding: 5px 8px; border-radius: 2px; font-size: 12px; font-weight:normal;"><i class="fa fa-file-text-o"></i> Download PPT</a> &nbsp; &nbsp; <a href="#" onClick="MyWindow=window.open('https://youtu.be/vdFCOu90fcY','MyWindow','toolbar=no,location=no,directories=no,status=no, menubar=no,scrollbars=no,resizable=no,width=600,height=300'); return false;"target="_blank" style="background-color: #e53935; color: #fff; padding: 5px 8px; border-radius: 2px; font-size: 12px; font-weight:normal;"><i class="fa fa-youtube-play"></i> Watch This Video</a>
                        </h2>--%>
                    <div class="clearfix"></div>
                    <h2 style="color: #2c3e50; font-size: 20px; font-weight: bold; margin: 15px 0 8px 15px; display: none;">
                        <img src="/g2c/img/NewAlt.gif" alt="Latest Updates" style="width: 25px; margin-top: -5px">
                        Route Map How to Reach Written Exam Venue 9th SIRB 2016-17   <a href="#" onclick="MyWindow=window.open('https://youtu.be/d7Vi-rkj1K8','MyWindow','toolbar=no,location=no,directories=no,status=no, menubar=no,scrollbars=no,resizable=no,width=600,height=300'); return false;" style="background-color: #e53935; color: #fff; padding: 5px 8px; border-radius: 2px; font-size: 12px; font-weight: normal;"><i class="fa fa-youtube-play"></i>Check This Video </a></h2>
                    <div class="clearfix"></div>

                    <div class="clearfix"></div>
                    <h2 style="color: #2c3e50; font-size: 20px; font-weight: bold; margin: 15px 0 5px 15px;">Application for Recruitment of Constables in 9th SIRB</h2>
                    <ul>
                        <li style="list-style: none; margin-left: 15px !important; padding: 2px; /*display: none; */"><a href="/pdf/Final%20Select%20List%209th%20SIRB.PDF" title="List of Candidate Qualified for Written Examination" target="_blank" style="color: #3498db; font-size: 16px; font-weight: bold; text-decoration: underline;"><i class="fa fa-hand-o-up fa-fw"></i>Publication of the Select List of Candidate Recruitment of Constables in 9th SIRB
                            <img src="/g2c/img/NewAlt.gif" alt="Latest Updates" style="width: 25px; margin-top: -5px"></a>
                        </li>

                        <li style="list-style: none; margin-left: 15px !important; padding: 2px;"><a href="/WebApp/Kiosk/OISF/QualifiedPET.aspx" title="List of Candidate Qualified for Written Examination" target="_blank" style="color: #3498db; font-size: 16px; font-weight: bold; text-decoration: underline;"><i class="fa fa-hand-o-up fa-fw"></i>List of Candidate Qualified for Written Examination
                            <img src="/g2c/img/NewAlt.gif" alt="Latest Updates" style="width: 25px; margin-top: -5px"></a>
                        </li>
                        <%--<li style="list-style: none; margin-left: 15px !important; padding: 2px;"><a href="/WebApp/Kiosk/OISF/AdmitCard.aspx" title="Click to Download Admit Card for Written Examination" target="_blank" style="color: #3498db; font-size: 16px; font-weight: bold; text-decoration: underline;"><i class="fa fa-hand-o-up"></i> Download Admit Card for Written Examination for 9th SIRB 2016-17
                            <img src="/g2c/img/NewAlt.gif" alt="Click to Download Admit Card for Written Examination" style="width: 25px; margin-top: -5px"></a>
                        </li>--%>
                        <li style="list-style: none; margin-left: 15px !important; padding: 2px;"><a href="/WebApp/Kiosk/OISF/ScoreSheet.aspx" title="Click to Download Score Sheet for Recruitment of Constables in 9TH SIRB" target="_blank" style="color: #3498db; font-size: 16px; font-weight: bold; text-decoration: underline;"><i class="fa fa-hand-o-up fa-fw"></i>Download Score Sheet for Recruitment of Constables in 9TH SIRB
                            <img src="/g2c/img/NewAlt.gif" alt="Click to Check the Written Examination Marks" style="width: 25px; margin-top: -5px"></a>
                        </li>
                    </ul>


                    <%--<h2 style="color: #2c3e50; font-size: 20px; font-weight: bold; margin: 10px 0 0 15px;">Online Greivance</h2>
            <ul>
                <li style="list-style: none; margin-left: 15px !important; padding: 2px;"><a href="/WebApp/Kiosk/OISF/Grievance.aspx" target="_blank" style="color: #3498db; font-size: 16px; font-weight: bold; text-decoration: underline;"><i class="fa fa-hand-o-up"></i> Any Candidates having Grievances can send application to the Chairman, (SSB ) latest by 18th,February,2017 through the Online Grievance System.</a><img src="/g2c/img/NewAlt.gif" alt="Latest Updates" style="width: 35px; margin-top: -10px" /></li>

                        <li style="list-style: none; margin-left: 15px !important; padding: 2px;"><i class="fa fa-hand-o-up"></i> <b style="font-size: 14px;"> Any Candidates having problem for downloading e-Pass and not received SMS related to Roll No. for Physical Measurement & Efficiency Test.<img src="/g2c/img/NewAlt.gif" alt="Latest Updates" style="width: 35px; margin-top: -10px" /> <br />
                            Please contact below numbers for Assistance<br />
                            Call Centre at 06746580111/6580222/6580333, Shri.Naba Das (+91 8895856633), Shri.Narayana Dora (+91 9437905270).</b>
                        </li>
               <li style="list-style: none; margin-left: 15px !important; padding: 2px;">
                    <i class="fa fa-hand-o-up"></i> <b style="font-size: 14px;">The leftover candidates are requested to keep checking of their SMS/e-Pass and website ( for appearing in the Recruitment Test.If there is any problem in downloading 
in e-Pass,they may contact to the call center of State Selection Board i.e. 0674-6580111,0674-6580222 OR 0671-2302444.</b></li>

                <li style="list-style: none; margin-left: 15px !important; padding: 2px;">
                    <i class="fa fa-hand-o-up"></i> <b style="font-size: 14px;">The candidates who failed/ not appeared in the Driving Test can also appear in the Written Test</b></li>
                </ul>--%>

                    <%-- <p style="color: #2470A2; list-style: none; margin-bottom: 0 !important;"><b><i class="fa fa-bell-o"></i> ALERT FOR CANDIDATES</b></p>
                    <ul>
                        <li  style="color: #EC4D1C; padding: 5px 5px 0 5px"><b>"SMSs/e-mails are being sent to the following candidates repeatedly to download their e-Pass to appear in the recruitment test but resulting failure to deliver them.
They are requested to visit the website regularly and download their e-Pass to appear in the recruitment test and in case if they faced any difficulty in downloading their e-Pass, they may contact to our Help Desk No.- 0674-658011,0674-6580222 and 0671-2302444."</b></li>
                    </ul>--%>
                    <%-- <p style="color: #2470A2; list-style: none; margin-bottom: 0 !important;"><b style="font-size: 14.5px;">ANNOUNCMENT OF PHYSICAL MEASURMENT AND EFFICIENCY EXAMINATION DATE FOR CANDIDATES</b></p>--%>

                    <ul>
                        <%-- <a href="/WebApp/Kiosk/OISF/DownloadEPass.aspx" target="_blank">
                            <li style="color: #EC4D1C;"><b>13th Batch Examination Date Sunday - Monday 26th - 27th February 2017, From Roll No. ST02181 to ST08728</b></li>
                            <li style="color: #EC4D1C;"><b>14th Batch Examination Date Tuesday - Wednesday 28th February - 1st March 2017, From Roll No. ST08729 to ST15276</b></li>
                            <li style="color: #EC4D1C;"><b>15th Batch Examination Date Thursday - Friday 2nd - 3rd March 2017, From Roll No. ST15277 to ST21823</b></li>
                            <li style="color: #EC4D1C;"><b>16th Batch Examination Date Saturday - Sunday 4th - 5th March 2017, From applicant who has filled Grievance</b></li>
                        </a>

                        <li style="background-color: red; width: 98%; color: #fff; padding: 5px 5px 0 5px; margin-left: 10px;"><i class="fa fa-hand-o-right"></i>The candidates are required to arrange their own accommodation.The State Selection Board will not provide any accommodation facilities to the candidates at any venue.</li>
                        <li>Applicants are suggested to apply online in time in order to avoid last minutes rush.</li>--%>
                        <li>Candidates are warned not to indulge in any malpractice or attempt any unfair means during the recruitment process.</li>
                        <li>Candidates are cautioned against payment of bribe/illegal gratification to middle men or anyone else for securing job.</li>
                        <li>If any malpractice or corruption come to the notice of State Selection Board, then persons demanding and receiving bribes as well as the concerned candidates will be liable to face criminal prosecution for the offence and their candidature shall be cancelled.</li>
                        <li>If any such activities come to notice to any candidate, he should approach the State Vigilance Department in their website: <a href="http://www.odishavigilance.gov.in/" target="_blank" style="color: #e74c3c;">www.odishavigilance.gov.in </a></li>

                    </ul>
                </div>
                <div class="modal-footer" style="padding: 10px 0 5px 0 !important; text-align: center !important;">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">


            <div class="col-lg-12 p0">
                <div>
                    <a href="/pdf/Final%20Select%20List%209th%20SIRB.PDF" target="_blank" title="Publication of the Select List of Candidate Recruitment pf Constables in 9th SIRB">
                        <div class="toprightIcon">
                            <img src="/g2c/img/select_list_sirb.gif" alt="Publication of the Select List of Candidate Recruitment pf Constables in 9th SIRB" class="img-responsive" />
                        </div>
                    </a>
                    <%--  <a href="/WebApp/Kiosk/OISF/AdmitCard.aspx" target="_blank" style="">
                    <div style="position: absolute; top: -53px; right: 15px; z-index: 1000;">
                        <img src="/g2c/img/written_test_gif_final.gif" alt="Download e-pass SIRB" />
                    </div>
                </a>--%>
                    <%--<a href="/g2c/pdf/admission_notice_ug_course_ouat.pdf"> <div style="position: absolute; bottom: 1px; right: 1px; left:0; z-index: 1000;">
                     <img src="../img/admission_ug_notice_link.png" alt="Admission Notice OUAT UG Entrance Examination 2017-18" /></div></a>--%>

                    <a href="/WebApp/Kiosk/OUAT/OUATPage.aspx">
                        <div class="toprightBtmIcon">
                            <img src="../img/ouat_entrance_popupIcon.png" alt="Onilne Form OUAT UG Entrance Examination 2017-18" class="img-responsive" />
                        </div>
                    </a>
                    <!--<div style="position: absolute; right: 490px; bottom: 57px; z-index: 1000;">
                    <button type="button" id="myBtn" class="btn btn-success btn-lg" style="background-color: #fff; border: none; padding: 8px;">
                        <span class="glyphicon glyphicon glyphicon-play" aria-hidden="true" style="color: #4D4D4D; font-size: 30px;"></span>
                    </button>

                    <button type="button" id="myBtn2" class="btn-danger btn-lg" style="background-color: #fff; border: none; padding: 8px;">
                        <span class="glyphicon glyphicon glyphicon-pause" aria-hidden="true"></span>
                    </button>
                </div>-->
                    <%-- <a href="/WebApp/Kiosk/OISF/DownloadEPass.aspx" target="_blank" style="">
                    <div style="position: absolute; top: -53px; right: 15px; z-index: 1000;">
                        <img src="/g2c/img/final4.gif" alt="Download e-pass SIRB" />
                    </div>
                </a>--%>
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                            <li data-target="#myCarousel" data-slide-to="3"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img src="/g2c/img/slider1.jpg" alt="Launch of e-tranfer" class="imgslide img-responsive" />
                            </div>

                            <div class="item">
                                <img src="/g2c/img/slider2.jpg" alt="CAP-An Initiative of Odisha Got." class="imgslide img-responsive" />
                            </div>

                            <div class="item">
                                <img src="/g2c/img/slider3.jpg" alt="Odisha Investor Meet" class="imgslide img-responsive" />
                            </div>

                            <div class="item">
                                <img src="/g2c/img/slider4.jpg" alt="Shri Naveen Patnaik Speech" class="imgslide img-responsive" />
                            </div>
                        </div>

                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <%--<a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=388">
                <div class="aplyoisf">
                    <div class="col-md-8 aplygrdnt">Application for Recruitment of 
Constables in 9th India
Reserve Battalion <br />କନେଷ୍ଟବଳ ପଦବୀ ପାଇଁ ଆବେଦନ କରନ୍ତୁ</div>
                    <div class="col-md-4 aplyhrebg"><span class="blink_me">APPLY <br />
                        HERE >></span></div>

                </div></a>--%>
                </div>
            </div>
            <!--<div class="col-md-12 col-xs-12  p0"><img src="/g2c/img/slider.jpg" class="imgslide" alt="" /></div>
            <div class="col-md-2 col-xs-12 p0">
                <a href="../WebApp/Citizen/Forms/Geustuser.aspx" target="_blank">
                    <div class="col-xs-12 p0">
                        <div class="citi_reg">
                            <div class="citi_regtxt">
                                <b><span class="fsize34">CITIZEN </span></b>
                                <span class="fsize18" style="display:block">Services</span>
                            </div>
                            <div class="citi_symbl"><i class="fa fa-group"></i></div>

                        </div>
                    </div>
                </a>

                <a href="/Account/Login" target="_blank">
                    <div class="col-xs-12 p0">
                        <div class="csc_reg">
                            <div class="citi_regtxt">
                                <b><span class="fsize34">LOGIN </span></b>
                                <span class="fsize18" style="display:block">CSC/Department</span>
                            </div>
                            <div class="csc_symbl"><i class="fa fa-unlock-alt"></i></div>

                        </div>
                    </div>
                </a>

                <a href="http://gis.csc.gov.in/locator/csc.aspx" target="_blank">
                    <div class="col-xs-12 p0">
                        <div class="locatecntr">
                            <div class="citi_regtxt ptop5">
                                <b><span class="fsize34">LOCATE </span></b>
                                <span class="fsize18" style="display:block">CSC Center</span>
                            </div>
                            <div class="locate_symbl"><i class="fa fa-map-marker"></i></div>

                        </div>
                    </div>
                </a>

                <a href="/webapp/kiosk/forms/applicationstatus.aspx" target="_blank">
                    <div class="col-xs-12 p0">
                        <div class="trackapp">
                            <div class="citi_regtxt">
                                <b><span class="fsize34">TRACK </span></b>
                                <span class="fsize18" style="display:block">Application</span>
                            </div>
                            <div class="track_symbl"><i class="fa fa-street-view"></i></div>
                        </div>
                    </div>
                </a>

            </div>-->
        </div>
    </div>

    <div class="row">
        <div class="container-fluid mtop15">

            <!-- ./col -->
            <div class="col-lg-3 col-xs-6 pright0">
                <!-- small box -->
                <div class="small-box deptbox_bg">
                    <div class="inner">
                        <asp:Label ID="lblDepartment" CssClass="lgbox_hd" runat="server"></asp:Label>
                        <p>Department</p>
                    </div>
                    <div class="icon"><i class="fa fa-university"></i></div>
                    <div class="small-box-footer"></div>
                    <!--<a href="#" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a>-->
                </div>
            </div>
            <!-- ./col -->
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6 pright0">
                <!-- small box -->
                <div class="small-box servbox_bg">
                    <div class="inner">
                        <asp:Label ID="lblServices" CssClass="lgbox_hd" runat="server"></asp:Label>
                        <p>Services </p>
                    </div>
                    <div class="icon"><i class="fa fa-building-o"></i></div>
                    <div class="small-box-footer"></div>
                    <!--<a href="#" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a>-->
                </div>
            </div>
            <!-- ./col -->
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6 pright0">
                <!-- small box -->
                <div class="small-box appbox_bg">
                    <div class="inner">
                        <asp:Label ID="lblTrasation" CssClass="lgbox_hd" runat="server"></asp:Label>
                        <p>Application Received</p>
                    </div>
                    <div class="icon"><i class="fa fa-group"></i></div>
                    <div class="small-box-footer"></div>
                    <!--<a href="#" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a>-->
                </div>
            </div>
            <!-- ./col -->

            <%-- <div class="col-lg-3 col-xs-6">
                    <div class="small-box compbox_bg">
                        <div class="inner">
                            Dashboard
                            <p>View All Reports</p>
                        </div>
                        <div class="icon"><i class="fa fa-keyboard-o"></i></div>
                        <div class="small-box-footer"></div>
                        <a href="http://attendance.gov.in/reports/device" class="small-box-footer"> More info <i class="fa fa-arrow-circle-right"></i> </a>
                    </div>
                </div>--%>

            <div class="col-lg-3 col-xs-6">
                <div class="small-box compbox_bg">
                    <div class="inner">
                        <asp:Label ID="lblHabisha" CssClass="lgbox_hd" runat="server"></asp:Label>
                        <p>SSEPD Application Received</p>
                    </div>
                    <div class="icon"><i class="fa fa-keyboard-o"></i></div>
                    <div class="small-box-footer"></div>
                </div>
            </div>
            <!-- ./col -->
        </div>
        <!-- /.row -->
    </div>

    <div class="container-fluid content">
        <div class="col-lg-12">
            <div class="row">
                <!--<div class="col-md-3 col-xs-12">
                          <div class="citiz_cornerhold">
                                       <div class="citiz_hd">CITIZEN CORNER’S <i class="fa fa-cogs"></i></div>
                                           <div class="citiz_txtbox">
                                                  <div class="citiz_list">
                                                      <ul>
                                                         <li><a href="#"><i class="fa fa-caret-right"></i>Forgot ID/Password</a></li>
                                                          <li><a href="#"><i class="fa fa-caret-right"></i>Online Grievance</a></li>
                                                     </ul>
                                                      </div>
                                          <div class="citiz_list">
                                           <ul>

                                          <li><a href="#"><i class="fa fa-caret-right"></i>Track Application</a></li>
                                         <li><a href="#"><i class="fa fa-caret-right"></i>Check Grievance Status</a></li>
                                         </ul></div>
                                      </div>
                            </div>
                          </div>-->

                <div class="col-md-9 col-xs-12 pleft0 mtop15">
                    <div class="w100 whitebg ptop10 pleft10 pright10">
                        <p><b class="fsize18">Welcome to Odisha Right to Public Services Act</b></p>
                        <p>
                            Odisha Right to Public Services Act, 2012 in Odisha is an exemplary initiative by the State Government to check corruption in public service delivery. The law enables the citizens to demand public services as a right and also includes a provision for penal action against officials failing to provide the services within the stipulated time.
                            The idea is to generate a demand for services, and to provide citizens with a platform for getting their grievances redressed in a time bound manner.
                        </p>
                    </div>
                    <div class="col-xs-12 ptop15 pleft0 pright0">
                        <div class="services_box">
                            <div class="services_box_hd w100 m0">AVAILABLE ONLINE SERVICES <i class="fa fa-cubes"></i><%--<b><span class="pull-right" style="margin-top: 4px; margin-right: 10px;"><a href="/WebApp/Citizen/Forms/Geustuser.aspx" target="_blank" class="aplyctserv" style="color: #FFFF00;">Apply for Citizen Services >></a></span></b>--%></div>
                            <div class="services_txt">
                                <div id="mydiv" class="col-xs-12 dept_ser_scroll">
                                    <!--<div class="panel-body">
                                    <div class="scroll_hd">Health and Family Welfare</div>
                                    <div class="panel-body-hold">
                                        <div class="col-md-6 p0">
                                            <ul>
                                                <li class="news-item">
                                                    <div class="row">
                                                        <div class="col-md-6 col-sm-12 col-xs-12">
                                                            <a href="/WebApp/Citizen/Forms/Geustuser.aspx" target="_blank"><i class="fa fa-caret-right"></i>Birth Certificate</a>
                                                        </div>
                                                    </div>
                                                </li>

                                            </ul>
                                        </div>
                                        <div class="col-md-6 p0">
                                            <ul>
                                                <li class="news-item">
                                                    <div class="row">
                                                        <div class="col-md-6 col-sm-12 col-xs-12">
                                                            <a href="/WebApp/Citizen/Forms/Geustuser.aspx" target="_blank"><i class="fa fa-caret-right"></i>Death Certificate</a>
                                                        </div>
                                                    </div>
                                                </li>

                                            </ul>
                                        </div>

                                    </div>
                                </div>-->

                                    <div class="panel-body">
                                        <div class="scroll_hd">Skill Development and Technical Education Department</div>
                                        <div class="panel-body-hold">
                                            <div class="col-md-6 p0">
                                                <ul>
                                                    <li class="news-item">
                                                        <div class="row">
                                                            <div class="col-xs-12">
                                                                <a href="/Account/Login" target="_blank" style="white-space: nowrap;"><i class="fa fa-caret-right"></i>Issue of Duplicate Diploma Certificate</a>
                                                            </div>
                                                        </div>
                                                    </li>


                                                    <li class="news-item">
                                                        <div class="row">
                                                            <div class="col-xs-12">
                                                                <a href="/Account/Login" target="_blank" style="white-space: nowrap;"><i class="fa fa-caret-right"></i>Issue of Migration Certificate</a>
                                                            </div>
                                                        </div>
                                                    </li>

                                                    <li class="news-item">
                                                        <div class="row">
                                                            <div class="col-xs-12">
                                                                <a href="/Account/Login" target="_blank" style="white-space: nowrap;"><i class="fa fa-caret-right"></i>Compliance of Verification of Document</a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="news-item" style="display: none">
                                                        <div class="row">
                                                            <div class="col-xs-12">
                                                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=405" target="_blank" style="white-space: nowrap;"><i class="fa fa-caret-right"></i>Verify Student Registration With UID</a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>

                                            <div class="col-md-6 p0">
                                                <ul>
                                                    <li class="news-item">
                                                        <div class="row">
                                                            <div class="col-xs-12">
                                                                <a href="/Account/Login" target="_blank" style="white-space: nowrap;"><i class="fa fa-caret-right"></i>Issue of Duplicate Divisional Marksheet</a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="news-item">
                                                        <div class="row">
                                                            <div class="col-xs-12">
                                                                <a href="/Account/Login" target="_blank" style="white-space: nowrap;"><i class="fa fa-caret-right"></i>Issue of Semester Marksheet</a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="news-item" style="display: none;">
                                                        <div class="row">
                                                            <div class="col-xs-12">
                                                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=404" target="_blank" style="white-space: nowrap;"><i class="fa fa-caret-right"></i>Student Registration With UID</a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="panel-body">
                                        <div class="scroll_hd">Social Securities and Empowerment of Person with Disabilities (SSEPD)</div>
                                        <div class="panel-body-hold">
                                            <div class="col-md-6 p0">
                                                <ul>
                                                    <li class="news-item">
                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                                <a href="/Account/Login" target="_blank"><i class="fa fa-caret-right"></i>National Family Benefit Scheme (NFBS)</a>
                                                            </div>
                                                        </div>

                                                    </li>

                                                    <li class="news-item">
                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                                <a href="/Account/Login" target="_blank"><i class="fa fa-caret-right"></i>Indira Gandhi National Widow Pension Scheme (IGNWP)</a>
                                                            </div>
                                                        </div>
                                                    </li>

                                                    <li class="news-item">
                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                                <a href="/Account/Login" target="_blank"><i class="fa fa-caret-right"></i>Madhu Babu Pension Yojana (MBPY)</a>
                                                            </div>
                                                        </div>
                                                    </li>

                                                </ul>
                                            </div>
                                            <div class="col-md-6 p0">
                                                <ul>
                                                    <li class="news-item">
                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                                <a href="/Account/Login" target="_blank"><i class="fa fa-caret-right"></i>Indira Gandhi National Disabled Pension Scheme (IGNDP)</a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="news-item">
                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                                <a href="/Account/Login" target="_blank"><i class="fa fa-caret-right"></i>Indira Gandhi National Old Age Pension Scheme (IGNOAP)</a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>

                                        </div>
                                    </div>






                                    <%--<div class="panel-body">
                                        <div class="scroll_hd">Department of Culture</div>
                                        <div class="panel-body-hold">
                                            <div class="col-md-6 p0">
                                                <ul>
                                                    <li class="news-item">
                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                                <a href="/Account/Login" target="_blank"><i class="fa fa-caret-right"></i>Habisha Brata Scheme</a>
                                                            </div>
                                                        </div>
                                                    </li>

                                                </ul>
                                            </div>

                                        </div>
                                    </div>--%>

                                    <!--  <div class="panel-body">
                        <div class="scroll_hd">General Administration Department (GA)</div>
                        <div class="panel-body-hold">
                            <div class="col-md-6 p0">
                                <ul>
                                    <li class="news-item">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx" target="_blank"><i class="fa fa-caret-right"></i>CM Relief Fund</a>
                                            </div>
                                        </div>
                                    </li>

                                    <li class="news-item">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx" target="_blank"><i class="fa fa-caret-right"></i>Issue of mutation order of lease hold plots</a>
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                            <div class="col-md-6 p0">
                                <ul>
                                    <li class="news-item">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx" target="_blank"><i class="fa fa-caret-right"></i>Issue of conversion order of lease hold plots</a>
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </div>

                        </div>
                    </div>


             <div class="panel-body">
                        <div class="scroll_hd">Skill Development and Technical Education Department</div>
                        <div class="panel-body-hold">
                            <div class="col-md-6 p0">
                                <ul>
                                    <li class="news-item">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx" target="_blank"><i class="fa fa-caret-right"></i>Migration Certificate</a>
                                            </div>
                                        </div>
                                    </li>

                                    <li class="news-item">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx" target="_blank"><i class="fa fa-caret-right"></i>Issuance of Transcript </a>
                                            </div>
                                        </div>
                                    </li>

                                    <li class="news-item">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx" target="_blank"><i class="fa fa-caret-right"></i>Divisional Certificate</a>
                                            </div>
                                        </div>
                                    </li>

                                    <li class="news-item">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx" target="_blank"><i class="fa fa-caret-right"></i>Semester Marksheet </a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-6 p0">
                                <ul>
                                    <li class="news-item">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx" target="_blank"><i class="fa fa-caret-right"></i>Duplicate Diploma Certificate</a>
                                            </div>
                                        </div>
                                    </li>


                                    <li class="news-item">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx" target="_blank"><i class="fa fa-caret-right"></i>Verification Certificate</a>
                                            </div>
                                        </div>
                                    </li>

                                    <li class="news-item">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx" target="_blank"><i class="fa fa-caret-right"></i>Photocopy of AnswerSheet</a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                        </div>
                  </div>

                    <div class="panel-body">
                        <div class="scroll_hd">Home Department</div>
                        <div class="panel-body-hold">
                            <div class="col-md-6 p0">
                                <ul>
                                    <li class="news-item">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx" target="_blank"><i class="fa fa-caret-right"></i>FIR Registration</a>
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </div>


                        </div>-->
                                </div>

                            </div>
                            <!--<div class="col-md-4">
                       <div class="sub_serviceshd">Applications</div>
                           <div class="services_txtboxhold">
                                   <ul>
                                       <li><a href="#"><i class="fa fa-caret-right"></i>Copy of FIR to the complainant</a></li>
                                       <li><a href="#"><i class="fa fa-caret-right"></i>Disposal of Application</a></li>
                                       <li><a href="#"><i class="fa fa-caret-right"></i>Disposal of application for NOC for fairs</a></li>
                                       <li><a href="#"><i class="fa fa-caret-right"></i>Supply of copy of fire report</a></li>
                                       <li><a href="#"><i class="fa fa-caret-right"></i>Fire Certificate for Fire incident without Insurance</a></li>
                                       <li><a href="#"><i class="fa fa-caret-right"></i>Fire of Certificate for Fire incident in insured premises</a></li>
                                       <li><a href="#"><i class="fa fa-caret-right"></i>Fire incident without Damage of property</a></li>
                                      <li><a href="#"><i class="fa fa-caret-right"></i>Registration of Ex-servicemen</a></li>
                                   </ul>
                           </div>
                   </div>-->
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-xs-12 mtop15 pleft0 pright0">
                    <a href="/Account/Login" target="_blank" style="display: none">
                        <div class="col-xs-12 p0 mbtm10">
                            <div class="complreg">
                                <div class="citi_regtxt">
                                    <b><span class="fsize34" style="display: block">APPLY</span></b>
                                    <b><span class="fsize18">For<%-- SSEPD --%> Services</span></b>
                                </div>
                                <div class="complreg_symbl"><i class="fa fa-edit"></i></div>
                            </div>
                        </div>
                    </a>
                    <a data-toggle="modal" href="#myModal3">
                        <div class="col-xs-12 p0 mbtm10">
                            <div class="applygrpd">
                                <div class="citi_regtxt">
                                    <b><span class="fsize34" style="display: block">e-Appeal</span></b>
                                    <b><span class="fsize18">Online Grievance</span></b>
                                </div>
                                <div class="applygrpd_symbl"><i class="fa fa-list"></i></div>
                            </div>
                        </div>
                    </a>

                    <%--<a href="https://gaestate.in/eappeal/" target="_blank">--%>
                    <%--<a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=399" target="_blank">
                        <div class="col-xs-12 p0 mbtm10">
                            <div class="applygrpd">
                                <div class="citi_regtxt">
                                    <b><span class="fsize34" style="display: block">e-Appeal</span></b>
                                    <b><span class="fsize18">Online Grievance</span></b>
                                </div>
                                <div class="applygrpd_symbl"><i class="fa fa-list"></i></div>
                            </div>
                        </div>
                    </a>--%>

                    <a href="/webapp/kiosk/forms/applicationstatus.aspx" target="_blank">
                        <div class="col-xs-12 p0">
                            <div class="trackapp">
                                <div class="citi_regtxt">
                                    <b><span class="fsize34">TRACK </span></b>
                                    <span class="fsize18" style="display: block">Application</span>
                                </div>
                                <div class="track_symbl"><i class="fa fa-street-view"></i></div>
                            </div>
                        </div>
                    </a>

                    <a href="/g2c/forms/CenterList.aspx" target="_blank">
                        <div class="col-xs-12 mtop10 p0">
                            <div class="locatecntr">
                                <div class="citi_regtxt ptop5">
                                    <b><span class="fsize34">LOCATE </span></b>
                                    <span class="fsize18" style="display: block">CSC Center</span>
                                </div>
                                <div class="locate_symbl"><i class="fa fa-map-marker"></i></div>

                            </div>
                        </div>
                    </a>




                    <div class="clearfix"></div>

                    <div class="citiz_cornerhold mtop10">
                        <div class="citiz_hd">NEWS & ACHIEVEMENT <i class="fa fa-rocket"></i></div>
                        <div class="str4 str_wrap str_vertical" style="height: 240px;">
                            <div class="newswrap">
                                <div class="newshld">
                                    <div class="newspc">
                                        <img src="/g2c/img/news1.jpg" alt="" />
                                    </div>
                                    <div class="newstxt">
                                        Citizen gets computerized acknowledgement. Citizen can check the status of application at any time and any where (24x7)<br />
                                        <b><a href="#">more...</a></b>
                                    </div>
                                </div>

                                <div class="newshld">
                                    <div class="newspc">
                                        <img src="/g2c/img/news2.jpg" alt="" />
                                    </div>
                                    <div class="newstxt">
                                        State Cabinet approved to place the Odisha Right to Public Services Bill 2012 on 16th June 2012.<br />
                                        <b><a href="#">more...</a></b>
                                    </div>
                                </div>

                                <div class="newshld bdrnone">
                                    <div class="newspc">
                                        <img src="/g2c/img/news3.jpg" alt="" />
                                    </div>
                                    <div class="newstxt">
                                        The bill aims to provide public services to the citizens in a time bound manner.<br />
                                        <b><a href="#">more...</a></b>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFFStateBind" runat="server" ClientIDMode="Static" />
</asp:Content>
