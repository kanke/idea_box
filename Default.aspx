<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Idea Box Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
   <div style="margin-bottom:10px; width:50px;" >
   
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/banner.jpg" 
                        Width="1170px" Height="81px" />
   
   </div>
   <div style="margin-top:10px; margin-bottom:10px; margin-left:10px; margin-right:10px;">
   
   
       <table align="center" class="style1" 
           style="font-family: Sylfaen; font-size: medium; padding: inherit; margin: inherit">
           <tr>
               <td>
                   Staff ID:</td>
               <td>
                    <asp:TextBox ID="IDTextBox" runat="server" Font-Names="Sylfaen" 
                        Font-Size="Medium"></asp:TextBox>
                &nbsp;
                    <asp:RequiredFieldValidator ID="idFieldValidator" runat="server" 
                        ControlToValidate="IDTextBox" ErrorMessage="Please Enter your Staff ID">Please 
                   Enter your Staff ID</asp:RequiredFieldValidator>
                </td>
           </tr>
           <tr>
               <td>
                    Staff Name:</td>
               <td>
                    <asp:TextBox ID="NameTextBox" runat="server" Font-Names="Sylfaen" 
                        Font-Size="Medium"></asp:TextBox>
                &nbsp;
                    <asp:RequiredFieldValidator ID="nameFieldValidator" runat="server" 
                        ControlToValidate="NameTextBox" ErrorMessage="Please Enter your Name">Please 
                   Enter your Name</asp:RequiredFieldValidator>
                </td>
           </tr>
           <tr>
               <td>
                    Unit:</td>
               <td>
                    <asp:DropDownList ID="UnitDropDownList" runat="server" 
                        ondatabound="UnitDropDownList_DataBound" 
                        DataSourceID="Your_unitSqlDataSource" DataTextField="unit_name" 
                        DataValueField="unit_name" Font-Names="Sylfaen" Font-Size="Medium">
                        <asp:ListItem Value="0">-- Select your Unit --</asp:ListItem>
                    </asp:DropDownList>
                &nbsp;
                   <asp:CompareValidator ID="your_unitCompareValidator" runat="server" 
                       ControlToValidate="UnitDropDownList" ErrorMessage="Please Select a Unit" 
                       Operator="NotEqual" ValueToCompare="0">Please Select a Unit</asp:CompareValidator>
               </td>
           </tr>
           <tr>
               <td>
                    Idea Text:</td>
               <td>
                    <asp:TextBox ID="Idea_TextTextBox" runat="server" TextMode="MultiLine" 
                        Height="72px" Width="405px" Font-Names="Sylfaen" Font-Size="Medium"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="ideaFieldValidator" runat="server" 
                        ControlToValidate="Idea_TextTextBox" ErrorMessage="Suggest an Idea">Suggest 
                   an Idea</asp:RequiredFieldValidator>
                </td>
           </tr>
           <tr>
               <td>
                   Department of Concentration:</td>
               <td>
                    <asp:DropDownList ID="DeptconDropDownList" runat="server" 
                        ondatabound="DeptconDropDownList_DataBound" 
                        onselectedindexchanged="DeptconDropDownList_SelectedIndexChanged" 
                        DataSourceID="Dept_conSqlDataSource" DataTextField="dept_name" 
                        DataValueField="dept_id" AutoPostBack="True" Font-Names="Sylfaen" 
                        Font-Size="Medium">
                        <asp:ListItem Value="0">-- Select Department of Concentration --</asp:ListItem>
                    </asp:DropDownList>
                &nbsp;
                    <asp:CompareValidator ID="deptCompareValidator" runat="server" 
                        ControlToValidate="DeptconDropDownList" 
                        ErrorMessage="Pick a Depertment" Operator="NotEqual" 
                        ValueToCompare="0">Pick a Depertment</asp:CompareValidator>
                </td>
           </tr>
           <tr>
               <td>
                   Unit /Area of Concentration:&nbsp;</td>
               <td>
                   <asp:DropDownList ID="ConDropDownList" runat="server" 
                        ondatabound="ConDropDownList_DataBound" 
                        onselectedindexchanged="ConDropDownList_SelectedIndexChanged" 
                        DataSourceID="Unit_conSqlDataSource" DataTextField="unit_name" 
                        DataValueField="unit_id" AutoPostBack="True" Font-Names="Sylfaen" 
                        Font-Size="Medium">
                        <asp:ListItem Value="0">-- Select Unit of Concentration --</asp:ListItem>
                    </asp:DropDownList>
                &nbsp; <asp:CompareValidator ID="unitCompareValidator" runat="server" ErrorMessage="Pick a Unit" 
                        Operator="NotEqual" ValueToCompare="0" 
                       ControlToValidate="ConDropDownList">Pick a Unit</asp:CompareValidator>
                </td>
           </tr>
           <tr>
               <td>
                   <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="Submit" 
                        Height="51px" ImageUrl="~/images/1325769137_ark.png" 
                        onclick="ImageButton1_Click" ToolTip="Submit" Width="52px" 
                        DescriptionUrl="Submit" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton2" runat="server" AlternateText="Clear" 
                        ImageUrl="~/images/1326963780_Reset.png" onclick="ImageButton2_Click" 
                        ToolTip="Clear" Width="40px" />
                &nbsp;&nbsp;
               </td>
               <td>
                   &nbsp;</td>
           </tr>
       </table>
   
   
   </div>
    <div>
    
    </div>
    
    <asp:SqlDataSource ID="Dept_conSqlDataSource" runat="server"
     ConnectionString="<%$ ConnectionStrings:Dept_conConnectionString %>" 
     SelectCommand="select dept_name,dept_id from idea.idea_dept">
    
    </asp:SqlDataSource>
                    
                    
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    
                    
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:SqlDataSource ID="Your_unitSqlDataSource" runat="server"
                    ConnectionString="<%$ ConnectionStrings:Your_unitConnectionString %>" 
                    SelectCommand="select unit_name,unit_id from idea.idea_unit ">
                   
                    </asp:SqlDataSource>
                    
    <asp:SqlDataSource ID="Unit_conSqlDataSource" runat="server"
    ConnectionString="<%$ ConnectionStrings:Unit_conConnectionString %>" 
    
        SelectCommand="select unit_name,unit_id from idea.idea_unit where (dept_id=@dept_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DeptconDropDownList" Name="dept_id" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
                    
    </form>
</body>
</html>
