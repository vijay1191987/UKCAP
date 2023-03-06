<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="HotelBooking.aspx.cs" Inherits="CitizenPortal.WebAppUK.JimCorbett.HotelBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/jcstyle.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#CheckinDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    // Add validations
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            });
            $('#CheckoutDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
                onSelect: function (date) {
                    // Add validations
                    //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="container-fluid">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h2 class="form-heading" style="margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>Hotel Booking</h2>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Availability Status</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Select Nationality</label>
                            <select class="form-control">
                                <option value="Select">Select</option>
                                <option value="Indian">Indian</option>
                                <option value="Foreigner">Foreigner</option>
                                <option value="SARRC">SARRC</option>
                            </select>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Check In Date</label>
                            <input type="text" id="CheckinDate" class="form-control" placeholder="DD/MM/YYYY" />
                        </div>

                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Check Out Date</label>
                            <input type="text" id="CheckoutDate" class="form-control" placeholder="DD/MM/YYYY" />
                        </div>

                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2 text-center" style="margin-top: 19px;">
                        <a href="#" id="BtnChckAvailability" class="btn btn-success" style="text-decoration: none;">PROCEED</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <%--<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="table-responsive">
                <table cellpadding="0" cellspacing="0" style="width: 100%; border-bottom: 5px solid #535353; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px; margin: 0 auto;" id="available-seats">
                    <tbody>
                                <tr>
                                    <td colspan="6" class="tble-mainhd">Hotel Room Availability<br>
                                        <span class="statusinfo">Please choose the below fields to check the room availability</span>
                                    </td>
                                </tr>
                              <tr>
                                  <td class="tble-subhd">Select the zone you are Visiting</td>
                                   <td style="text-align:center; padding:15px; background-color:#fff; border: 1px solid #CDCDCD;">
                                        
                                        <select class="form-control">
                                        <option value="0">Select</option>
                                        <option value="1">Dhikala</option>
                                        <option value="2">Bijrani</option>
                                        <option value="3">Jhirna</option>
                                        <option value="4">Sonanadi</option>
                                        <option value="5">Durgadevi</option>
                                        <option value="6">Dhela</option>
                                        </select></td>
                                  <td class="tble-subhd">Select Accommodation Type</td>
                                  <td style="text-align:center; padding:15px; background-color:#fff; border: 1px solid #CDCDCD;">
                                      <select class="form-control">
                                        <option value="0">Select</option>
                                        <option value="1">Single Bed</option>
                                        <option value="2">Double Bed</option>
                                        <option value="3">Four Bed</option>
                                        </select></td>
                                  <td class="tble-subhd">Required No. of Rooms</td>
                                    <td style="text-align:center; padding:15px; background-color:#fff; border: 1px solid #CDCDCD;">
                                        <select class="form-control">
                                        <option value="0">Select</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align:center; padding:10px 15px; background-color:#fff; border: 1px solid #CDCDCD;"> 
                                        <input type="button" class="btn btn-primary" value="Proceed for Availability"/></td>
                                </tr>
                            </tbody>
                </table>
                    </div>
            </div>--%>
        </div>
    </div>
</asp:Content>
