<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="backend.aspx.cs" Inherits="cms_db.backend" %>

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

            <h2>All Items</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="item_id" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="item_id" HeaderText="item_id" InsertVisible="False" ReadOnly="True" SortExpression="item_id" />
                    <asp:BoundField DataField="item_name" HeaderText="item_name" SortExpression="item_name" />
                    <asp:BoundField DataField="item_description" HeaderText="item_description" SortExpression="item_description" />
                    <asp:BoundField DataField="item_picture" HeaderText="item_picture" SortExpression="item_picture" />
                    <asp:BoundField DataField="fk_category_id" HeaderText="fk_category_id" SortExpression="fk_category_id" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" DeleteCommand="DELETE FROM [item] WHERE [item_id] = @item_id" InsertCommand="INSERT INTO [item] ([item_name], [item_description], [item_picture], [fk_category_id]) VALUES (@item_name, @item_description, @item_picture, @fk_category_id)" SelectCommand="SELECT * FROM [item]" UpdateCommand="UPDATE [item] SET [item_name] = @item_name, [item_description] = @item_description, [item_picture] = @item_picture, [fk_category_id] = @fk_category_id WHERE [item_id] = @item_id">
                <DeleteParameters>
                    <asp:Parameter Name="item_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="item_name" Type="String" />
                    <asp:Parameter Name="item_description" Type="String" />
                    <asp:Parameter Name="item_picture" Type="String" />
                    <asp:Parameter Name="fk_category_id" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="item_name" Type="String" />
                    <asp:Parameter Name="item_description" Type="String" />
                    <asp:Parameter Name="item_picture" Type="String" />
                    <asp:Parameter Name="fk_category_id" Type="Int32" />
                    <asp:Parameter Name="item_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
        <h2>Select items then click new to insert</h2>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="item_id" DataSourceID="SqlDataSource1" EmptyDataText="No Selection" Height="50px" Width="125px" OnItemInserted="DetailsView1_ItemInserted">
            <Fields>
                <asp:BoundField DataField="item_id" HeaderText="item_id" InsertVisible="False" ReadOnly="True" SortExpression="item_id" />
                <asp:BoundField DataField="item_name" HeaderText="item_name" SortExpression="item_name" />
                <asp:BoundField DataField="item_description" HeaderText="item_description" SortExpression="item_description" />
                <asp:BoundField DataField="item_picture" HeaderText="item_picture" SortExpression="item_picture" />
                <asp:BoundField DataField="fk_category_id" HeaderText="fk_category_id" SortExpression="fk_category_id" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" DeleteCommand="DELETE FROM [item] WHERE [item_id] = @item_id" InsertCommand="INSERT INTO [item] ([item_name], [item_description], [item_picture], [fk_category_id]) VALUES (@item_name, @item_description, @item_picture, @fk_category_id)" SelectCommand="SELECT * FROM [item] WHERE ([item_id] = @item_id)" UpdateCommand="UPDATE [item] SET [item_name] = @item_name, [item_description] = @item_description, [item_picture] = @item_picture, [fk_category_id] = @fk_category_id WHERE [item_id] = @item_id">
            <DeleteParameters>
                <asp:Parameter Name="item_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="item_name" Type="String" />
                <asp:Parameter Name="item_description" Type="String" />
                <asp:Parameter Name="item_picture" Type="String" />
                <asp:Parameter Name="fk_category_id" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="item_id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="item_name" Type="String" />
                <asp:Parameter Name="item_description" Type="String" />
                <asp:Parameter Name="item_picture" Type="String" />
                <asp:Parameter Name="fk_category_id" Type="Int32" />
                <asp:Parameter Name="item_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        Inserting and Editing Sections<br />
        <br />
        Section Selection Gridview<br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="section_id,section_number" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="section_id" HeaderText="section_id" InsertVisible="False" ReadOnly="True" SortExpression="section_id" />
                <asp:BoundField DataField="section_number" HeaderText="section_number" SortExpression="section_number" ReadOnly="True" />
                <asp:BoundField DataField="fk_item_id" HeaderText="fk_item_id" SortExpression="fk_item_id" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" DeleteCommand="DELETE FROM [section_select] WHERE [section_id] = @section_id AND [section_number] = @section_number" InsertCommand="INSERT INTO [section_select] ([section_number], [fk_item_id]) VALUES (@section_number, @fk_item_id)" SelectCommand="SELECT * FROM [section_select]" UpdateCommand="UPDATE [section_select] SET [fk_item_id] = @fk_item_id WHERE [section_id] = @section_id AND [section_number] = @section_number" OnSelecting="SqlDataSource2_Selecting">
            <DeleteParameters>
                <asp:Parameter Name="section_id" Type="Int32" />
                <asp:Parameter Name="section_number" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="section_number" Type="Int32" />
                <asp:Parameter Name="fk_item_id" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="fk_item_id" Type="Int32" />
                <asp:Parameter Name="section_id" Type="Int32" />
                <asp:Parameter Name="section_number" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <p>Section number <strong>5</strong> is for the <strong>highlighted section</strong></p>
        <br />
        Add Section<br />
        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="section_id,section_number" DataSourceID="SqlDataSource4" EmptyDataText="Nothing Selected" Height="50px" Width="125px" OnItemInserted="DetailsView2_ItemInserted">
            <Fields>
                <asp:BoundField DataField="section_id" HeaderText="section_id" InsertVisible="False" ReadOnly="True" SortExpression="section_id" />
                <asp:BoundField DataField="section_number" HeaderText="section_number" SortExpression="section_number" ReadOnly="True" />
                <asp:BoundField DataField="fk_item_id" HeaderText="fk_item_id" SortExpression="fk_item_id" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" DeleteCommand="DELETE FROM [section_select] WHERE [section_id] = @section_id AND [section_number] = @section_number" InsertCommand="INSERT INTO [section_select] ([section_number], [fk_item_id]) VALUES (@section_number, @fk_item_id)" SelectCommand="SELECT * FROM [section_select] WHERE ([section_id] = @section_id)" UpdateCommand="UPDATE [section_select] SET [fk_item_id] = @fk_item_id WHERE [section_id] = @section_id AND [section_number] = @section_number">
            <DeleteParameters>
                <asp:Parameter Name="section_id" Type="Int32" />
                <asp:Parameter Name="section_number" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="section_number" Type="Int32" />
                <asp:Parameter Name="fk_item_id" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" Name="section_id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="fk_item_id" Type="Int32" />
                <asp:Parameter Name="section_id" Type="Int32" />
                <asp:Parameter Name="section_number" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>


       <a class="link" href="SiteStructure.aspx">Site Structure Change</a>
       <a class="link" href="Index.aspx">Index Page</a>
       <a class="link" href="uploading.aspx">Upload Page</a>
       <a class="link" href="CategoryJokes.aspx">Category & Jokes Page</a>
    </form>
</body>
</html>
