using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clases
{
    public enum TipoUsuario
    {
        ADMIN = 1,
        VENTAS = 2
    }
     public class Usuario
     {
        public int ID_Usuario { get; set; }
        public string UsuarioNombre { get; set; }
        public string NombreCompleto { get; set; }
        public string Contrasenia { get; set; }
        public TipoUsuario TipoUsuario { get; set; }
        public string CorreoElectronico { get; set; }

        public Usuario() { }
        public Usuario(string usuarioNombre, string contrasenia, bool esAdmin )
        {
            UsuarioNombre = usuarioNombre;
            //NombreCompleto = nombreCompleto;
            Contrasenia = contrasenia;
            TipoUsuario = esAdmin ? TipoUsuario.ADMIN : TipoUsuario.VENTAS;
            //CorreoElectronico = correoElectronico;
        }
    }

}
