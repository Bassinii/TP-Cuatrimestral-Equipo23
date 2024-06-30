<%@ Page Title="Gestion de Articulos" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Articulos.aspx.cs" Inherits="Site.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex div-articulos" style="margin-top: 56px; display: flex;">
        <div id="sidebar" class="bg-light p-3" style="width: 270px; position: fixed; top: 9.5%; left: 0; overflow-y: auto; padding: 10px; box-sizing: border-box; background-color: #f8f9fa; z-index: 1000;">
            <h2>Articulos</h2>
            <h2>Articulos</h2>
            <!-- Repetición de elementos de ejemplo -->
        </div>

        <div style="margin-left: 270px; margin-top: 10px; padding: 20px; width: calc(100% - 270px);">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
                <div class="input-group" style="width: 70%;">
                    <span class="input-group-text" id="inputGroup-sizing-default">Buscar</span>
                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                </div>
                <button type="button" class="btn btn-outline-success" style="width: 180px;" data-bs-toggle="modal" data-bs-target="#agregarModal">Agregar Articulo</button>
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
                            <div class="dropdown">
                                <a class="btn btn-dark dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#modificarModal"
                                            data-id="<%= articulo.id %>"
                                            data-nombre="<%= articulo.nombre %>"
                                            data-stock="<%= articulo.stock %>"
                                            data-precio="<%= articulo.precio %>"
                                            data-marca="<%= articulo.marca.nombre %>"
                                            data-categoria="<%= articulo.categoria.nombre %>"
                                            onclick="llenarModalModificar(this)">Modificar</a>
                                    </li>
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

    <!-- Modal Agregar -->
    <div class="modal fade" id="agregarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar articulo</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="articuloNombre" class="form-label">Nombre</label>
                        <asp:TextBox runat="server" ID="TxtBoxNombre" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="articuloStock" class="form-label">Stock</label>
                        <asp:TextBox runat="server" ID="TxtBoxStock" TextMode="Number" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="articuloPrecio" class="form-label">Precio</label>
                        <asp:TextBox runat="server" ID="TxtBoxPrecio" TextMode="Number" CssClass="form-control" />
                    </div>
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
                    <asp:Button Text="Agregar" CssClass="btn btn-primary" runat="server" ID="ButtonAgregar" OnClick="ButtonAgregar_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Modificar -->
    <div class="modal fade" id="modificarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="modificarModalLabel">Modificar articulo</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="articuloNombre" class="form-label">Nombre</label>
                        <asp:TextBox runat="server" ID="TextBoxNombre" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="articuloStock" class="form-label">Stock</label>
                        <asp:TextBox runat="server" ID="TextBoxStock" TextMode="Number" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="articuloPrecio" class="form-label">Precio</label>
                        <asp:TextBox runat="server" ID="TextBoxPrecio" TextMode="Number" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="articuloMarca" class="form-label">Marca</label>
                        <asp:DropDownList ID="DropDownModificarMarcas" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label for="articuloCategoria" class="form-label">Categoría</label>
                        <asp:DropDownList ID="DropDownModificarCategorias" runat="server" CssClass="form-control" OnLoad="DropDownModificarCategorias_Load"></asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button Text="Modificar" CssClass="btn btn-primary" runat="server" ID="ButtonModificar" OnClick="ButtonModificar_Click" />
                </div>
            </div>
        </div>
    </div>

    <script>
        function llenarModalModificar(element) {
            var id = element.getAttribute("data-id");
            var nombre = element.getAttribute("data-nombre");
            var stock = element.getAttribute("data-stock");
            var precio = element.getAttribute("data-precio");
            var marca = element.getAttribute("data-marca");
            var categoria = element.getAttribute("data-categoria");

            document.getElementById('<%= TextBoxNombre.ClientID %>').value = nombre;
            document.getElementById('<%= TextBoxStock.ClientID %>').value = stock;
            document.getElementById('<%= TextBoxPrecio.ClientID %>').value = precio;

            // Set the dropdown selected value
            var marcaDropdown = document.getElementById('<%= DropDownModificarMarcas.ClientID %>');
            marcaDropdown.value = marca;
            var categoriaDropdown = document.getElementById('<%= DropDownModificarCategorias.ClientID %>');
            categoriaDropdown.value = categoria;
        }
    </script>
</asp:Content>

<%-- a --%>