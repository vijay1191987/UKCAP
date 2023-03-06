<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKCommon.Master" AutoEventWireup="true" CodeBehind="whos_who.aspx.cs" Inherits="CitizenPortal.WebAppUK.whos_who" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .prfle_link {
            border: 1px solid #337ab7; border-radius: 20px; padding: 0 10px; transition:all .5s;
        }
            .prfle_link:hover { background-color:#337ab7; color:#fff; text-decoration:none;
            }
             .dept_link {
            border: 1px solid #337ab7; border-radius: 20px; padding: 8px 10px; transition:all .5s;
        }
            .dept_link:hover { background-color:#337ab7; color:#fff; text-decoration:none;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <!-- Governor Profile -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="font-size: 18px; text-align: center;">PROFILE</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered" style="font-size: 14px;">
                        <tbody>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;">
                                    <p><b>Name</b></p>
                                </td>
                                <td>
                                    <p>Dr.Krishan Kant Paul,</p>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;"><b>Governor</b></td>
                                <td>He has been serving&nbsp; the State of Uttarakhand as its Governor from January 2015 onwards. Before coming to Uttarakhand, he remained the Governor of Meghalaya, Manipur, Mizoram and Nagaland for varying duration.</td>
                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;">
                                    <p><b>Date of   Birth</b></p>
                                </td>
                                <td>
                                    <p>6th   February, 1948</p>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;">
                                    <p><b>Education</b></p>
                                </td>
                                <td style="vertical-align:top;">
                                    <p>M.Sc   (Hons) Ph.D. A number of scientific papers in&nbsp;international journals of   repute and newspaper articles have been published</p>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;"><b>Service</b></td>
                                <td>I.P.S   in 1970</td>
                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;">
                                    <p><b>UPSC   Assignment</b></p>
                                </td>
                                <td style="vertical-align:top;">
                                    <p>After serving for 3 years and 6 months (longest ever tenure) as Commissioner of Police (Delhi),he demitted office&nbsp; in July&nbsp;2007. Held a   Constitutional Position as Member U.P.S. C. for &nbsp;over five years and six   months</p>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;">
                                    <p><b>Commendations</b></p>
                                </td>
                                <td style="vertical-align:top;">
                                    <p>In an   outstanding public service career of over&nbsp; 37 years under Govt. numerous   decorations and Commendations were received&nbsp;from the Government and work   was recognised and acclaimed by the General Public and social organizations</p>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;">
                                    <p><b>Medals</b></p>
                                </td>
                                <td style="vertical-align:top;">
                                    <p>
                                        1. Special Duty Medal (Andaman &amp; Nicobar)&nbsp;<br />
                                        2. Police Medal for Meritorious Services&nbsp;<br />
                                        3. President's Police Medal for Distinguished Services&nbsp;<br />
                                        4. Special Duty Medal (Bar) Arunachal&nbsp;<br />
                                        5. Internal Security Medal
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;">
                                    <p><b>General Medal (tenure based)</b></p>
                                </td>
                                <td style="vertical-align:top;">
                                    <p>
                                        1. Sangram Medal&nbsp;<br />
                                        2. Paschim Star<br />
                                        3. 25 years of Indian&nbsp;Independence<br />
                                        4. 50 years of Indian Independence
                                    </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <%--<div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>--%>
            </div>

        </div>
    </div>

    <!-- CM Profile -->
    <div id="myModal1" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="font-size: 18px; text-align: center;">PROFILE</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered" style="font-size: 14px;">
                        <tbody>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;">
                                    <p><b>Name</b></p>
                                </td>
                                <td>
                                    <p>Trivendra Singh Rawat </p>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;"><b>Chief Minister</b></td>
                                <td>He became the 8th Chief Minister of Uttarakhand in March 2017 after BJP got a remarkable mandate of 57 out of 70 seats in the state assembly elections.</td>
                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;">
                                    <p><b>Age (as in 2017)</b></p>
                                </td>
                                <td>
                                    <p>56 Years</p>
                                </td>
                            </tr>
                            <tr>

                                <td style="background-color: #e9e9e9; vertical-align: top;">College/University</td>
                                <td>Hemwati Nandan Bahuguna Garhwal University</td>

                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;"><b>College/University</b></td>
                                <td>Master Degree</td>
                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;">
                                    <p><b>Debut</b></p>
                                </td>
                                <td style="vertical-align:top;">
                                    <p>Trivendra joined Rashtriya Swayamsewak Sangh in 1979 and became its Paracharak in 1981.</p>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;">
                                    <p><b>Political Journey</b></p>
                                </td>
                                <td style="vertical-align:top;">• In 1979, joined Rashtriya Swayam Sewak Sangh.
                                    <br />
                                    • Became a Sangh Pracharak in 1981.<br/>
                                    • Appointed as Tehsil Pracharak of RSS at Lansdowne, Uttarakhand in 1981.<br/>
                                    • Became a Tehsil Pracharak of RSS at Srinagar, Uttarakhand in 1983.<br/>
                                    • In 1985, appointed as Nagar Pracharak of RSS at Dehradun, Uttarakhand.<br/>
                                    • Became an Editor of Rashtradev at Meerut, Uttar Pradesh in 1989.<br/>
                                    • In 1993, he was appointed as Secretary (Organisation) of BJP.<br/>
                                    • Trivendra worked as a State Secretary (Organisation) of BJP, Uttar Pradesh, Uttarakhand between 1997 and 2002.<br/>
                                    • Trivendra was appointed as one of the members of "Namaami Gange" to clean Holy Ganga in 2014.<br/>
                                    • He became the 8th Chief Minister of Uttarakhand in March 2017 after BJP got a remarkable mandate of 57 out of 70 seats in the state assembly elections.
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <%--<div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>--%>
            </div>

        </div>
    </div>

     <!-- Chief Secretary, Profile -->
    <div id="myModal2" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="font-size: 18px; text-align: center;">PROFILE</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered" style="font-size: 14px;">
                        <tbody>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;">
                                    <p><b>Name</b></p>
                                </td>
                                <td>
                                    <p>Utpal Kumar Singh </p>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;"><b>Chief Secretary</b></td>
                                <td>He will replace R Ramaswamy and will be the 15th chief secretary of the 17-year-old hill state.He is 15th chief secretary of Uttarakhand.</td>
                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;"><b>Date of Birth</b></td>
                                <td>July 29, 1960,</td>
                            </tr>
                             <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;"><b>College/University</b></td>
                                <td>MA History</td>
                            </tr>
                            <tr>

                                <td style="background-color: #e9e9e9; vertical-align: top;">Service</td>
                                <td>A 1986 batch IAS officer, Singh was earlier posted on deputation in New Delhi as additional secretary in the ministry of agriculture.</td>

                            </tr>
                           
                        </tbody>
                    </table>
                </div>
                <%--<div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>--%>
            </div>

        </div>
    </div>

     <!-- DGP Police, Profile -->
    <div id="myModal3" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="font-size: 18px; text-align: center;">PROFILE</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered" style="font-size: 14px;">
                        <tbody>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;">
                                    <p><b>Name</b></p>
                                </td>
                                <td>
                                    <p>Anil K. Raturi</p>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;"><b>Director General of Police (DGP)</b></td>
                                <td>Anil Kumar Raturi will replace M A Ganapathy on Monday to assume office as the 10th Director General of Police (DGP) of Uttarakhand.</td>
                            </tr>
                            <tr>
                                <td style="background-color: #e9e9e9; vertical-align: top;"><b>Date of Birth</b></td>
                                <td>Oct 21, 1963,</td>
                            </tr>
                             
                            <tr>

                                <td style="background-color: #e9e9e9; vertical-align: top;">Service</td>
                                <td>A 1965 batch IPS Ashok Kumar Saran was the first DGP of the state and his successor was Prem Dutt Raturi, who took over charge on April 30, 2002 and was on the post till June 15, 2004. A 1973 batch IPS officer Kanchan Choudhary Bhattacharya, who was the first woman DGP of the country, held the position from June 15, 2004 to October 31, 2007. Subhash Joshi was the state's fourth DGP who held the post from October 31, 2007 to July 15, 2010.M A Ganapathy, a 1986-batch IPS officer, became the ninth DGP on April 30, 2016 and his tenure is all set to come to an end on July 24.</td>

                            </tr>
                           
                        </tbody>
                    </table>
                </div>
                <%--<div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>--%>
            </div>

        </div>
    </div>

    <div class="row">
        <div class="container-fluid" style="min-height: 500px;">
            <div class="col-lg-12">
                <div class="innercontent_wrapper">
                <h2>Who's Who</h2>
                <div class="col-md-12">
                    <div class="row featurette">
                        <div class="col-md-2">
                            <img src="img/uk_governor.jpg" alt="Dr.Krishan Kant Paul, Governor, Uttarakhand" style="border: 8px solid #ddd;" />
                        </div>
                        <div class="col-md-10 pleft0">
                            <h3 class="featurette-heading">Dr. Krishan Kant Paul<br />
                                <span class="text-muted">Governor, Uttarakhand</span></h3>
                            <p class="lead">He has been serving  the State of Uttarakhand as its Governor from January 2015 onwards. Before coming to Uttarakhand, he remained the Governor of Meghalaya, Manipur, Mizoram and Nagaland for varying duration. After serving for 3 years and 6 months (longest ever tenure) as Commissioner of Police (Delhi),he demitted office  in July 2007. Held a Constitutional Position as Member U.P.S. C. for  over five years and six months</p>
                            <p><b><i class="fa fa-globe fa-fw"></i>Visit Website:</b> <a href="http://governoruk.gov.in/" target="_blank">Governor of Uttarakhand</a>   <a href="#" data-toggle="modal" data-target="#myModal" class="pull-right prfle_link"><i class="fa fa-user fa-fw"></i>View Profile</a></p>
                        </div>

                    </div>

                    <hr class="featurette-divider" />
                    <div class="row featurette">
                        <div class="col-md-2 ">
                            <img src="img/uk_cm.jpg" alt="Shri Trivendra Singh Rawat, Chief Minister, Uttarakhand" style="border: 8px solid #ddd;" />
                        </div>
                        <div class="col-md-10 pleft0">
                            <h3 class="featurette-heading">Shri Trivendra Singh Rawat<br />
                                <span class="text-muted">Chief Minister, Uttarakhand</span></h3>
                            <p class="lead">Trivendra Singh Rawat is an Indian politician and is the eighth and current Chief Minister of Uttarakhand. Rawat was a member of the Rashtriya Swayamsevak Sangh from 1979 to 2002 and held the post of organizing secretary of the Uttarakhand region, and later the state, after its formation in 2000. </p>
                            <p><b><i class="fa fa-globe fa-fw"></i>Visit Website:</b> <a href="http://cm.uk.gov.in/" target="_blank">Chief Minister of Uttarakhand</a> <a href="#" data-toggle="modal" data-target="#myModal1" class="pull-right prfle_link"><i class="fa fa-user fa-fw"></i>View Profile</a></p>
                        </div>

                    </div>
                    <hr class="featurette-divider" />
                    <div class="row featurette">
                        <div class="col-md-2 ">
                            <img src="img/uk_chiefsecretary.jpg" alt="Shri Utpal Singh, Chief Secretary, Uttarakhand" style="border: 8px solid #ddd;" />
                        </div>
                        <div class="col-md-10 pleft0">
                            <h3 class="featurette-heading">Shri Utpal Singh<br />
                                <span class="text-muted">Chief Secretary, Uttarakhand</span></h3>
                            <p class="lead">An Uttarakhand cadre official, Singh belongs to Jharkhand. Sources said he was a favourite in the BC Khanduri-led Bharatiya Janata Party government in the hill state and was principal secretary to the chief minister.</p>
                            <p><a href="#" data-toggle="modal" data-target="#myModal2" class="pull-right prfle_link"><i class="fa fa-user fa-fw"></i>View Profile</a></p>
                        </div>

                    </div>
                    <hr class="featurette-divider" />
                    <div class="row featurette">
                        <div class="col-md-2 ">
                            <img src="img/uk_dgp_police.jpg" alt="Shri Anil K. Raturi,DGP, Uttarakhand" style="border: 8px solid #ddd;" />
                        </div>
                        <div class="col-md-10 pleft0">
                            <h3 class="featurette-heading">Shri Anil K. Raturi<br />
                                <span class="text-muted">DGP, Uttarakhand</span></h3>
                            <p class="lead">The Mission of Uttarakhand Police is prevention and detection of crime, maintenance of law and order and efficient service delivery to citizens. In pursuance of our mission, we shall discharge our duties with a sense of service, impartiality and integrity. In addition to our statutory responsibilities, we will endeavour to efficiently assist in rescue and relief operations during disasters.</p>
                            <p><b><i class="fa fa-globe fa-fw"></i>Visit Website:</b> <a href="http://uttarakhandpolice.uk.gov.in/pages/display/173-whos-who" target="_blank">Police Officers</a> <a href="#" data-toggle="modal" data-target="#myModal3" class="pull-right prfle_link"><i class="fa fa-user fa-fw"></i>View Profile</a></p>
                        </div>
                    </div>

                    <div class="row featurette">
                        <div class="col-md-2 "></div>
                        <div class="col-md-10 pleft0 pbottom15">
                            <br />
                            <h3 class="featurette-heading">List of Different Department
                            </h3>
                            <br />
                            <p><a href="http://www.uk.gov.in/files/SecList722018.pdf" target="_blank" class="dept_link"><i class="fa fa-file-pdf-o fa-fw"></i>Chief Secretary and Secretaries</a> <a href="http://www.uk.gov.in/files/DM06102017.PDF" target="_blank" class="dept_link"><i class="fa fa-file-pdf-o fa-fw"></i>District Magistrates</a>  <a href="http://www.uk.gov.in/files/WIM_As_On_06-10-2016.PDF" target="_blank" class="dept_link"><i class="fa fa-file-pdf-o fa-fw"></i>Web Information Manager</a></p>
                        </div>
                    </div>
                </div>
                    </div>
            </div>
        </div>
    </div>

</asp:Content>
