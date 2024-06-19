using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clases
{
    public class Articulo
    {
        public int id { get; set; }
        public int stock { get; set; }
        public float precio { get; set; }
        public List<Imagen> imagenes { get; set; }
        public Marca marca { get; set; } = new Marca();   
        public Categoria categoria { get; set; } = new Categoria();    

       
    }
}
