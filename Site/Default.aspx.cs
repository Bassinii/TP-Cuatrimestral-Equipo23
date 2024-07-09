using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases;
using Negocio;

namespace Site
{
    public partial class Formulario_web1 : System.Web.UI.Page
    {
        public List<Articulo> ListArticulos { get; set; }
        public List<ArticuloCarrito> ListCarrito { get; set; }
        public float totalCarrito { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioArticulo negocioArticulo = new NegocioArticulo();
            ListArticulos = negocioArticulo.listar();

            ListCarrito = Session["Carrito"] != null ? (List<ArticuloCarrito>)Session["Carrito"] : new List<ArticuloCarrito>();
            Session.Add("Carrito", ListCarrito);

            if (Request.QueryString["id"] != null && int.Parse(Request.QueryString["action"]) == 1)
            {
                int id = int.Parse(Request.QueryString["id"]);

                Articulo seleccionado = ListArticulos.Find(x => x.id == id);
                if (seleccionado != null)
                {
                    ArticuloCarrito existeCarrito = ListCarrito.Find(x => x.id == id);

                    if (existeCarrito != null)
                    {
                        existeCarrito.cantidad += 1;
                    }
                    else
                    {
                        //Creamos seleccionadoCarrito mandandole al construcor seleccionado para que copie sus props.
                        ArticuloCarrito seleccionadoCarrito = new ArticuloCarrito(seleccionado);
                        ListCarrito.Add(seleccionadoCarrito);
                    }
                }

            }
            totalCarrito = ListCarrito.Sum(articulo => articulo.precio * articulo.cantidad);

            if (!IsPostBack)
            {
                DropDownList1.Items.Add(new ListItem("Efectivo", "Efectivo"));
                DropDownList1.Items.Add(new ListItem("Debito", "Debito"));
                DropDownList1.Items.Add(new ListItem("Credito", "Credito"));
                DropDownList1.Items.Add(new ListItem("MercadoPago", "MercadoPago"));
            }
        }

        protected void ButtonFinalizarCompra_Click(object sender, EventArgs e)
        {
            Venta venta = new Venta();
            NegocioVenta negocioVenta = new NegocioVenta();

            venta.total = totalCarrito;
            venta.esPedidosYa = CheckBoxPedidosYa.Checked;
            venta.subtotal = totalCarrito;
            venta.idEmpleado = 2;
            venta.idCliente = 1;
            

            negocioVenta.agregar(venta);

            // Limpiar el carrito
            ListCarrito.Clear();
            Session["Carrito"] = ListCarrito;

            // Actualizar la página o redirigir
            Response.Redirect("Default.aspx");
        }
    }
}