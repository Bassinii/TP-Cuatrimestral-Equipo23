using Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioUsuario
    {
        public bool Loguear(Usuario usuario)
        {
            AccesoDatos datos= new AccesoDatos();
            try
            {
                datos.setearConsulta("select ID_Usuario,TipoUsuario from Usuarios where Usuario= @usuario and Contrasenia = @contrasenia");
                datos.setearParametro ("@usuario", usuario.UsuarioNombre);
                datos.setearParametro("@contrasenia", usuario.Contrasenia);

                datos.ejecutarLectura();
                while(datos.Lector.Read())
                {
                    usuario.ID_Usuario = (int)datos.Lector["ID_Usuario"];
                    usuario.TipoUsuario = (int)(datos.Lector["TipoUsuario"]) == 1 ? TipoUsuario.VENTAS : TipoUsuario.ADMIN;
                    return true;
                }
                return false;
            }

            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
    }
}
