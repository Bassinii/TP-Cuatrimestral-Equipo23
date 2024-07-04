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
    public partial class Formulario_web11 : System.Web.UI.Page
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
            NegocioArticulo negocioArticulo = new NegocioArticulo();
            List<Articulo> listaArticulos;

            if (Session["nombreFiltro"] != null)
            {
                listaArticulos = negocioArticulo.listarPorNombre(Session["nombreFiltro"].ToString());
            }
            else
            {
                listaArticulos = negocioArticulo.listar();
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nombre = TextFiltro.Text.Trim();
            if (!string.IsNullOrEmpty(nombre))
            {
                Session["nombreFiltro"] = nombre;
            }
            else
            {
                Session.Remove("nombreFiltro");
            }
            Response.Redirect("Articulos.aspx");
        }

        protected void BtnEliminarFilt_Click(object sender, EventArgs e)
        {
            Session.Remove("nombreFiltro");
            Response.Redirect("Articulos.aspx");
        }
    }
}
