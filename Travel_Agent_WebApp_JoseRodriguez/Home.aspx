<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Travel_Agent_WebApp_JoseRodriguez.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Home_StyleSheet.css"/>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="Home_JavaScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section>
        <div id="ImageFrame" >
             <img id="MainPicture" style="width:900px; height:600px" src="LosRoques3.jpg"/>
             <div id="ForwardArrow" onclick="ChangingPicture()">
                <img src="flecha.png"/>
            </div> 
            <div id="BackwardArrow" onclick="ChangingPictureBackwards()">
                <img src="flechaBack.png"/>
            </div>
        </div>
        
        <div id="Welcome" class="info">
            <h1>WELCOME!!!</h1>
            <p>ToursVenezuela.com is a travel agency specialized in adventure tours in Venezuela. 
                The country with largest Caribbean shore in the whole world.n</p>
            <p>This country has extraordinary landscapes, wonderful beaches, exotic forest, deep 
                jungles and amazing mountains. All in one place!</p>
            
        </div>
         
         <div id="Tours-Info" class="info">
            <h2>Guided Tours</h2>
            <p>Our plans and offers include local food, comfortable stay and guided tours to the 
                most surprising places. We count with a qualified staff and incredible prices, just surf our website for details.</p>
             <p>Are you ready to sign up for the most stunning adventure you have ever experienced before?</p>
        </div>
    </section>
</asp:Content>
