using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Clases;

namespace Negocio
{
    class NegocioArticulo
    {
        public List<Articulo> listar()
        {

            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datosArticulo = new AccesoDatos();
            try
            {
                datosArticulo.setearConsulta("SELECT A.ID_Articulo, A.Stock, A.Nombre, A.Precio_Unitario, M.Nombre AS Marca, C.Nombre AS Categoria FROM ARTICULOS A LEFT JOIN Categorias C ON A.ID_Categoria = C.ID_Categoria LEFT JOIN Marcas M ON A.ID_Marca = M.ID_Marca");
                datosArticulo.ejecutarLectura();

                while (datosArticulo.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.id = datosArticulo.Lector.GetInt32(0);
                    aux.stock = datosArticulo.Lector.GetInt32(1);
                    aux.precio = datosArticulo.Lector.GetFloat(2);
                   /// aux.imagenes = (string)datosArticulo.Lector["Descripcion"];
                    aux.marca = new Marca { nombre = (string)datosArticulo.Lector["Marca"], id = datosArticulo.Lector.GetInt32(2) };
                    string categoria = string.Empty;
                    if (!datosArticulo.Lector.IsDBNull(datosArticulo.Lector.GetOrdinal("Categoria")))
                    {
                      
                        aux.categoria = new Categoria { nombre = (string)datosArticulo.Lector["Categoria"], id = datosArticulo.Lector.GetInt32(8) };
                      }
                    else
                    {
                        categoria = "Sin categoría";
                        aux.categoria = new Categoria { nombre = categoria };
                    }

                    aux.precio = (float)datosArticulo.Lector.GetDecimal(6);
                    aux.imagenes = GetImagenes(aux.id); 
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
                datosArticulo.CerrarConexion();
            }
        }

        public List<Imagen> GetImagenes(int idArti)
        {
            List<Imagen> lista = new List<Imagen>();
            AccesoDatos datosArticulo = new AccesoDatos();
            try
            {         
                datosArticulo.setearConsulta("SELECT ImagenUrl FROM IMAGENES WHERE IdArticulo = @IdArticulo");
                datosArticulo.setearParametro("@IdArticulo", idArti);
                datosArticulo.ejecutarLectura();

                while (datosArticulo.Lector.Read())
                {
                    string urlImagen = (string)datosArticulo.Lector["ImagenUrl"];
                    Imagen imagen = new Imagen(idArti, urlImagen);
                    lista.Add(imagen);
                }

                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
