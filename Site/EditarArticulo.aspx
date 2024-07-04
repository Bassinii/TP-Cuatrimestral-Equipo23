<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarArticulo.aspx.cs" Inherits="Site.EditarArticulo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Editar Artículo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style>
        body {
            background-color: #eafaf1; /* Color de fondo verde claro */
        }
        .container {
            max-width: 600px; /* Ancho máximo del contenedor */
            margin-top: 20px; /* Espacio superior */
        }
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
    <div class="d-flex justify-content-center mt-4">
        <form id="form1" runat="server" class="w-50">
            <div class="container mt-4">
                <h1><%= Request.QueryString["id"] != null ? "Editar Artículo" : "Agregar Artículo" %></h1>
                
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="El Nombre es requerido." ControlToValidate="txtNombre" runat="server" CssClass="text-danger" Display="Dynamic" />
                </div>
                
                <div class="mb-3">
                    <label for="txtStock" class="form-label">Stock</label>
                    <asp:TextBox ID="txtStock" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="El Stock es requerido." ControlToValidate="txtStock" runat="server" CssClass="text-danger" Display="Dynamic" />
                    <asp:RangeValidator ErrorMessage="El Stock debe ser mayor o igual a 0." ControlToValidate="txtStock"  MinimumValue="0" MaximumValue="10000" Type="Integer"  CssClass="text-danger" runat="server" />
                </div>
                
                <div class="mb-3">
                    <label for="txtPrecio" class="form-label">Precio Unitario</label>
                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="El Precio es requerido." ControlToValidate="txtPrecio" runat="server" CssClass="text-danger" Display="Dynamic" />
                    
                </div>
                
                <div class="mb-3">
                    <label for="ddlCategoria" class="form-label">Categoría</label>
                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-control">
                       
                    </asp:DropDownList>
                </div>
                
                <div class="mb-3">
                    <label for="ddlMarca" class="form-label">Marca</label>
                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-control">
                        
                    </asp:DropDownList>
                </div>
                
                <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>

                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" PostBackUrl="Articulos.aspx" />
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" Visible="false" />
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
