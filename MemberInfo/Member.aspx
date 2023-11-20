<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="KarateSchool.Member" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
    <p>
        Hello,
        <asp:LoginName ID="LoginName1" runat="server" />
        <asp:Label ID="lblFullName" runat="server"></asp:Label>
        <asp:LoginStatus ID="LoginStatus1" runat="server" />
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Select a Member to preview: " Visible="False"></asp:Label>
        <asp:DropDownList ID="ddlMembers" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlInstructors_SelectedIndexChanged" Visible="False">
        </asp:DropDownList>
    </p>
    <p>
        <asp:GridView ID="memberGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </p>
</asp:Content>
