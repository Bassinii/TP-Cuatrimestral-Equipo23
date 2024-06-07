<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Site.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label>Nombre usuario</label>
            <asp:TextBox ID="TextBoxUsuario" runat="server"></asp:TextBox>
            <label>apellido</label>
            <asp:TextBox ID="TextBoxApellido" runat="server"></asp:TextBox>
            <asp:Button ID="BtnEnviar" runat="server" Text="Enviar" />
        </div>
    </form>
</body>
</html>
