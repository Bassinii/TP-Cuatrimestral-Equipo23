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
    public partial class VentanaUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
            }
        }

        private void CargarUsuarios()
        {
            NegocioUsuario negocioU = new NegocioUsuario();
            List<Usuario> ListU = negocioU.Listar();

            // Aquí podrías agregar lógica adicional si necesitas
        }
    }
}