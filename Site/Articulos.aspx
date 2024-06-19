<%@ Page Title="Gestion de Articulos" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Articulos.aspx.cs" Inherits="Site.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Styles.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div-articulos">
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
                </tr>
                <%} %>
            </tbody>
        </table>
    </div>
</asp:Content>
