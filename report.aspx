<%@ Page Language="C#" AutoEventWireup="true" CodeFile="report.aspx.cs" Inherits="report" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Idea Box Report Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color:DodgerBlue; text-align:center; padding-bottom:5px; padding-top:5px; font-size: large; font-family: Sylfaen;">
    Idea Box Report
    </div>
    <div style="width: 500px;">
        <div style="margin-bottom:10px;">
            <table><tr><td style="font-size: medium; font-family: Sylfaen">Search by</td><td>
                <asp:DropDownList ID="SearchFieldDropDown" runat="server" 
                            onselectedindexchanged="SearchFieldDropDown_SelectedIndexChanged" 
                    AutoPostBack="True" Font-Names="Sylfaen" Font-Size="Medium">
                    <asp:ListItem Value="date">Date</asp:ListItem>
                    <asp:ListItem Value="staff_name">Staff Name</asp:ListItem>
                    <asp:ListItem Value="staff_id">Staff ID</asp:ListItem>
                    <asp:ListItem Value="staff_unit_id">Staff Unit</asp:ListItem>
                    <asp:ListItem Value="idea_text">Idea</asp:ListItem>
                    <asp:ListItem Value="Unit_con">Unit of Concen</asp:ListItem>
                    <asp:ListItem Value="dept_con">Dept of Concen</asp:ListItem>
                </asp:DropDownList>
            </td></tr>
            </table>
        </div>
        <div id="dateDiv" runat="server" style="margin-bottom:10px;">
            <table>
            <tr>
                <td style="font-size: medium; font-family: Sylfaen">Begin Date</td>
                <td><asp:TextBox ID="fromTextBox" runat="server" Font-Names="Sylfaen" 
                        Font-Size="Medium"></asp:TextBox>
                    <cc1:CalendarExtender ID="fromTextBox_CalendarExtender" runat="server" 
                        TargetControlID="fromTextBox">
                    </cc1:CalendarExtender>
                </td>
                <td>
                    <asp:Image ID="Image1" runat="server"
                        ImageUrl="~/images/1326890686_Calender_day.png" Height="28px" 
                        Width="28px" /></td>
                <td style="font-size: medium; font-family: Sylfaen">End Date</td>
                <td>
                    <asp:TextBox ID="toTextBox" runat="server" Font-Names="Sylfaen" 
                        Font-Size="Medium"></asp:TextBox>
                    <cc1:CalendarExtender ID="toTextBox_CalendarExtender" runat="server" 
                        TargetControlID="toTextBox">
                    </cc1:CalendarExtender>
                </td>
                <td>
                    <asp:Image ID="Image2" runat="server" Height="28px" 
                        ImageUrl="~/images/1326890686_Calender_day.png" Width="28px" /></td>
                <td>
                    <asp:CompareValidator ID="dateCompareValidator" runat="server" 
                        ErrorMessage="Begin Date must be less than End Date" Text="*" ControlToCompare="toTextBox" 
                        ControlToValidate="fromTextBox" Operator="LessThanEqual"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="fromdateValidator" runat="server" 
                        ErrorMessage="Begin date must be provided" Text="*" ControlToValidate="fromTextBox"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="todateValidator" runat="server" 
                        ErrorMessage="End date must be provided" Text="*" ControlToValidate="toTextBox"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            </table>
        </div>
        <div id="textDiv" runat="server" style="margin-bottom:10px">
            <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Search Text" Font-Names="Sylfaen" 
                        Font-Size="Medium"></asp:Label>
                </td>
                <td><asp:TextBox ID="searchTextBox" runat="server" Font-Names="Sylfaen" 
                        Font-Size="Medium"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="searchtextValidator" runat="server" 
                        ErrorMessage="Please enter a value" Text="*" 
                        ControlToValidate="searchTextBox"></asp:RequiredFieldValidator></td>
            </tr>
            </table>
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <asp:Button ID="searchButton" runat="server" Text="Search" 
            onclick="searchButton_Click" Font-Names="Sylfaen" Font-Size="Medium"/>
            &nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Clear" onclick="Button1_Click" 
                Font-Names="Sylfaen" Font-Size="Medium" />
&nbsp;<p></p>
        <div style="margin-bottom:10px">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" AutoGenerateColumns="False" Font-Names="Sylfaen">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="date" HeaderText="Date" />
                    <asp:BoundField DataField="staff_id" HeaderText="Staff ID" />
                    <asp:BoundField DataField="staff_name" HeaderText="Staff Name" />
                    <asp:BoundField DataField="staff_unit_id" HeaderText="Staff Unit" />
                    <asp:BoundField DataField="idea_text" HeaderText="Idea" />
                    <asp:BoundField DataField="dept_name" HeaderText="Department of Concen" />
                    <asp:BoundField DataField="Unit_name" HeaderText="Unit of Concen" />
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
           
            <asp:ImageButton ID="ImageButton1" runat="server" 
                ImageUrl="~/images/1305883412_table_excel.png" ToolTip="Export to Excel" 
                Height="41px" Width="47px" onclick="ImageButton1_Click" />
        </div>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    </form>
</body>
</html>
