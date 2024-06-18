using Clases;
using System;
using System.Collections.Generic;
using System.Windows;

namespace Negocio
{
    public class NegocioMarca

    {
        public List<Marca> listar()
        {
            List<Marca> lista = new List<Marca>();
            AccesoDatos datosMarca = new AccesoDatos();
            try
            {
                datosMarca.setearConsulta("select * from marcas");
                datosMarca.ejecutarLectura();

                while (datosMarca.Lector.Read())
                { 
                    Marca marcas = new Marca();
                    marcas.id = datosMarca.Lector.GetInt32(0);
                    marcas.nombre = datosMarca.Lector["Nombre"].ToString();
                    lista.Add(marcas);

                }
                return lista;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                throw ex;
                
            }
        }
        public void agregar(Marca nuevaMarca)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Marcas (Nombre) VALUES (@nombre)");
                datos.setearParametro("@nombre", nuevaMarca.nombre);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Marca obtenerPorId(string idMarca)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT * FROM Marcas WHERE ID_Marca = @id");
                datos.setearParametro("@id", idMarca);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    Marca marca = new Marca();
                    marca.id = datos.Lector.GetInt32(0);
                    marca.nombre = datos.Lector["Nombre"].ToString();
                    return marca;
                }
                else
                {
                    throw new Exception("No se encontró la marca con el ID proporcionado.");
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

        public void actualizar(Marca marca)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Marcas SET Nombre = @nombre WHERE ID_Marca = @id");
                datos.setearParametro("@nombre", marca.nombre);
                datos.setearParametro("@id", marca.id);
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

        public void eliminar(int idMarca)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("DELETE FROM Marcas WHERE ID_Marca = @id");
                datos.setearParametro("@id", idMarca);
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
