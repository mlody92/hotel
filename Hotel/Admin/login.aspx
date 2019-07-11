<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Hotel.Admin.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="css/login.css" rel="stylesheet" />
    <script src="../Scripts/time.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="container" style="margin-left: 300px; margin-right: 300px;">
        <div class="text-center">
            <img src="./images/logo.png" id="logoimg" alt=" Logo" />
        </div>
        <div class="tab-content">
            <div id="login" class="tab-pane active">
                <p class="text-muted text-center btn-block btn btn-primary btn-rect">
                    Wpisz login administratora i hasło
                </p>
                <asp:TextBox ID="loginTextBox" runat="server" class="form-control"></asp:TextBox>
                <asp:TextBox ID="passwordTextBox" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                <asp:Button ID="zalogujButton" runat="server" Text="Zaloguj" class="btn text-muted text-center btn-danger" OnClick="zalogujButton_Click" />
                <p>
                    <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label></p>
            </div>
        </div>

        <div id="pokaz" />
    </div>
    <div id="skryptCzas" runat="server">
    </div>

    </div>
    </form>
</body>
</html>
