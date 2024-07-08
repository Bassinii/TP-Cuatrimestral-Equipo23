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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex">
        <div id="sidebar" class="bg-light p-3" style="width: 25%; position: fixed; top: 9.5%; /* ajusta según la altura de tu navbar */
            left: 0; /* ajusta según la altura de tu navbar */
            overflow-y: auto; padding: 10px; box-sizing: border-box; background-color: #f8f9fa; /* color de fondo */
            z-index: 1000;
            height: 90%">
            <h2>CARRITO</h2>
            <div id="cart-items">
                <!-- Aquí se agregarán las tarjetas del carrito -->
            </div>
        </div>
        <div class="container mt-5" id="article-list" style="margin-left: 270px; margin-top: 78px !important; margin-right: 24px;">
            <div class="row row-cols-2 row-cols-md-4 g-4">
                <% foreach (Clases.Articulo articulo in ListArticulos)
                   { %>
                <div class="col">
                    <div class="card h-100" onclick="addToCart('<%= articulo.nombre %>', <%= articulo.precio %>, 'https://images.deliveryhero.io/image/pedidosya/products/6d298228-77c7-4fe8-b928-5b9142021154.jpg?quality=90&width=1280&webp=1')">
                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="z-index: 800;">$<%=articulo.precio %></span>
                        <img src="https://i.imgur.com/6WZ0WPP.jpg" class="card-img-top" alt="Imagen del producto"/>
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
