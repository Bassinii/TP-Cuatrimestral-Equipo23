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
    public partial class Marcas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPostBack)
                {
                    CargarMarcas();
                }
            }
        }
        private void CargarMarcas()
        {
            NegocioMarca negocioM = new NegocioMarca();
            List<Marca> ListM = negocioM.listar();

           
         
        }
        
    }
}
