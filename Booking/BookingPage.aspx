﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookingPage.aspx.cs" Inherits="Booking.BookingPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-bottom: 15px">
        <div class="auto-style6">
            Personal Info Input<table class="auto-style7">
                <tr>
                    <td class="auto-style13">Full Name:</td>
                    <td class="auto-style14">
                        <asp:TextBox ID="nameTxt" runat="server" Width="232px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="nameRequiredField" runat="server" ControlToValidate="nameTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Contact Number:</td>
                    <td class="auto-style12">
                        <asp:TextBox ID="numTxt" runat="server" Width="196px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="nameRequiredField0" runat="server" ControlToValidate="numTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:Label ID="numValidate" runat="server" ForeColor="Red" Text="Must be a valid number" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Email Address:</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="emailTxt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="nameRequiredField1" runat="server" ControlToValidate="emailTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:Label ID="emailValidate" runat="server" ForeColor="Red" Text="Must be a valid email address" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        <asp:Label ID="Label1" runat="server" Text="Booking Date:"></asp:Label>
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
                        <asp:Label ID="headCountLbl" runat="server" Text="Estimated Number of People:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="headCountTxt" runat="server" TextMode="Number" OnTextChanged="headCountTxt_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="headCountRequiredField" runat="server" ControlToValidate="headCountTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="preQuoteLbl" runat="server" Text="Estimated Cost:"></asp:Label>
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
                    </td>
                </tr>
            </table>
            By proceeding with the booking process, you are consent to receiving an email.<br />
            Please check your spam folder if you do not see the email.<br />
            <br />
            Please fill out the google form to rate the website after finishing this page and the admin page. Thank you.</div>
</div>
</asp:Content>
