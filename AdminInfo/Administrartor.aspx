<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Administrartor.aspx.cs" Inherits="KarateSchool.AdminInfo.Administrartor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%">
    <tr>
        <td style="background-color: #FF8080">
            <table  class="w-100">
                <tr>
                    <td style="width: 50%" ><center><span style="font-size: x-large"><strong>Members</strong></span><br />
                        </center></td>
                </tr>
                <tr>
                    <td style="width: 50%" >
                        <asp:GridView ID="dgvMembers" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True"  DataKeyNames="MemberFirstName,MemberLastName,MemberPhoneNumber,MemberDateJoined" Width="90%">
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
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%">
                        <table class="w-100" >
                            <tr>
                                <td colspan="2" style="width: 45%"><strong>Select a record to delete it.</strong></td>
                                <td colspan="2" style="width: 45%"><strong>Enter data to create a record.</strong></td>
                                <td style="width: 62px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 15%" >First Name:&nbsp; </td>
                                <td style="width: 30%">
                                    <asp:Label ID="lblDeleteMemberFName" runat="server"></asp:Label>
                                </td>
                                <td align="right" style="width: 15%" >First Name:&nbsp; </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtAddMemberFName" runat="server"></asp:TextBox>
                                    <br />
                                </td>
                                <td style="width: 62px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 15%" >&nbsp;</td>
                                <td style="width: 30%">
                                    &nbsp;</td>
                                <td align="right" >&nbsp;</td>
                                <td class="text-start" >
                                    <asp:RequiredFieldValidator ID="rfvMemberFName" runat="server" ControlToValidate="txtAddMemberFName" ErrorMessage="Please enter a first name." ForeColor="Red" ValidationGroup="valMember" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                                <td align="right" >&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 15%" >Last Name:&nbsp; </td>
                                <td style="width: 30%">
                                    <asp:Label ID="lblDeleteMemberLName" runat="server"></asp:Label>
                                </td>
                                <td align="right" style="width: 15%" >Last Name:&nbsp; </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtAddMemberLName" runat="server"></asp:TextBox>
                                    <br />
                                </td>
                                <td style="width: 62px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 15%" >&nbsp;</td>
                                <td style="width: 30%">
                                    &nbsp;</td>
                                <td align="right" style="width: 15%" >&nbsp;</td>
                                <td style="width: 30%">
                                    <asp:RequiredFieldValidator ID="rfvMemberLName" runat="server" ControlToValidate="txtAddMemberLName" Display="Dynamic" ErrorMessage="Please enter a last name." ForeColor="Red" ValidationGroup="valMember"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 62px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 15%; width: 15%" >Date Joined:&nbsp; </td>
                                <td style="height: 15%; width: 30%;">
                                    <asp:Label ID="lblDeleteMemberDateJoined" runat="server"></asp:Label>
                                </td>
                                <td align="right" style="height: 15%; width: 15%;" >Date Joined:&nbsp; </td>
                                <td style="height: 15%; width: 30%">
                                    <asp:TextBox ID="txtAddMemberDateJoined" runat="server"></asp:TextBox>
                                    <br />
                                </td>
                                <td style="height: 15%; width: 62px;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 15%; width: 15%" >&nbsp;</td>
                                <td style="height: 15%; width: 30%;">
                                    &nbsp;</td>
                                <td align="right" style="height: 15%; width: 15%;" >&nbsp;</td>
                                <td style="height: 15%; width: 30%">
                                    <asp:RequiredFieldValidator ID="rfvMemberDateJoined" runat="server" ControlToValidate="txtAddMemberDateJoined" ErrorMessage="Please enter a date joined." ForeColor="Red" ValidationGroup="valMember" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                                <td style="height: 15%; width: 62px;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 15%" >Phone Number:&nbsp; </td>
                                <td style="width: 30%">
                                    <asp:Label ID="lblDeleteMemberPhoneNumber" runat="server"></asp:Label>
                                </td>
                                <td align="right" style="width: 15%" >Phone Number:&nbsp; </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtAddMemberPhoneNumber" runat="server"></asp:TextBox>
                                    <br />
                                </td>
                                <td style="width: 62px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 15%" >&nbsp;</td>
                                <td style="width: 30%">
                                    &nbsp;</td>
                                <td align="right" style="width: 15%" >&nbsp;</td>
                                <td style="width: 30%">
                                    <asp:RegularExpressionValidator ID="revMemberPhoneNumber" runat="server" ControlToValidate="txtAddMemberPhoneNumber" ErrorMessage="Please enter a valid phone number." ForeColor="Red" ValidationGroup="valMember" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" Display="Dynamic"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="revMemberPhoneNumber0" runat="server" ControlToValidate="txtAddMemberPhoneNumber" ErrorMessage="Please enter a phone number." ForeColor="Red" ValidationGroup="valMember" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 62px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 15%" >Email:&nbsp; </td>
                                <td style="width: 30%">
                                    <asp:Label ID="lblDeleteMemberEmail" runat="server"></asp:Label>
                                </td>
                                <td align="right" style="width: 15%" >Email:&nbsp; </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtAddMemberEmail" runat="server"></asp:TextBox>
                                    <br />
                                </td>
                                <td style="width: 62px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 15%" >&nbsp;</td>
                                <td style="width: 30%">
                                </td>
                                <td align="right" style="width: 15%" >&nbsp;</td>
                                <td style="width: 30%">
                                    <asp:RegularExpressionValidator ID="revMemberEmail" runat="server" ControlToValidate="txtAddMemberEmail" ErrorMessage="Please enter a valid email." ForeColor="Red" ValidationGroup="valMember" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="rfvMemberEmail0" runat="server" ControlToValidate="txtAddMemberEmail" ErrorMessage="Please enter an email." ForeColor="Red" ValidationGroup="valMember" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 62px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 15%"  >&nbsp;</td>
                                <td style="width: 30%">
                        <asp:Button ID="btnDeleteMember" runat="server" Text="Delete" />
                                </td>
                                <td style="width: 15%"  >&nbsp;</td>
                                <td style="width: 30%">
                        <asp:Button ID="btnAddMember" runat="server" Text="Add" ValidationGroup="valMember" />
                                </td>
                                <td style="width: 62px">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%" >
                        &nbsp;</td>
                </tr>
            </table>
        </td>
        <td style="background-color: #FF8080">
            <table  class="w-100">
                <tr>
                    <td style="width: 50%" ><center><span style="font-size: x-large"><strong>Instructors</strong></span><br />
                        </center></td>
                </tr>
                <tr>
                    <td style="width: 50%"  >
                        <asp:GridView ID="dgvInstructors" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" Width="100%" DataKeyNames="InstructorFirstName,InstructorLastName">
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
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%" >
                        <table class="w-100" >
                                <tr>
                                <td colspan="2"><strong>Select a record to delete it.</strong></td>
                                <td colspan="2"><strong>Enter data to create a record.</strong></td>
        <td style="height: 15%; width: 62px;">
            &nbsp;</td>
    </tr>
                                <tr>
        <td align="right" style="height: 15%; width: 18%" >First Name:&nbsp; </td>
        <td style="height: 15%; width: 27%;">
            <asp:Label ID="lblDeleteInstructorFName" runat="server"></asp:Label>
        </td>
        <td align="right" style="height: 15%; width: 18%" >First Name:&nbsp; </td>
        <td style="height: 15%; width: 27%">
            <asp:TextBox ID="txtAddInstructorFName" runat="server"></asp:TextBox>
            <br />
        </td>
        <td style="height: 15%; width: 62px;">
            &nbsp;</td>
    </tr>
                                <tr>
        <td align="right" style="height: 15%; width: 18%" >&nbsp;</td>
        <td style="height: 15%; width: 27%;">
            &nbsp;</td>
        <td align="right" style="height: 15%; width: 18%" >&nbsp;</td>
        <td style="height: 15%; width: 27%">
            <asp:RequiredFieldValidator ID="rfcInstructorFName" runat="server" ControlToValidate="txtAddInstructorFName" ErrorMessage="Please enter a first name." ForeColor="Red" ValidationGroup="valInstructor" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
        <td style="height: 15%; width: 62px;">
            &nbsp;</td>
    </tr>
    <tr>
        <td align="right" style="width: 18%" >Last Name:&nbsp; </td>
        <td class="w-25" style="width: 27%">
            <asp:Label ID="lblDeleteInstructorLName" runat="server"></asp:Label>
        </td>
        <td align="right" style="width: 18%" >Last Name:&nbsp; </td>
        <td style="width: 27%">
            <asp:TextBox ID="txtAddInstructorLName" runat="server"></asp:TextBox>
            <br />
        </td>
        <td style="width: 62px">
            &nbsp;</td>
    </tr>
    <tr>
        <td align="right" style="width: 18%" >&nbsp;</td>
        <td class="w-25" style="width: 27%">
            &nbsp;</td>
        <td align="right" style="width: 18%" >&nbsp;</td>
        <td style="width: 27%">
            <asp:RequiredFieldValidator ID="rfcInstructorLName" runat="server" ControlToValidate="txtAddInstructorLName" ErrorMessage="Please enter a last name." ForeColor="Red" ValidationGroup="valInstructor" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
        <td style="width: 62px">
            &nbsp;</td>
    </tr>
    <tr>
        <td align="right" style="width: 18%" >Phone Number:&nbsp; </td>
        <td class="w-25" style="width: 27%">
            <asp:Label ID="lblDeleteInstructorPhoneNumber" runat="server"></asp:Label>
        </td>
        <td align="right" style="width: 18%" >Phone Number:&nbsp; </td>
        <td style="width: 27%">
            <asp:TextBox ID="txtAddInstructorPhoneNumber" runat="server"></asp:TextBox>
            <br />
        </td>
        <td style="width: 62px">
            &nbsp;</td>
    </tr>
    <tr>
        <td align="right" style="width: 18%" >&nbsp;</td>
        <td class="w-25" style="width: 27%">
            &nbsp;</td>
        <td align="right" style="width: 18%" >&nbsp;</td>
        <td colspan="2">
            <asp:RegularExpressionValidator ID="recInstructorPhoneNumber" runat="server" ControlToValidate="txtAddInstructorPhoneNumber" ErrorMessage="Please enter a valid phone number." ForeColor="Red" ValidationGroup="valInstructor" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="recInstructorPhoneNumber0" runat="server" ControlToValidate="txtAddInstructorPhoneNumber" ErrorMessage="Please enter a phone number." ForeColor="Red" ValidationGroup="valInstructor" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 18%"  >&nbsp;</td>
        <td class="w-25" style="width: 27%">
<asp:Button ID="Button1" runat="server" Text="Delete" />
        </td>
        <td style="width: 18%"  >&nbsp;</td>
        <td style="width: 27%">
<asp:Button ID="Button2" runat="server" Text="Add" ValidationGroup="valInstructor" />
        </td>
        <td style="width: 62px">
            &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%"  >
                        &nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="background-color: #FF8080; " colspan="2">
            <table >
                <tr>
                    <td align="right" >ModelName: </td>
                    <td>
                        <asp:TextBox ID="txtAddModel" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" >AutoTypeID: </td>
                    <td>
                        <asp:DropDownList ID="ddlAddTypeID" runat="server">
                            <asp:ListItem>Karate Age-Uke</asp:ListItem>
                            <asp:ListItem>Karate Chudan-Uke</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" >CargoSpace: </td>
                    <td>
                        <asp:TextBox ID="txtAddCargoSpace" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" >&nbsp;</td>
                    <td>
            <asp:Button ID="btnAdd" runat="server" Text="Add" />
                    </td>
                </tr>
                </table>
        </td>
    </tr>
    </table>
</asp:Content>
