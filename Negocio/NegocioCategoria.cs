using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Clases;

namespace Negocio
{
    public class NegocioCategoria
    {
        public List<Categoria> List()
        {
            List<Categoria> lista = new List<Categoria>();
            AccesoDatos datosCategoria = new AccesoDatos();
            try
            {
                datosCategoria.setearConsulta("select * from Categorias");
                datosCategoria.ejecutarLectura();

                while (datosCategoria.Lector.Read())
                {
                    Categoria categoria = new Categoria();
                    categoria.id = datosCategoria.Lector.GetInt32(0);
                    categoria.nombre = datosCategoria.Lector["Nombre"].ToString();
                    lista.Add(categoria);

                }
                return lista;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                throw ex;

            }
        }
        public void agregar(Categoria nuevaCategoria)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Categorias (Nombre) VALUES (@nombre)");
                datos.setearParametro("@nombre", nuevaCategoria.nombre);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Categoria obtenerPorId(string idCategoria)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT * FROM Categorias WHERE ID_Categoria = @id");
                datos.setearParametro("@id", idCategoria);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    Categoria categoria = new Categoria();
                    categoria.id = datos.Lector.GetInt32(0);
                    categoria.nombre = datos.Lector["Nombre"].ToString();
                    return categoria;
                }
                else
                {
                    throw new Exception("No se encontró la Categoria con el ID proporcionado.");
                }
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.ToString());
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        public void actualizar(Categoria categoria)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Categorias SET Nombre = @nombre WHERE ID_Categoria = @id");
                datos.setearParametro("@nombre", categoria.nombre);
                datos.setearParametro("@id", categoria.id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                // MessageBox.Show(ex.ToString());
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        public void eliminar(int idCategoria)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("DELETE FROM Categorias WHERE ID_Categoria = @id");
                datos.setearParametro("@id", idCategoria);
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
