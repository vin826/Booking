<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Booking.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    
    <title></title>
    <style type="text/css">
        .auto-style6 {
            height: 78px;
        }
        .auto-style7 {
            width: 99%;
            margin-bottom: 1px;
        }
        .auto-style8 {
            width: 125px;
        }
        .auto-style9 {
            width: 125px;
            height: 42px;
        }
        .auto-style10 {
            height: 42px;
        }
        .auto-style11 {
            width: 125px;
            height: 36px;
        }
        .auto-style12 {
            height: 36px;
        }
        .auto-style13 {
            width: 125px;
            height: 26px;
        }
        .auto-style14 {
            height: 26px;
        }
    </style>
</head>
<body style="margin-bottom: 15px">
    <form id="form1" runat="server">
        <div class="auto-style6">
            Personal Info Input<table class="auto-style7">
                <tr>
                    <td class="auto-style13">Full Name:</td>
                    <td class="auto-style14">
                        <asp:TextBox ID="Tname" runat="server" Width="232px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Phone Number:</td>
                    <td class="auto-style12">
                        <asp:TextBox ID="Tnum" runat="server" Width="196px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Email Address:</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="Temail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td>
                        <asp:Calendar ID="Calendar1" runat="server">
                             <SelectedDayStyle BackColor="Blue" >
                        </SelectedDayStyle>
                        </asp:Calendar>
                    </td>
                </tr>
             

            

            </table>
        </div>
    </form>
</body>
</html>
