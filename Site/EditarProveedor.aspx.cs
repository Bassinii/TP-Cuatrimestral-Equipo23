using System;
using System.Web.UI;
using Clases;
using Negocio;

namespace Site
{
    public partial class EditarProveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string idProveedor = Request.QueryString["id"];
                    CargarDatosProveedor(idProveedor);
                    btnEliminar.Visible = true;
                }
                else
                {
                    btnEliminar.Visible = false;
                }
            }
        }

        protected void CargarDatosProveedor(string idProveedor)
        {
            NegocioProveedores negocioProveedor = new NegocioProveedores();
            Proveedores auxProveedor = negocioProveedor.obtenerPorId(idProveedor);

            if (auxProveedor != null)
            {
                txtDireccion.Text = auxProveedor.direccion;
                txtProvincia.Text = auxProveedor.provincia;
                txtEmail.Text = auxProveedor.email;
                txtTelefono.Text = auxProveedor.telefono.ToString();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string direccion = txtDireccion.Text;
            string provincia = txtProvincia.Text;
            string email = txtEmail.Text;
            string telefono = txtTelefono.Text;


            if (string.IsNullOrEmpty(direccion) || string.IsNullOrEmpty(provincia) || string.IsNullOrEmpty(email))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Por favor, complete todos los campos obligatorios.');", true);
                return;
            }



            NegocioProveedores negocioProveedor = new NegocioProveedores();

            try
            {
                if (Request.QueryString["id"] != null)
                {
                    string idProveedor = Request.QueryString["id"];
                    if (!string.IsNullOrEmpty(idProveedor))
                    {
                        Proveedores proveedor = new Proveedores()
                        {
                            id = int.Parse(idProveedor),
                            direccion = direccion,
                            provincia = provincia,
                            email = email,
                            telefono = telefono
                        };
                        negocioProveedor.actualizar(proveedor);
                    }
                }
                else
                {
                    Proveedores nuevoProveedor = new Proveedores()
                    {
                        direccion = direccion,
                        provincia = provincia,
                        email = email,
                        telefono = telefono
                    };
                    negocioProveedor.agregar(nuevoProveedor);
                }

                Response.Redirect("ProveedoresGestion.aspx");
            }
            catch (Exception ex)
            {
                // Manejo de errores apropiado
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                string idProveedor = Request.QueryString["id"];
                NegocioProveedores negocioProveedor = new NegocioProveedores();
                try
                {
                    negocioProveedor.eliminar(int.Parse(idProveedor));
                    Response.Redirect("ProveedoresGestion.aspx");
                }
                catch (Exception ex)
                {
                    // Manejo de errores apropiado
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
            }
        }
    }
}
