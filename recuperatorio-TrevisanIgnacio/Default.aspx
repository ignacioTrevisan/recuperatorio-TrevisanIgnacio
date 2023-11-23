<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="recuperatorio_TrevisanIgnacio.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RecuperatorioConnectionString4 %>" ProviderName="<%$ ConnectionStrings:RecuperatorioConnectionString4.ProviderName %>" SelectCommand="SELECT * FROM productos where id = @id">
                <SelectParameters>
                    <asp:Parameter Name="id"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RecuperatorioConnectionString %>" DeleteCommand="DELETE FROM productos where id=@id 
"
                InsertCommand="INSERT INTO productos (descripcion) values (@descripcion)" SelectCommand="SELECT * FROM productos " UpdateCommand="UPDATE productos SET descripcion = @descripcion where id=@id">
                <DeleteParameters>
                    <asp:Parameter Name="id"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion"></asp:Parameter>
                    <asp:Parameter Name="id"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RecuperatorioConnectionString2 %>" DeleteCommand="DELETE from precios where id=@id" InsertCommand="INSERT INTO precios (fecha,monto,idProducto) VALUES (@fecha,@monto,@idProducto)" ProviderName="<%$ ConnectionStrings:RecuperatorioConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM precios" UpdateCommand="Update precios SET fecha = @fecha, monto=@monto, idProducto = @idProducto where id=@id">
                <DeleteParameters>
                    <asp:Parameter Name="id"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="fecha"></asp:Parameter>
                    <asp:Parameter Name="monto"></asp:Parameter>
                    <asp:Parameter Name="idProducto"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="fecha"></asp:Parameter>
                    <asp:Parameter Name="monto"></asp:Parameter>
                    <asp:Parameter Name="idProducto"></asp:Parameter>
                    <asp:Parameter Name="id"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RecuperatorioConnectionString3 %>" DeleteCommand="Delete from precios where idProducto=@id" ProviderName="<%$ ConnectionStrings:RecuperatorioConnectionString3.ProviderName %>" SelectCommand="SELECT * from precios">
                <DeleteParameters>
                    <asp:Parameter Name="id"></asp:Parameter>
                </DeleteParameters>
            </asp:SqlDataSource>
            
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="id"></asp:GridView>
            
            <br />
            <asp:Panel ID="Panel1" runat="server" BackColor="#999999" Width="300">
                <div style ="padding:10px"
            <asp:Label ID="Label1" runat="server" Text="Id"></asp:Label><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Descripcion"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="accion"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Text="Modificar" Value="opcion1" />
                <asp:ListItem Text="Eliminar" Value="opcion2" />
                <asp:ListItem Text="Agregar" Value="opcion3" />
                
            </asp:DropDownList>
                    <asp:Button ID="Button2" runat="server" Text="Confirmar" OnClick="Button2_Click" />
            <br />
                    </div>
            </asp:Panel >
            
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="id"></asp:GridView>
            <asp:Panel ID="Panel2" runat="server" BackColor="#999999" Width="300">
                <div style ="padding:10px" >
            
            <asp:Label ID="Label4" runat="server" Text="Id"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><asp:Button ID="Button3" runat="server" Text="Buscar" OnClick="Button3_Click" />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Fecha"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Monto"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label7" runat="server" Text="IdProducto"></asp:Label>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataTextField="id" DataValueField="id" DataSourceID="SqlDataSource7"></asp:DropDownList><asp:SqlDataSource ID="SqlDataSource7" runat="server" OnSelecting="SqlDataSource7_Selecting" ConnectionString="<%$ ConnectionStrings:RecuperatorioConnectionString5 %>" SelectCommand="SELECT [id] FROM [productos]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RecuperatorioConnectionString6 %>" DeleteCommand="DELETE from precios where id=@id" ProviderName="<%$ ConnectionStrings:RecuperatorioConnectionString6.ProviderName %>" SelectCommand="SELECT * FROM precios where id=@id">
                        <DeleteParameters>
                            <asp:Parameter Name="id"></asp:Parameter>
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:Parameter Name="id"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem Text="Modificar" Value="opcion1" />
                        <asp:ListItem Text="Eliminar" Value="opcion2" />
                        <asp:ListItem Text="Agregar" Value="opcion3" />
                    </asp:DropDownList>
                   
                    <asp:Button ID="Button4" runat="server" Text="Confirmar" OnClick="Button4_Click" />
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server"></asp:SqlDataSource>
       </asp:Panel>
    </form>
</body>
</html>
