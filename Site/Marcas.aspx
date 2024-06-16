<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Marcas.aspx.cs" Inherits="Site.Marcas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Marcas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>


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
            <table class="table table-success table-striped">
              <thead>
                <tr>
                  <th scope="col">ID MARCA</th>
                  <th scope="col">NOMBRE MARCA</th>
               
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
                </tr>
                    <%} %>
              </tbody>
            </table>
        </div>
        <!-- agregar y modificar marcas -->
         <!-- agregar y modificar marcas -->
        <!-- Button trigger modal -->
<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
  AGREGAR MARCAS
</button>

<!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                        <!-- Formulario para ingresar el nombre de la marca -->
          <div class="mb-3">
            <label for="nombreMarca" class="form-label">Nombre de la Marca</label>
            <input type="text" class="form-control" id="nombreMarca" name="nombreMarca" required="required"/>
          </div>
               
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <asp:Button runat="server" ID="BtnGuardar" Text="Guardar" CssClass="btn btn-primary" OnClick="BtnGuardar_Click" />

              </div>
            </div>
          </div>
        </div>
    </form>
    <asp:HyperLink ID="LinkVolver" runat="server" NavigateUrl="default.aspx">Volver a Inicio</asp:HyperLink>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
