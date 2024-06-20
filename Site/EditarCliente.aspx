﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarCliente.aspx.cs" Inherits="Site.EditarCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Editar Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style>
        body {
            background-color: #eafaf1; /* Color de fondo verde claro */
        }
        .container {
            max-width: 600px; /* Ancho máximo del contenedor */
            margin-top: 20px; /* Espacio superior */
        }
        .btn-primary {
            background-color: #28a745; /* Verde Bootstrap */
            border-color: #28a745; /* Verde Bootstrap */
        }
        .btn-primary:hover {
            background-color: #218838; /* Verde más oscuro para el hover */
            border-color: #1e7e34; /* Verde más oscuro para el hover */
        }
    </style>
</head>
<body>
    <div class="d-flex justify-content-center mt-4">
        <form id="form1" runat="server" class="w-50">
            <div class="container mt-4">
                <h1><%= Request.QueryString["id"] != null ? "Editar Cliente" : "Agregar Cliente" %></h1>
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtApellido" class="form-label">Apellido</label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtDireccion" class="form-label">Dirección</label>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtMail" class="form-label">Correo Electrónico</label>
                    <asp:TextBox ID="txtMail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtTelefono" class="form-label">Teléfono</label>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" PostBackUrl="Clientes.aspx" />
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" Visible="false" />
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
