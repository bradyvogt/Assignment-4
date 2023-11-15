<%@ Page Title="" Language="C#" MasterPageFile="~/Member.Master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="KarateSchool.Member" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
    <p>
        Hi
        <asp:Label ID="lblFirstName" runat="server" Text="First"></asp:Label>
        <asp:Label ID="lblLastName" runat="server" Text="Last"></asp:Label>
        ,</p>
    <p>
        <asp:GridView ID="memberGridView" runat="server">
        </asp:GridView>
    </p>
    
</asp:Content>
