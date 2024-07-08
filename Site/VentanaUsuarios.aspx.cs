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
            //Validamos que no se pueda acceder por fuera.
            Usuario usuario = (Usuario)Session["usuario"];

            if (usuario == null)
            {
                Session["error"] = "Debes loguearte para ingresar.";
                Response.Redirect("Error.aspx", false);
                return;
            }

            if (!Vistas.TieneAcceso(usuario, Request.Url.AbsolutePath))
            {
                Session["error"] = $"No tienes permiso para acceder a esta página. Tipo de usuario: {usuario.TipoUsuario}";
                Response.Redirect("Error.aspx", false);
            }

            if (!IsPostBack)
            {
                CargarUsuarios();
            }
        }

        private void CargarUsuarios()
        {
            NegocioUsuario negocioU = new NegocioUsuario();
            List<Usuario> ListU = negocioU.Listar();
            Session["ListaUsuarios"] = ListU;

        }

        protected void FiltrarUsuarios(object sender, EventArgs e)
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
            Response.Redirect("VentanaUsuarios.aspx");
        }

        protected void BtnEliminarFilt_Click(object sender, EventArgs e)
        {
            if (Session["nombreFiltro"] != null)
            {
                Session.Remove("nombreFiltro");
                Response.Redirect("VentanaUsuarios.aspx");
            }
        }
    }
}