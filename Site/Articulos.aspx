<%@ Page Title="Gestion de Articulos" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Articulos.aspx.cs" Inherits="Site.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style>
        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
        }

            .btn-primary:hover {
                background-color: #218838;
                border-color: #1e7e34;
            }

        .container {
            margin-top: 50px; /* Ajustar espacio superior para navbar fija */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <h1>Gestión de Artículos</h1>
        <!-- Filtro y botón para agregar nuevo artículo -->
        <div class="mb-3 row">
            <div class="col-md-6">
                <asp:TextBox ID="TextFiltro" runat="server" CssClass="form-control" placeholder="Buscar artículo por nombre..." />
            </div>
            <div class="col-md-2">
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Filtrar" OnClick="Button1_Click" />
                <asp:Button ID="BtnEliminarFilt" runat="server" CssClass="btn btn-danger" Text="Eliminar filtro" OnClick="BtnEliminarFilt_Click" />
            </div>
            <div class="col-md-4">
                <a href="EditarArticulo.aspx" class="btn btn-success">+ Nuevo</a>
            </div>
        </div>
        <!-- Ver Articulos -->
        <div>
            <table class="table table-success table-striped table-hover">
                <thead>
                    <tr>
                        <th scope="col">ID Artículo</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Stock</th>
                        <th scope="col">Precio Unitario</th>
                        <th scope="col">Categoría</th>
                        <th scope="col">Marca</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        Negocio.NegocioArticulo negocioArticulo = new Negocio.NegocioArticulo();
                        List<Clases.Articulo> listaArticulos;

                        if (Session["nombreFiltro"] != null)
                        {
                            listaArticulos = negocioArticulo.listarPorNombre(Session["nombreFiltro"].ToString());
                        }
                        else
                        {
                            listaArticulos = negocioArticulo.listar();
                        }

                        foreach (Clases.Articulo objArticulo in listaArticulos)
                        {
                    %>
                    <tr>
                        <td><%= objArticulo.id %></td>
                        <td><%= objArticulo.nombre %></td>
                        <td><%= objArticulo.stock %></td>
                        <td><%= objArticulo.precio %></td>
                        <td><%= objArticulo.categoria.nombre %></td>
                        <td><%= objArticulo.marca.nombre %></td>
                        <td>
                            <a href='<%= "EditarArticulo.aspx?id=" + objArticulo.id %>' class="btn btn-primary btn-sm">Modificar</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <asp:HyperLink ID="LinkVolver" runat="server" NavigateUrl="default.aspx">Volver a Inicio</asp:HyperLink>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</asp:Content>
