using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace Negocio
{
    public static class Validacion
    {
        public static bool validaTextoVacio(object control)
        {
           
            if(control is TextBox textBox)
            {
                //TextBox textBox = (TextBox)control;
                return !string.IsNullOrEmpty(textBox.Text);
            }
            return false;
        }
    }
}
