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
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioArticulo negocioArticulo = new NegocioArticulo();
            ListArticulos = negocioArticulo.listar();
        }


    }
}