using Clases;
using System;
using System.Collections.Generic;
using System.Windows;

namespace Negocio
{
    public class NegocioCliente
    {
        public List<Cliente> listar()
        {
            List<Cliente> lista = new List<Cliente>();
            AccesoDatos datosCliente = new AccesoDatos();
            try
            {
                datosCliente.setearConsulta("SELECT * FROM Clientes");
                datosCliente.ejecutarLectura();

                while (datosCliente.Lector.Read())
                {
                    Cliente cliente = new Cliente();
                    cliente.id = datosCliente.Lector.GetInt32(0);
                    cliente.nombre = datosCliente.Lector["Nombre"].ToString();
                    cliente.apellido = datosCliente.Lector["Apellido"].ToString();
                    cliente.direccion = datosCliente.Lector["Direccion"].ToString();
                    cliente.mail = datosCliente.Lector["Mail"].ToString();
                    cliente.telefono = datosCliente.Lector["Telefono"].ToString();
                    lista.Add(cliente);
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
                datosCliente.CerrarConexion();
            }
        }
        public void agregar(Cliente nuevoCliente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Clientes (Nombre, Apellido, Direccion, Mail, Telefono) VALUES (@nombre, @apellido, @direccion, @mail, @telefono)");
                datos.setearParametro("@nombre", nuevoCliente.nombre);
                datos.setearParametro("@apellido", nuevoCliente.apellido);
                datos.setearParametro("@direccion", nuevoCliente.direccion);
                datos.setearParametro("@mail", nuevoCliente.mail);
                datos.setearParametro("@telefono", nuevoCliente.telefono);
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
        public Cliente obtenerPorId(string idCliente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT * FROM Clientes WHERE ID_Cliente = @id");
                datos.setearParametro("@id", idCliente);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    Cliente cliente = new Cliente();
                    cliente.id = datos.Lector.GetInt32(0);
                    cliente.nombre = datos.Lector["Nombre"].ToString();
                    cliente.apellido = datos.Lector["Apellido"].ToString();
                    cliente.direccion = datos.Lector["Direccion"].ToString();
                    cliente.mail = datos.Lector["Mail"].ToString();
                    cliente.telefono = datos.Lector["Telefono"].ToString();
                    return cliente;
                }
                else
                {
                    throw new Exception("No se encontró el cliente con el ID proporcionado.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public void actualizar(Cliente cliente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Clientes SET Nombre = @nombre, Apellido = @apellido, Direccion = @direccion, Mail = @mail, Telefono = @telefono WHERE ID_Cliente = @id");
                datos.setearParametro("@nombre", cliente.nombre);
                datos.setearParametro("@apellido", cliente.apellido);
                datos.setearParametro("@direccion", cliente.direccion);
                datos.setearParametro("@mail", cliente.mail);
                datos.setearParametro("@telefono", cliente.telefono);
                datos.setearParametro("@id", cliente.id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        public void eliminar(int idCliente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("DELETE FROM Clientes WHERE ID_Cliente = @id");
                datos.setearParametro("@id", idCliente);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public List<Cliente> listarPorNombre(string nombre)
        {
            List<Cliente> lista = new List<Cliente>();
            AccesoDatos datosCliente = new AccesoDatos();
            try
            {
                datosCliente.setearConsulta($"SELECT * FROM Clientes where Nombre LIKE '{nombre}%'");
                datosCliente.ejecutarLectura();

                while (datosCliente.Lector.Read())
                {
                    Cliente cliente = new Cliente();
                    cliente.id = datosCliente.Lector.GetInt32(0);
                    cliente.nombre = datosCliente.Lector["Nombre"].ToString();
                    cliente.apellido = datosCliente.Lector["Apellido"].ToString();
                    cliente.direccion = datosCliente.Lector["Direccion"].ToString();
                    cliente.mail = datosCliente.Lector["Mail"].ToString();
                    cliente.telefono = datosCliente.Lector["Telefono"].ToString();
                    lista.Add(cliente);
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
                datosCliente.CerrarConexion();
            }
        }
    }
}
