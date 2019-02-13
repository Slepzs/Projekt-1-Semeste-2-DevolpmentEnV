<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uploading.aspx.cs" Inherits="cms_db.uploading" %>

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
            <h1>Upload a file to the server.</h1>
            <p>Remember it must match a picture in the database</p>
            <asp:FileUpload ID="FileUpload1" runat="server" />
&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        </div>
        
        <a class="link" href="backend.aspx">Item & Section Page</a>
        <a class="link" href="SiteStructure.aspx">Site Structure</a>
        <a class="link" href="backend.aspx">Backend</a>
        <a class="link" href="CategoryJokes.aspx">Category & Jokes Page</a>
        <a class="link" href="Index.aspx">Index</a>
    </form>
</body>
</html>
