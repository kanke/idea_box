<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Endpage.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Idea Box</title>
    <style type="text/css">
        .style1
        {
            width: 950px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
  
    <div style="azimuth:center">
    <table style="width: 1223px">
        <tr align="center">
            <td class="style1">
                <br />
                <br />
                <br />
                <asp:Image ID="Image1" runat="server" Height="65px" 
                    ImageUrl="~/images/1325769130_idea.png" />
                <br />
                <br />
                <h1 style=" text-decoration:blink">Thank You For dropping an Idea !.Do come back again if you want to drop some more.</h1>
                    <p>
                   <%-- <h2><i> Courtesy, IT Service Management </i></h2>--%>
                    </p>
            </td>
                        
        </tr>
        <tr align="center">
            <td class="style1">
                <br />
                <br />
                <h3><a href="http://10.234.16.56/">Back to the Intranet</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
                <a href="Default.aspx">Drop another Idea !</a>
                </h3>
            </td>
        </tr>
    </table>               
    </div>
    <!--</form>-->
    </form>
</body>
</html>
