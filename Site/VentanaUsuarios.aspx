<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="VentanaUsuarios.aspx.cs" Inherits="Site.VentanaUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Gestión de Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style>
        .btn-primary {
            background-color: #28a745; /* Verde Bootstrap */
            border-color: #28a745; /* Verde Bootstrap */
        }
        .btn-primary:hover {
            background-color: #218838; /* Verde más oscuro para el hover */
            border-color: #1e7e34; /* Verde más oscuro para el hover */
        }
        .content-container {
            margin-top: 100px; /* Ajustar espacio superior para navbar fija */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-container">
        <h1>Gestión de Usuarios</h1>
        <!-- ver usuarios -->
        <div>
            <%
                Negocio.NegocioUsuario negocioU = new Negocio.NegocioUsuario();
                List<Clases.Usuario> ListU = negocioU.Listar();
            %>
            <table class="table table-success table-striped table-hover">
                <thead>
                    <tr>
                        <th scope="col">ID Usuario</th>
                        <th scope="col">Nombre Usuario</th>
                        <th scope="col">Nombre Completo</th>
                        <th scope="col">Tipo Usuario</th>
                        <th scope="col">Correo Electrónico</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        foreach (Clases.Usuario objU in ListU)
                        {
                    %>
                    <tr>
                        <td><%= objU.ID_Usuario %></td>
                        <td><%= objU.UsuarioNombre %></td>
                        <td><%= objU.NombreCompleto %></td>
                       <td><%= Convert.ToInt32(objU.TipoUsuario) == 1 ? "Administrador" : "Ventas" %></td>
                        <td><%= objU.CorreoElectronico %></td>
                        <td>
                            <a href='<%= "EditarUsuario.aspx?id=" + objU.ID_Usuario %>' class="btn btn-primary btn-sm">Modificar</a>
                             </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <!-- Button to add new user -->
        <a href="EditarUsuarios.aspx" class="btn btn-success">Agregar Usuario</a>
        <asp:HyperLink ID="LinkVolver" runat="server" NavigateUrl="default.aspx">Volver a Inicio</asp:HyperLink>
    </div>
</asp:Content>