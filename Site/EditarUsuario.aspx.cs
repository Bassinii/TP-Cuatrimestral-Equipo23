using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Clases;
using Negocio;

namespace Site
{
    public partial class EditarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string idUsuario = Request.QueryString["id"].ToString();
                    CargarDatosUsuario(idUsuario);
                    btnEliminar.Visible = true;
                }
                else
                {
                    btnEliminar.Visible = false;
                }
            }
        }

        protected void CargarDatosUsuario(string idUsuario)
        {
            if (string.IsNullOrEmpty(idUsuario))
                return;

            int usuarioId;
            if (!int.TryParse(idUsuario, out usuarioId))
                return;

            NegocioUsuario negocioUsuario = new NegocioUsuario();
            Usuario usuario = negocioUsuario.ObtenerPorId(usuarioId);

            if (usuario != null)
            {
                txtUsuario.Text = usuario.UsuarioNombre;
                txtNombreCompleto.Text = usuario.NombreCompleto;
                txtCorreoElectronico.Text = usuario.CorreoElectronico;
                txtContrasenia.Attributes["value"] = usuario.Contrasenia; // Asignar valor a la contraseña
                ddlTipoUsuario.SelectedValue = usuario.TipoUsuario.ToString();
                // La contraseña generalmente no se muestra en la edición
            }
        }


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
                return;

            string usuario = txtUsuario.Text;
            string nombreCompleto = txtNombreCompleto.Text;
            TipoUsuario tipoUsuario = (TipoUsuario)Convert.ToInt32(ddlTipoUsuario.SelectedValue);
            string correoElectronico = txtCorreoElectronico.Text;
            string contrasenia = txtContrasenia.Text; // Obtener la nueva contraseña

            NegocioUsuario negocioUsuario = new NegocioUsuario();

            try
            {
                if (Request.QueryString["id"] != null)
                {
                    string idUsuario = Request.QueryString["id"];
                    if (!string.IsNullOrEmpty(idUsuario))
                    {
                        Usuario user = new Usuario
                        {
                            ID_Usuario = int.Parse(idUsuario),
                            UsuarioNombre = usuario,
                            NombreCompleto = nombreCompleto,
                            TipoUsuario = tipoUsuario,
                            CorreoElectronico = correoElectronico,
                            Contrasenia = contrasenia // Asignar la nueva contraseña
                        };
                        negocioUsuario.Actualizar(user);
                    }
                }
                else
                {
                    Usuario newUser = new Usuario
                    {
                        UsuarioNombre = usuario,
                        NombreCompleto = nombreCompleto,
                        TipoUsuario = tipoUsuario,
                        CorreoElectronico = correoElectronico,
                        Contrasenia = contrasenia // Asignar la contraseña al crear nuevo usuario
                    };
                    negocioUsuario.Agregar(newUser);
                }

                Response.Redirect("VentanaUsuarios.aspx");
            }
            catch (SqlException ex) when (ex.Number == 2601) // Número de error para violación de índice único
            {
                lblError.Text = "El Usuario ingresado ya se encuentra registrado.";
                lblError.Visible = true;
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.Message);
                // Manejar la excepción mostrando un mensaje o registrándola
                //throw ex;
            }
        }


        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                string idUsuario = Request.QueryString["id"];
                NegocioUsuario negocioUsuario = new NegocioUsuario();
                try
                {
                    negocioUsuario.Eliminar(int.Parse(idUsuario));
                    Response.Redirect("Usuarios.aspx");
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