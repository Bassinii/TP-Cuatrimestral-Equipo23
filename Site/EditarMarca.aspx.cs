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
    public partial class EditarMarca : System.Web.UI.Page
    {
        
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    // Obtener el ID de la marca de la URL
                    if (Request.QueryString["id"] != null)
                    {
                        string idMarca = Request.QueryString["id"].ToString();
                       
                        CargarDatosMarca(idMarca);
                        btnEliminar.Visible = true;

                }
                else
                {
                    btnEliminar.Visible = false;
                }
                }
            }

            protected void CargarDatosMarca(string idMarca)
            {
                NegocioMarca negocioMarca = new NegocioMarca();
                Marca marca = negocioMarca.obtenerPorId(idMarca);

                if (marca != null)
                {
                    txtNombreMarca.Text = marca.nombre; 
                }
            }

            protected void btnGuardar_Click(object sender, EventArgs e)
            {
         
                // Obtener el nombre de la marca ingresado en el TextBox
                string nombreMarca = txtNombreMarca.Text;

                // Validar que el nombre de la marca no esté vacío
                if (string.IsNullOrEmpty(nombreMarca))
                {
                    // Manejar caso en el que el nombre está vacío
                    // Puedes mostrar un mensaje de error o realizar alguna acción
                    return;
                }

                // Crear una instancia de la clase NegocioMarca (o similar) para manejar la lógica de negocio
                NegocioMarca negocioMarca = new NegocioMarca();

                try
                {
                    if (Request.QueryString["id"] != null)
                    {
                        // Actualizar la marca existente
                        string idMarca = Request.QueryString["id"];
                        if (!string.IsNullOrEmpty(idMarca))
                        {
                            Marca marca = new Marca
                            {
                                id = int.Parse(idMarca),
                                nombre = nombreMarca
                            };
                            negocioMarca.actualizar(marca);
                        }
                    }
                    else
                    {
                        // Agregar una nueva marca
                        Marca nuevaMarca = new Marca
                        {
                            nombre = nombreMarca
                        };
                        negocioMarca.agregar(nuevaMarca);
                    }

                    // Redirigir a la página de gestión de marcas en la misma ventana
                    Response.Redirect("Marcas.aspx");
                }
                catch (Exception ex)
                {
                    // Manejar la excepción mostrando un mensaje o registrándola
                    // ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                    // Puedes optar por registrar la excepción en un log en lugar de mostrarla en un alert
                    throw ex;
                }
            }
            protected void btnEliminar_Click(object sender, EventArgs e)
            {
                if (Request.QueryString["id"] != null)
                {
                    string idMarca = Request.QueryString["id"];
                    NegocioMarca negocioMarca = new NegocioMarca();
                    try
                    {
                        negocioMarca.eliminar(int.Parse(idMarca));
                        Response.Redirect("Marcas.aspx");

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