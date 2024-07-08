using Clases;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site
{
    public partial class Formulario_web13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarArticulos();
            }
        }
        private void CargarArticulos()
        {
            NegocioVenta negocioVenta = new NegocioVenta();
            List<Venta> listVentas;

            //if (Session["nombreFiltro"] != null)
            //{
            //    listaArticulos = negocioVenta.listarPorNombre(Session["nombreFiltro"].ToString());
            //}
            //else
            //{
                listVentas = negocioVenta.listar();
            //}

        }
    }
}