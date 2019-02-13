<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryJokes.aspx.cs" Inherits="cms_db.CategoryJokes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="App_Themes/Stylesheet/style.scss" rel="stylesheet" type="text/css" />
    <link href="App_Themes/Stylesheet/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <h1>Edit or Delete Categories</h1>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="category_id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="category_id" HeaderText="category_id" InsertVisible="False" ReadOnly="True" SortExpression="category_id" />
                    <asp:BoundField DataField="category_name" HeaderText="category_name" SortExpression="category_name" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" DeleteCommand="DELETE FROM [item_category] WHERE [category_id] = @category_id" InsertCommand="INSERT INTO [item_category] ([category_name]) VALUES (@category_name)" SelectCommand="SELECT * FROM [item_category]" UpdateCommand="UPDATE [item_category] SET [category_name] = @category_name WHERE [category_id] = @category_id">
                <DeleteParameters>
                    <asp:Parameter Name="category_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="category_name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="category_name" Type="String" />
                    <asp:Parameter Name="category_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <h2>Add Categories</h2>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="category_id" DataSourceID="SqlDataSource2" Height="50px" Width="125px" EmptyDataText="Select Category before adding">
                <Fields>
                    <asp:BoundField DataField="category_id" HeaderText="category_id" InsertVisible="False" ReadOnly="True" SortExpression="category_id" />
                    <asp:BoundField DataField="category_name" HeaderText="category_name" SortExpression="category_name" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" DeleteCommand="DELETE FROM [item_category] WHERE [category_id] = @category_id" InsertCommand="INSERT INTO [item_category] ([category_name]) VALUES (@category_name)" SelectCommand="SELECT * FROM [item_category] WHERE ([category_id] = @category_id)" UpdateCommand="UPDATE [item_category] SET [category_name] = @category_name WHERE [category_id] = @category_id">
                <DeleteParameters>
                    <asp:Parameter Name="category_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="category_name" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="category_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="category_name" Type="String" />
                    <asp:Parameter Name="category_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="joke_id" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="joke_id" HeaderText="joke_id" InsertVisible="False" ReadOnly="True" SortExpression="joke_id" />
                    <asp:BoundField DataField="joke_img" HeaderText="joke_img" SortExpression="joke_img" />
                    <asp:BoundField DataField="joke_description" HeaderText="joke_description" SortExpression="joke_description" />
                    <asp:BoundField DataField="fk_category_id" HeaderText="fk_category_id" SortExpression="fk_category_id" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" DeleteCommand="DELETE FROM [joke] WHERE [joke_id] = @joke_id" InsertCommand="INSERT INTO [joke] ([joke_img], [joke_description], [fk_category_id]) VALUES (@joke_img, @joke_description, @fk_category_id)" SelectCommand="SELECT * FROM [joke]" UpdateCommand="UPDATE [joke] SET [joke_img] = @joke_img, [joke_description] = @joke_description, [fk_category_id] = @fk_category_id WHERE [joke_id] = @joke_id">
                <DeleteParameters>
                    <asp:Parameter Name="joke_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="joke_img" Type="String" />
                    <asp:Parameter Name="joke_description" Type="String" />
                    <asp:Parameter Name="fk_category_id" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="joke_img" Type="String" />
                    <asp:Parameter Name="joke_description" Type="String" />
                    <asp:Parameter Name="fk_category_id" Type="Int32" />
                    <asp:Parameter Name="joke_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="joke_id" DataSourceID="SqlDataSource4" EmptyDataText="Select Joke before adding a new" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="joke_id" HeaderText="joke_id" InsertVisible="False" ReadOnly="True" SortExpression="joke_id" />
                    <asp:BoundField DataField="joke_img" HeaderText="joke_img" SortExpression="joke_img" />
                    <asp:BoundField DataField="joke_description" HeaderText="joke_description" SortExpression="joke_description" />
                    <asp:BoundField DataField="fk_category_id" HeaderText="fk_category_id" SortExpression="fk_category_id" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" DeleteCommand="DELETE FROM [joke] WHERE [joke_id] = @joke_id" InsertCommand="INSERT INTO [joke] ([joke_img], [joke_description], [fk_category_id]) VALUES (@joke_img, @joke_description, @fk_category_id)" SelectCommand="SELECT * FROM [joke] WHERE ([joke_id] = @joke_id)" UpdateCommand="UPDATE [joke] SET [joke_img] = @joke_img, [joke_description] = @joke_description, [fk_category_id] = @fk_category_id WHERE [joke_id] = @joke_id">
                <DeleteParameters>
                    <asp:Parameter Name="joke_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="joke_img" Type="String" />
                    <asp:Parameter Name="joke_description" Type="String" />
                    <asp:Parameter Name="fk_category_id" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="joke_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="joke_img" Type="String" />
                    <asp:Parameter Name="joke_description" Type="String" />
                    <asp:Parameter Name="fk_category_id" Type="Int32" />
                    <asp:Parameter Name="joke_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
          <a class="link" href="backend.aspx">Item & Section Page</a>
             <a class="link" href="SiteStructure.aspx">Site Structure Change</a>
       <a class="link" href="Index.aspx">Index Page</a>
       <a class="link" href="uploading.aspx">Upload Page</a>
        </div>
    </form>
</body>
</html>
