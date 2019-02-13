<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteStructure.aspx.cs" Inherits="cms_db.SiteStructure" %>

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
            <h1>Site Structure</h1>
            <p>Content ID 1, 2 & 3 Are for sections. 4, 5 are for categories</p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="structure_id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="fk_site_header" HeaderText="fk_site_header" SortExpression="fk_site_header" />
                    <asp:BoundField DataField="fk_site_content" HeaderText="fk_site_content" SortExpression="fk_site_content" />
                    <asp:BoundField DataField="fk_site_footer" HeaderText="fk_site_footer" SortExpression="fk_site_footer" />
                    <asp:BoundField DataField="structure_id" HeaderText="structure_id" InsertVisible="False" ReadOnly="True" SortExpression="structure_id" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" DeleteCommand="DELETE FROM [site_structure] WHERE [structure_id] = @structure_id" InsertCommand="INSERT INTO [site_structure] ([fk_site_header], [fk_site_content], [fk_site_footer]) VALUES (@fk_site_header, @fk_site_content, @fk_site_footer)" SelectCommand="SELECT [fk_site_header], [fk_site_content], [fk_site_footer], [structure_id] FROM [site_structure]" UpdateCommand="UPDATE [site_structure] SET [fk_site_header] = @fk_site_header, [fk_site_content] = @fk_site_content, [fk_site_footer] = @fk_site_footer WHERE [structure_id] = @structure_id">
                <DeleteParameters>
                    <asp:Parameter Name="structure_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="fk_site_header" Type="Int32" />
                    <asp:Parameter Name="fk_site_content" Type="Int32" />
                    <asp:Parameter Name="fk_site_footer" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="fk_site_header" Type="Int32" />
                    <asp:Parameter Name="fk_site_content" Type="Int32" />
                    <asp:Parameter Name="fk_site_footer" Type="Int32" />
                    <asp:Parameter Name="structure_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <h2>Header</h2>
            <br />
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="header_id" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="header_id" HeaderText="header_id" InsertVisible="False" ReadOnly="True" SortExpression="header_id" />
                    <asp:BoundField DataField="header_title" HeaderText="header_title" SortExpression="header_title" />
                    <asp:BoundField DataField="header_logo" HeaderText="header_logo" SortExpression="header_logo" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" DeleteCommand="DELETE FROM [site_header] WHERE [header_id] = @header_id" InsertCommand="INSERT INTO [site_header] ([header_title], [header_logo]) VALUES (@header_title, @header_logo)" SelectCommand="SELECT * FROM [site_header]" UpdateCommand="UPDATE [site_header] SET [header_title] = @header_title, [header_logo] = @header_logo WHERE [header_id] = @header_id">
                <DeleteParameters>
                    <asp:Parameter Name="header_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="header_title" Type="String" />
                    <asp:Parameter Name="header_logo" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="header_title" Type="String" />
                    <asp:Parameter Name="header_logo" Type="String" />
                    <asp:Parameter Name="header_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <h2>Footer</h2><br />
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="footer_id" DataSourceID="SqlDataSource4">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="footer_id" HeaderText="footer_id" InsertVisible="False" ReadOnly="True" SortExpression="footer_id" />
                    <asp:BoundField DataField="footer_description" HeaderText="footer_description" SortExpression="footer_description" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" DeleteCommand="DELETE FROM [site_footer] WHERE [footer_id] = @footer_id" InsertCommand="INSERT INTO [site_footer] ([footer_description]) VALUES (@footer_description)" SelectCommand="SELECT * FROM [site_footer]" UpdateCommand="UPDATE [site_footer] SET [footer_description] = @footer_description WHERE [footer_id] = @footer_id">
                <DeleteParameters>
                    <asp:Parameter Name="footer_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="footer_description" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="footer_description" Type="String" />
                    <asp:Parameter Name="footer_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <h1>Content Structure</h1>
            <p>Don't change anything unless you know what you're doing</p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="content_id" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="content_id" HeaderText="content_id" InsertVisible="False" ReadOnly="True" SortExpression="content_id" />
                    <asp:BoundField DataField="fk_category_id" HeaderText="fk_category_id" SortExpression="fk_category_id" />
                    <asp:BoundField DataField="fk_section_select" HeaderText="fk_section_select" SortExpression="fk_section_select" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" DeleteCommand="DELETE FROM [site_content] WHERE [content_id] = @content_id" InsertCommand="INSERT INTO [site_content] ([fk_category_id], [fk_section_select]) VALUES (@fk_category_id, @fk_section_select)" SelectCommand="SELECT * FROM [site_content]" UpdateCommand="UPDATE [site_content] SET [fk_category_id] = @fk_category_id, [fk_section_select] = @fk_section_select WHERE [content_id] = @content_id">
                <DeleteParameters>
                    <asp:Parameter Name="content_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="fk_category_id" Type="Int32" />
                    <asp:Parameter Name="fk_section_select" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="fk_category_id" Type="Int32" />
                    <asp:Parameter Name="fk_section_select" Type="Int32" />
                    <asp:Parameter Name="content_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

        <a class="link" href="backend.aspx">Item & Section Page</a>
        <a class="link" href="uploading.aspx">Upload Page</a>
        <a class="link" href="Index.aspx">Index Page</a>
        <a class="link" href="CategoryJokes.aspx">Category & Jokes Page</a>
         
            </form>
</body>
</html>
