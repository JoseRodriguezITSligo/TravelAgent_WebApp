<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Beaches.aspx.cs" Inherits="Travel_Agent_WebApp_JoseRodriguez.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Galleries_StyleSheet.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Beach">
        <table id="Beaches_Wrapper">
            <tr>
                <td><img class="Gallery" src="Beaches1.JPG"/><p style="margin-left:180px"><b>Margarita Hilton Suites</b></p>
                </td>
                <td><img class="Gallery" src="Beaches2.jpg"/><p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Los Roques</b></p></td>
                <td><img class="Gallery" src="Beaches3.jpg"/><p><b>&nbsp;&nbsp;&nbsp;&nbsp; Los Roques Airport</b></p></td>
            </tr>
            <tr>
                <td><img class="Gallery" src="Beaches4.jpg"/><p><b>Los Roques Overview</b></p></td>
                <td><img class="Gallery" src="Beaches5.jpg"/><p><b>&nbsp;&nbsp; Diving Los Roques</b></p></td>
                <td><img class="Gallery" src="Beaches6.jpg"/><p><b>&nbsp;&nbsp; Cayo Norte Morrocoy</b></p></td>
            </tr>
            <tr>
                <td><img class="Gallery" src="Beaches7.jpg"/><p><b>Manglares in Morrocoy</b></p></td>
                <td><img class="Gallery" src="Beaches8.jpg"/><p><b>&nbsp;&nbsp; Cayo Sal Morrocoy</b></p></td>
                <td><img class="Gallery" src="Beaches9.jpg"/><p><b>Cayo Sombrero Morrocoy         </tr>
        </table>
    </div>
</asp:Content>
