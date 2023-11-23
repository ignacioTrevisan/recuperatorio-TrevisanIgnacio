using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recuperatorio_TrevisanIgnacio
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0)
            {
                SqlDataSource4.SelectParameters["id"].DefaultValue = TextBox1.Text;
                SqlDataSource4.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader datos;
                datos = (SqlDataReader) this.SqlDataSource4.Select(DataSourceSelectArguments.Empty);
                if (TextBox1.Text != "")
                {
                    if (datos.Read())
                    {
                        SqlDataSource1.UpdateParameters["id"].DefaultValue = TextBox1.Text;
                        SqlDataSource1.UpdateParameters["descripcion"].DefaultValue = TextBox2.Text;
                        SqlDataSource1.Update();
                    }
                    else
                    {
                        TextBox2.Text = "este producto no existe";
                    }
                }


            }
            else if (DropDownList1.SelectedIndex == 1)
            {
                SqlDataSource3.DeleteParameters["id"].DefaultValue = TextBox1.Text;
                SqlDataSource3.Delete();
                SqlDataSource1.DeleteParameters["id"].DefaultValue = TextBox1.Text;
                SqlDataSource1.Delete();
                GridView1.DataBind();
                GridView2.DataBind();
                DropDownList3.DataBind();
            }
            else 
            {
                SqlDataSource1.InsertParameters["descripcion"].DefaultValue = TextBox2.Text;
                SqlDataSource1.Insert();
                GridView1.DataBind();
            }
        }
       

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource4.SelectParameters["id"].DefaultValue = TextBox1.Text;
            this.SqlDataSource4.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro;
            registro = (SqlDataReader)this.SqlDataSource4.Select(DataSourceSelectArguments.Empty);

            if (registro.Read())
            {
                TextBox2.Text = registro["descripcion"].ToString();
                registro = null;
            }
            else
            {
                TextBox2.Text = "este producto no existe";
            }
            
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedIndex == 0)
            {
                SqlDataSource2.UpdateParameters["id"].DefaultValue = TextBox3.Text;
                SqlDataSource2.UpdateParameters["fecha"].DefaultValue = TextBox4.Text;
                SqlDataSource2.UpdateParameters["monto"].DefaultValue = TextBox5.Text;
                SqlDataSource2.UpdateParameters["idProducto"].DefaultValue = DropDownList3.SelectedValue;
                SqlDataSource2.Update();
                GridView2.DataBind();
            }
            else if (DropDownList2.SelectedIndex == 1)
            {
                SqlDataSource5.DeleteParameters["id"].DefaultValue = TextBox3.Text;
                SqlDataSource5.Delete();
                DataBind();
            }
            else 
            {
                SqlDataSource2.InsertParameters["fecha"].DefaultValue = TextBox4.Text;
                SqlDataSource2.InsertParameters["monto"].DefaultValue = TextBox5.Text;
                SqlDataSource2.InsertParameters["idProducto"].DefaultValue = DropDownList3.SelectedValue;
                SqlDataSource2.Insert();
                DataBind();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlDataSource5.SelectParameters["id"].DefaultValue = TextBox3.Text;
            this.SqlDataSource5.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro;
            registro = (SqlDataReader)this.SqlDataSource5.Select(DataSourceSelectArguments.Empty);

            if (registro.Read())
            {
                TextBox4.Text = registro["fecha"].ToString();
                TextBox5.Text = registro["monto"].ToString();
                DropDownList3.SelectedValue = registro["idProducto"].ToString();
                registro = null;
            }
            else
            {
                TextBox2.Text = "este producto no existe";
            }
        }

        protected void SqlDataSource7_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}