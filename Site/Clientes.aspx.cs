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
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPostBack)
                {
                    CargarClientes();
                }
            }
        }
        private void CargarClientes()
        {
            NegocioCliente negocioCli = new NegocioCliente();
            List<Cliente> ListCli = negocioCli.listar();

        }

        protected void filtrarClientes(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nombre = TextFiltro.Text;
            if (nombre.Length == 0)
            {
                return;
            }
            Session.Add("nombreFiltro", TextFiltro.Text);
            Response.Redirect("Clientes.aspx");

        }

        protected void BtnEliminarFilt_Click(object sender, EventArgs e)
        {
            if (Session["nombreFiltro"] != null)
            {
                Session.Remove("nombreFiltro");
                Response.Redirect("Clientes.aspx");
            }
        }
    }
}