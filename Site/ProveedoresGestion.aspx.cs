using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Clases;

namespace Site
{
    public partial class ProveedoresGestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPostBack)
                {
                    CargarProveedores();
                }
            }
        }
        private void CargarProveedores()
        {
            NegocioProveedores negocioProveedor = new NegocioProveedores();
            List<Proveedores> listaProveedores = negocioProveedor.listar();

        }

    }

}