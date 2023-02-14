<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Booking.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="loginTbl" runat="server">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Label ID="userLbl" runat="server" Text="Username: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="userTxt" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="userRequiredField" runat="server" ControlToValidate="userTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:Label ID="userValidate" runat="server" Text="Username does not exist" ForeColor="Red" Visible="False"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Label ID="passLbl" runat="server" Text="Password: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="passTxt" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="passRequiredField" runat="server" ControlToValidate="passTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:Label ID="passValidate" runat="server" Text="Invalid password" ForeColor="Red" Visible="False"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"></asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Button ID="loginBtn" runat="server" Text="Login" OnClick="loginBtn_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table ID="controlTbl" runat="server" Visible="False">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Button ID="addBtn" runat="server" Text="Button" />
            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Button ID="Button2" runat="server" Text="Button" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Button ID="Button3" runat="server" Text="Button" />
            </asp:TableCell>
            <asp:TableCell runat="server"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
