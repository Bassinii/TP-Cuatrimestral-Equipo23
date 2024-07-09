using Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Negocio
{
    public class NegocioImagen
    {
    
        public List<Imagen> listarPorArticulo(int idArticulo)
        {
            List<Imagen> lista = new List<Imagen>();
            AccesoDatos datosImagen = new AccesoDatos();
            try
            {
                datosImagen.setearConsulta("SELECT ID_Imagen, ID_Articulo, URL_Imagen FROM Imagenes WHERE ID_Articulo = @ID_Articulo");
                datosImagen.setearParametro("@ID_Articulo", idArticulo);
                datosImagen.ejecutarLectura();

                while (datosImagen.Lector.Read())
                {
                    Imagen aux = new Imagen(
                        datosImagen.Lector.GetInt32(1), 
                        datosImagen.Lector.GetString(2), 
                        datosImagen.Lector.GetInt32(0)  
                    );

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                throw ex;
            }
            finally
            {
                datosImagen.CerrarConexion();
            }
        }

     
        public void agregar(Imagen nuevaImagen)
        {
            AccesoDatos datosImagen = new AccesoDatos();
            try
            {
                datosImagen.setearConsulta("INSERT INTO Imagenes (ID_Articulo, URL_Imagen) VALUES (@ID_Articulo, @URL_Imagen)");
                datosImagen.setearParametro("@ID_Articulo", nuevaImagen.idArticulo);
                datosImagen.setearParametro("@URL_Imagen", nuevaImagen.url);

                datosImagen.ejecutarAccion();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                throw ex;
            }
            finally
            {
                datosImagen.CerrarConexion();
            }
        }

        public void actualizar(Imagen imagen)
        {
            AccesoDatos datosImagen = new AccesoDatos();
            try
            {
                datosImagen.setearConsulta("UPDATE Imagenes SET ID_Articulo = @ID_Articulo, URL_Imagen = @URL_Imagen WHERE ID_Imagen = @ID_Imagen");
                datosImagen.setearParametro("@ID_Articulo", imagen.idArticulo);
                datosImagen.setearParametro("@URL_Imagen", imagen.url);
                datosImagen.setearParametro("@ID_Imagen", imagen.id);

                datosImagen.ejecutarAccion();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                throw ex;
            }
            finally
            {
                datosImagen.CerrarConexion();
            }
        }

        public void eliminar(int idImagen)
        {
            AccesoDatos datosImagen = new AccesoDatos();
            try
            {
                datosImagen.setearConsulta("DELETE FROM Imagenes WHERE ID_Imagen = @ID_Imagen");
                datosImagen.setearParametro("@ID_Imagen", idImagen);

                datosImagen.ejecutarAccion();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                throw ex;
            }
            finally
            {
                datosImagen.CerrarConexion();
            }
        }
    }
}
