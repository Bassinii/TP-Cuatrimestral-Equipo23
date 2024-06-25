<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Marcas.aspx.cs" Inherits="Site.Marcas" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Gestión de Marcas</title>
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
        <h1>Gestión de Marcas</h1>
        <!-- ver marcas -->
        <div>
            <%
                Negocio.NegocioMarca negocioM = new Negocio.NegocioMarca();
                List<Clases.Marca> ListM = negocioM.listar();
            %>
            <table class="table table-success table-striped table-hover">
                <thead>
                    <tr>
                        <th scope="col">ID MARCA</th>
                        <th scope="col">NOMBRE MARCA</th>
                        <th scope="col">ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        foreach (Clases.Marca objM in ListM)
                        {
                    %>
                    <tr>
                        <td><%= objM.id %></td>
                        <td><%= objM.nombre %></td>
                        <td>
                            <a href='<%= "EditarMarca.aspx?id=" + objM.id %>' class="btn btn-primary btn-sm">Modificar</a>
                            <!-- aca enviamos id a la ventana editarMarca-->
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <!-- Button to add new brand -->
        <a href="EditarMarca.aspx" class="btn btn-success">Agregar Marca</a>
        <asp:HyperLink ID="LinkVolver" runat="server" NavigateUrl="default.aspx">Volver a Inicio</asp:HyperLink>
    </div>
</asp:Content>

