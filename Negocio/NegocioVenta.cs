using Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Negocio
{
    public class NegocioVenta
    {
        public List<Venta> listar()
        {
            List<Venta> lista = new List<Venta>();
            AccesoDatos datosVenta = new AccesoDatos();
            try
            {
                datosVenta.setearConsulta("SELECT ID_Venta, ID_Empleado, ID_Cliente, Fecha, Hora, Subtotal, Total, EsPedidosYa FROM Ventas");
                datosVenta.ejecutarLectura();

                while (datosVenta.Lector.Read())
                {
                    Venta aux = new Venta();
                    aux.id = datosVenta.Lector.GetInt32(0);
                    aux.idEmpleado = datosVenta.Lector.GetInt32(1);
                    aux.idCliente = datosVenta.Lector.GetInt32(2);
                    aux.fecha = datosVenta.Lector.GetDateTime(3);
                    aux.hora = datosVenta.Lector.GetTimeSpan(4);
                    aux.subtotal = (float)datosVenta.Lector.GetDecimal(5);
                    aux.total = (float)datosVenta.Lector.GetDecimal(6);
                    aux.esPedidosYa = datosVenta.Lector.GetBoolean(7);

                    // Obtener los detalles de la venta y asignarlos
                    //aux.ListDetalleVenta = listarDetalles(aux.id);

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
                datosVenta.CerrarConexion();
            }
        }

        // Método para obtener detalles de ventas
        private List<DetalleVenta> listarDetalles(int idVenta)
        {
            List<DetalleVenta> listaDetalles = new List<DetalleVenta>();
            AccesoDatos datosDetalleVenta = new AccesoDatos();
            try
            {
                datosDetalleVenta.setearConsulta("SELECT ID_Detalle, ID_Venta, ID_Articulo, Cantidad, Precio_Unitario, Porcentaje_Descuento FROM DetallesVentas WHERE ID_Venta = @idVenta");
                datosDetalleVenta.setearParametro("@idVenta", idVenta);
                datosDetalleVenta.ejecutarLectura();

                while (datosDetalleVenta.Lector.Read())
                {
                    DetalleVenta detalle = new DetalleVenta();
                    detalle.id = datosDetalleVenta.Lector.GetInt32(0);
                    detalle.idVenta = datosDetalleVenta.Lector.GetInt32(1);
                    detalle.idArticulo = datosDetalleVenta.Lector.GetInt32(2);
                    detalle.cantidad = datosDetalleVenta.Lector.GetInt32(3);
                    detalle.precioUnitario = (float)datosDetalleVenta.Lector.GetDecimal(4);
                    detalle.porcentajeDescuento = datosDetalleVenta.Lector.IsDBNull(5) ? 0 : (float)datosDetalleVenta.Lector.GetDecimal(5); // Manejo de valores nulos

                    listaDetalles.Add(detalle);
                }

                return listaDetalles;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                throw ex;
            }
            finally
            {
                datosDetalleVenta.CerrarConexion();
            }
        }
        public void agregar(Venta nuevaVenta)
        {
            AccesoDatos datosVenta = new AccesoDatos();
            try
            {
                datosVenta.setearConsulta("INSERT INTO Ventas (ID_Empleado, ID_Cliente, Subtotal, Total, EsPedidosYa) VALUES (@ID_Empleado, @ID_Cliente, @Subtotal, @Total, @EsPedidosYa)");
                datosVenta.setearParametro("@ID_Empleado", nuevaVenta.idEmpleado);
                datosVenta.setearParametro("@ID_Cliente", nuevaVenta.idCliente);
                datosVenta.setearParametro("@Subtotal", nuevaVenta.subtotal);
                datosVenta.setearParametro("@Total", nuevaVenta.total);
                datosVenta.setearParametro("@EsPedidosYa", nuevaVenta.esPedidosYa);

                datosVenta.ejecutarAccion();

                // Obtener el ID de la venta recién insertada
                //nuevaVenta.id = datosVenta.obtenerUltimoIDInsertado();

                // Insertar los detalles de la venta
                //foreach (DetalleVenta detalle in nuevaVenta.ListDetalleVenta)
                //{
                //    agregarDetalleVenta(detalle, nuevaVenta.id);
                //}
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                throw ex;
            }
            finally
            {
                datosVenta.CerrarConexion();
            }
        }
    }
}
