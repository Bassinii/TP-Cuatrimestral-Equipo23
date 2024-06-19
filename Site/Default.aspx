<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Site.Formulario_web1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Styles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex">
        <div id="sidebar" class="bg-light p-3" style="width: 270px; position: fixed; top: 70px; /* ajusta según la altura de tu navbar */
            left: 0; /* ajusta según la altura de tu navbar */
            overflow-y: auto; padding: 10px; box-sizing: border-box; background-color: #f8f9fa; /* color de fondo */
            z-index: 1000; /* asegúrate de que esté encima del contenido */">
            <h2>CARRITO</h2>

        </div>

        <div class="container mt-5" id="article-list" style="margin-left: 270px;">
            <div class="row row-cols-2 row-cols-md-4 g-4">
                <% foreach (Clases.Articulo articulo in ListArticulos)
                    { %>
                <div class="col">
                    <div class="card h-100">
                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"><%=articulo.precio %></span>
                        <img src="https://images.deliveryhero.io/image/pedidosya/products/6d298228-77c7-4fe8-b928-5b9142021154.jpg?quality=90&width=1280&webp=1" class="card-img-top" alt="Imagen del producto">
                        <div class="card-body">
                            <h5 class="card-title"><%= articulo.nombre %></h5>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</asp:Content>
