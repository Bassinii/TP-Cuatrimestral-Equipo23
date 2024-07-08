using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clases
{
    public class DetalleVenta
    {
        public int id { get; set; }
        public int idVenta { get; set; }
        public int idArticulo { get; set; }
        public int cantidad { get; set; }
        public float precioUnitario { get; set; }
        public float porcentajeDescuento { get; set; }
    }
}
