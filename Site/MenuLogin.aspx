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
    <div class="d-flex justify-content-center align-items-start" style="height: 100vh; padding-top: 100px;">
        <div class="alert alert-success text-center" role="alert" style="width: 600px; border: 1px solid #d4edda; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
            <h4 class="alert-heading">BIENVENIDX!</h4>
            <p>Logueado con éxito.</p>
            <hr>
            <p class="mb-0">Selecciona una opción en el menú superior para realizar tareas de gestión.</p>
        </div>
    </div>
</asp:Content>
