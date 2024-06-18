<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Marcas.aspx.cs" Inherits="Site.Marcas" %>

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
    <h1>Gestión de Marcas</h1>
    <form id="form1" runat="server">
         <!-- ver marcas -->
       <div>
            
            <%
                Negocio.NegocioMarca negocioM = new Negocio.NegocioMarca();
                List<Clases.Marca> ListM = negocioM.listar();
            %>
            <table class="table table-success table-striped table-hover">
              <thead>
                <tr>
                  <th scope="col">ID MARCA</th>
                  <th scope="col">NOMBRE MARCA</th>
                  <th scope="col">ACCIONES</th>
                </tr>
              </thead>
              <tbody>
                  <%
                      foreach (Clases.Marca objM in ListM)
                      {
                  %>
                <tr>
                  
                  <td><%=objM.id %></td>
                  <td><%=objM.nombre %></td>
                  <td>
                <a href='<%= "EditarMarca.aspx?id=" + objM.id %>' class="btn btn-primary btn-sm">Modificar</a>
                    <!-- aca enviamos id a la ventana editarMarca-->
                </td>
                </tr>
                    <%} %>
              </tbody>
            </table>
             </div>

        <!-- Button to add new brand -->
        <a href="EditarMarca.aspx" class="btn btn-success">Agregar Marca</a>
        <asp:HyperLink ID="LinkVolver" runat="server" NavigateUrl="default.aspx">Volver a Inicio</asp:HyperLink>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        // Script para manejar la selección de filas en la tabla
        $(document).ready(function () {
            $('#tablaMarcas tbody').on('click', 'tr', function () {
                $(this).toggleClass('table-active'); // Aplicar clase de selección cuando se hace clic en una fila
            });
        });
</script>
</body>
</html>
