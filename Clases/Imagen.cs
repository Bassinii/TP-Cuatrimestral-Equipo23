using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clases
{
    public class Imagen
    {
        public int id { get; set; }
        public int idArticulo { get; set; }
        public string url { get; set; }
        public Imagen(int idA, string urlImag, int _id)
        {
            this.id = _id;
            this.idArticulo = idA;
            this.url = urlImag;
        }
    }
}
