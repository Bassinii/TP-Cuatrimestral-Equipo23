<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Site.Login"  MasterPageFile="~/MasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
<style>
        .container-green {
            background-color: #d4edda; /* Fondo verde claro */
            padding: 20px;
            border-radius: 10px; /* Bordes redondeados */
            margin-top: 20px; /* Espacio superior */
        }

        .container-white {
            background-color: #fff; /* Fondo blanco */
            padding: 20px;
            border-radius: 10px; /* Bordes redondeados */
        }
       .btn-primary {
            background-color: #28a745; /* Verde Bootstrap */
            border-color: #28a745; /* Verde Bootstrap */
        }
        .btn-primary:hover {
            background-color: #218838; /* Verde más oscuro para el hover */
            border-color: #1e7e34; /* Verde más oscuro para el hover */
        }
        .custom-container {
            background-color: #d4edda; /* Verde claro */
            padding: 30px;
            border-radius: 10px;
            margin-top: 50px;
        }
        .custom-card {
            background-color: #fff; /* Blanco */
            padding: 20px;
            border-radius: 10px;
        }
        .form-control {
            max-width: 300px; /* Ancho máximo del TextBox */
            margin: 0 auto; /* Centrar el TextBox */
        }
        .form-group {
            text-align: center; /* Centrar el texto de las etiquetas */
        }
        .form-group label {
            display: block; /* Hacer que las etiquetas ocupen todo el ancho disponible */
        }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container custom-container">
        <div class="row justify-content-center">
            <div class="col-md-6 custom-card">
                <h1 class="text-center">Login</h1>
                <div class="form-group">
                    <label for="TextBoxUsuario">Usuario</label>
                    <asp:TextBox ID="TextBoxUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <br />
                <div class="form-group">
                    <label for="TextBoxPassword">Contraseña </label>
                    <asp:TextBox ID="TextBoxPassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <br />
                <div class="text-center">
                    <asp:Button ID="BtnIngresar" runat="server" Text="INGRESAR" OnClick="BtnIngresar_Click" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</asp:Content>
