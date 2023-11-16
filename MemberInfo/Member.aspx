<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="KarateSchool.Member" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
    <p>
        Hi
        <asp:Label ID="lblFirstName" runat="server" Text="First"></asp:Label>
        <asp:Label ID="lblLastName" runat="server" Text="Last"></asp:Label>
        ,</p>
    <p>
        <asp:GridView ID="memberGridView" runat="server">
        </asp:GridView>
        <asp:LoginStatus ID="LoginStatus1" runat="server" />
    </p>
</asp:Content>
