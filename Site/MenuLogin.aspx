<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuLogin.aspx.cs" Inherits="Site.MenuLogin" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Menu De Usuario</title>
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
            padding-top: 50px; /* Ajustar espacio superior para navbar fija */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-container">
        <h1>Menu De Usuario</h1>
        <div>
            <h3>Ingresaste Correctamente.</h3>
            
            <!-- Aquí puedes agregar los enlaces a las páginas específicas para cada tipo de usuario -->
            <asp:HyperLink ID="LinkCategorias" runat="server" NavigateUrl="Categorias.aspx">Gestión de Categorías</asp:HyperLink>
            <!-- Agrega más enlaces según sea necesario -->
        </div>
    </div>
</asp:Content>
