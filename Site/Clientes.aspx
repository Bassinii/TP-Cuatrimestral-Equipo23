<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Site.Clientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Clientes</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h1>Gestión de Clientes</h1>

            <!-- Ver clientes -->
            <div class="mt-4">
                <h2>Clientes Existentes</h2>
                <p>Proximamente grilla con clientes existentes.</p>
                <!-- Aquí grilla de clientes -->
            </div>

            <!-- Agregar cliente -->
            <div class="mt-4">
                <h2>Agregar Cliente</h2>
                <div class="mb-3">
                    <label for="Nombre" class="form-label">Nombre</label>
                    <asp:TextBox ID="TextBoxNombre" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="Apellido" class="form-label">Apellido</label>
                    <asp:TextBox ID="TextBoxApellido" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="Email" class="form-label">Email</label>
                    <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="Telefono" class="form-label">Teléfono</label>
                    <asp:TextBox ID="TextBoxTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="BtnAgregar" runat="server" Text="Agregar Cliente" CssClass="btn btn-primary" />
                <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" Visible="true" />
            </div>
        </div>
    </form>
    <asp:HyperLink ID="LinkVolver" runat="server" NavigateUrl="default.aspx">Volver a Inicio</asp:HyperLink></body>
</html>
