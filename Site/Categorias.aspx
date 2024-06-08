<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categorias.aspx.cs" Inherits="Site.Categorias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Marcas</title>
</head>
<body>
    <h1>Gestión de Categorías</h1>
    <form id="form1" runat="server">
         <!-- ver marcas -->
        <div>
            <h2>Categorías:</h2>
            <p>se muestra una grilla con las categorias existentes</p>
        </div>
        <!-- agregar y modificar marcas -->
         <div>
            <h2><asp:Label ID="LblTituloFormulario" runat="server" Text="Agregar Nueva Categoría"></asp:Label></h2>
            <asp:HiddenField ID="HiddenFieldIDCategoria" runat="server" />
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
