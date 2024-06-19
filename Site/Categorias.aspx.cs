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