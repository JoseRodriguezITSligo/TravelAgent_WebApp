<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LosAndes.aspx.cs" Inherits="Travel_Agent_WebApp_JoseRodriguez.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Destinations_StyleSheet.css"/>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="Destinations_JavaScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Images-wrapper">
        <table id="Images-row">
            <tr>
                <td class="smallImage"><img id="LosAndes1"  src="LosAndes2.jpg" style="height:200px;width:200px;margin-left:220px" onclick="ImageChanger(this.id)"/></td>
                <td class="smallImage" ><img id="LosAndes2" src="PicoBolivar2.jpg" style="height:200px;width:200px;margin-left:220px" onclick="ImageChanger(this.id)"/></td>
                <td class="smallImage"><img id="LosAndes3"  src="PicoBolivar3.JPG" style="height:200px;width:200px;margin-left:220px" onclick="ImageChanger(this.id)"/></td>
            </tr>
        </table>
         <div id="BigImageFrame" class="BigFrame">
                <img id="BigImage" class="BigPicture" src="PicoBolivar.jpg" />
                <p id="HideButton"><b><i><u>Hide</u></i></b></p>
         </div>  
    </div>
    <div id="info-Section">
        <h1>Los Andes Venezolanos</h1>
        <p>Mountains with a height of more than 4000 metres over the sea level, 
            low and humid temperatures and snow on the peak of the mountains almost 
            all the year, Los Andes is the perfect place to go on your holidays.</p>
        <p>This region is considered by tourists as the friendliest region in Venezuela. 
            Local people are known as gentile and kind, offering an excellent hospitality 
            to all the tourists.</p>
        <p>Climbing, expeditions, local markets, historical buildings, cable cars and 
            National Parks are some of the things that Los Andes has to offer to you 
            during your visit.</p>
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
                <asp:ListItem Value="9">5 day Tour</asp:ListItem>
                <asp:ListItem Value="10">9 day Tour</asp:ListItem>
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
