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
    public partial class Categorias : System.Web.UI.Page
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
                    cargarCategorias();
                }
            }
        }
        private void cargarCategorias()
        {
           NegocioCategoria categoria= new NegocioCategoria();
            List<Categoria> ListC = new List<Categoria>();
            


        }

    }
}