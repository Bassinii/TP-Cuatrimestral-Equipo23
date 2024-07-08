<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarUsuario.aspx.cs" Inherits="Site.EditarUsuario" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Editar Usuario</title>
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
                <h1><%= Request.QueryString["id"] != null ? "Editar Usuario" : "Agregar Usuario" %></h1>

                <div class="mb-3">
                    <label for="txtUsuario" class="form-label">Usuario</label>
                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ErrorMessage="Usuario debe contener entre 5 y 30 caracteres." ControlToValidate="txtUsuario" ValidationExpression="^.{3,30}$" CssClass="text-danger" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="El Usuario es requerido." ControlToValidate="txtUsuario" runat="server" CssClass="text-danger" Display="Dynamic" />
                </div>
                <div class="mb-3">
                    <label for="txtNombreCompleto" class="form-label">Nombre Completo</label>
                    <asp:TextBox ID="txtNombreCompleto" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="El Nombre Completo es requerido." ControlToValidate="txtNombreCompleto" runat="server" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ErrorMessage="El nombre completo debe contener entre 5 y 30 caracteres." ControlToValidate="txtNombreCompleto" ValidationExpression="^.{3,30}$" CssClass="text-danger" runat="server" />
                    </div>
                
                <div class="mb-3">
                    <label for="ddlTipoUsuario" class="form-label">Tipo de Usuario</label>
                    <asp:DropDownList ID="ddlTipoUsuario" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Administrador" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Ventas" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ErrorMessage="Seleccione un Tipo de Usuario." ControlToValidate="ddlTipoUsuario" runat="server" CssClass="text-danger" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
                <div class="mb-3">
                    <label for="txtContrasenia" class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtContrasenia" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtContrasenia" ErrorMessage="La contraseña debe contener al menos una letra minúscula, un número y tener una longitud mínima de 4 caracteres." 
                          ValidationExpression="^(?=.*[a-z])(?=.*\d).{4,}$" CssClass="text-danger" />
                    <asp:RequiredFieldValidator ErrorMessage="La Contraseña es requerida." ControlToValidate="txtContrasenia" runat="server" CssClass="text-danger" Display="Dynamic" />
                </div>

                <div class="mb-3">
                    <label for="txtCorreoElectronico" class="form-label">Correo Electrónico</label>
                    <asp:TextBox ID="txtCorreoElectronico" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="El Correo Electrónico es requerido." ControlToValidate="txtCorreoElectronico" runat="server" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ErrorMessage="Ingrese un formato de correo electrónico válido." ControlToValidate="txtCorreoElectronico" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|net|org|edu|gov)$" CssClass="text-danger" runat="server" />
                </div>
                <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>

                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" PostBackUrl="VentanaUsuarios.aspx" />
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" Visible="false" />
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>