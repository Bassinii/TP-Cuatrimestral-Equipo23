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

        }
        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            // Obtener el nombre de la marca ingresado en el modal
            string nombreMarca = Request.Form["nombreMarca"];

            // Validar que el nombre de la marca no esté vacío
            if (string.IsNullOrEmpty(nombreMarca))
            {
                // Manejar caso en el que el nombre está vacío
                // Puedes mostrar un mensaje de error o realizar alguna acción
                return;
            }

            // Crear una instancia de la clase NegocioMarca (o similar) para manejar la lógica de negocio
            NegocioMarca negocioMarca = new NegocioMarca();

            // Crear un objeto Marca con los datos ingresados
            Marca nuevaMarca = new Marca
            {
                nombre = nombreMarca
                // Puedes agregar más propiedades si es necesario
            };

            // Llamar al método agregar de NegocioMarca para insertar la marca
            try
            {
                negocioMarca.agregar(nuevaMarca);
                // Si se guarda exitosamente, puedes realizar alguna acción como recargar la lista de marcas
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch (Exception ex)
            {
                // Manejar el error
                // Puedes mostrar un mensaje de error o realizar alguna acción
                throw ex;
            }
        }
    }
}
