<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProveedoresGestion.aspx.cs" Inherits="Site.Formulario_web12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Proveedores</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <style>
        .btn-primary {
            background-color: #28a745; 
            border-color: #28a745; 
        }
        .btn-primary:hover {
            background-color: #218838; 
            border-color: #1e7e34;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <h1>Gestión de Proveedores</h1>
           
            <div class="mb-3 row">
                <div class="col-md-6">
                    <input type="text" id="txtFiltro" class="form-control" placeholder="Buscar proveedor...(sin logica)"/>
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-primary" onclick="filtrarClientes()">Filtrar</button>
                </div>
                <div class="col-md-4">
                    <a href="EditarProveedor.aspx" class="btn btn-success"> + Agregar Proveedor</a>
                </div>
            </div>
            <!-- Ver Proveedores -->
            <div>
            
            <%
                Negocio.NegocioProveedores negocioProveedor = new Negocio.NegocioProveedores();
                List<Clases.Proveedores> listaProveedores = negocioProveedor.listar();
            %>
            <table class="table table-success table-striped table-hover">
              <thead>
                <tr>
                  <th scope="col">ID Proveedor</th>
                  <th scope="col">DIRECCION </th>
                  <th scope="col">PROVINCIA</th>
                  <th scope="col">EMAIL</th>
                  <th scope="col">TELFONO</th>
             
                </tr>
              </thead>
              <tbody>
                  <%
                      foreach (Clases.Proveedores proveedor in listaProveedores)
                      {
                  %>
                <tr>
                  
                  <td><%=proveedor.id %></td>
                  <td><%=proveedor.direccion %></td>
                  <td><%=proveedor.provincia %></td>
                  <td><%=proveedor.email %></td>
                  <td><%=proveedor.telefono %></td>
                 

                  <td>
                <a href='<%= "EditarProveedor.aspx?id=" + proveedor.id %>' class="btn btn-primary btn-sm">Modificar</a>
                    
                </td>
                </tr>
                    <%} %>
              </tbody>
            </table>
             </div>
            

          
           
        <asp:HyperLink ID="LinkVolver" runat="server" NavigateUrl="default.aspx">Volver a Inicio</asp:HyperLink>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script>
        // Script para manejar la selección de filas en la tabla
        $(document).ready(function () {
            $('#tablaMarcas tbody').on('click', 'tr', function () {
                $(this).toggleClass('table-active'); // Aplicar clase de selección cuando se hace clic en una fila
            });
        });
</script>
</asp:Content>
