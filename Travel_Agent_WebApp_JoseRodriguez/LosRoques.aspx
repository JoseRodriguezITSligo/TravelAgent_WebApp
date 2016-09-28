<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LosRoques.aspx.cs" Inherits="Travel_Agent_WebApp_JoseRodriguez.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Destinations_StyleSheet.css"/>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="Destinations_JavaScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="Images-wrapper">
        <table id="Images-row">
            <tr>
                <td class="smallImage"><img id="LosRoques1"  src="LosRoques2.jpg" style="height:200px;width:200px;margin-left:220px" onclick="ImageChanger(this.id)"/></td>
                <td class="smallImage" ><img id="LosRoques2" src="LosRoques6.jpg" style="height:200px;width:200px;margin-left:220px" onclick="ImageChanger(this.id)"/></td>
                <td class="smallImage"><img id="LosRoques3"  src="LosRoques9.png" style="height:200px;width:200px;margin-left:220px" onclick="ImageChanger(this.id)"/></td>
            </tr>
        </table>
         <div id="BigImageFrame" class="BigFrame">
                <img id="BigImage" class="BigPicture" src="LosRoques2.jpg" />
                <p id="HideButton"><b><i><u>Hide</u></i></b></p>
         </div>  
    </div>
    <div id="info-Section">
        <h1>Los Roques</h1>
        <p>In the middle of the Caribbean sea, one hour away from Venezuela’s shore it 
            is located the archipelago "Los Roques". With 45 islands and cays, Los Roques 
            is the perfect place for relaxing, chilling up and enjoying life.</p>
        <p>Because of its wonderful coral reef, fish variety, crystalline water and warm weather; 
            it is considered an amazing place for activities as fishing, diving, windsurfing, 
            snorkelling and kitesurfing.</p>
        <p>If you are looking for beautiful beaches, white sand, fresh sea food, colourful 
            B&B and a Caribbean atmosphere, you cannot miss Los Roques.</p>
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
                <asp:ListItem Value="5">5 day Tour</asp:ListItem>
                <asp:ListItem Value="6">9 day Tour</asp:ListItem>
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
