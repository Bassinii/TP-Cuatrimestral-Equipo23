<%@ Page Title="Gestion de Articulos" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Articulos.aspx.cs" Inherits="Site.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex div-articulos" style="margin-top: 56px; display: flex;">

        <div id="sidebar" class="bg-light p-3" style="width: 270px; position: fixed; top: 9.5%; /* ajusta según la altura de tu navbar */
            left: 0; /* ajusta según la altura de tu navbar */
            overflow-y: auto; padding: 10px; box-sizing: border-box; background-color: #f8f9fa; /* color de fondo */
            z-index: 1000;">
            <h2>Articulos</h2>
            <h2>Articulos</h2>
            <h2>Articulos</h2>
            <h2>Articulos</h2>
            <h2>Articulos</h2>
            <h2>Articulos</h2>
            <h2>Articulos</h2>
            <h2>Articulos</h2>
            <h2>Articulos</h2>
            <h2>Articulos</h2>
            <h2>Articulos</h2>
            <h2>Articulos</h2>
            <h2>Articulos</h2>
            <h2>Articulos</h2>
            <h2>Articulos</h2>
        </div>

        <div style="margin-left: 270px; margin-top: 10px; padding: 20px; width: calc(100% - 270px);">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
                <div class="input-group" style="width: 70%;">
                    <span class="input-group-text" id="inputGroup-sizing-default">Buscar</span>
                    <input type="text" class="form-control"  aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                </div>
                <button type="button" class="btn btn-outline-success" style="width:180px;" data-bs-toggle="modal" data-bs-target="#exampleModal">Agregar Articulo</button>
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
                        <th scope="col">Acciones</th>
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

                            <div class="dropdown" >
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
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar articulo</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <%--<div class="mb-3">
                        <label for="articuloId" class="form-label">ID</label>
                        <input type="number" class="form-control" id="articuloId" name="id" required>
                    </div>--%>
                    <div class="mb-3">
                        <label for="articuloNombre" class="form-label">Nombre</label>
                        <asp:TextBox runat="server" ID="TxtBoxNombre" CssClass="form-control"/>
                        <%--<input type="text" class="form-control" id="articuloNombre" name="nombre" required>--%>
                    </div>
                    <div class="mb-3">
                        <label for="articuloStock" class="form-label">Stock</label>
                        <asp:TextBox runat="server" ID="TxtBoxStock" TextMode="Number" CssClass="form-control"/>
                        <%--<input type="number" class="form-control" id="articuloStock" name="stock" required>--%>
                    </div>

                    <div class="mb-3">
                        <label for="articuloPrecio" class="form-label">Precio</label>
                        <asp:TextBox runat="server" ID="TxtBoxPrecio" TextMode="Number" CssClass="form-control"/>
                        <%--<input type="number" step="0.01" class="form-control" id="articuloPrecio" name="precio" required>--%>
                    </div>
                    <%--<div class="mb-3">
                        <label for="articuloImagenes" class="form-label">Imágenes (URLs)</label>
                        <textarea class="form-control" id="articuloImagenes" name="imagenes" rows="3" placeholder="Una URL por línea"></textarea>
                    </div>--%>
                    <div class="mb-3">
                        <label for="articuloMarca" class="form-label">Marca</label>
                        <asp:DropDownList ID="DropDownMarcas" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label for="articuloCategoria" class="form-label">Categoría</label>
                        <asp:DropDownList ID="DropDownCategorias" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button Text="Agregar" CssClass="btn btn-primary" runat="server" ID="ButtonAgregar" OnClick="ButtonAgregar_Click" placeholder=""/>
                    <%--<button type="button" class="btn btn-primary">Agregar</button>--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<%-- a --%>