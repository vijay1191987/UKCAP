<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKCommon.Master" AutoEventWireup="true" CodeBehind="help.aspx.cs" Inherits="CitizenPortal.WebAppUK.help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="container-fluid" style="min-height: 500px;">
            <div class="col-lg-12">
                <div class="innercontent_wrapper">
                    <h2>Help</h2>
                    <p><b>1. Screen Reader Access-</b>This link Provides information regarding access to different Screen Readers.</p>

                    <p><b>2. Skip To main Content-</b>This link sends the control to main content, so that visually challenged people can skip to listen header and navigation every time and can switch to main content directly.</p>

                    <p><b>3. Skip to navigation-</b>This link sends the control to menu.</p>

                    <p><b>4 Text Size-</b>Changing the size of the text refers to making the text appearing smaller or bigger from its standard size. The website allows you to change the text size in two different ways, by clicking on the text size icons present at the top of each page and through the Accessibility Options page.</p>
                    <p>
                        <b>4.1  Text size Icons</b><br />
                        Following different options are provided in the form of icons which are available on the top of each page:
                    </p>
                    <p>
                        <b>- </b>Decrease text size: Allows to decrease the text size to one level<br />
                        <b>A </b>Normal text size: Allows to set default text size<br />
                        <b>+</b>Increase text size: Allows to increase the text size to one level
                    </p>
                    <p><b>4.2  Accessibility Options</b></p>
                    <p>To change the text size using the Accessibility Options page:</p>
                    <ol>
                        <li>Select Accessibility Options. The Accessibility Options page is displayed.</li>
                           <li> From the Text Size section, select the appropriate text size.</li>
                            <li>Click Apply.</li>
                    </ol>
                    <p class="clearfix"></p>
                    <p><b>5. Change Content Languane</b><br />
                       हिंदी में – By clicking on this link, user will be able to see the contents in hindi<br />

                        In English - This link displays the contents in english</p>
                    <p><b>6. Search Facility</b><br />

User can search for documents with entries that contain any one of the words he/she specify in the box.</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
