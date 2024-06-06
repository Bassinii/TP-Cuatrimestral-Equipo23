<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Site.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <h1> Login </h1>
    <form id="form1" runat="server">
        <div>
            <label>Usuario</label>
            <asp:TextBox ID="TextBoxUsuario" runat="server"></asp:TextBox>
            <label>Contraseña</label>
            <asp:TextBox ID="TextBoxContraseña" TextMode="Password" runat="server"></asp:TextBox>
            <asp:Button ID="BtnEnviar" runat="server" Text="Enviar" />
        </div>
    </form>
    <asp:HyperLink ID="LinkRegistrarse" runat="server" NavigateUrl="register.aspx">tenes cuenta? Registrate</asp:HyperLink>
</body>
</html>
