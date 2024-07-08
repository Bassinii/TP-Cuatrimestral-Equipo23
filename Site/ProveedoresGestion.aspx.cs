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
    public partial class Formulario_web12 : System.Web.UI.Page
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
                if (!IsPostBack)
                {
                    CargarProveedores();
                }
            }
        }
        private void CargarProveedores()
        {
            NegocioProveedores negocioProveedor = new NegocioProveedores();
            List<Proveedores> ListaProveedores;

            if (Session["IDFiltro"] != null)
            {
                int idFiltro = (int)Session["IDFiltro"];
                ListaProveedores = negocioProveedor.listar().Where(p => p.id == idFiltro).ToList();
            }
            else
            {
                ListaProveedores = negocioProveedor.listar();
            }
        }

        protected void FiltrarProveedores(object sender, EventArgs e)
        {
            int idFiltro;
            if (int.TryParse(TextFiltro.Text, out idFiltro))
            {
                Session.Add("IDFiltro", idFiltro);
            }
            else
            {
                Session.Remove("IDFiltro"); 
            Response.Redirect("ProveedoresGestion.aspx");
        }
    }

        protected void BtnEliminarFilt_Click(object sender, EventArgs e)
        {
            if (Session["IDFiltro"] != null)
            {
                Session.Remove("IDFiltro");
                Response.Redirect("ProveedoresGestion.aspx");
            }
        }
    }
}
