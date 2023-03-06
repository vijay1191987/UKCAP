<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="DayBooking.aspx.cs" Inherits="CitizenPortal.WebAppUK.JimCorbett.DayBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/jcstyle.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#txtVisitDate').datepicker({
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
                <h2 class="form-heading" style="margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>Day Booking</h2>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Availability Status</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Select Zone</label>
                            <select name="" id="ddlZone" class="form-control">
                                <option value="0">-Select-</option>
                                <option value="01">Bijrani</option>
                                <option value="02">Jhirna</option>
                                <option value="03">Durga Devi</option>
                                <option value="04">Dhikala</option>
                                <option value="05">Dhela</option>
                                <option value="06">Sonanadi</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Date of Visit</label>
                            <input type="text" id="txtVisitDate" class="form-control" placeholder="DD/MM/YYYY" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                        <label class="manadatory">No. of Person</label>
                        <div class="form-group">

                            <div class="col-xs-6 pleft0 pright0">
                                <input type="text" id="AdultCnt" class="form-control" placeholder="Adult" maxlength="1" />
                            </div>
                            <div class="col-xs-6 pleft0 pright0">
                                <input type="text" id="ChildCnt" class="form-control" placeholder="Child" maxlength="1" />
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Select Nationality</label>
                            <select id="ddlN" class="form-control">
                                <option value="0">Select</option>
                                <option value="1">Indian</option>
                                <option value="2">Foreigner</option>
                                <option value="3">SARRC</option>

                            </select>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 text-center" style="margin-top: 19px;">
                        <a href="#" id="BtnChckAvailability" class="btn btn-success" style="text-decoration: none;">CHECK AVAILABILITY</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <%--<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="table-responsive">
                <table cellpadding="0" cellspacing="0" style="width: 100%; border-bottom: 5px solid #535353; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px; margin: 0 auto;" id="available-seats">
                    <tbody>
                        <tr>
                            <td colspan="7" class="tble-mainhd">Available Jeeps
                                        <span id="lblZone" style="font-size: 17px;">Bijrani ( Amdanda Entry Gate ) </span>
                                <br/>
                                <span class="statusinfo">Availability Status as on
                                            <span id="lbldate">Monday, June, 4, 2018, 11:07:16 AM</span></span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7"></td>
                        </tr>
                        <tr>
                            <td rowspan="2" class="tble-subhd">Date
                            </td>
                            <td colspan="3" class="tble-subhd" style="background-color: #D9DDE3 !important;">Morning (<span id="lblMTime">Entry: 06:30 AM | Exit: 13:30 PM</span>)
                            </td>
                            <td colspan="3" class="tble-subhd" style="background-color: #DCD1CF !important;">Evening (<span id="lblETime">Entry: 13:30 PM | Exit: 18:30 PM</span>)
                            </td>
                        </tr>
                        <tr>
                            <td class="tble-subhd">Shared</td>
                            <td class="tble-subhd">Private</td>
                            <td class="tble-subhd">Full Day</td>
                            <td class="tble-subhd">Shared</td>
                            <td class="tble-subhd">Private</td>
                            <td class="tble-subhd">Full Day</td>
                        </tr>

                        <tr>
                            <td class="tble-maintxt">04 Jun 2018</td>
                            <!-------------Morning Sheet's Status------------->

                            <td class="tble-maintxt mrng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('04-06-2018','01','M','Shared','Bijrani' );return false">2</a>
                                    </span>

                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <td class="tble-maintxt mrng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('04-06-2018','01','M','Private','Bijrani' );return false">23</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>
                            </td>
                            <td class="tble-maintxt mrng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('04-06-2018','01','M','FullDay','Bijrani' );return false">5</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <!----------------Evening Sheet's Status---------->
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('04-06-2018','01','E','Shared','Bijrani' );return false">2</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('04-06-2018','01','E','Private','Bijrani' );return false">23</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>

                                </div>

                            </td>
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">
                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('04-06-2018','01','E','FullDay','Bijrani' );return false">5</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="tble-maintxt">05 Jun 2018</td>
                            <!-------------Morning Sheet's Status------------->
                            <td class="tble-maintxt mrng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('05-06-2018','01','M','Shared','Bijrani' );return false">2</a>
                                    </span>

                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <td class="tble-maintxt mrng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('05-06-2018','01','M','Private','Bijrani' );return false">23</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>
                            </td>
                            <td class="tble-maintxt mrng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('05-06-2018','01','M','FullDay','Bijrani' );return false">5</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <!----------------Evening Sheet's Status---------->
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('05-06-2018','01','E','Shared','Bijrani' );return false">2</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('05-06-2018','01','E','Private','Bijrani' );return false">23</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>

                                </div>

                            </td>
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('05-06-2018','01','E','FullDay','Bijrani' );return false">5</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>

                                </div>

                            </td>
                        </tr>

                        <tr>
                            <td class="tble-maintxt">06 Jun 2018</td>
                            <!-------------Morning Sheet's Status------------->

                            <td class="tble-maintxt mrng">


                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('06-06-2018','01','M','Shared','Bijrani' );return false">2</a>
                                    </span>

                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <td class="tble-maintxt mrng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('06-06-2018','01','M','Private','Bijrani' );return false">23</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>
                            </td>
                            <td class="tble-maintxt mrng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('06-06-2018','01','M','FullDay','Bijrani' );return false">5</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <!----------------Evening Sheet's Status---------->
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('06-06-2018','01','E','Shared','Bijrani' );return false">2</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('06-06-2018','01','E','Private','Bijrani' );return false">23</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>

                                </div>

                            </td>
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('06-06-2018','01','E','FullDay','Bijrani' );return false">5</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>

                                </div>

                            </td>
                        </tr>

                        <tr>
                            <td class="tble-maintxt">07 Jun 2018</td>
                            <!-------------Morning Sheet's Status------------->

                            <td class="tble-maintxt mrng">


                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('07-06-2018','01','M','Shared','Bijrani' );return false">2</a>
                                    </span>

                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <td class="tble-maintxt mrng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('07-06-2018','01','M','Private','Bijrani' );return false">23</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>
                            </td>
                            <td class="tble-maintxt mrng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('07-06-2018','01','M','FullDay','Bijrani' );return false">5</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <!----------------Evening Sheet's Status---------->
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('07-06-2018','01','E','Shared','Bijrani' );return false">2</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('07-06-2018','01','E','Private','Bijrani' );return false">23</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>

                                </div>

                            </td>
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('07-06-2018','01','E','FullDay','Bijrani' );return false">5</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>

                                </div>

                            </td>
                        </tr>

                        <tr>
                            <td class="tble-maintxt">08 Jun 2018</td>
                            <!-------------Morning Sheet's Status------------->

                            <td class="tble-maintxt mrng">


                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('08-06-2018','01','M','Shared','Bijrani' );return false">2</a>
                                    </span>

                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <td class="tble-maintxt mrng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('08-06-2018','01','M','Private','Bijrani' );return false">23</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>
                            </td>
                            <td class="tble-maintxt mrng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('08-06-2018','01','M','FullDay','Bijrani' );return false">5</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <!----------------Evening Sheet's Status---------->
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('08-06-2018','01','E','Shared','Bijrani' );return false">2</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('08-06-2018','01','E','Private','Bijrani' );return false">23</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>

                                </div>

                            </td>
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('08-06-2018','01','E','FullDay','Bijrani' );return false">5</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>

                                </div>

                            </td>
                        </tr>

                        <tr>
                            <td class="tble-maintxt">09 Jun 2018</td>
                            <!-------------Morning Sheet's Status------------->

                            <td class="tble-maintxt mrng">


                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('09-06-2018','01','M','Shared','Bijrani' );return false">2</a>
                                    </span>

                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <td class="tble-maintxt mrng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('09-06-2018','01','M','Private','Bijrani' );return false">23</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>
                            </td>
                            <td class="tble-maintxt mrng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('09-06-2018','01','M','FullDay','Bijrani' );return false">5</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <!----------------Evening Sheet's Status---------->
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('09-06-2018','01','E','Shared','Bijrani' );return false">2</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>
                                </div>

                            </td>
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('09-06-2018','01','E','Private','Bijrani' );return false">23</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>

                                </div>

                            </td>
                            <td class="tble-maintxt evng">
                                <div class="jeep-holder">
                                    <span class="jeep-count pull-left">

                                        <a href="javascript:void(0);" style="color: #fff; text-decoration: none;" onclick="OpenPopupForJeep('09-06-2018','01','E','FullDay','Bijrani' );return false">5</a>
                                    </span>
                                    <span class="avail-jeep pull-left"></span>

                                </div>

                            </td>
                        </tr>

                    </tbody>
                </table>
                    </div>
            </div>--%>
        </div>
    </div>
</asp:Content>
