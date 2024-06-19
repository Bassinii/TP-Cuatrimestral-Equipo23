<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categorias.aspx.cs" Inherits="Site.Categorias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Marcas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <style>
        .btn-primary {
            background-color: #28a745; /* Verde Bootstrap */
            border-color: #28a745; /* Verde Bootstrap */
        }
        .btn-primary:hover {
            background-color: #218838; /* Verde más oscuro para el hover */
            border-color: #1e7e34; /* Verde más oscuro para el hover */
        }
    </style>
</head>
<body>
    <h1>Gestión de Categorías</h1>
        <form id="form1" runat="server">
         <!-- ver CATEGORIAS -->
       <div>
            
            <%
                Negocio.NegocioCategoria NegocioM = new Negocio.NegocioCategoria();
                List<Clases.Categoria> ListC = NegocioM.List();
            %>
            <table class="table table-success table-striped table-hover">
              <thead>
                <tr>
                  <th scope="col">ID CATEGORIA</th>
                  <th scope="col">NOMBRE CATEGORIA</th>
                  <th scope="col">ACCIONES</th>
                </tr>
              </thead>
              <tbody>
                  <%
                      foreach (Clases.Categoria objC in ListC)
                      {
                  %>
                <tr>
                  
                  <td><%=objC.id %></td>
                  <td><%=objC.nombre %></td>
                  <td>
                <a href='<%= "EditarCategoria.aspx?id=" + objC.id %>' class="btn btn-primary btn-sm">Modificar</a>
                    <!-- aca enviamos id a la ventana editarCategoria-->
                </td>
                </tr>
                    <%} %>
              </tbody>
            </table>
             </div>

        <!-- Button Agregar -->
        <a href="EditarCategoria.aspx" class="btn btn-success">Agregar Categoria</a>
    <asp:HyperLink ID="LinkVolver" runat="server" NavigateUrl="default.aspx">Volver a Inicio</asp:HyperLink>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
