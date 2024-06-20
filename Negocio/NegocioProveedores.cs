using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Clases;

namespace Negocio
{
    public class NegocioProveedores
    {
        public List<Proveedores> listar()
        {
            List<Proveedores> lista = new List<Proveedores>();
            AccesoDatos datosProveedores = new AccesoDatos();
            try
            {
                datosProveedores.setearConsulta("select * from proveedores");
                datosProveedores.ejecutarLectura();

                while (datosProveedores.Lector.Read())
                {
                    Proveedores proveedor = new Proveedores();
                    proveedor.id = datosProveedores.Lector.GetInt32(0);
                    proveedor.direccion = datosProveedores.Lector["Direccion"].ToString();
                    proveedor.provincia = datosProveedores.Lector["Provincia"].ToString();
                    proveedor.email = datosProveedores.Lector["Mail"].ToString();
                    proveedor.telefono = datosProveedores.Lector["Telefono"].ToString();
                    lista.Add(proveedor);

                }
                return lista;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                throw ex;

            }
        }
        public void agregar(Proveedores nuevoProveedor)
        {
            AccesoDatos datosProveedores = new AccesoDatos();
            try
            {
                datosProveedores.setearConsulta("INSERT INTO Proveedores (Direccion, Provincia, Mail, Telefono) VALUES (@direccion, @provincia, @mail, @telefono)");
                datosProveedores.setearParametro("@direccion", nuevoProveedor.direccion);
                datosProveedores.setearParametro("@provincia", nuevoProveedor.provincia);
                datosProveedores.setearParametro("@mail", nuevoProveedor.email);
                datosProveedores.setearParametro("@telefono", nuevoProveedor.telefono);
                datosProveedores.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Proveedores obtenerPorId(string idProveedor)
        {
            AccesoDatos datosProveedores = new AccesoDatos();
            try
            {
                datosProveedores.setearConsulta("SELECT * FROM Proveedores WHERE ID_Proveedor = @id");
                datosProveedores.setearParametro("@id", idProveedor);
                datosProveedores.ejecutarLectura();

                if (datosProveedores.Lector.Read())
                {
                    Proveedores proveedor = new Proveedores();
                    proveedor.id = datosProveedores.Lector.GetInt32(0);
                    proveedor.direccion = datosProveedores.Lector["Direccion"].ToString();
                    proveedor.provincia = datosProveedores.Lector["Provincia"].ToString();
                    proveedor.email = datosProveedores.Lector["Mail"].ToString();
                    proveedor.telefono = datosProveedores.Lector["Telefono"].ToString();
                    return proveedor;
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
                datosProveedores.CerrarConexion();
            }
        }

        public void actualizar(Proveedores actualProveedor)
        {
            AccesoDatos datosProveedores = new AccesoDatos();
            try
            {
                datosProveedores.setearConsulta("INSERT INTO Proveedores (Direccion, Provincia, Mail, Telefono) VALUES (@direccion, @provincia, @mail, @telefono)");
                datosProveedores.setearParametro("@direccion", actualProveedor.direccion);
                datosProveedores.setearParametro("@provincia", actualProveedor.provincia);
                datosProveedores.setearParametro("@mail", actualProveedor.email);
                datosProveedores.setearParametro("@telefono", actualProveedor.telefono);
                datosProveedores.ejecutarAccion();
            }
            catch (Exception ex)
            {
                // MessageBox.Show(ex.ToString());
                throw ex;
            }
            finally
            {
                datosProveedores.CerrarConexion();
            }
        }

        public void eliminar(int idProveedor)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("DELETE FROM Marcas WHERE ID_Proveedor = @id");
                datos.setearParametro("@id", idProveedor);
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



