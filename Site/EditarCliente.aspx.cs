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
    public partial class EditarCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string idCliente = Request.QueryString["id"].ToString();
                    CargarDatosCliente(idCliente);
                    btnEliminar.Visible = true;
                }
                else
                {
                    btnEliminar.Visible = false;
                }
            }
        }

        protected void CargarDatosCliente(string idCliente)
        {
            NegocioCliente negocioCliente = new NegocioCliente();
            Cliente cliente = negocioCliente.obtenerPorId(idCliente);

            if (cliente != null)
            {
                txtNombre.Text = cliente.nombre;
                txtApellido.Text = cliente.apellido;
                txtDireccion.Text = cliente.direccion;
                txtMail.Text = cliente.mail;
                txtTelefono.Text = cliente.telefono;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string direccion = txtDireccion.Text;
            string mail = txtMail.Text;
            string telefono = txtTelefono.Text;

            if (string.IsNullOrEmpty(nombre) || string.IsNullOrEmpty(apellido) || string.IsNullOrEmpty(direccion) || string.IsNullOrEmpty(mail) || string.IsNullOrEmpty(telefono))
            {
                // Manejar caso en el que alguno de los campos está vacío
                return;
            }

            NegocioCliente negocioCliente = new NegocioCliente();

            try
            {
                if (Request.QueryString["id"] != null)
                {
                    string idCliente = Request.QueryString["id"];
                    if (!string.IsNullOrEmpty(idCliente))
                    {
                        Cliente cliente = new Cliente
                        {
                            id = int.Parse(idCliente),
                            nombre = nombre,
                            apellido = apellido,
                            direccion = direccion,
                            mail = mail,
                            telefono = telefono
                        };
                        negocioCliente.actualizar(cliente);
                    }
                }
                else
                {
                    Cliente nuevoCliente = new Cliente
                    {
                        nombre = nombre,
                        apellido = apellido,
                        direccion = direccion,
                        mail = mail,
                        telefono = telefono
                    };
                    negocioCliente.agregar(nuevoCliente);
                }

                Response.Redirect("Clientes.aspx");
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
                string idCliente = Request.QueryString["id"];
                NegocioCliente negocioCliente = new NegocioCliente();
                try
                {
                    negocioCliente.eliminar(int.Parse(idCliente));
                    Response.Redirect("Clientes.aspx");
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