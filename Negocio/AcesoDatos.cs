using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;


namespace Negocio
{
    public class AccesoDatos
    {

        private SqlConnection conexion;
        private SqlCommand comando;
        private SqlDataReader lector;
        public SqlDataReader Lector
        {
            get { return lector; }
        }

        public AccesoDatos()
        {
            conexion = new SqlConnection("server=.\\SQLEXPRESS; database=TPCuatrimestral; integrated security=true");
            comando = new SqlCommand();
        }

        public void setearConsulta(string Consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = Consulta;
        }

        public void ejecutarLectura()
        {
            comando.Connection = conexion;


            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void ejecutarAccion()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
                CerrarConexion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void setearParametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }
        public void CerrarConexion()
        {
            if (lector != null)
                lector.Close();
            conexion.Close();
        }




        public object ejecutarScalar()
        {
            try
            {
                conexion.Open();
                return comando.ExecuteScalar();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CerrarConexion();
            }
        }
    }
}
