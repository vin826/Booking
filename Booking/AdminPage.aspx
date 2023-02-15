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
                <asp:RequiredFieldValidator ID="userRequiredField" runat="server" ControlToValidate="userTxt" ErrorMessage="*" ForeColor="Red" ValidationGroup="loginValGroup"></asp:RequiredFieldValidator>
                <asp:Label ID="userValidate" runat="server" Text="Username does not exist" ForeColor="Red" Visible="False"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Label ID="passLbl" runat="server" Text="Password: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="passTxt" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="passRequiredField" runat="server" ControlToValidate="passTxt" ErrorMessage="*" ForeColor="Red" ValidationGroup="loginValGroup"></asp:RequiredFieldValidator>
                <asp:Label ID="passValidate" runat="server" Text="Invalid password" ForeColor="Red" Visible="False"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Button ID="loginBtn" runat="server" Text="Login" OnClick="loginBtn_Click" ValidationGroup="loginValGroup" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table ID="controlTbl" runat="server" Visible="False">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Button ID="viewBtn" runat="server" Text="View" OnClick="viewBtn_Click" />
            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Button ID="addBtn" runat="server" Text="Add" OnClick="addBtn_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Button ID="deleteBtn" runat="server" Text="Delete" OnClick="deleteBtn_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:PlaceHolder ID="dataPH" runat="server" Visible="False"></asp:PlaceHolder>
    <asp:Table ID="addTbl" runat="server" Visible="False">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Label ID="nameLbl" runat="server" Text="Full Name:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="nameTxt" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="nameRequiredField" runat="server" ControlToValidate="nameTxt" ErrorMessage="*" ForeColor="Red" ValidationGroup="addValGroup"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Label ID="numLbl" runat="server" Text="Contact Number:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="numTxt" runat="server" MaxLength="11"></asp:TextBox>
                <asp:RequiredFieldValidator ID="numRequiredField" runat="server" ControlToValidate="numTxt" ErrorMessage="*" ForeColor="Red" ValidationGroup="addValGroup"></asp:RequiredFieldValidator>
                <asp:Label ID="numValidate" runat="server" ForeColor="Red" Text="Must be a valid number" Visible="False"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Label ID="emailLbl" runat="server" Text="Email Address:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="emailTxt" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="emailRequiredField" runat="server" ControlToValidate="emailTxt" ErrorMessage="*" ForeColor="Red" ValidationGroup="addValGroup"></asp:RequiredFieldValidator>
                <asp:Label ID="emailValidate" runat="server" ForeColor="Red" Text="Must be a valid email address" Visible="False"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Label ID="dateLbl" runat="server" Text="Booking Date:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Calendar ID="dateCal" runat="server"></asp:Calendar>
                <asp:Label ID="dateValidate" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Button ID="bookBtn" runat="server" Text="Add Booking" OnClick="bookBtn_Click" ValidationGroup="addValGroup" />
            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Label ID="bookConfirm" runat="server" Text="Booking Confirmed!" Visible="False" ForeColor="Green"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table ID="deleteTbl" runat="server" Visible="False">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Label ID="deleteLbl" runat="server" Text="Delete by Booking ID:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:TextBox ID="deleteTxt" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="deleteRequiredField" runat="server" ForeColor="Red" ErrorMessage="*" ValidationGroup="deleteValGroup" ControlToValidate="deleteTxt"></asp:RequiredFieldValidator>
                <asp:Label ID="deleteValidate" runat="server" Text="Booking ID does not exist" Visible="False" ForeColor="Red"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Button ID="deleteBookingBtn" runat="server" Text="Delete Booking" OnClick="deleteBookingBtn_Click" ValidationGroup="deleteValGroup" />
            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Label ID="deleteConfirm" runat="server" Text="Booking Deleted Successfully" Visible="False" ForeColor="Green"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    </asp:Content>
