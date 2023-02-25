<%@ Page Title="Booking Page" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookingPage.aspx.cs" Inherits="Booking.BookingPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-bottom: 15px">
        <div class="auto-style6">
            Personal Info Input<table class="auto-style7" role="presentation">
                <tr>
                    <td class="auto-style13">
                        <asp:Label ID="nameLbl" runat="server" Text="Full Name:" for="nameTxt"></asp:Label></td>
                    <td class="auto-style14">
                        <asp:TextBox ID="nameTxt" runat="server" Width="232px" MaxLength="40"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="nameRequiredField" runat="server" ControlToValidate="nameTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">
                        <asp:Label ID="numLbl" runat="server" Text="Contact Number:" for="numTxt"></asp:Label>
                    </td>
                    <td class="auto-style12">
                        <asp:TextBox ID="numTxt" runat="server" Width="196px" MaxLength="11"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="nameRequiredField0" runat="server" ControlToValidate="numTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:Label ID="numValidate" runat="server" ForeColor="Red" Text="Must be a valid number" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="emailLbl" runat="server" Text="Email Address:" for="emailTxt"></asp:Label>
                    </td>
                    <td class="auto-style10">
                        <asp:TextBox ID="emailTxt" runat="server" EnableTheming="True" MaxLength="40"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="nameRequiredField1" runat="server" ControlToValidate="emailTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:Label ID="emailValidate" runat="server" ForeColor="Red" Text="Must be a valid email address" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        <asp:Label ID="Label1" runat="server" Text="Booking Date:" for="bookingDate">></asp:Label>
                    </td>
                    <td>
                        <asp:Calendar ID="bookingDate" runat="server">
                             <SelectedDayStyle BackColor="Blue" >
                            </SelectedDayStyle>
                        </asp:Calendar>
                        <asp:Label ID="dateValidate" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="headCountLbl" runat="server" Text="Estimated Number of People:" for="headCountTxt"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="headCountTxt" runat="server" TextMode="Number" OnTextChanged="headCountTxt_TextChanged" MaxLength="5" min="1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="headCountRequiredField" runat="server" ControlToValidate="headCountTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="preQuoteLbl" runat="server" Text="Estimated Cost:" for="preQuoteTxt"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="preQuoteTxt" runat="server" TextMode="Number" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="bookingBtn" runat="server" Text="Book" OnClick="bookingBtn_Click" />
                        <asp:Label ID="bookingConfirm" runat="server" Text="Booking Confirmed!" ForeColor="Green" Visible="False"></asp:Label>
                        <asp:Label ID="bookingValidate" runat="server" Text="Booking Failed" ForeColor="Red" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
            By proceeding with the booking process, you are consenting to receiving an email.<br />
            Please check your spam folder if you do not see the email.<br />
            <br />
            Please fill out the google form to rate the website after finishing this page and the admin page. Thank you.</div>
</div>
</asp:Content>
