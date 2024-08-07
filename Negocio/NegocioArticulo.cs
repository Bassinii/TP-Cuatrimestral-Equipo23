﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Clases;

namespace Negocio
{
    public class NegocioArticulo
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
                    aux.nombre = datosArticulo.Lector.GetString(2);
                    aux.precio = (float)datosArticulo.Lector.GetDecimal(3);
                    aux.marca = new Marca { nombre = datosArticulo.Lector.GetString(4) };

                    // Ajustar los índices de acuerdo a las columnas seleccionadas en la consulta
                    if (!datosArticulo.Lector.IsDBNull(5))
                    {
                        aux.categoria = new Categoria { nombre = datosArticulo.Lector.GetString(5) };
                    }
                    else
                    {
                        aux.categoria = new Categoria { nombre = "Sin categoría" };
                    }

                    // Obtener las imágenes para este artículo
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
                datosArticulo.setearConsulta("SELECT URL_Imagen, ID_Imagen FROM IMAGENES WHERE ID_Articulo = @ID_Articulo");
                datosArticulo.setearParametro("@ID_Articulo", idArti);
                datosArticulo.ejecutarLectura();

                while (datosArticulo.Lector.Read())
                {
                    string URL_Imagen = datosArticulo.Lector.GetString(0); // Asegurarse del índice correcto
                    int ID_Imagen = datosArticulo.Lector.GetInt32(1); // Asegurarse del índice correcto
                    Imagen imagen = new Imagen(idArti, URL_Imagen, ID_Imagen);
                    lista.Add(imagen);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datosArticulo.CerrarConexion();
            }
        }


        public void agregar(Articulo nuevoArticulo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO ARTICULOS (Stock, Nombre, Precio_Unitario, ID_Marca, ID_Categoria) VALUES (@stock, @nombre, @precio, @idMarca, @idCategoria)");
                datos.setearParametro("@stock", nuevoArticulo.stock);
                datos.setearParametro("@nombre", nuevoArticulo.nombre);
                datos.setearParametro("@precio", nuevoArticulo.precio);
                datos.setearParametro("@idMarca", nuevoArticulo.marca.id);
                datos.setearParametro("@idCategoria", nuevoArticulo.categoria.id);
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

        public Articulo ObtenerPorId(string idArticulos)
        {
            AccesoDatos datosArticulo = new AccesoDatos();
            try
            {
                datosArticulo.setearConsulta("SELECT A.ID_Articulo, A.Stock, A.Nombre, A.Precio_Unitario, M.ID_Marca, M.Nombre AS Marca, C.ID_Categoria, C.Nombre AS Categoria FROM ARTICULOS A LEFT JOIN Categorias C ON A.ID_Categoria = C.ID_Categoria LEFT JOIN Marcas M ON A.ID_Marca = M.ID_Marca WHERE A.ID_Articulo = @id");
                datosArticulo.setearParametro("@id", idArticulos);
                datosArticulo.ejecutarLectura();

                if (datosArticulo.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.id = datosArticulo.Lector.GetInt32(0);
                    aux.stock = datosArticulo.Lector.GetInt32(1);
                    aux.nombre = datosArticulo.Lector.GetString(2);
                    aux.precio = (float)datosArticulo.Lector.GetDecimal(3);
                    aux.marca = new Marca { id = datosArticulo.Lector.GetInt32(4), nombre = datosArticulo.Lector.GetString(5) };

                    if (!datosArticulo.Lector.IsDBNull(7))
                    {
                        aux.categoria = new Categoria { id = datosArticulo.Lector.GetInt32(6), nombre = datosArticulo.Lector.GetString(7) };
                    }
                    else
                    {
                        aux.categoria = new Categoria { nombre = "Sin categoría" };
                    }

                    // Obtener las imágenes para este artículo
                    aux.imagenes = GetImagenes(aux.id);

                    return aux;
                }
                else
                {
                    throw new Exception("No se encontró el articulo con el ID proporcionado.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datosArticulo.CerrarConexion();
            }
        }


        public void actualizar(Articulo nuevoArticulo)
        {
            AccesoDatos datosArticulo = new AccesoDatos();
            try
            {
                datosArticulo.setearConsulta("UPDATE ARTICULOS SET Stock = @stock, Nombre = @nombre, Precio_Unitario = @precio, ID_Marca = @idMarca, ID_Categoria = @idCategoria WHERE ID_Articulo = @id");
                datosArticulo.setearParametro("@stock", nuevoArticulo.stock);
                datosArticulo.setearParametro("@nombre", nuevoArticulo.nombre);
                datosArticulo.setearParametro("@precio", nuevoArticulo.precio);
                datosArticulo.setearParametro("@idMarca", nuevoArticulo.marca.id);
                datosArticulo.setearParametro("@idCategoria", nuevoArticulo.categoria.id);
                datosArticulo.setearParametro("@id", nuevoArticulo.id);
                datosArticulo.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datosArticulo.CerrarConexion();
            }
        }

        public void eliminar(int idArticulo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("DELETE FROM Articulos WHERE ID_Articulo = @id");
                datos.setearParametro("@id", idArticulo);
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

        public List<Articulo> listarPorNombre(string nombre)
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datosArticulo = new AccesoDatos();
            try
            {
                datosArticulo.setearConsulta($"SELECT A.ID_Articulo, A.Stock, A.Nombre, A.Precio_Unitario, M.Nombre AS Marca, C.Nombre AS Categoria " +
                                             $"FROM ARTICULOS A " +
                                             $"LEFT JOIN Categorias C ON A.ID_Categoria = C.ID_Categoria " +
                                             $"LEFT JOIN Marcas M ON A.ID_Marca = M.ID_Marca " +
                                             $"WHERE A.Nombre LIKE '{nombre}%'");
                datosArticulo.ejecutarLectura();

                while (datosArticulo.Lector.Read())
                {
                    Articulo articulo = new Articulo();
                    articulo.id = datosArticulo.Lector.GetInt32(0);
                    articulo.stock = datosArticulo.Lector.GetInt32(1);
                    articulo.nombre = datosArticulo.Lector.GetString(2);
                    articulo.precio = (float)datosArticulo.Lector.GetDecimal(3);

                    articulo.marca = new Marca { nombre = datosArticulo.Lector.GetString(4) };
                    articulo.categoria = new Categoria { nombre = datosArticulo.Lector.GetString(5) };

                    // Obtener las imágenes para este artículo
                    articulo.imagenes = GetImagenes(articulo.id);

                    lista.Add(articulo);
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
    }
}
