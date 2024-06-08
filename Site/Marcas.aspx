<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Marcas.aspx.cs" Inherits="Site.Marcas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Marcas</title>
</head>
<body>
    <h1>Gestión de Marcas</h1>
    <form id="form1" runat="server">
         <!-- ver marcas -->
        <div>
            <h2>Marcas:</h2>
            <p>se muestra una grilla con las marcas existentes</p>
        </div>
        <!-- agregar y modificar marcas -->
         <div>
            <h2><asp:Label ID="LblTituloFormulario" runat="server" Text="Agregar Nueva Marca"></asp:Label></h2>
            <asp:HiddenField ID="HiddenFieldIDMarca" runat="server" />
            <label>Nombre</label>
            <asp:TextBox ID="TextBoxNombre" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" />
            <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" Visible="true" />
        </div>
    </form>
    <asp:HyperLink ID="LinkVolver" runat="server" NavigateUrl="default.aspx">Volver a Inicio</asp:HyperLink>
</body>
</html>
