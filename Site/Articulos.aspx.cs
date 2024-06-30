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
            if (!IsPostBack)
            {
                NegocioArticulo negocioArticulo = new NegocioArticulo();
                ListArticulos = negocioArticulo.listar();

                NegocioMarca negocioMarca = new NegocioMarca();
                ListMarcas = negocioMarca.listar();

                NegocioCategoria negocioCategoria = new NegocioCategoria();
                ListCategorias = negocioCategoria.List();

                DropDownCategorias.DataSource = ListCategorias;
                DropDownCategorias.DataTextField = "nombre";
                DropDownCategorias.DataValueField = "id";
                DropDownCategorias.DataBind();
                DropDownCategorias.Items.Insert(0, new ListItem("Seleccione una Categoría", "0"));

                DropDownMarcas.DataSource = ListMarcas;
                DropDownMarcas.DataTextField = "nombre";
                DropDownMarcas.DataValueField = "id";
                DropDownMarcas.DataBind();
                DropDownMarcas.Items.Insert(0, new ListItem("Seleccione una Marca", "0"));

                // Populate modification dropdowns
                DropDownModificarMarcas.DataSource = ListMarcas;
                DropDownModificarMarcas.DataTextField = "nombre";
                DropDownModificarMarcas.DataValueField = "id";
                DropDownModificarMarcas.DataBind();

                DropDownModificarCategorias.DataSource = ListCategorias;
                DropDownModificarCategorias.DataTextField = "nombre";
                DropDownModificarCategorias.DataValueField = "id";
                DropDownModificarCategorias.DataBind();
            }
        }

        protected void ButtonAgregar_Click(object sender, EventArgs e)
        {
            NegocioArticulo negocioArticulo = new NegocioArticulo();
            Articulo articulo = new Articulo
            {
                nombre = TxtBoxNombre.Text,
                precio = int.Parse(TxtBoxPrecio.Text),
                stock = int.Parse(TxtBoxStock.Text),
                marca = new Marca { id = int.Parse(DropDownMarcas.SelectedValue) },
                categoria = new Categoria { id = int.Parse(DropDownCategorias.SelectedValue) }
            };

            negocioArticulo.agregar(articulo);
        }

        protected void ButtonModificar_Click(object sender, EventArgs e)
        {
            NegocioArticulo negocioArticulo = new NegocioArticulo();
            Articulo articulo = new Articulo
            {
                nombre = TextBoxNombre.Text,
                precio = int.Parse(TextBoxPrecio.Text),
                stock = int.Parse(TextBoxStock.Text),
                marca = new Marca { id = int.Parse(DropDownModificarMarcas.SelectedValue) },
                categoria = new Categoria { id = int.Parse(DropDownModificarCategorias.SelectedValue) }
            };

            negocioArticulo.actualizar(articulo);
        }

        protected void DropDownModificarCategorias_Load(object sender, EventArgs e)
        {

        }
    }
}
