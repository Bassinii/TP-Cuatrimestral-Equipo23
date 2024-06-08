<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="Site.Ventas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Ventas</title>
</head>
<body>
    <h1>Gestión de Ventas</h1>
    <form id="form1" runat="server">
        <!-- nueva venta -->
    <div>
    <h2>Nueva Venta</h2>
            <label>Empleado</label>
            <p>se muestra DropDownListEmpleado existentes</p>
            <br />
            <label>Cliente</label>
            <p>se muestra DropDownListClientes existentes</p>
             <br />
            <p>se autocompletan automaticamente cuando se agregue la funcionalidad</p>
            <label>Nro de Factura: </label>
            <asp:TextBox ID="TextBoxFactura" runat="server" ReadOnly="true"></asp:TextBox>
            <br />
            <label>Fecha</label>
            <asp:TextBox ID="TextBoxFecha" runat="server" ReadOnly="true"></asp:TextBox>
            <br />
            <label>Hora</label>
            <asp:TextBox ID="TextBoxHora" runat="server" ReadOnly="true"></asp:TextBox>
            <br />
            <h3>Detalles de la Venta</h3>
            <p>Cargamos datos de la venta: articulo, cantidad, precio.</p>
            <asp:Button ID="BtnAgregarDetalle" runat="server" Text="Agregar Detalle" Visible="false" />
            <br /><br />
            <label>Subtotal</label>
            <asp:TextBox ID="TextBoxSubtotal" runat="server"></asp:TextBox>
            <br />
            <label>Total</label>
            <asp:TextBox ID="TextBoxTotal" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="BtnGuardarVenta" runat="server" Text="Generar Venta" />
            <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" Visible="true" />
        </div>
    </form>
    <asp:HyperLink ID="LinkVolver" runat="server" NavigateUrl="default.aspx">Volver a Inicio</asp:HyperLink>
</body>
</html>
