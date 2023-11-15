<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor.Master" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="KarateSchool.Instructor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <p>
        Hi
        <asp:Label ID="lblFirstName" runat="server" Text="Firsty"></asp:Label>
        <asp:Label ID="lblLastName" runat="server" Text="Last"></asp:Label>
        ,</p>
    <p>
        <asp:GridView ID="instructorGridView" runat="server">
        </asp:GridView>
    </p>
</asp:Content>
