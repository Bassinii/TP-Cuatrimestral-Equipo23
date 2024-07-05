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
            
           
            <asp:HyperLink ID="LinkUsuarios" runat="server" NavigateUrl="VentanaUsuarios.aspx">Ir a gestionar usuarios</asp:HyperLink>
            
        </div>
    </div>
</asp:Content>
