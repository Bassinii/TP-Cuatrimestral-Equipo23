<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Site.Formulario_web1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /*Este style puede que tambien deba estar en otra pagina si esta usaba Styles.css*/
        /* Main container styles */
        .d-flex {
            display: flex;
        }

        /* Sidebar (cart) styles */
        #sidebar {
            padding-bottom: 70px; /* Ajusta el padding para dejar espacio para el div fijo */
        }

        /* Product list styles */
        .container {
            max-width: calc(100% - 250px); /* Ajusta el ancho para dejar espacio para el sidebar */
            margin-top: 100px; /* Ajusta según la altura de tu navbar */
            margin-left: 25% !important; /* Deja espacio para el sidebar */
        }

        .card {
            border: none;
            border-radius: 0 !important; /* Uso de !important si los estilos heredados causan problemas */
            overflow: visible;
            transition: transform 0.3s ease;
            position: relative;
        }

            .card:hover {
                transform: scale(1.05);
            }

        .card-img-top {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-top-left-radius: 0 !important; /* Sobrescribe cualquier estilo heredado */
            border-top-right-radius: 0 !important; /* Sobrescribe cualquier estilo heredado */
        }

        .card-body {
            padding: 0; /* Elimina el padding del cuerpo de la card */
        }

        .card-title {
            font-size: 1rem;
            text-align: center;
            margin: 0; /* Elimina el margen para centrar el texto completamente */
            font-weight: bold;
            color: #fff;
            background: rgba(0, 0, 0, 0.7);
            position: absolute;
            bottom: 0;
            width: 100%;
            padding: 5px 0;
            box-sizing: border-box; /* Asegura que el padding no afecte el tamaño del elemento */
        }

        /* Additional styles for cart items */
        .cart-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            padding: 10px;
            background-color: #fff;
        }

            .cart-item img {
                width: 50px;
                height: 50px;
                object-fit: cover;
                margin-right: 10px;
            }

        .cart-item-details {
            flex: 1;
        }

        .cart-item-title {
            font-size: 0.9rem;
            font-weight: bold;
            margin: 0;
        }

        .cart-item-price {
            font-size: 0.8rem;
            color: #555;
        }

        .cart-footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 25%; /* Debe coincidir con el ancho del sidebar */
            background-color: #f8f9fa;
            padding: 10px;
            box-sizing: border-box;
            z-index: 1000;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex">
        <div id="sidebar" class="bg-light p-3" style="width: 25%; position: fixed; top: 9.5%; /* ajusta según la altura de tu navbar */
            left: 0; /* ajusta según la altura de tu navbar */
            overflow-y: auto; box-sizing: border-box; background-color: #f8f9fa; /* color de fondo */
            z-index: 1000; height: calc(100% - 9.5%);">
            <h2>CARRITO</h2>
            <div id="cart-items">
                <%foreach (Clases.ArticuloCarrito articuloCarrito in ListCarrito)
                    {%>
                <div class="cart-item">
                    <% if (articuloCarrito.imagenes != null && articuloCarrito.imagenes.Count > 0)
                        { %>
                    <img src="<%=articuloCarrito.imagenes[0].url %>" class="card-img-top" alt="Imagen del producto" />
                    <% }
                        else
                        { %>
                    <img src="https://via.placeholder.com/150" class="card-img-top" alt="Imagen no disponible" />
                    <% } %>
                    <div class="cart-item-details">
                        <p class="cart-item-title"><%= articuloCarrito.nombre %></p>
                        <p class="cart-item-price"><%= articuloCarrito.precio %> X <%= articuloCarrito.cantidad %></p>
                    </div>
                </div>
                <%} %>
            </div>
        </div>
        <div class="cart-footer d-flex justify-content-between align-items-center">
            <h5>Total: $<%= totalCarrito %></h5>
            <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Finalizar compra</a>
            <%--<asp:Button ID="ButtonFinalizarCompra" runat="server" Text="Finalizar compra" CssClass="btn btn-primary" OnClick="ButtonFinalizarCompra_Click" />--%>
        </div>
        <div class="container mt-5" id="article-list" style="margin-left: 270px; margin-top: 78px !important; margin-right: 24px;">
            <div class="row row-cols-2 row-cols-md-4 g-4">
                <% foreach (Clases.Articulo articulo in ListArticulos)
                    { %>
                <a href="Default.aspx?id=<%=articulo.id %>&action=1">
                    <div class="col">
                        <div class="card h-100" onclick="addToCart('<%= articulo.nombre %>')">
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="z-index: 800;">$<%= articulo.precio %>
                            </span>
                            <% if (articulo.imagenes != null && articulo.imagenes.Count > 0)
                                { %>
                            <img src="<%=articulo.imagenes[0].url %>" class="card-img-top" alt="Imagen del producto" />
                            <% }
                                else
                                { %>
                            <img src="https://via.placeholder.com/150" class="card-img-top" alt="Imagen no disponible" />
                            <% } %>
                            <div class="card-body">
                                <h5 class="card-title"><%= articulo.nombre %></h5>
                            </div>
                        </div>
                    </div>
                </a>
                <% } %>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Finalizar compra</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <%--<div class="mb-3">
                        <label for="articuloId" class="form-label">ID</label>
                        <input type="number" class="form-control" id="articuloId" name="id" required>
                    </div>
                    <div class="mb-3">
                        <label for="articuloStock" class="form-label">Stock</label>
                        <input type="number" class="form-control" id="articuloStock" name="stock" required>
                    </div>
                    <div class="mb-3">
                        <label for="articuloNombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="articuloNombre" name="nombre" required>
                    </div>
                    <div class="mb-3">
                        <label for="articuloPrecio" class="form-label">Precio</label>
                        <input type="number" step="0.01" class="form-control" id="articuloPrecio" name="precio" required>
                    </div>
                    <div class="mb-3">
                        <label for="articuloImagenes" class="form-label">Imágenes (URLs)</label>
                        <textarea class="form-control" id="articuloImagenes" name="imagenes" rows="3" placeholder="Una URL por línea"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="articuloMarca" class="form-label">Marca</label>
                        <input type="text" class="form-control" id="articuloMarca" name="marca" required>
                    </div>
                    <div class="mb-3">
                        <label for="articuloCategoria" class="form-label">Categoría</label>
                        <input type="text" class="form-control" id="articuloCategoria" name="categoria" required>
                    </div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <%--<button type="button" class="btn btn-primary">Agregar</button>--%>
                    <asp:Button ID="ButtonFinalizarCompra" runat="server" Text="Finalizar compra" CssClass="btn btn-primary" OnClick="ButtonFinalizarCompra_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
