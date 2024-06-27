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
    public partial class Formulario_web11 : System.Web.UI.Page
    {
        public List<Articulo> ListArticulos { get; set; }
        public List<Marca> ListMarcas { get; set; }
        public List<Categoria> ListCategorias { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioArticulo negocioArticulo = new NegocioArticulo();
            ListArticulos = negocioArticulo.listar();

            NegocioMarca negocioMarca = new NegocioMarca();
            ListMarcas = negocioMarca.listar();

            NegocioCategoria negocioCategoria = new NegocioCategoria();
            ListCategorias = negocioCategoria.List();

            DropDownCategorias.DataSource = ListCategorias;
            DropDownCategorias.DataTextField = "nombre";  // Propiedad a mostrar en el DropDownList
            DropDownCategorias.DataValueField = "id";    // Propiedad que se usará como valor del DropDownList
            DropDownCategorias.DataBind();
            DropDownCategorias.Items.Insert(0, new ListItem("Seleccione una Categoría", "0")); // Agregar opción por defecto

            DropDownMarcas.DataSource = ListMarcas;
            DropDownMarcas.DataTextField = "nombre";  // Propiedad a mostrar en el DropDownList
            DropDownMarcas.DataValueField = "id";    // Propiedad que se usará como valor del DropDownList
            DropDownMarcas.DataBind();
            DropDownMarcas.Items.Insert(0, new ListItem("Seleccione una Marca", "0"));
        }

        protected void ButtonAgregar_Click(object sender, EventArgs e)
        {
            NegocioArticulo negocioArticulo = new NegocioArticulo();
            Articulo articulo = new Articulo();


            articulo.nombre = TxtBoxNombre.Text;
            articulo.precio = int.Parse(TxtBoxPrecio.Text);
            articulo.stock = int.Parse(TxtBoxStock.Text);
            articulo.marca.id = int.Parse(DropDownMarcas.SelectedValue);
            articulo.categoria.id = int.Parse(DropDownCategorias.SelectedValue);


            negocioArticulo.agregar(articulo);

        }
    }
}