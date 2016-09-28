<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Administrator.aspx.cs" Inherits="Travel_Agent_WebApp_JoseRodriguez.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="UdateTourPrice" font-size="Large" style="margin-top: 100px">
        &nbsp; Update prices for the tours available:<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RadioButtonList ID="rdBtnTours" runat="server" Font-Size="Large">
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
            <asp:ListItem Value="11">Double Package</asp:ListItem>
            <asp:ListItem Value="12">Triple Package</asp:ListItem>
        </asp:RadioButtonList>

        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New Price/ person:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tbxNewPrice" runat="server"></asp:TextBox>
&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnUpdatePrice" runat="server" Text="UpdatePrice" OnClick="btnUpdatePrice_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblUpdatePriceResult" runat="server"></asp:Label>

    </div>

    <div id="UpdateDestinationCapacity" style="margin-top:50px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Update Destination capacity:

        <br />
        <br />
        <asp:RadioButtonList ID="rdBtnDestinations" runat="server">
            <asp:ListItem Value="1">Angel Falls</asp:ListItem>
            <asp:ListItem Value="2">Canaima</asp:ListItem>
            <asp:ListItem Value="3">Los Roques</asp:ListItem>
            <asp:ListItem Value="4">Morrocoy</asp:ListItem>
            <asp:ListItem Value="5">Los Andes</asp:ListItem>
        </asp:RadioButtonList>

        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New Capacity:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <asp:TextBox ID="tbxNewCapacity" runat="server"></asp:TextBox>


        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnUpdateCapacity" runat="server" Text="UpdateCapacity" OnClick="btnUpdateCapacity_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblUpdateCapResult" runat="server"></asp:Label>


    </div>
</asp:Content>
