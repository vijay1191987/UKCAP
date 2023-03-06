<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="CitizenPortal.WebApp.Login.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">
         $(document).ready(function () {
             $("#step2").hide();
             $("#step3").hide();
             $("#proceedStep1").click(function () {
                 if ($("#step1").hide("slow")) {
                     $("#step2").slideDown("slow");
                     $("#step3").hide("slow");
                 }
             });
             $("#proceedStep2").click(function () {
                 if ($("#step1").hide("slow")) {
                     $("#step2").hide("slow");
                     $("#step3").slideDown("slow");
                 }
             });
            });
    </script>
    <style type="text/css">
        .style1 {
            width: 30%;
            background-color: #FFCCCC;
        }

        .style2 {
            color: #FF0066;
            font-size: large;
        }

        .style3 {
            color: #FF0066;
            font-size: x-large;
        }

        .forgotpwdWrapper {
            background-color: #E3E6ED;
            /*opacity:0.7;*/
            margin: 0 auto 30px auto;
            width: 100%;
        }

        .forgotPwdHolder {
            width: 550px;
            margin:0 auto;
        }
        .box-container {
            margin-bottom: 15px;
            padding-left: 15px;
            padding-right: 15px;
        }
        .box-container1 > .box-heading {
            background-color: #37495f;
            border: 1px solid #37495f;
            border-radius: 3px 3px 0 0;
            color: #fff;
            font-size: 1.4em;
            margin: 0;
            padding: 2px 15px;
        }

        .box-heading h4 {
                color: #fff;
                font-size: 25px;
            }

        .box-container1 > .box-body {
            background-color: rgba(252, 252, 252, 0.89) !important;
        }

        .box-container1 > .box-body-open {
            border: 1px solid #dddddd;
            border-radius: 3px;
        }
        .mbtm20 {
            margin-bottom: 20px !important;
        }

        .mtop50 {
            margin-top: 50px !important;
        }
        .mbtm50 {
            margin-bottom: 50px !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="row">
         <div class="col-lg-12 mtop50 mbtm50">
             <div class="forgotPwdHolder box-container1" id="step1">
                 <div class="box-heading">
                    <h4 class="box-title"><i class="fa fa-keyboard-o"></i> Forgot Password</h4>
                </div>
                 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 forgotpwdWrapper z-depth-4">
                 <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>Mobile Number*</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-mobile-phone fa-1x"></i>
                                </div>
                                <input type="number" name="Mobile" class="form-control"/>
                            </div>
                           
                        </div>

                    </div>

                 <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>Login ID*</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-user fa-1x"></i>
                                </div>
                                <input type="text" name="Name" class="form-control"/>
                            </div>
                            
                        </div>

                    </div>
                     <div class="form-group mtop10 mbtm50">
                         <div class="col-xs-7 pleft0">
                         <label class="form-label" for=""><b>Captcha Code*</b></label>
                         <img src="/Account/GetCaptcha" alt="verification code" /></div>
                         <div class="col-xs-5 pright0">
                             <input type="text" name="Name" class="form-control"/>
                         </div>
                     </div>
                      <div class="form-group text-center">

                        <button type="button" class="btn btn-primary mtop20" id="proceedStep1">Proceed <i class="fa fa-arrow-circle-right"></i></button>
                          </div>
             </div>
             </div>
             

             <div class="forgotPwdHolder box-container1" id="step2">
                 <div class="box-heading">
                    <h4 class="box-title"><i class="fa fa-keyboard-o"></i> Verify OTP</h4>
                </div>
                 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 forgotpwdWrapper z-depth-4">
                 <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>OTP Number*</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-qrcode fa-1x"></i>
                                </div>
                               <input type="password" name="OTP CODE" class="form-control"/>

                            </div>
                           
                        </div>

                    </div>
                      <div class="form-group mtop10 mbtm50 text-center">

                        <button type="button" class="btn btn-primary mtop20" id="proceedStep2">Verify</button>
                          </div>
             </div>
             </div>


             <div class="forgotPwdHolder box-container1" id="step3">
                 <div class="box-heading">
                    <h4 class="box-title"><i class="fa fa-keyboard-o"></i> Authenticate your Details</h4>
                </div>
                 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 forgotpwdWrapper z-depth-4">
                 <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>Login ID*</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-key fa-1x"></i>
                                </div>
                                <input type="text" name="Name" class="form-control"/>

                            </div>
                           
                        </div>

                    </div>

                     <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>Father Name*</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-mars fa-1x"></i>
                                </div>
                                 <input type="text" name="Name" class="form-control"/>

                            </div>
                           
                        </div>

                    </div>

                     <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>DOB</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar fa-1x"></i>
                                </div>
                                <input type="date" name="DOB" class="form-control"/>

                            </div>
                           
                        </div>

                    </div>

                     <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>Mobile No.</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-mobile-phone fa-1x"></i>
                                </div>
                                 <input type="number" name="OTP CODE" class="form-control"/>

                            </div>
                           
                        </div>

                    </div>

                     <div class="form-group mtop10 mbtm50">
                        <label class="form-label" for=""><b>Email ID</b></label>
                        <div class="col-xs-12 pright0 pleft0">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-envelope fa-1x"></i>
                                </div>
                                 <input type="email" name="Name" class="form-control"/>

                            </div>
                           
                        </div>

                    </div>
                      <div class="form-group mtop10 text-center"><button type="button" class="btn btn-primary">Submit</button>
                          </div>
             </div>
             </div>
         </div>
    </div>
</asp:Content>
