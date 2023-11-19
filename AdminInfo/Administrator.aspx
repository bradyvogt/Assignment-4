<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Administrator.aspx.cs" Inherits="KarateSchool.AdminInfo.Administrartor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Hello,
    <asp:LoginName ID="LoginName1" runat="server" />
    <asp:LoginStatus ID="LoginStatus1" runat="server" />
&nbsp;<br />
    <table style="width:100%">
    <tr>
        <td style="background-color: #FFFFCC">
            <table  class="w-100">
                <tr>
                    <td style="width: 50%" ><center><span style="font-size: x-large"><strong>Members</strong></span><br />
                        </center></td>
                </tr>
                <tr>
                    <td style="width: 50%" >
                        <asp:GridView ID="dgvMembers" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True"  DataKeyNames="Member_UserID,MemberFirstName,MemberLastName,MemberPhoneNumber,MemberDateJoined" Width="90%" OnRowDataBound="dgvMembers_RowDataBound" OnSelectedIndexChanged="dgvMembers_SelectedIndexChanged">
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
                                    <asp:TextBox ID="txtAddMemberDateJoined" runat="server" TextMode="Date"></asp:TextBox>
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
                                <td align="right" style="width: 15%" >&nbsp;</td>
                                <td style="width: 30%">
                                    &nbsp;</td>
                                <td align="right" style="width: 15%" >Username:&nbsp; </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtAddMemberUsername" runat="server"></asp:TextBox>
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
                                    <asp:RequiredFieldValidator ID="rfvMemberFName0" runat="server" ControlToValidate="txtAddMemberUsername" ErrorMessage="Please enter a username." ForeColor="Red" ValidationGroup="valMember" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 62px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 15%" >&nbsp;</td>
                                <td style="width: 30%">
                                    &nbsp;</td>
                                <td align="right" style="width: 15%" >Password:&nbsp; </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtAddMemberPassword" runat="server" TextMode="Password"></asp:TextBox>
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
                                    <asp:RequiredFieldValidator ID="rfvMemberPassword" runat="server" ControlToValidate="txtAddMemberPassword" ErrorMessage="Please enter a password." ForeColor="Red" ValidationGroup="valMember" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 62px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 15%"  >&nbsp;</td>
                                <td style="width: 30%">
                        <asp:Button ID="btnDeleteMember" runat="server" Text="Delete" OnClick="btnDeleteMember_Click" />
                                </td>
                                <td style="width: 15%"  >&nbsp;</td>
                                <td style="width: 30%">
                        <asp:Button ID="btnAddMember" runat="server" Text="Add" ValidationGroup="valMember" OnClick="btnAddMember_Click" />
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
        <td style="background-color: #FFFFCC">
            <table  class="w-100">
                <tr>
                    <td style="width: 50%" ><center><span style="font-size: x-large"><strong>Instructors</strong></span><br />
                        </center></td>
                </tr>
                <tr>
                    <td style="width: 50%"  >
                        <asp:GridView ID="dgvInstructors" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" Width="100%" DataKeyNames="InstructorID,InstructorFirstName,InstructorLastName" OnRowDataBound="dgvInstructors_RowDataBound" OnSelectedIndexChanged="dgvInstructors_SelectedIndexChanged">
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
        <td align="right" style="width: 18%" >&nbsp;</td>
        <td class="w-25" style="width: 27%">
            &nbsp;</td>
                                <td align="right" style="width: 15%" >Username:&nbsp; </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtAddInstructorUsername" runat="server"></asp:TextBox>
                                </td>
    </tr>
    <tr>
        <td align="right" style="width: 18%" >&nbsp;</td>
        <td class="w-25" style="width: 27%">
            &nbsp;</td>
                                <td align="right" style="width: 15%" >&nbsp;</td>
                                <td style="width: 30%">
                                    <asp:RequiredFieldValidator ID="rfvInstructorFName" runat="server" ControlToValidate="txtAddInstructorUsername" ErrorMessage="Please enter a username." ForeColor="Red" ValidationGroup="valInstructor" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
    </tr>
    <tr>
        <td align="right" style="width: 18%" >&nbsp;</td>
        <td class="w-25" style="width: 27%">
            &nbsp;</td>
                                <td align="right" style="width: 15%" >Password:&nbsp; </td>
                                <td style="width: 30%">
                                    <asp:TextBox ID="txtAddInstructorPassword" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
    </tr>
    <tr>
        <td align="right" style="width: 18%" >&nbsp;</td>
        <td class="w-25" style="width: 27%">
            &nbsp;</td>
                                <td align="right" style="width: 15%" >&nbsp;</td>
                                <td style="width: 30%">
                                    <asp:RequiredFieldValidator ID="rfvInstructorPassword" runat="server" ControlToValidate="txtAddInstructorPassword" ErrorMessage="Please enter a password." ForeColor="Red" ValidationGroup="valInstructor" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
    </tr>
    <tr>
        <td style="width: 18%"  >&nbsp;</td>
        <td class="w-25" style="width: 27%">
<asp:Button ID="btnDeleteInstructor" runat="server" Text="Delete" OnClick="btnDeleteInstructor_Click" />
        </td>
        <td style="width: 18%"  >&nbsp;</td>
        <td style="width: 27%">
<asp:Button ID="btnAddInstructor" runat="server" Text="Add" ValidationGroup="valInstructor" OnClick="btnAddInstructor_Click" />
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
        <td style="background-color: #FFFFCC; " colspan="2">
            <table >
                <tr>
                    <td align="right" >Section Name: </td>
                    <td>
                        <asp:DropDownList ID="ddlSection" runat="server" AutoPostBack="True">
                            <asp:ListItem>Karate Age-Uke</asp:ListItem>
                            <asp:ListItem>Karate Chudan-Uke</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="height: 30px" >Member: </td>
                    <td style="height: 30px">
                        <asp:DropDownList ID="ddlMembers" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" >Instructor: </td>
                    <td>
                        <asp:DropDownList ID="ddlInstructors" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" >Start Date: </td>
                    <td>
                        <asp:TextBox ID="txtSectionDate" runat="server" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="txtSectionDate" Display="Dynamic" ErrorMessage="Please enter a date." ForeColor="Red" ValidationGroup="valAssign"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" >Fee: </td>
                    <td>
                        <asp:TextBox ID="txtFee" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFee" runat="server" ControlToValidate="txtFee" Display="Dynamic" ErrorMessage="Please enter a fee." ForeColor="Red" ValidationGroup="valAssign"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" >&nbsp;</td>
                    <td>
            <asp:Button ID="btnAssign" runat="server" Text="Assign" OnClick="btnAssign_Click" ValidationGroup="valAssign" />
                    </td>
                </tr>
                </table>
        </td>
    </tr>
    </table>
</asp:Content>
