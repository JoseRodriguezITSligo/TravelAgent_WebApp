<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Canaima.aspx.cs" Inherits="Travel_Agent_WebApp_JoseRodriguez.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Destinations_StyleSheet.css"/>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="Destinations_JavaScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Images-wrapper">
        <table id="Images-row">
            <tr>
                <td class="smallImage"><img id="Canaima1"  src="Roraima1.jpg" onclick="ImageChanger(this.id)"/></td>
                <td class="smallImage" ><img id="Canaima2" src="GranSabana6.jpg" onclick="ImageChanger(this.id)"/></td>
                <td class="smallImage"><img id="Canaima3"  src="GranSabana4.jpg" onclick="ImageChanger(this.id)"/></td>
            </tr>
        </table>
         <div id="BigImageFrame" class="BigFrame">
                <img id="BigImage" class="BigPicture" src="Roraima1.jpg" />
                <p id="HideButton"><b><i><u>Hide</u></i></b></p>
         </div>  
    </div>
    
    <div id="info-Section">
       <h1>Canaima National Park</h1> 
        <p>Canaima is one of the largest national parks in Venezuela (around 30000 km^2 ). 
            It’s known for being home of the oldest rock formations in Earth, 
            going back to 4 thousand million years ago. Landscapes are dominated by the view 
            of these huge rock plateaus called Tepuis which form impressive natural scenarios.
        </p>
        <p>Mountains as Roraima, Auyantepui (where the Angel Falls is), Kavak, Churun Meru and 
            many others have been there for million of years to delight human beings with their beauty.
        </p>
        <p>Wide rivers and huge land extensions are the perfect combination for taking up activities 
            such as kayaking, skydive, paragliding, climbing, hiking and much more.
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
            <li style="width: 380px" ><span>5 day Tour:&nbsp; &nbsp;</span>
                <asp:Label ID="lblFiveDayPrice" runat="server" Text="0"></asp:Label>
&nbsp;<asp:Label ID="lblPerPerson1" runat="server" Text="/person"></asp:Label>
            </li>
            <li style="width: 380px"><span>9 day Tour:&nbsp;&nbsp;&nbsp; </span><asp:Label ID="lblNineDayPrice" runat="server" Text="0"></asp:Label>&nbsp;<asp:Label ID="lblPerPerson2" runat="server" Text="/person"></asp:Label>
            </li>
        </ol>
        <p style="width: 437px">
            <asp:CheckBoxList ID="cbxTours" runat="server" Height="16px" Width="153px">
                <asp:ListItem Value="3">5 day Tour</asp:ListItem>
                <asp:ListItem Value="4">9 day Tour</asp:ListItem>
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
