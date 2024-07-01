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
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarVistasDisponibles();
            }
        }

        private void CargarVistasDisponibles()
        {
            navbar.Controls.Clear(); // Limpiar navbar antes de agregar nuevas vistas

            

            if (Session["usuario"] != null)
            {
                Usuario usuario = (Usuario)Session["usuario"];
                List<string> vistasDisponibles = Vistas.ObtenerVistas(usuario);

                LiteralControl ulInicio = new LiteralControl();
                ulInicio.Text = "<ul class='navbar-nav me-auto mb-2 mb-lg-0'>";

                navbar.Controls.Add(ulInicio);

                foreach (string vista in vistasDisponibles)
                {                   
                        LiteralControl lc = new LiteralControl();
                        lc.Text = $"<li class='nav-item'><a class='nav-link' href='{vista}'>{ObtenerNombreVista(vista)}</a></li>";
                        navbar.Controls.Add(lc);                   
                }
                LiteralControl ulFin = new LiteralControl();
                ulFin.Text = "</ul>";

                navbar.Controls.Add(ulFin);
            }
            else // Si no hay usuario autenticado
            {
                LiteralControl ulInicio = new LiteralControl();
                ulInicio.Text = "<ul class='navbar-nav me-auto mb-2 mb-lg-0'>";

                navbar.Controls.Add(ulInicio);
                // Agregar las vistas por defecto al navbar
                LiteralControl lcInicio = new LiteralControl();
                lcInicio.Text = "<li class='nav-item'><a class='nav-link' href='Default.aspx'>Inicio</a></li>";
                navbar.Controls.Add(lcInicio);

                LiteralControl lcLogin = new LiteralControl();
                lcLogin.Text = "<li class='nav-item'><a class='nav-link' href='Login.aspx'>Usuario</a></li>";
                navbar.Controls.Add(lcLogin);

                LiteralControl ulFin = new LiteralControl();
                ulFin.Text = "</ul>";

                navbar.Controls.Add(ulFin);
            }

        }


        private string ObtenerNombreVista(string vista)
        {
            switch (vista)
            {
                case "Default.aspx":
                    return "Inicio";
                case "Login.aspx":
                    return "Usuario";
                case "Ventas.aspx":
                    return "Historial de ventas";
                case "Articulos.aspx":
                    return "Gestión de Artículos";
                case "Marcas.aspx":
                    return "Gestión de Marcas";
                case "Categorias.aspx":
                    return "Gestión de Categorias";
                case "Clientes.aspx":
                    return "Gestión de Clientes";
                case "ProveedoresGestion.aspx":
                    return "Gestión de Proveedores";
                default:
                    return "Vista Desconocida";
            }
        }
    }
}