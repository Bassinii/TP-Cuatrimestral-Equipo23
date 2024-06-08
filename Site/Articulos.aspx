<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Articulos.aspx.cs" Inherits="Site.Articulos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Artículos</title>
</head>
<body>
    <h1>Gestión de Artículos</h1>
    <form id="form1" runat="server">
        <!--Ver articulos -->
        <div>
             <h2>Artículos Existentes</h2>
             <p>se muestra una grilla con los articulos existentes</p>

            
        </div>
        <!--Modificar y Agregar Articulos -->
        <div>
            <h2><asp:Label ID="LblTituloFormulario" runat="server" Text="Agregar Nuevo Artículo"></asp:Label></h2>
            <asp:HiddenField ID="HiddenFieldIDArticulo" runat="server" />
            <label>Nombre</label>
            <asp:TextBox ID="TextBoxNombre" runat="server"></asp:TextBox>
            <br />
            <label>Stock</label>
            <asp:TextBox ID="TextBoxStock" runat="server"></asp:TextBox>
            <br />
            <label>Precio Unitario</label>
            <asp:TextBox ID="TextBoxPrecioUnitario" runat="server"></asp:TextBox>
            <br />
            <label>Categoría</label>
            <asp:DropDownList ID="DropDownListCategoria" runat="server"></asp:DropDownList>
            <br />
            <label>Marca</label>
            <asp:DropDownList ID="DropDownListMarca" runat="server"></asp:DropDownList>
            <br />
            <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" />
            <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" Visible="True" />
        </div>
    </form>
    <asp:HyperLink ID="LinkVolver" runat="server" NavigateUrl="default.aspx">Volver a Inicio</asp:HyperLink>
</body>
</html>

