<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Angel_Falls.aspx.cs" Inherits="Travel_Agent_WebApp_JoseRodriguez.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Destinations_StyleSheet.css"/>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="Destinations_JavaScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Images-wrapper">
        <table id="Images-row">
            <tr>
                <td class="smallImage"><img id="AngelFalls1"  src="SaltoAngel.jpg" onclick="ImageChanger(this.id)"/></td>
                <td class="smallImage" ><img id="AngelFalls2" src="SaltoAngel2.png" onclick="ImageChanger(this.id)"/></td>
                <td class="smallImage"><img id="AngelFalls3"  src="SaltoAngel5.jpg" onclick="ImageChanger(this.id)"/></td>
            </tr>
        </table>
        <div id="BigImageFrame" class="BigFrame">
                <img id="BigImage" class="BigPicture" src="SaltoAngel2.png" />
                <p id="HideButton"><b><i><u>Hide</u></i></b></p>
        </div>  
    </div>
     
    <div id="info-Section">
        <h1>Angel Falls</h1>
        <p>This is the world’s highest uninterrupted waterfall with height of 979 metres. 
            The waterfall drops over the edge of the Auyantepui in the Canaima National Park 
            (a UNESCO world heritage site).
        </p>
        <p>This place is one of the most famous attractions in Venezuela. 
            It is located in the Venezuela’s jungle and it has been an inspiration for different 
            films such as Up from Disney Pixar and Point Break.</p>
        <p>
            This breathtaking waterfall is located in the oldest place on earth and is considered as 
            an outstanding place that has to be admired once at least.
        </p>
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
                <asp:ListItem Value="1">5 day Tour</asp:ListItem>
                <asp:ListItem Value="2">9 day Tour</asp:ListItem>
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
        &nbsp;<asp:Button ID="btnBookButton" runat="server" Text="Book" Font-Bold="True" Font-Size="Medium" Height="30px" Width="80px" OnClick="btnBookButton_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblErrorHeading" runat="server" Font-Size="X-Large"></asp:Label>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblErrorMsg" runat="server" Font-Size="X-Large"></asp:Label>
    </div>
    <div style="margin-left:50px; margin-top:20px">
    <iframe id="BreakPoint" height="300" width="500" src="https://www.youtube.com/embed/VrvPhYeALxg?controls=1"></iframe>
    <iframe id="Up" height="300" width="500" src="https://www.youtube.com/embed/ox4SMS7b_OU?controls=1"></iframe>
    </div>        
</asp:Content>
