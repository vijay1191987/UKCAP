<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKCommon.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CitizenPortal.WebAppUK.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function (){
            $('.count').each(function () {
                $(this).prop('Counter', 0).animate({
                    Counter: $(this).text() 
                }, {
                    duration: 4000,
                    easing: 'swing',
                    step: function (now) {
                        $(this).text(Math.ceil(now));
                    }
                });
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <section class="slideBg">
            <div class="slidetxt">
                <h6>Welcome to Uttarakhand</h6>
                <p>Uttarakhand was formed on 9th November 2000 as the 27th State of India, when it was carved out of northern Uttar Pradesh. Located at the foothills of the Himalayan mountain ranges, it is largely a hilly State, having international boundaries with China (Tibet) in the north and Nepal in the east. On its north-west lies Himachal Pradesh, while on the south is Uttar Pradesh. It is rich in natural resources especially water and forests with many glaciers, rivers, dense forests and snow-clad mountain peaks. Char-dhams, the four most sacred and revered Hindu temples of Badrinath,Kedarnath, Gangotri and Yamunotri are nestled in the mighty mountains. It’s truly God’s Land (Dev Bhoomi). Dehradun is the Capital of Uttarakhand. It is one of the most beautiful resort in the submountain tracts of India, known for its scenic surroundings. The town lies in the Dun Valley, on the watershed of the Ganga and Yamuna rivers.</p>
            </div>
        </section>
    </div>
    <section class="content">
        <div class="department_infobox">
            <div class="col-lg-2 service_count">
                <i class="fa fa-dashboard fa-4x btn-block mb10"></i>ONLINE SERVICES COUNT
            </div>
            <div class="col-lg-2 department_count">
              <b class="count"> 1</b>
                <span>DEPARTMENT</span>

            </div>
            <div class="col-lg-2 department_count">
               <b class="count"> 5</b>
                <span>SERVICES</span>
            </div>
            <div class="col-lg-3 department_count">
                <b class="count">1000</b>
                <span>APPLICATION RECEIVED</span>
            </div>
            <div class="col-lg-3 department_count">
                <b class="count">890</b>
                <span>APPLICATION DISCLOSED</span>
            </div>
        </div>
        <div class="col-lg-12 all_service_hold text-center">
            <h1>Available Online Services for Citizens</h1>
            <div class="clearfix"></div>
             <div class="col-lg-1 services_link"></div>
            <div class="col-lg-2 services_link">
            <a href="/Account/Login" class="">
                <div class="birth_box">
                    <i class="fa fa-university fa-4x inline-block"></i>
                    <%--<img src="img/birth_icon.png" alt="" class="img-responsive inline-block" />--%>
                    <p>
                        Apply for <span>Citizen Services</span>
                    </p>
                </div>
            </a>
                </div>
            <div class="col-lg-2 services_link">
            <a href="http://5.79.69.86:7270/Citizen/Forms/Index.aspx" class="" target="_blank">
                <div class="income_box">
                    <i class="fa fa fa-paw fa-4x inline-block"></i>
                   
                   
                    <p>
                        Book for <span>Jim Corbett Park</span>
                    </p>
                </div>
            </a>
                </div>
            <div class="col-lg-2 services_link">
            <a href="http://104.211.245.85/charDhaam/index.aspx" target="_blank" class="">
                <div class="oldage_box">
                    <img src="img/aadhaar_icon.png" alt="" class="img-responsive inline-block" />
                    <p>
                        UID Registration For <span>Char Dham Yatra</span>
                    </p>
                </div>
            </a>
                 </div>
            
            <%--<div class="col-lg-2 services_link">
            <a href="#" class="">
                <div class="income_box">
                    <i class="fa fa fa-street-view fa-4x inline-block"></i>
                   
                    <img src="img/income_icon.png" alt="" class="img-responsive inline-block" />
                    <p>
                        Track <span>Application</span>
                    </p>
                </div>
            </a>
                </div>--%>
             <div class="col-lg-2 services_link">
            <a href="DomicileCertificate/DomicileForm.aspx" class="">
                <div class="domicile_box">
                    <i class="fa fa fa-map-marker fa-4x inline-block"></i>
                    <%--<img src="img/domicile_icon.png" alt="" class="img-responsive inline-block" />--%>
                    <p>
                        Locate <span>CSC Center</span>
                    </p>
                </div>
            </a>
                 </div>
             <div class="col-lg-2 services_link">
            <a href="#" class="">
                <div class="death_box">
                    <i class="fa fa fa-list fa-4x inline-block"></i>
                    <%--<img src="img/death_icon.png" alt="" class="img-responsive inline-block" />--%>
                    <p>
                        Online <span>Grievance</span>
                    </p>
                </div>
            </a>
                </div>
        </div>
    </section>
</asp:Content>
