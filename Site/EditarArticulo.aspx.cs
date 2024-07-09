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
    public partial class EditarArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCategorias();
                CargarMarcas();

                if (Request.QueryString["id"] != null)
                {
                    string idArticulo = Request.QueryString["id"].ToString();
                    CargarDatosArticulo(idArticulo);
                    btnEliminar.Visible = true;
                }
                else
                {
                    btnEliminar.Visible = false;
                }
            }
        }

       
        protected void CargarCategorias()
        {
            NegocioCategoria negocioCategoria = new NegocioCategoria();
            List<Categoria> categorias = negocioCategoria.List();

            ddlCategoria.DataSource = categorias;
            ddlCategoria.DataTextField = "nombre";
            ddlCategoria.DataValueField = "id";
            ddlCategoria.DataBind();

            ddlCategoria.Items.Insert(0, new ListItem("-- Seleccionar categoría --", ""));
        }
        protected void CargarMarcas()
        {
            NegocioMarca negocioMarca = new NegocioMarca();
            List<Marca> marcas = negocioMarca.listar();

            ddlMarca.DataSource = marcas;
            ddlMarca.DataTextField = "nombre";
            ddlMarca.DataValueField = "id";
            ddlMarca.DataBind();

            ddlMarca.Items.Insert(0, new ListItem("-- Seleccionar marca --", ""));
        }
        protected void CargarDatosArticulo(string idArticulo)
        {
            NegocioArticulo negocioArticulo = new NegocioArticulo();
            Articulo articulo = negocioArticulo.ObtenerPorId(idArticulo);

            if (articulo != null)
            {
                txtNombre.Text = articulo.nombre;
                txtStock.Text = articulo.stock.ToString();
                txtPrecio.Text = articulo.precio.ToString();

                // Seleccionar la categoría y marca en los DropDownLists
                ddlCategoria.SelectedValue = articulo.categoria.id.ToString();
                ddlMarca.SelectedValue = articulo.marca.id.ToString();
                
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
                return;

            string nombre = txtNombre.Text;
            int stock = Convert.ToInt32(txtStock.Text);
            float precio = float.Parse(txtPrecio.Text);
            int idCategoria = int.Parse(ddlCategoria.SelectedValue);
            int idMarca = int.Parse(ddlMarca.SelectedValue);

            NegocioArticulo negocioArticulo = new NegocioArticulo();

            try
            {
                if (Request.QueryString["id"] != null)
                {
                    string idArticulo = Request.QueryString["id"];
                    if (!string.IsNullOrEmpty(idArticulo))
                    {
                        Articulo articulo = new Articulo
                        {
                            id = int.Parse(idArticulo),
                            nombre = nombre,
                            stock = stock,
                            precio = precio,
                            categoria = new Categoria { id = idCategoria },
                            marca = new Marca { id = idMarca }
                        };
                        negocioArticulo.actualizar(articulo);
                    }
                }
                else
                {
                    Articulo nuevoArticulo = new Articulo
                    {
                        nombre = nombre,
                        stock = stock,
                        precio = precio,
                        categoria = new Categoria { id = idCategoria },
                        marca = new Marca { id = idMarca },
                        
                    };
                    negocioArticulo.agregar(nuevoArticulo);
                }

                Response.Redirect("Articulos.aspx");
            }
            catch (Exception ex)
            {
                // Manejar la excepción mostrando un mensaje o registrándola
                lblError.Text = ex.Message;
                lblError.Visible = true;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                string idArticulo = Request.QueryString["id"];
                NegocioArticulo negocioArticulo = new NegocioArticulo();
                try
                {
                    negocioArticulo.eliminar(int.Parse(idArticulo));
                    Response.Redirect("Articulos.aspx");
                }
                catch (Exception ex)
                {
                    // Manejo de la excepción
                    lblError.Text = ex.Message;
                    lblError.Visible = true;
                }
            }
        }
    }
}