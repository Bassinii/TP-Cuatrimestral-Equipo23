<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="Site.Formulario_web13" %>

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

        <h1>Gestión de Ventas</h1>
        <%--<!-- Filtro y botón para agregar nuevo artículo -->
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
        </div>--%>
        <!-- Ver Articulos -->
        <div>
            <table class="table table-success table-striped table-hover">
                <thead>
                    <tr>
                        <th scope="col">ID Artículo</th>
                        <th scope="col">ID Empleado</th>
                        <th scope="col">ID Cliente</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Hora</th>
                        <th scope="col">Total</th>
                        <th scope="col">Pedidos Ya</th>
                        <th scope="col">Accion</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        Negocio.NegocioVenta negocioArticulo = new Negocio.NegocioVenta();
                        List<Clases.Venta> listVentas;

                        //if (Session["nombreFiltro"] != null)
                        //{
                        //    listVentas = negocioArticulo.listarPorNombre(Session["nombreFiltro"].ToString());
                        //}
                        //else
                        //{
                        listVentas = negocioArticulo.listar();
                        //}

                        foreach (Clases.Venta objArticulo in listVentas)
                        {
                    %>
                    <tr>
                        <td><%= objArticulo.id %></td>
                        <td><%= objArticulo.idEmpleado %></td>
                        <td><%= objArticulo.idCliente %></td>
                        <td><%= objArticulo.fecha %></td>
                        <td><%= objArticulo.hora %></td>
                        <td><%= objArticulo.total %></td>

                        <%if (objArticulo.esPedidosYa)
                            {%>
                                <td>Si</td>
                           <% }
                            else
                            {%>
                                <td>No</td>
                           <% } %>

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
