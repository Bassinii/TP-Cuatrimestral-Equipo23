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
                    usuario.TipoUsuario = (int)(datos.Lector["TipoUsuario"]) == 1 ? TipoUsuario.ADMIN : TipoUsuario.VENTAS;
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

        public List<Usuario> Listar()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datosUsuarios = new AccesoDatos();
            try
            {
                datosUsuarios.setearConsulta("SELECT * FROM Usuarios");
                datosUsuarios.ejecutarLectura();

                while (datosUsuarios.Lector.Read())
                {
                    Usuario usuario = new Usuario();
                    usuario.ID_Usuario = datosUsuarios.Lector.GetInt32(0);
                    usuario.UsuarioNombre = datosUsuarios.Lector["Usuario"].ToString();
                    usuario.NombreCompleto = datosUsuarios.Lector["NombreCompleto"].ToString();
                    usuario.Contrasenia = datosUsuarios.Lector["Contrasenia"].ToString();
                    usuario.TipoUsuario = (TipoUsuario)datosUsuarios.Lector.GetInt32(datosUsuarios.Lector.GetOrdinal("TipoUsuario"));
                    usuario.CorreoElectronico = datosUsuarios.Lector["CorreoElectronico"].ToString();
                    lista.Add(usuario);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<Usuario> listarPorNombre(string nombre)
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datosUsuarios = new AccesoDatos();
            try
            {
                datosUsuarios.setearConsulta($"SELECT * FROM Usuarios where NombreCompleto LIKE '{nombre}%'");
                datosUsuarios.ejecutarLectura();

                while (datosUsuarios.Lector.Read())
                {
                    Usuario usuario = new Usuario();
                    usuario.ID_Usuario = datosUsuarios.Lector.GetInt32(0);
                    usuario.UsuarioNombre = datosUsuarios.Lector["Usuario"].ToString();
                    usuario.NombreCompleto = datosUsuarios.Lector["NombreCompleto"].ToString();
                    usuario.TipoUsuario = (TipoUsuario)datosUsuarios.Lector.GetInt32(datosUsuarios.Lector.GetOrdinal("TipoUsuario"));
                    usuario.CorreoElectronico = datosUsuarios.Lector["CorreoElectronico"].ToString();
                    lista.Add(usuario);
                    
                }
                return lista;
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show(ex.ToString());
                throw ex;
            }
            finally
            {
                datosUsuarios.CerrarConexion();
            }
        }

        public void Agregar(Usuario nuevoUsuario)
        {
            AccesoDatos datosUsuarios = new AccesoDatos();
            try
            {
                datosUsuarios.setearConsulta("INSERT INTO Usuarios (Usuario, NombreCompleto, Contrasenia, TipoUsuario, CorreoElectronico) VALUES (@usuario, @nombreCompleto, @contrasenia, @tipoUsuario, @correoElectronico)");
                datosUsuarios.setearParametro("@usuario", nuevoUsuario.UsuarioNombre);
                datosUsuarios.setearParametro("@nombreCompleto", nuevoUsuario.NombreCompleto);
                datosUsuarios.setearParametro("@contrasenia", nuevoUsuario.Contrasenia);
                datosUsuarios.setearParametro("@tipoUsuario", nuevoUsuario.TipoUsuario);
                datosUsuarios.setearParametro("@correoElectronico", nuevoUsuario.CorreoElectronico);
                datosUsuarios.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Usuario ObtenerPorId(int idUsuario)
        {
            AccesoDatos datosUsuarios = new AccesoDatos();
            try
            {
                datosUsuarios.setearConsulta("SELECT * FROM Usuarios WHERE ID_Usuario = @id");
                datosUsuarios.setearParametro("@id", idUsuario);
                datosUsuarios.ejecutarLectura();

                if (datosUsuarios.Lector.Read())
                {
                    Usuario usuario = new Usuario();
                    usuario.ID_Usuario = datosUsuarios.Lector.GetInt32(0);
                    usuario.UsuarioNombre = datosUsuarios.Lector["Usuario"].ToString();
                    usuario.NombreCompleto = datosUsuarios.Lector["NombreCompleto"].ToString();
                    usuario.Contrasenia = datosUsuarios.Lector["Contrasenia"].ToString();
                    usuario.TipoUsuario = (TipoUsuario)datosUsuarios.Lector.GetInt32(datosUsuarios.Lector.GetOrdinal("TipoUsuario"));
                    usuario.CorreoElectronico = datosUsuarios.Lector["CorreoElectronico"].ToString();
                    return usuario;
                }
                else
                {
                    throw new Exception("No se encontró el usuario con el ID proporcionado.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datosUsuarios.CerrarConexion();
            }
        }

        public void Actualizar(Usuario usuarioActual)
        {
            AccesoDatos datosUsuarios = new AccesoDatos();
            try
            {
                datosUsuarios.setearConsulta("UPDATE Usuarios SET Usuario = @usuario, NombreCompleto = @nombreCompleto, Contrasenia = @contrasenia, TipoUsuario = @tipoUsuario, CorreoElectronico = @correoElectronico WHERE ID_Usuario = @id");
                datosUsuarios.setearParametro("@usuario", usuarioActual.UsuarioNombre);
                datosUsuarios.setearParametro("@nombreCompleto", usuarioActual.NombreCompleto);
                datosUsuarios.setearParametro("@contrasenia", usuarioActual.Contrasenia);
                datosUsuarios.setearParametro("@tipoUsuario", usuarioActual.TipoUsuario);
                datosUsuarios.setearParametro("@correoElectronico", usuarioActual.CorreoElectronico);
                datosUsuarios.setearParametro("@id", usuarioActual.ID_Usuario);
                datosUsuarios.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datosUsuarios.CerrarConexion();
            }
        }

        public void Eliminar(int idUsuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("DELETE FROM Usuarios WHERE ID_Usuario = @id");
                datos.setearParametro("@id", idUsuario);
                datos.ejecutarAccion();
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
    

