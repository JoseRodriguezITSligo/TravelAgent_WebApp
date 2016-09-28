<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookingConfirmation.aspx.cs" Inherits="Travel_Agent_WebApp_JoseRodriguez.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="BookingConfirmation_StyleSheet.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 id="ConfirmationHeading">Confirmation Number</h1>
    <p id="ConfirmationNumber"><asp:Label ID="lblConfirmationNumber" runat="server" Text=""></asp:Label></p>
    <h1>Customer Details</h1>
    <div id="CustomerDetials" class="FormContainer">
        <p style="width:600px">First Name: <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label></p>
        <p style="width:600px">Surname:  <asp:Label ID="lblSurname" runat="server" Text=""></asp:Label></p>
        <p style="width:600px">Phone:  <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label></p>
        <p style="width:600px">Email: <asp:Label ID="lblEmail" runat="server"></asp:Label></p>
    </div>
    <h1>Booking Details</h1>
    <div id ="BookingDetails" class="FormContainer">
        <p>Package: <asp:Label ID="lblPackage" runat="server" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
        <p style="width:800px">Tour Description:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTour1" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblTour2" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblTour3" runat="server"></asp:Label>
        </p>
        <p style="width:600px">Number of people: <asp:Label ID="lblNoOfPeople" runat="server" Text=""></asp:Label></p>
        <p style="width:600px">Departure Date: <asp:Label ID="lblDate" runat="server" Text=""></asp:Label></p>
    </div>
    <h1>Total</h1>
    <div id="PaymentDetials" class="FormContainer">
        <p>Currency: <asp:Label ID="lblCurrency" runat="server" Text=""></asp:Label></p>
        <p>Exchange Rate: <asp:Label ID="lblExchangeRate" runat="server" Text=""></asp:Label></p>
        <p>Total: <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></p>
    </div>
    <aside id="ConfirmationImages">
        <table>
            <tr>
                <td>
                    <img class="ConfPict" src="Beaches5.jpg"/>
                </td>
            </tr>
            <tr>
                 <td>
                    <img class="ConfPict" src="Deserts4.jpg"/>
                </td>
            </tr>
            <tr>
                <td>
                    <img class="ConfPict" src="Mountain5.jpg"/>
                </td>
            </tr>
        </table>
    </aside>
</asp:Content>
