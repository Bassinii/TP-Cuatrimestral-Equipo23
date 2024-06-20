<%@ Page Title="Gestion de Articulos" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Articulos.aspx.cs" Inherits="Site.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex div-articulos" style="margin-top: 56px; display: flex;">

        <div id="sidebar" class="bg-light p-3" style="width: 270px; position: fixed; top: 70px; /* ajusta según la altura de tu navbar */
            left: 0; /* ajusta según la altura de tu navbar */
            overflow-y: auto; padding: 10px; box-sizing: border-box; background-color: #f8f9fa; /* color de fondo */
            z-index: 1000;">
            <h2>Articulos</h2>
        </div>

        <div style="margin-left: 270px; margin-top: 10px; padding: 20px; width: calc(100% - 270px);">
            <div style="display: flex; justify-content: flex-end; align-items: center; margin-bottom: 10px;">
                <button type="button" class="btn btn-outline-success">Agregar Articulo</button>
            </div>

            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Stock</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Marca</th>
                        <th scope="col">Categoria</th>
                    </tr>
                </thead>
                <tbody>
                    <%foreach (Clases.Articulo articulo in ListArticulos)
                        { %>
                    <tr>
                        <th scope="row"><%= articulo.id %></th>
                        <td><%= articulo.nombre %></td>
                        <td><%= articulo.stock %></td>
                        <td><%= articulo.precio %></td>
                        <td><%= articulo.marca.nombre %></td>
                        <td><%= articulo.categoria.nombre %></td>
                        <td>
                            <div class="dropdown">
                                <a class="btn btn-dark dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"></a>

                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Modificar</a></li>
                                    <li><a class="dropdown-item" href="#">Eliminar</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
