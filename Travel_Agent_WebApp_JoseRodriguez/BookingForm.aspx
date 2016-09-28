<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookingForm.aspx.cs" Inherits="Travel_Agent_WebApp_JoseRodriguez.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="BookingForm_StyleSheet.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <h1 id="CDHeading">Customer Details</h1> 
  <div id="CustomerDetailsBox" class="FormContainer">
    
    <p class="Titles">First Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tbxFName" class="TextInput" runat="server" Font-Size="Medium" ></asp:TextBox>
        *</p>
    <p class="Titles">Surname:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tbxSurname" class="TextInput" runat="server" Font-Size="Medium" ></asp:TextBox>
        *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblCustDetailsError" CssClass="ErrorMessage" runat="server"></asp:Label>
      </p>
    <p class="Titles">Address Line 1:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tbxAddress1" class="TextInput" runat="server" Font-Size="Medium" ></asp:TextBox>
        *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
    <p class="Titles">Address Line 2:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tbxAddress2" class="TextInput" runat="server" Font-Size="Medium" ></asp:TextBox>
    </p>
    <p> Country:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlCountry" runat="server" Font-Size="Medium" BackColor="#CFCFCF">
            <asp:ListItem Value="1">Ireland</asp:ListItem>
            <asp:ListItem Value="2">Spain</asp:ListItem>
            <asp:ListItem Value="3">France</asp:ListItem>
            <asp:ListItem Value="4">England</asp:ListItem>
            <asp:ListItem Value="5">United States</asp:ListItem>
            <asp:ListItem Value="6">Venezuela</asp:ListItem>
        </asp:DropDownList>
        *</p>
    <p> City:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlCity" runat="server" Font-Size="Medium" BackColor="#CFCFCF">
            <asp:ListItem Value="1">Dublin</asp:ListItem>
            <asp:ListItem Value="2">Sligo</asp:ListItem>
            <asp:ListItem Value="3">Limerick</asp:ListItem>
            <asp:ListItem Value="4">Cork</asp:ListItem>
            <asp:ListItem Value="5">Madrid</asp:ListItem>
            <asp:ListItem Value="6">Barcelona</asp:ListItem>
            <asp:ListItem Value="7">Paris</asp:ListItem>
            <asp:ListItem Value="8">Lyon</asp:ListItem>
            <asp:ListItem Value="9">London</asp:ListItem>
            <asp:ListItem Value="10">Liverpool</asp:ListItem>
            <asp:ListItem Value="11">Manchester</asp:ListItem>
            <asp:ListItem Value="12">New York</asp:ListItem>
            <asp:ListItem Value="13">Chicago</asp:ListItem>
            <asp:ListItem Value="14">Miami</asp:ListItem>
            <asp:ListItem Value="15">Caracas</asp:ListItem>
            <asp:ListItem Value="16">Valencia</asp:ListItem>
        </asp:DropDownList>
        *</p>
    <p class="Titles">Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="tbxPhone" class="TextInput" runat="server" Font-Size="Medium" ></asp:TextBox>
    </p>
    <p class="Titles">Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="tbxEmail" class="TextInput" runat="server" Font-Size="Medium" ></asp:TextBox>
    </p>
  </div>
  <h1>Package Selection</h1>    
  <div class="FormContainer" >          
        Tour Selected:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBoxList ID="cbxTours" runat="server">
            <asp:ListItem Value="1">Angel Falls (5 days)</asp:ListItem>
            <asp:ListItem Value="2">Angel Falls (9 days)</asp:ListItem>
            <asp:ListItem Value="3">Canaima (5 days)</asp:ListItem>
            <asp:ListItem Value="4">Canaima (9 days)</asp:ListItem>
            <asp:ListItem Value="5">Los Roques (5 days)</asp:ListItem>
            <asp:ListItem Value="6">Los Roques (9 days)</asp:ListItem>
            <asp:ListItem Value="7">Morrocoy (5 days)</asp:ListItem>
            <asp:ListItem Value="8">Morrocoy (9 days)</asp:ListItem>
            <asp:ListItem Value="9">Los Andes (5 days)</asp:ListItem>
            <asp:ListItem Value="10">Los Andes (9 days)</asp:ListItem>
        </asp:CheckBoxList>
        <asp:Label ID="lblToursError" CssClass="ErrorMessage" runat="server"></asp:Label>
        <br />
        <br />
        Departure date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number of people:&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlNumOfPeople" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlNumOfPeople_SelectedIndexChanged" BackColor="#CFCFCF">
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
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="lblNumOfPeopleError" CssClass="ErrorMessage" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp; 
      <asp:Calendar ID="calDepartureDate" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" CellPadding="1">
            <DayHeaderStyle BackColor="#99CCCC" Height="1px" ForeColor="#336666" />
            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
            <TitleStyle BackColor="#003399" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" BorderColor="#3366CC" BorderWidth="1px" Height="25px" />
            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
            <WeekendDayStyle BackColor="#CCCCFF" />
        </asp:Calendar>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="lblCheckAvailability" runat="server" OnClick="lblCheckAvailability_Click" Text="Check Availability" />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblDepDateError" CssClass="ErrorMessage" runat="server"></asp:Label>
    </div>
    <h1>Total Booking</h1>
    <div class="FormContainer">

        Currency:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlCurrencyPicker" runat="server" Font-Size="Medium" OnSelectedIndexChanged="ddlCurrency_SelectedIndexChanged" AutoPostBack="True" BackColor="#CFCFCF">
                <asp:ListItem Value="1">Euro (€)</asp:ListItem>
                <asp:ListItem Value="2">Pound (£)</asp:ListItem>
                <asp:ListItem Value="3">US Dollar ($)</asp:ListItem>
                <asp:ListItem Value="4">Bolivar (VEF)</asp:ListItem>
        </asp:DropDownList>

        <br />
        <br />
        Unit price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblPricePP" runat="server" Font-Size="Large"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number of people:&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblNumOfPeople" runat="server" Font-Size="Large"></asp:Label>
        <br />
        <br />
        Total:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblTotal" runat="server" Font-Size="X-Large"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnUpdateTotal" runat="server" Font-Bold="True" Font-Size="Medium" OnClick="btnUpdateTotal_Click" Text="Update Total" />
    </div>
    <h1>Payment Details</h1>
    <div class="FormContainer">

        Card Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tbxCardNumber" class="TextInput" runat="server" Font-Size="Medium" ></asp:TextBox>
        *&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblCardNumError" CssClass="ErrorMessage" runat="server"></asp:Label>
        <br />
        <br />
        Card Holder:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tbxCardHolder" class="TextInput" runat="server" Font-Size="Medium"></asp:TextBox>
        * <br />
        <br />
        Expiry date (Month/Year):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlMonth" Margin-Left="250px" runat="server" Font-Size="Medium" BackColor="#CFCFCF">
            <asp:ListItem Value="01">January</asp:ListItem>
            <asp:ListItem Value="02">February</asp:ListItem>
            <asp:ListItem Value="03">March</asp:ListItem>
            <asp:ListItem Value="04">April</asp:ListItem>
            <asp:ListItem Value="05">May</asp:ListItem>
            <asp:ListItem Value="06">June</asp:ListItem>
            <asp:ListItem Value="07">July</asp:ListItem>
            <asp:ListItem Value="08">Augst</asp:ListItem>
            <asp:ListItem Value="09">September</asp:ListItem>
            <asp:ListItem Value="10">October</asp:ListItem>
            <asp:ListItem Value="11">November</asp:ListItem>
            <asp:ListItem Value="12">December</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlYear" runat="server" Font-Size="Medium" BackColor="#CFCFCF">
            <asp:ListItem>2016</asp:ListItem>
            <asp:ListItem>2017</asp:ListItem>
            <asp:ListItem>2018</asp:ListItem>
            <asp:ListItem>2019</asp:ListItem>
            <asp:ListItem>2020</asp:ListItem>
            <asp:ListItem>2021</asp:ListItem>
            <asp:ListItem>2022</asp:ListItem>
            <asp:ListItem>2023</asp:ListItem>
            <asp:ListItem>2024</asp:ListItem>
            <asp:ListItem>2025</asp:ListItem>
        </asp:DropDownList>
        *<br />
        <br />
        CVV:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="tbxCVV" class="TextInput" runat="server" Font-Size="Medium" Width="50px"></asp:TextBox>
        *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblCVVError" CssClass="ErrorMessage" runat="server"></asp:Label>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblPayDetailsError" CssClass="ErrorMessage" runat="server"></asp:Label>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnConfirmBooking" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="X-Large" Font-Underline="True" Text="Confirm your booking" Width="400px" OnClick="btnConfirmBooking_Click" />
    </div>
</asp:Content>
