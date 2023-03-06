<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="ConfirmBooking.aspx.cs" Inherits="CitizenPortal.WebAppUK.JimCorbett.ConfirmBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/jcstyle.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="container-fluid">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h2 class="form-heading" style="margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>Confirm Booking</h2>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Booking Details</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="booking-txt">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <table class="userinfo">
                                    <tbody>
                                        <tr>
                                            <td colspan="6" class="title">Booking Details </td>
                                        </tr>
                                        <tr>
                                            <td class="hd" style="width: 16.66666666666667%;">Zone: </td>
                                            <td style="width: 16.66666666666667%;">
                                                <label id="lblZone">Bijrani</label>
                                            </td>
                                            <td class="hd" style="width: 16.66666666666667%;">Permit Date: </td>
                                            <td style="width: 16.66666666666667%;">
                                                <label id="lblPermitDate">02-06-2018</label>
                                            </td>
                                            <td class="hd">Time Slot: </td>
                                            <td>
                                                <label id="lblTimeSlot">Morning</label>
                                            </td>

                                        </tr>
                                        <tr>

                                            <td class="hd">Booked By: </td>
                                            <td align="left" class="BlockContent">
                                                <label id="lblBookedBy">JimCorbett</label>
                                            </td>

                                            <td class="hd">Identity Card/No: </td>
                                            <td>
                                                <label id="lblIDValue">9811408869</label>
                                            </td>
                                            <td class="hd">Contact No: </td>
                                            <td>
                                                <label id="lblContNo">9811408869</label>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>

                                            <td class="hd">Email ID: </td>
                                            <td>
                                                <label id="lbleMailiD">jimcorbett@gmail.com</label>
                                            </td>
                                            <td class="hd">Alternate No: </td>
                                            <td>
                                                <label id="lblAlternateNo">9899408686</label>
                                                &nbsp;
                                            </td>
                                            <td class="hd">System IP</td>
                                            <td>
                                                <label id="lblState">116.74.4.14</label>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="clearfix"></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mtop10">
                                <div class="table-responsive">
                                    <div class="tourist-tble">
                                        <div class="title">Select the Visitors from the Added Tourist List</div>
                                    </div>
                                    <div style="background-color: #ca7d7d; color: #fff; text-align: center; padding: 5px 0 5px 0;">
                                        <b>Note:- </b>In Online Booking only for 6 person and 2 Children (below the age of 11 years) are allowed in a ticket. Children above 12 years of age will be considered as adult.     
                                    </div>
                                    <div id="AddVisitorTble" style="display: block; min-height: 0; max-height: 215px; overflow-y: scroll; text-align: center;">
                                        <div id="DivGridView" style="width: 100%; background-color: #fff;">
                                            <table style="width: 100%; background-color: #fff;" class="table table-striped table-bordered" id="tblSuspect">
                                                <tbody>
                                                    <tr>
                                                        <th style="text-align: center;">Select </th>
                                                        <th style="text-align: center;">Visitor Name</th>
                                                        <th style="text-align: center;">Gender</th>
                                                        <th style="text-align: center;">Age</th>
                                                        <th style="text-align: center;">Mobile</th>
                                                        <th style="text-align: center;">Nationality</th>
                                                        <th style="text-align: center;">ID Proof Type</th>
                                                        <th style="text-align: center;">ID Proof No</th>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 65px">
                                                            <input id="chkrow115" type="checkbox" name="chkrowname" onclick="AddSelectedVisitor(&quot;115,30,999000001676&quot;);"/></td>
                                                        <td style="">Sohan Kumar</td>
                                                        <td style="">Female</td>
                                                        <td style="">30</td>
                                                        <td style="">9899408686</td>
                                                        <td style="">Indian</td>
                                                        <td style="">PAN Card</td>
                                                        <td style="">BDSPK8008C</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 65px">
                                                            <input id="chkrow60" type="checkbox" name="chkrowname" onclick="AddSelectedVisitor(&quot;60,25,999000000736&quot;);"/></td>
                                                        <td style="">Vibhav</td>
                                                        <td style="">M</td>
                                                        <td style="">25</td>
                                                        <td style=""></td>
                                                        <td style="">Indian</td>
                                                        <td style="">PAN Card</td>
                                                        <td style="">Shimla8008C</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 65px">
                                                            <input id="chkrow59" type="checkbox" name="chkrowname" onclick="AddSelectedVisitor(&quot;59,30,999000000736&quot;);"/></td>
                                                        <td style="">Mohan</td>
                                                        <td style="">M</td>
                                                        <td style="">30</td>
                                                        <td style=""></td>
                                                        <td style="">Indian</td>
                                                        <td style="">PAN Card</td>
                                                        <td style="">DELHI8008C</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!----------------Tourist Details-------------------->
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mtop10">
                                <div class="table-responsive" id="DivTourist">
                                    <table id="VisitorTableFull" class="tourist-tble" style="width: 100%; margin: 0 auto; overflow: hidden;">
                                        <tbody>
                                            <tr>

                                                <td colspan="8" class="title">Tourist Details</td>
                                            </tr>
                                            <tr>
                                                <td colspan="8" style="background-color: #ca7d7d; color: #fff; text-align: center;">Enter the Tourist details and click on <b>VERIFY</b> button to add in visitor list. All fields are mandatory. </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 21%;" class="confirm-userhd">Tourist Name</td>
                                                <td style="width: 10%;" class="confirm-userhd">Gender</td>
                                                <td style="width: 7%;" class="confirm-userhd">Age</td>
                                                <td style="width: 8%;" class="confirm-userhd">Mobile</td>
                                                <td style="width: 10%;" class="confirm-userhd">Nationality</td>
                                                <td style="width: 12%;" class="confirm-userhd">ID Proof</td>
                                                <td style="width: 12%;" class="confirm-userhd">ID Proof No.</td>
                                                <td style="width: 7%;" class="confirm-userhd">Action</td>

                                            </tr>
                                            <tr id="TrVisitors1">
                                                <td>
                                                    <input name="" type="text" maxlength="100" id="txtVisitorName" class="form-control" />
                                                </td>
                                                <td>
                                                    <select name="" id="ddlGender" class="form-control">
                                                        <option value="0">Select</option>
                                                        <option value="F">Female</option>
                                                        <option value="M">Male</option>

                                                    </select>
                                                </td>
                                                <td>
                                                    <input name="" type="text" maxlength="2" id="txtAge" class="form-control" onkeypress="return CreateNumericAge(this,event,false)" />
                                                </td>
                                                <td>
                                                    <input name="" type="text" maxlength="10" id="txtMobile" class="form-control" />
                                                </td>
                                                <td>
                                                    <select name="" id="ddlNationality" class="form-control">
                                                        <option value="0">Select</option>
                                                        <option value="1">Indian</option>
                                                        <option value="2">Foreigner</option>
                                                        <option value="3">SARRC</option>
                                                    </select>

                                                </td>
                                                <td>
                                                    <select name="" id="ddlIDProofType" class="form-control">
                                                        <option value="0">---Select---</option>
                                                        <option value="Aadhaar Card">Aadhaar Card</option>
                                                        <option value="Driving Licence">Driving Licence</option>
                                                        <option value="PAN Card">PAN Card</option>
                                                        <option value="VoterID Card">VoterID Card</option>
                                                        <option value="Ration Card">Ration Card</option>
                                                        <option value="Passport">Passport</option>
                                                        <option value="Others">Others</option>

                                                    </select>
                                                </td>
                                                <td>
                                                    <input name="" type="text" id="txtIDProofNo" class="form-control" data-toggle="tooltip" title="Enter 12-digit aadhaar number!" onkeypress="return CreateAlphaNumericTextBox(this,event,true)" />
                                                </td>
                                                <td class="whitebg text-center">

                                                    <input type="button" class="btn btn-default" value="VERIFY" onclick="VisitorVrifiedBy();" />
                                                </td>
                                            </tr>


                                        </tbody>
                                    </table>
                                </div>
                                <br>
                                <!----------------Value Added Service-------------------->
                                <div class="table-responsive" id="DivValueAdded" style="display: none;">
                                    <table cellpadding="0" cellspacing="0" class="valueadded-tble" style="width: 100%; padding: 0; margin: 0; overflow: hidden;">
                                        <tbody>
                                            <tr>
                                                <td colspan="8" class="title">Value Added Service</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2" style="font-weight: bold; font-size: 1.15em; text-align: left; padding-left: 10px; width: 25%;">Vehicle Type</td>
                                                <td style="border-right: none !important; text-align: left; padding-left: 10px;" id="TDShared">
                                                    <div class="radio">
                                                        <label style="font-weight: bold;">
                                                            <input type="radio" id="rdShared" name="optradio" value="V001" onclick="ShowVechile();" />Shared</label>

                                                    </div>
                                                </td>
                                                <td style="border-right: none !important; text-align: left; padding-left: 10px;" id="TDPrivate">
                                                    <div class="radio">
                                                        <label style="font-weight: bold;">
                                                            <input type="radio" id="rdPrivate" name="optradio" value="V002" onclick="ShowVechile();" />Private</label>
                                                        <span>(Book your own Vehicle)</span>
                                                    </div>
                                                </td>
                                                <td style="text-align: left; padding-left: 10px;" id="TDFullDay">
                                                    <div class="radio">
                                                        <label style="font-weight: bold;">
                                                            <input type="radio" id="rdFullDay" name="optradio" value="V003" onclick="ShowVechile();" />Full Day Safari</label>
                                                        <span>(An extra charge of <i class="fa fa-rupee fa-fw"></i>5000 will be applicable)</span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr id="TDVechile" style="display: none;">
                                                <td colspan="4" style="font-size: 1.1em; text-align: left; padding-top: 6px; padding-bottom: 6px; padding-left: 10px; font-weight: 500;">Choose vehicle of your own choice 
                                                        <select id="ddlVechile" class="form-control" style="width: 250px; display: inline;">
                                                            <option value="Select">--Select Vehicle--</option>
                                                        </select><span style="font-weight: normal; padding-left: 6px;"> (For extra payment of <i class="fa fa-rupee fa-fw"></i>5000)</span></td>

                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <br>
                                <!----------------Vechile Availability Message------------------->
                                <div class="row" id="DivAlert" style="display: none;">
                                    <div class="col-lg-10 col-lg-push-1 booking-box mtop0 mbtm0 text-center">
                                        <div class="alert alert-warning">
                                            <b>Vehicle!</b> Vehicle not available in selected session please go to
                                            <a href="Citizen/Forms/AvailabilityStatus2.aspx">Availability</a>
                                        </div>
                                    </div>
                                </div>
                                <!----------------Additional Details-------------------->
                                <div class="table-responsive" id="DivAdditional" style="display: none;">
                                    <table cellpadding="0" cellspacing="0" class="additonalinfo-tble" style="width: 100%; overflow: hidden;">
                                        <tbody>
                                            <tr>
                                                <td colspan="8" class="title" style="text-align: left !important; font-size: 1.2em;">Additional Details</td>
                                            </tr>
                                            <tr>
                                                <td class="subhd" style="width: 15%">Particular</td>
                                                <td class="subhd" style="width: 60%">Name</td>
                                                <td class="subhd">Mobile No.</td>
                                                <td class="subhd">Alternate No.</td>
                                            </tr>
                                            <tr>
                                                <td><b>Vehicle Details</b>
                                                </td>
                                                <td>
                                                    <label id="txtVechileName" class="form-control"></label>
                                                </td>
                                                <td>--</td>
                                                <td>--</td>
                                            </tr>
                                            <tr>
                                                <td><b>Driver Details</b>
                                                </td>
                                                <td>
                                                    <label id="txtdrivername" class="form-control"></label>
                                                </td>
                                                <td>
                                                    <label id="txtdrivermobile" class="form-control"></label>
                                                </td>
                                                <td>
                                                    <label id="txtdriveraltmobile" class="form-control"></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Owner Details</b>
                                                </td>
                                                <td>
                                                    <label id="txtwonername" class="form-control"></label>
                                                </td>
                                                <td>
                                                    <label id="txtwonermobile" class="form-control"></label>
                                                </td>
                                                <td>
                                                    <label id="txtwoneraltmobile" class="form-control"></label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Guide Details</b>
                                                </td>
                                                <td>
                                                    <label id="txtguidename" class="form-control"></label>
                                                </td>
                                                <td>
                                                    <label id="txtguidemobile" class="form-control"></label>
                                                </td>
                                                <td>
                                                    <label id="txtguidaltmobile" class="form-control"></label>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <br />

                                <br />
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                                    <input type="button" id="ViewSummary" class="btn btn-primary" value="Booking Summary" data-toggle="modal" data-target="#costumModal5" style="width: 160px; padding: 11px 10px; margin-right: 3px; height: 42px;" />

                                    <input type="button" id="BtnNext" class="btn btn-info" value="Next >>" onclick="SubmitTravelVisitorList();" disabled="disabled" data-toggle="tooltip" title="Please select visitor list from grid!" style="width: 160px; padding: 10px 10px; margin-right: 3px;" />
                                    <input type="button" id="BtnNextForVechile" class="btn btn-info" value="Next >>" onclick="SubmitTravelVachileDetail();" data-toggle="tooltip" style="width: 160px; padding: 10px; margin-right: 3px; display: none;" />
                                </div>
                                <div class="clearfix"></div>
                                <br />
                                <div class="alert alert-success">
                                    <strong>Important Notice</strong>
                                    <ul>

                                        <li>1) The booking will be open 90 days in advance for foreigners and 45 days in advance for Indians.</li>
                                        <li>2) For foreigners tourist, ID required will be their passport and PAN card, U.I.C., Passport, Voter ID or any other government issued ID which will have to be shown at the time of entrance.</li>
                                        <li>3) Your Booking can be make through the payment gateway using
Credit Card, Debit Card, Money Transfer or any other method.</li>
                                        <li>4) Foreigners will be charged Rs. 250/- and Indians will be charged Rs. 100/- per online ticket.</li>
                                        <li>5) The entrance ticket for a Gypsy will be charged for 6 tourists even if less number of tourist are entering.</li>

                                        <li>6) For refund will be available at the rate of 75% for 21 days, 50% for 14 days, 25% for 7 days and
0% for less than 7 days.</li>
                                        <li>9) Children above 12 years of age will be treated as adults.</li>
                                        <li>10) The remaining permits, which have not been issued online will be allotted in the following order
of preference: -<br />
                                            a. State Guest, Honorable Supreme Court/High Court Judges, other VIPs.<br />
                                            b. NTCA and MoEF&amp;CC officials, Officers from Govt. of India, Forest Officers<br />
                                            c. Tourists at reception counter</li>
                                    </ul>
                                </div>

                            </div>
                            <div class="clearfix"></div>
                            <div class="mbtm20"></div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
