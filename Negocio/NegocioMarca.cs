using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Clases;

namespace Negocio
{
    public class NegocioMarca

    {
        public List<Marca> listar()
        {
            List<Marca> lista = new List<Marca>();
            AccesoDatos datosMarca = new AccesoDatos();
            try
            {
                datosMarca.setearConsulta("select * from marcas");
                datosMarca.ejecutarLectura();

                while (datosMarca.Lector.Read())
                { 
                    Marca marcas = new Marca();
                    marcas.id = datosMarca.Lector.GetInt32(0);
                    marcas.nombre = datosMarca.Lector["Nombre"].ToString();
                    lista.Add(marcas);

                }
                return lista;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                throw ex;
                
            }
        }
        public void agregar(Marca nuevaMarca)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Marcas (Nombre) VALUES (@nombre)");
                datos.setearParametro("@nombre", nuevaMarca.nombre);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
