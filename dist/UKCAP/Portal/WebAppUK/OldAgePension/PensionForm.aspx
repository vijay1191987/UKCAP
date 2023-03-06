<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="PensionForm.aspx.cs" Inherits="CitizenPortal.WebAppUK.OldAgePension.PensionForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            debugger;
            $('#doesSongrandsonEarn').hide();
            $('#applcntCurrntlyWorking').hide(); 
            $('#hvngLandDtl').hide();
            $('#applcntHvngPropty').hide();
            $('#hvngOwnHouse').hide();
            $('#gettingOtherHelp').hide();
            $('#doesApplResidance').hide();
            $('#otherPersonRsdnceApplcnt').hide();
        });
        //Other Information DIV SHOW/HIDE//
        function fuShowHideDiv(divID1, isTrue) {
            debugger;
            //alert(divID);
            if (isTrue == "1") {
                $('#' + divID1).show(500);

            }
            if (isTrue == "0") {
                $('#' + divID1).hide(500);

            }
        }

        function fuShowHideDiv1(divID, isTrue) {
            debugger;
            //alert(divID);//
            if (isTrue == "1") {
                $('#' + divID).show(500);
            }
            if (isTrue == "0") {
                $('#' + divID).hide(500);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="form-heading" style="width: 98%; margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>OLD AGE PENSION CERTIFICATE </h2>
            </div>
            <div class="col-lg-12">
                <div class="col-md-12 box-container ">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Applicant Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                            <div class="form-group">
                                <label>Full Name of Applicant</label>
                                <input type="text" id="" placeholder="Applicant Name" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                            <div class="form-group">
                                <label>Father/Husband Name</label>
                                <input type="text" id="" placeholder="Father/Husband Name" class="form-control" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                            <div class="form-group">
                                <label>Age</label>
                                <input type="text" id="" placeholder="Age in years" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                            <div class="form-group">
                                <label>Gender</label>
                                <select class="form-control">
                                    <option value="select">Select</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="transgender">Transgender</option>
                                </select>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Cast</label>
                                <select class="form-control">
                                    <option value="select">Select</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="transgender">Transgender</option>
                                </select>
                            </div>
                        </div>
                         <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Sub Cast</label>
                                <select class="form-control">
                                    <option value="select">Select</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="transgender">Transgender</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                            <div class="form-group">
                                <label>Email Id</label>
                                <input type="text" class="form-control" placeholder="" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                            <div class="form-group">
                                <label>Post Office</label>
                                <input type="text" class="form-control" placeholder="" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                            <div class="form-group">
                                <label>Police Station</label>
                                <input type="text" class="form-control" placeholder="" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                          <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                            <div class="form-group">
                                <label>Bank Name</label>
                                <input type="text" class="form-control" placeholder="" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                            <div class="form-group">
                                <label>Bank Branch</label>
                                <input type="text" class="form-control" placeholder="" />
                            </div>
                        </div>
                         <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                            <div class="form-group">
                                <label>Account No</label>
                                <input type="text" class="form-control" placeholder="XXXXXXXXXXXX" />
                            </div>
                        </div>
                          <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                            <div class="form-group">
                                <label>Mobile No</label>
                                <input type="text" class="form-control" placeholder="Mobile No" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>

                <div class="col-md-12 box-container ">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Beneficiary Address Details</h4>
                    </div>
                    <div class="box-body box-body-open">

                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Address Line-1 (Care of)</label>
                                <input type="text" id="" placeholder="First Line Address" class="form-control" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">Address Line-2 (Building)</label>
                                <input type="text" id="" placeholder="Second Line Address" class="form-control" />
                            </div>
                        </div>


                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory">
                                                State
                                            </label>
                                            <select name="" id="" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                                <option value="0">-Select-</option>
                                                <option value="01">ANDAMAN &amp; NIKOBAR ISLANDS</option>
                                                <option value="26">ANDHRA PRADESH</option>
                                                <option value="09">ARUNACHAL PRADESH</option>
                                                <option value="35">ASSAM</option>
                                                <option value="29">BIHAR</option>
                                                <option value="210">CHANDIGARH</option>
                                                <option value="25">CHHATTISGARH</option>
                                                <option value="33">DADRA &amp; NAGAR HAVELI</option>
                                                <option value="10">DAMAN &amp; DIU</option>
                                                <option value="07">Delhi</option>
                                                <option value="32">GOA</option>
                                                <option value="18">GUJARAT</option>
                                                <option value="17">HARYANA</option>
                                                <option value="30">HIMACHAL PRADESH</option>
                                                <option value="02">JAMMU &amp; KASHMIR</option>
                                                <option value="22">JHARKHAND</option>
                                                <option value="24">KARNATAKA</option>
                                                <option value="08">KERALA</option>
                                                <option value="04">LAKSHADWEEP</option>
                                                <option value="34">MADHYA PRADESH</option>
                                                <option value="27">MAHARASHTRA</option>
                                                <option value="20">MANIPUR</option>
                                                <option value="15">MEGHALAYA</option>
                                                <option value="28">MIZORAM</option>
                                                <option value="12">NAGALAND</option>
                                                <option value="21">ODISHA</option>
                                                <option value="31">PUDUCHERRY</option>
                                                <option value="05">PUNJAB</option>
                                                <option value="06">RAJASTHAN</option>
                                                <option value="13">SIKKIM</option>
                                                <option value="19">TAMIL NADU</option>
                                                <option value="37">Telangana</option>
                                                <option value="11">TRIPURA</option>
                                                <option value="23">UTTAR PRADESH</option>
                                                <option value="14">UTTARAKHAND</option>
                                                <option value="16">WEST BENGAL</option>
                                            </select>
                                        </div>
                                    </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">District</label>
                                <select class="form-control" name="district">
                                    <option value="select">Select</option>
                                    <option value="angul">Angul</option>
                                    <option value="balasore">Balasore</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Block/Taluka/Sub district</label>
                                <select class="form-control" name="taluka">
                                    <option value="select">Select</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Gram Panchayat</label>
                                <select class="form-control" name="panchayat">
                                    <option value="select">Select</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Municipality/Patvari Chowki</label>
                                <select class="form-control" name="municipality">
                                    <option value="select">Select</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-1">
                            <div class="form-group">
                                <label class="manadatory">Pincode</label>
                                <input type="text" class="form-control" placeholder="" />
                            </div>
                        </div>
                        <div class="clearfix"></div>

                    </div>
                </div>

                <div class="col-md-12 box-container ">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Other Details</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0 ">
                                        <p>
                                            <span><span class="fom-Numbx">1.</span>
                                               Does the son or grandson of the applicant earn?
                                            </span>
                                        </p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio4" id="yes" value="yes" onclick="return fuShowHideDiv('doesSongrandsonEarn', 1);" />
                                            Yes<label for="yes"></label>
                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio4" id="no" value="no" onclick="return fuShowHideDiv('doesSongrandsonEarn', 0);" />
                                            No<label for="no"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div id="doesSongrandsonEarn">
                            <div class="form-group">
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Type of Bussiness</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <input id="" class="form-control" name="" placeholder="Describe Here" type="text" value="" autofocus="" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Monthly Income </p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <input id="" class="form-control" name="" type="text" placeholder="(In Rupees)" value="" autofocus="" />
                                        </div>
                                    </div>
                                </div>
                                </div>
                            <div class="clearfix"></div>
                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">2.</span> Does the applicant currently working?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio5" id="" value="Direct Purchase" onclick="return fuShowHideDiv1('applcntCurrntlyWorking', 1);" />
                                            Yes<label for="exarmy"></label>
                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio5" id="" value="Department Purchase" onclick="return fuShowHideDiv1('applcntCurrntlyWorking', 0);" />
                                            No<label for="sptprsn"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div id="applcntCurrntlyWorking">
                            <div class="form-group">
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Type of Bussiness</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <input id="" class="form-control" name="" placeholder="Describe Here" type="text" value="" autofocus="" />
                                    </div>
                                </div>
                            </div>
                                <div class="form-group">
                                <div class="col-lg-12 othrinfosubhd2">
                                    <div class="col-md-9 pleft0">
                                        <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>Monthly Income</p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <input id="" class="form-control" name="" placeholder="(In Rupees)" type="text" value="" autofocus="" />
                                    </div>
                                </div>
                            </div>
                                </div>
                            <div class="clearfix"></div>
                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">3.</span> Is applicant having own land?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio6" id="" value="Direct Purchase" onclick="return fuShowHideDiv1('hvngLandDtl', 1);" />
                                            Yes<label for="exarmy"></label>
                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio6" id="" value="Department Purchase" onclick="return fuShowHideDiv1('hvngLandDtl', 0);" />
                                            No<label for="sptprsn"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            
                                <div class="form-group" id="hvngLandDtl">
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>If yes, please descibe the land </p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <input id="" class="form-control" name="" placeholder="Describe Here" type="text" value="" autofocus="" />
                                        </div>
                                    </div>
                                </div>
                            <div class="clearfix"></div>
                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">4.</span> Does the applicant have movable and immovable property?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio7" id="" value="Direct Purchase" onclick="return fuShowHideDiv1('applcntHvngPropty', 1);" />
                                            Yes<label for="exarmy"></label>
                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio7" id="" value="Department Purchase" onclick="return fuShowHideDiv1('applcntHvngPropty', 0);" />
                                            No<label for="sptprsn"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                             <div class="form-group" id="applcntHvngPropty">
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>If yes, please descibe the land </p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <input id="" class="form-control" name="" placeholder="Describe Here" type="text" value="" autofocus="" />
                                        </div>
                                    </div>
                                </div>
                            <div class="clearfix"></div>
                            <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">5.</span> Does the applicant have their own house?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio8" id="" value="Direct Purchase" onclick="return fuShowHideDiv1('hvngOwnHouse', 1);" />
                                            Yes<label for="exarmy"></label>
                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio8" id="" value="Department Purchase" onclick="return fuShowHideDiv1('hvngOwnHouse', 0);" />
                                            No<label for="sptprsn"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                                <div class="form-group" id="hvngOwnHouse">
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>If yes, Please describe the house </p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <input id="" class="form-control" name="" placeholder="Describe Here" type="text" value="" autofocus="" />
                                        </div>
                                    </div>
                                </div>
                            
                            <div class="clearfix"></div>
                               <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">6.</span> Does the applicant getting any other types of monetary help?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio9" id="" value="Direct Purchase" onclick="return fuShowHideDiv1('gettingOtherHelp', 1);" />
                                            Yes<label for="exarmy"></label>
                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio9" id="" value="Department Purchase" onclick="return fuShowHideDiv1('gettingOtherHelp', 0);" />
                                            No<label for="sptprsn"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                                <div class="form-group" id="gettingOtherHelp">
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>If yes, Please describe the help</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <input id="" class="form-control" name="" placeholder="Describe Here" type="text" value="" autofocus="" />
                                        </div>
                                    </div>
                                </div>
                            <div class="clearfix"></div>
                               <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">7.</span> Does the applicant having residance in Uttarakhand?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio10" id="" value="Direct Purchase" onclick="return fuShowHideDiv1('doesApplResidance', 1);" />
                                            Yes<label for="exarmy"></label>
                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio10" id="" value="Department Purchase" onclick="return fuShowHideDiv1('doesApplResidance', 0);" />
                                            No<label for="sptprsn"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                                <div class="form-group" id="doesApplResidance">
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>If yes, Duration of Residance</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <input id="" class="form-control" name="" placeholder="Total No of Years" type="text" value="" autofocus="" />
                                        </div>
                                    </div>
                                </div>
                            <div class="clearfix"></div>
                              <div class="form-group mtop5">
                                <div class="col-lg-12 othrinfohd">
                                    <div class="col-md-9 pleft0">
                                        <p><span><span class="fom-Numbx">8.</span> Does anyone else stay with the applicant?</span></p>
                                    </div>
                                    <div class="col-md-3 pleft0 pright0">
                                        <div class="col-xs-6 pleft0">
                                            <input type="radio" name="radio11" id="" value="Direct Purchase" onclick="return fuShowHideDiv1('otherPersonRsdnceApplcnt', 1);" />
                                            Yes<label for="exarmy"></label>
                                        </div>
                                        <div class="col-xs-6">
                                            <input type="radio" name="radio11" id="" value="Department Purchase" onclick="return fuShowHideDiv1('otherPersonRsdnceApplcnt', 0);" />
                                            No<label for="sptprsn"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                                <div class="form-group" id="otherPersonRsdnceApplcnt">
                                    <div class="col-lg-12 othrinfosubhd2">
                                        <div class="col-md-9 pleft0">
                                            <p class="pleft27"><i class="fa fa-arrow-right pright5"></i>If yes, Please describe the relation from that person</p>
                                        </div>
                                        <div class="col-md-3 pleft0 pright0">
                                            <input id="" class="form-control" name="" placeholder="Describe Relation" type="text" value="" autofocus="" />
                                        </div>
                                    </div>
                                </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>

                
                <div class="col-md-12 box-container">
                    <div class="box-body box-body-open" style="text-align: center;">
                        <input type="button" id="" class="btn btn-success" value="Submit" />
                        <input type="submit" name="" value="Cancel" class="btn btn-danger" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
