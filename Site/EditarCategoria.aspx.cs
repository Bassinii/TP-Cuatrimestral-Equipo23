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
    public partial class EditarCategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // Obtener el ID de la Categoria de la URL
                if (Request.QueryString["id"] != null)
                {
                    string idCategoria = Request.QueryString["id"].ToString();

                    cargarDatosCategoria(idCategoria);
                    btnEliminar.Visible = true;

                }
                else
                {
                    btnEliminar.Visible = false;
                }
            }
        }

        protected void cargarDatosCategoria(string idCategoria)
        {
            NegocioCategoria negocioCategoria = new NegocioCategoria();
            Categoria categoria = negocioCategoria.obtenerPorId(idCategoria);

            if (categoria != null)
            {
                txtNombreCategoria.Text = categoria.nombre;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            // Obtener el nombre de la categoria ingresado en el TextBox
            string nombreCategoria = txtNombreCategoria.Text;

            // Validar que el nombre de la categoria no esté vacío
            if (string.IsNullOrEmpty(nombreCategoria))
            {
                // Manejar caso en el que el nombre está vacío
               
                return;
            }

            // Crear una instancia de la clase NegocioCategoria (o similar) para manejar la lógica de negocio
            NegocioCategoria negocioCategoria = new NegocioCategoria();

            try
            {
                if (Request.QueryString["id"] != null)
                {
                    // Actualizar la Categoria existente
                    string idCategoria = Request.QueryString["id"];
                    if (!string.IsNullOrEmpty(idCategoria))
                    {
                        Categoria categoria = new Categoria
                        {
                            id = int.Parse(idCategoria),
                            nombre = nombreCategoria
                        };
                        negocioCategoria.actualizar(categoria);
                    }
                }
                else
                {
                    // Agregar una nueva Categoria
                    Categoria nuevaCategoria = new Categoria
                    {
                        nombre = nombreCategoria
                    };
                    negocioCategoria.agregar(nuevaCategoria);
                }

                // Redirigir a la página de gestión de Categorias en la misma ventana
                Response.Redirect("Categorias.aspx");
            }
            catch (Exception ex)
            {
                // Manejar la excepción mostrando un mensaje o registrándola
               
                throw ex;
            }
        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                string idCategoria = Request.QueryString["id"];
                NegocioCategoria negocioCategoria = new NegocioCategoria();
                try
                {
                    negocioCategoria.eliminar(int.Parse(idCategoria));
                    Response.Redirect("Categorias.aspx");

                }
                catch (Exception ex)
                {
                    // Manejo de la excepción
                    throw ex;
                }

            }
        }
    }
}