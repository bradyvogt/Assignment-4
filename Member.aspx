﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="KarateSchool.Member" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <p>
        Hi
        <asp:Label ID="lblFirstName" runat="server" Text="First"></asp:Label>
&nbsp;<asp:Label ID="lblLastName" runat="server" Text="Last"></asp:Label>
        ,</p>
    <p>
        <asp:GridView ID="memberGridView" runat="server">
        </asp:GridView>
    </p>
    
</asp:Content>