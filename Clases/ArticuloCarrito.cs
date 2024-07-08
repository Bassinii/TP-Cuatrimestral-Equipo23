using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clases
{
    public class ArticuloCarrito : Articulo
    {
        public int cantidad { get; set; }

        public ArticuloCarrito(Articulo articulo)
        {

            this.id = articulo.id;
            this.nombre = articulo.nombre;
            this.precio = articulo.precio;
            this.categoria = articulo.categoria;
            this.stock = articulo.stock;
            this.marca = articulo.marca;
            this.imagenes = articulo.imagenes;
            this.cantidad = 1;

        }
    }
}
