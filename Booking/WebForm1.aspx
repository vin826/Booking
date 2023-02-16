<%@Page Title=""  Language="C#" MasterPageFile="~/MasterPage.Master"  AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Booking.WebForm1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
    
    
    
    

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
        <div class="auto-style6">
            Personal Info Input<table class="auto-style7">
                <tr>
                    <td class="auto-style13">Full Name:</td>
                    <td class="auto-style14">
                        <asp:TextBox ID="Tname" runat="server" Width="232px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enrollee Name is required. ( * )" ControlToValidate="Tname" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Phone Number:</td>
                    <td class="auto-style12">
                        <asp:TextBox ID="Tnum" runat="server" Width="196px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enrollee Name is required. ( * )" ControlToValidate="Tnum" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Email Address:</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="Temail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email Adress is required. ( * )" ControlToValidate="Temail" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
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
  
</asp:Content>

