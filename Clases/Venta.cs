using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clases
{
    public class Venta
    {
        public int id { get; set; }
        public int idEmpleado { get; set; }
        public int idCliente { get; set; }
        public DateTime fecha { get; set; }
        public TimeSpan hora { get; set; }
        public float subtotal { get; set; }
        public float total { get; set; }
        public bool esPedidosYa { get; set; }
        //public List<DetalleVenta> ListDetalleVenta { get; set; }
    }
}
