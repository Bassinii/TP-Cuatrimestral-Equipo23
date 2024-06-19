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
    
    }
}