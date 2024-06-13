<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Site.Formulario_web1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Styles.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="main-container">
       <div class="sidebar">
           <ul>
               <li><a href="#">Opción 1</a></li>
               <li><a href="#">Opción 2</a></li>
               <li><a href="#">Opción 3</a></li>
               <li><a href="#">Opción 4</a></li>
           </ul>
       </div>
       <div class="body_articles">
           <div id="articles-card-container" class="card-container">
               <%for (int i = 0; i < 83; i++) { %>
                   <div class="article-card card">
                       <img src="ruta/a/asadillo-manchego.jpg" alt="Asadillo Manchego" class="card-image">
                       <div class="card-title">Asadillo Manchego</div>
                   </div>
                   <div class="article-card card">
                       <img src="ruta/a/banana.jpg" alt="Banana" class="card-image">
                       <div class="card-title">Banana</div>
                   </div>
                   <div class="article-card card">
                       <img src="ruta/a/capuchino.jpg" alt="Capuchino" class="card-image">
                       <div class="card-title">Capuchino</div>
                   </div>
               <% } %>
           </div>
       </div>
   </div>
</asp:Content>
