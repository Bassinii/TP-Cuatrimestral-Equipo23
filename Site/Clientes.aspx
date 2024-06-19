<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Site.Clientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Clientes</title>
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
    <form id="form1" runat="server">

            <h1>Gestión de Clientes</h1>
                <!-- Filtro y botón para agregar nuevo cliente -->
            <div class="mb-3 row">
                <div class="col-md-6">
                    <input type="text" id="txtFiltro" class="form-control" placeholder="Buscar cliente..."/>
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-primary" onclick="filtrarClientes()">Filtrar</button>
                </div>
                <div class="col-md-4">
                    <a href="EditarCliente.aspx" class="btn btn-success"> + Nuevo</a>
                </div>
            </div>
            <!-- Ver clientes -->
            <div>
            
            <%
                Negocio.NegocioCliente negocioCli = new Negocio.NegocioCliente();
                List<Clases.Cliente> ListCli = negocioCli.listar();
            %>
            <table class="table table-success table-striped table-hover">
              <thead>
                <tr>
                  <th scope="col">ID Cliente</th>
                  <th scope="col">NOMBRE </th>
                  <th scope="col">APELLIDO</th>
                  <th scope="col">DIRECCION</th>
                  <th scope="col">MAIL</th>
                  <th scope="col">TELEFONO</th>
                  <th scope="col">ACCIONES</th>

                </tr>
              </thead>
              <tbody>
                  <%
                      foreach (Clases.Cliente objCli in ListCli)
                      {
                  %>
                <tr>
                  
                  <td><%=objCli.id %></td>
                  <td><%=objCli.nombre %></td>
                  <td><%=objCli.apellido %></td>
                  <td><%=objCli.direccion %></td>
                  <td><%=objCli.mail %></td>
                  <td><%=objCli.telefono %></td>

                  <td>
                <a href='<%= "EditarCliente.aspx?id=" + objCli.id %>' class="btn btn-primary btn-sm">Modificar</a>
                    <!-- aca enviamos id a la ventana editarMarca-->
                </td>
                </tr>
                    <%} %>
              </tbody>
            </table>
             </div>
            

            <!-- Agregar cliente -->
           
        <asp:HyperLink ID="LinkVolver" runat="server" NavigateUrl="default.aspx">Volver a Inicio</asp:HyperLink>
    </form>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script>
        // Script para manejar la selección de filas en la tabla
        $(document).ready(function () {
            $('#tablaMarcas tbody').on('click', 'tr', function () {
                $(this).toggleClass('table-active'); // Aplicar clase de selección cuando se hace clic en una fila
            });
        });
</script>
</html>
