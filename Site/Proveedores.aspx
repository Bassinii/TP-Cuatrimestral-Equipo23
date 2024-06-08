<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="Site.Proveedores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Proveedores</title>
</head>
<body>
    <form id="form1" runat="server">
        
            <h1>Gestión de Proveedores</h1>

            <!-- Ver proveedores -->
            <div class="mt-4">
                <h2>Proveedores Existentes</h2>
                <p>Proximamente grilla de proveedores.</p>
                <!-- Aquí grilla de proveedores -->
            </div>

            <!-- Agregar proveedor -->
            <div class="mt-4">
                <h2>Agregar Proveedor</h2>
                <div class="mb-3">
                    <label for="Nombre" class="form-label">Nombre</label>
                    <asp:TextBox ID="TextBoxNombre" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="Direccion" class="form-label">Dirección</label>
                    <asp:TextBox ID="TextBoxDireccion" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="Email" class="form-label">Email</label>
                    <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="Telefono" class="form-label">Teléfono</label>
                    <asp:TextBox ID="TextBoxTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="BtnAgregar" runat="server" Text="Agregar Proveedor" CssClass="btn btn-primary" />
                <asp:HyperLink ID="LinkVolver" runat="server" NavigateUrl="default.aspx">Volver a Inicio</asp:HyperLink>
            </div>         
        
    </form>
</body>
</html>