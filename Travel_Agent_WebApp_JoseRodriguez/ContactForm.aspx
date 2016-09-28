<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ContactForm.aspx.cs" Inherits="Travel_Agent_WebApp_JoseRodriguez.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="ContactForm_StyleSheet.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1 id="HeadingContact">
        Contact us:
    </h1>
    <div id="ContactForm-wrapper">
        <p>
            <b>Type of query:&nbsp;&nbsp;&nbsp;&nbsp;</b>
            <asp:DropDownList ID="ddlTypeOfMsg" runat="server" Font-Size="Medium" Height="30px">
                <asp:ListItem Value="1">Tours and Activities</asp:ListItem>
                <asp:ListItem Value="2">Estimates</asp:ListItem>
                <asp:ListItem Value="3">Complaints</asp:ListItem>
                <asp:ListItem Value="4">Suggestions</asp:ListItem>
                <asp:ListItem Value="5">Other</asp:ListItem>
            </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <p>
            <b>First name:&nbsp;&nbsp;&nbsp;&nbsp;</b>
            <asp:TextBox ID="tbxFirstName" runat="server" Width="150px" BorderStyle="Solid" Height="25px" BorderWidth="2px" Font-Size="Medium"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <p>
           <b>Surname:&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</b> 
            <asp:TextBox ID="tbxSurname" runat="server" Width="150px" BorderStyle="Solid" Height="25px" BorderWidth="2px" Font-Size="Medium"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *</p>
        <p>
            <b>Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</b>
            <asp:TextBox ID="tbxPhone" runat="server" Width="150px" BorderStyle="Solid" Height="25px" BorderWidth="2px" style="margin-left: 0px" Font-Size="Medium"></asp:TextBox>
        </p>
        <p>
            <b>Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
            <asp:TextBox ID="tbxEmail" runat="server" Width="150px" BorderStyle="Solid" Height="25px" BorderWidth="2px" Font-Size="Medium"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *</p>
        <p>
            <b>Message:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
            <asp:TextBox ID="tbxContactText" runat="server" Height="150px" Width="700px" BorderStyle="Solid" TextMode="MultiLine" style="text-wrap:normal" MaxLength="600" Rows="8" Font-Size="Medium"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnSubmitMessage" runat="server" Text="Submit your message" OnClick="btnSubmitMessage_Click" Font-Bold="True" Font-Size="Medium" />
        </p>
      
   </div>
      <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
        </p>
<p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblConfirmation" runat="server"></asp:Label>
&nbsp;&nbsp; &nbsp;</p>
</asp:Content>
