using Clases;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            NegocioUsuario negocio = new NegocioUsuario();

            try
            {
                usuario = new Usuario(TextBoxUsuario.Text, TextBoxPassword.Text, false);
                if(negocio.Loguear(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("MenuLogin.aspx", false);
                }
                else
                {
                    Session["error"] = "Usuario o contraseña incorrectos";
                    Response.Redirect("Error.aspx", false);
                }

            }
            catch (Exception ex)
            {

                Session["error"] = ex.ToString();
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}