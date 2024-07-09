using Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public static class Vistas
    {
        public static List<string> ObtenerVistas(Usuario usuario)
        {
            List<string> vistasDisponibles = new List<string>();

            // Por defecto, todos los usuarios tienen acceso al inicio y al login
            if(usuario == null)
            {
                //vistasDisponibles.Add("Default.aspx");
                vistasDisponibles.Add("Login.aspx");
                return vistasDisponibles;
            }

            // Según el tipo de usuario, agregamos las vistas correspondientes
            if (usuario.TipoUsuario == TipoUsuario.ADMIN)// ADMIN
            {
                vistasDisponibles.Add("Default.aspx");
                vistasDisponibles.Add("Ventas.aspx");
                vistasDisponibles.Add("Articulos.aspx");
                vistasDisponibles.Add("Marcas.aspx");
                vistasDisponibles.Add("Categorias.aspx");
                vistasDisponibles.Add("Clientes.aspx");
                vistasDisponibles.Add("ProveedoresGestion.aspx");
                vistasDisponibles.Add("VentanaUsuarios.aspx");
            }
            else if (usuario.TipoUsuario == TipoUsuario.VENTAS)// VENTAS
            {
                vistasDisponibles.Add("Default.aspx");
                vistasDisponibles.Add("Ventas.aspx");
                vistasDisponibles.Add("Clientes.aspx");
                vistasDisponibles.Add("Articulos.aspx");
            }

            return vistasDisponibles;
        }
        public static bool TieneAcceso(Usuario usuario, string pagina)
        {
            List<string> vistasDisponibles = ObtenerVistas(usuario);

            // Eliminar la barra inicial si existe
            string paginaSinParametros = pagina.TrimStart('/').Split('?')[0];

            // Verificar si la página sin parámetros está en la lista de vistas disponibles
            return vistasDisponibles.Contains(paginaSinParametros);
        }
    }
}
   