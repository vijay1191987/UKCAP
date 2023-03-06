<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="FoodLicenseForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.EDistrict.FoodLicense.FoodLicenseForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="container-fluid">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h2 class="form-heading" style="margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>FOOD LICENSE APPLICATION FORM  <small class="pull-right txt_white pright10">Language :
                        <input type="button" id="ContentPlaceHolder1_btnLang" class="btn-link" style="height: 25px; color: #fff;" onclick="javascript: return ChangeLanguage();" value="हिन्दी" /><i class="fa fa-hand-o-up"></i></small></h2>
            </div>
            <%--Basic Details START Here--%>
            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 pleft0">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Business Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group" style="line-height:22px;">
                                <label class="manadatory">Type of Business</label>
                               <div class="col-lg-3 pleft0"><input type="checkbox" />Catering</div>
                                <div class="col-lg-3"> <input type="checkbox" />Distributor / Supplier</div>
                                <div class="col-lg-3"> <input type="checkbox" />Hotel</div>
                                <div class="col-lg-3"> <input type="checkbox" />Milk Collection / Chilling</div>
                                <div class="col-lg-3 pleft0"> <input type="checkbox" />Packaging</div>
                                <div class="col-lg-3"> <input type="checkbox" />Restaurant</div>
                                <div class="col-lg-3"> <input type="checkbox" />Retail Trade</div>
                                <div class="col-lg-3"> <input type="checkbox" />Slaughter House</div>
                                <div class="col-lg-3 pleft0"> <input type="checkbox" />Solvent extracting</div>
                                <div class="col-lg-3"> <input type="checkbox" />Solvent Extracting and Oil Refining plant</div>
                                <div class="col-lg-3"> <input type="checkbox" />Storage / Warehouse / Cold Storage</div>
                                <div class="col-lg-3"> <input type="checkbox" />Transporter of food</div>
                                <div class="col-lg-3"> <input type="checkbox" />Warehouse Trade</div>
                                <div class="col-lg-3 pleft0"> <input type="checkbox" />Dhaba or any other food vending establishment</div>
                                <div class="col-lg-3"> <input type="checkbox" />Manufacturing / Processing including sorting,grading etc.</div>
                                <div class="col-lg-3"> <input type="checkbox" />Relabeling ( Manufactured by third party under own packing and labelling)</div>
                                <div class="col-lg-3"> <input type="checkbox" />Solvent Extract Plant with Preclination of oil seeds or pre expelling of oil</div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mtop10"></div>
                       
                        
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            <%--Photograph & Signature--%>
            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 p0">
                <div id="divPhoto" class="col-md-12 box-container">
                    <div class="box-heading" style="padding: 12px 8px;">
                        <h4 class="box-title manadatory">Applicant Photograph
                        </h4>
                    </div>
                    <div class="box-body box-body-open p0">
                        <div class="col-lg-12">
                            <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 220px;" id="myImg" />
                            <input class="camera" id="File1" name="Photoupload" type="file" />
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Company Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                         <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Company/Organization Name</label>
                                <input type="text" id="txtDeceasedfullname" placeholder="Company/Organization Name" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                            <div class="form-group">
                                <label class="manadatory">Address of Registered Office</label>
                                <input type="text" id="txtRegOfficeAddress" placeholder="Address of Registered Office" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <label class="manadatory">Address of the premises for which the licensing application is</label>
                                <textarea class="form-control" rows="3" cols="3" style="resize:none;"></textarea>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Concern Person Name</label>
                                <input type="text" id="txtConcernPersonName" placeholder="Concern Person Name" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Company Landline No</label>
                                <input type="text" id="txtComLandlineNo" placeholder="Company Landline No" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Email ID</label>
                                <input type="text" id="txtComEmailID" placeholder="Email ID" class="form-control" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            <div class="clearfix"></div>

            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Incharge of Operation Person Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                         <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
                            <div class="form-group">
                                <label class="manadatory">Name</label>
                                <input type="text" id="txtInchargefullname" placeholder="Full Name" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Eligibility</label>
                                <input type="text" id="txtInchargeEligibility" placeholder="Eligibility" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Mobile No</label>
                                <input type="text" id="txtInchargeMobileNo" placeholder="Mobile No" class="form-control" />
                            </div>
                        </div>
                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Telephone No</label>
                                <input type="text" id="txtInchargeTelephoneNo" placeholder="Telephone No" class="form-control" />
                            </div>
                        </div>
                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Email ID</label>
                                <input type="text" id="txtInchargeEmailId" placeholder="Email ID" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Photo Identity Card No</label>
                                <input type="text" id="txtInchargeIDCardNo" placeholder="Photo Identity Card No" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Photo Identity Card Expiration Date</label>
                                <input type="text" id="txtInchargeIDCardExpDate" placeholder="DD/MM/YYYY" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <label class="manadatory">Address </label>
                                <textarea class="form-control" id="txtInchargeAddress" rows="2" cols="2" style="resize:none;"></textarea>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Complying Person Details <small class="pull-right" style="color:#fff; font-weight:normal !important;"><input type="checkbox" /> same as incharge person</small></h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
                            <div class="form-group">
                                <label class="manadatory">Name</label>
                                <input type="text" id="txtComplyingfullname" placeholder="Full Name" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Eligibility</label>
                                <input type="text" id="txtComplyingEligibility" placeholder="Eligibility" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Mobile No</label>
                                <input type="text" id="txtComplyingMobileNo" placeholder="Mobile No" class="form-control" />
                            </div>
                        </div>
                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Telephone No</label>
                                <input type="text" id="txtComplyingTelephoneNo" placeholder="Telephone No" class="form-control" />
                            </div>
                        </div>
                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Email ID</label>
                                <input type="text" id="txtComplyingEmailId" placeholder="Email ID" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Photo Identity Card No</label>
                                <input type="text" id="txtComplyingIDCardNo" placeholder="Photo Identity Card No" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Photo Identity Card Expiration Date</label>
                                <input type="text" id="txtComplyingIDCardExpDate" placeholder="DD/MM/YYYY" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <label class="manadatory">Address </label>
                                <textarea class="form-control" id="txtComplyingAddress" rows="2" cols="2" style="resize:none;"></textarea>
                            </div>
                        </div>
                        
                        <div class="clearfix"></div>
                    </div>
                </div>
            <div class="clearfix"></div>

             <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Production Details </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Production Capability</label>
                                <input type="text" id="txtProdCapability" placeholder="Production Capability" class="form-control" />
                            </div>
                        </div>
                         <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Approved Power load for use</label>
                                <input type="text" id="txtApprovePowerLoad" placeholder="Approved Power load" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Deposit Amount of License</label>
                                <input type="text" id="txtDepositLicenseAmt" placeholder="Deposit Amount of License" class="form-control" />
                            </div>
                        </div>
                         <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Demand Draft No.</label>
                                <input type="text" id="txtDDNumber" placeholder="Demand Draft No." class="form-control" />
                            </div>
                        </div>
                         <div class="col-xs-12 col-sm-12 col-md-4 col-lg-3">
                            <div class="form-group">
                              <label class="manadatory">Draft Payable</label>
                                <textarea rows="2" cols="1" class="form-control" style="resize:none;"></textarea>
                            </div>
                            </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3"> 
                            <div class="form-group">
                              <label class="manadatory">What products are dairy products</label>
                                <label class="mychckbx">
                                    <input name="chkDeclaration" type="checkbox" />
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3"> 
                            <div class="form-group">
                              <label class="manadatory">Does the product contain salvents extracted oil, D isiled mills</label>
                                 <label class="mychckbx">
                                    <input name="chkDeclaration" type="checkbox" />
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3"> 
                            <div class="form-group">
                              <label class="manadatory">The unit is equipped with an analytical laboratory</label>
                                 <label class="mychckbx">
                                    <input name="chkDeclaration" type="checkbox" />
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            </div>
                        <div class="clearfix"></div>
                        </div>
                 </div>
            <div class="clearfix"></div>

             <%--Declaratin Details--%>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" id="Div2">
                <div class="box-heading">
                    <h4 class="box-title register-num">Declaration</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-sm-6 col-md-6 col-lg-12">
                        <p class="text-justify">
                            <input name="" type="checkbox" id="FormDeclaration" class="pull-left" />
                            <b style="display: flex; line-height: 22px;">I, solemnly affirm that the above mentioned information submitted by me is true and correct to my knowledge and belief. I hereby agree to be liable for legal consequences for any information found incorrect or untrue at a later date
                            </b>
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container text-center">
                <input type="button" class="btn btn-success" value="Submit" />
                <input type="button" class="btn btn-danger mleft10" value="Cancel" />
            </div>
        </div>
    </div>
</asp:Content>
