<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Morrocoy.aspx.cs" Inherits="Travel_Agent_WebApp_JoseRodriguez.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Destinations_StyleSheet.css"/>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="Destinations_JavaScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Images-wrapper">
        <table id="Images-row">
            <tr>
                <td class="smallImage"><img id="Morrocoy1"  src="Morrocoy1.jpg" style="height:200px;width:200px;margin-left:220px" onclick="ImageChanger(this.id)"/></td>
                <td class="smallImage" ><img id="Morrocoy2" src="Morrocoy2.jpg" style="height:200px;width:200px;margin-left:220px" onclick="ImageChanger(this.id)"/></td>
                <td class="smallImage"><img id="Morrocoy3"  src="Morrocoy5.jpg" style="height:200px;width:200px;margin-left:220px" onclick="ImageChanger(this.id)"/></td>
            </tr>
        </table>
         <div id="BigImageFrame" class="BigFrame">
                <img id="BigImage" class="BigPicture" src="Morrocoy5.jpg" />
                <p id="HideButton"><b><i><u>Hide</u></i></b></p>
         </div>  
    </div>
    <div id="info-Section">
        <h1>Morrocoy National Park</h1>
        <p>Located in the northworthy region of Venezuela it’s a group of small islands not 
            too far from the Venezuelan shore. Full of colour with incredible blue sea, 
            white sand beaches, the greenest palm trees in the world and a very curious 
            floral plant called “Manglares” make of this region the perfect place to 
            enjoy your holidays. </p>
        <p>Morrocoy is famous for parties taking place everywhere, especially in the middle of the sea thanks to
            places like Los Juanes, a shallow sandless beach, allow tourist staying in the very calm water 
            while enjoying the sun and a premium glass of Caribbean Rum.</p>
        <p>Moreover, Morrocoy is not only made of beaches but deserts is also part of the landscapes 
            this region may offer. “Los Medanos de Coro” is a famous dunes formation not too far from 
            Morrocoy National Park which is an excellent option for sightseeing during your stay.</p>
        <p>If you are looking for sun, beach, party and the most exquisite sea food, Morrocoy is the perfect place for you!</p>
    </div>
    <div style="margin-left:510px">
        <iframe width="500" height="300" src="https://www.youtube.com/embed/EkbL_qtGAG8"></iframe>
    </div>
    <div id="TourInfo">
        <h2>Tour details and booking options</h2>
        <p>Info about the tours in this destination</p>
        <p>Currency used:&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlCurrencyPicker" runat="server" Font-Size="Medium" AutoPostBack="True" OnSelectedIndexChanged="ddlCurrencyPicker_SelectedIndexChanged">
                <asp:ListItem Value="1">Euro (€)</asp:ListItem>
                <asp:ListItem Value="2">Pound (£)</asp:ListItem>
                <asp:ListItem Value="3">US Dollar ($)</asp:ListItem>
                <asp:ListItem Value="4">Bolivar (VEF)</asp:ListItem>
            </asp:DropDownList>
        </p>
        <ol style="list-style:none">
            <li style="width: 380px" ><span>5 day Tour:&nbsp;&nbsp;&nbsp; </span><asp:Label ID="lblFiveDayPrice" runat="server" Text="0"></asp:Label>&nbsp;<asp:Label ID="lblPerPerson1" runat="server" Text="/person"></asp:Label>
            </li>
            <li style="width: 380px"><span>9 day Tour:&nbsp;&nbsp;&nbsp; </span><asp:Label ID="lblNineDayPrice" runat="server" Text="0"></asp:Label>&nbsp;<asp:Label ID="lblPerPerson2" runat="server" Text="/person"></asp:Label>
            </li>
        </ol>
        <p style="width: 437px">
            <asp:CheckBoxList ID="cbxTours" runat="server" Height="16px" Width="153px">
                <asp:ListItem Value="7">5 day Tour</asp:ListItem>
                <asp:ListItem Value="8">9 day Tour</asp:ListItem>
            </asp:CheckBoxList>
            <asp:Label ID="lblNoOfPeople" runat="server">Number of people</asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlNoOfPeople" runat="server" Font-Size="Medium">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
        </p>
        &nbsp;<asp:Button ID="BookButton" runat="server" Text="Book" Font-Bold="True" Font-Size="Medium" Height="30px" Width="80px" OnClick="BookButton_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblErrorHeading" runat="server" Font-Size="X-Large"></asp:Label>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblErrorMsg" runat="server" Font-Size="X-Large"></asp:Label>
    </div>
</asp:Content>
