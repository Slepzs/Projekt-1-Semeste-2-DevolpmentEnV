<%@ Page Title="" Language="C#" MasterPageFile="~/mpage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="cms_db.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    



       <h2>Items</h2>
           <div class="uk-container">  
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1"> 
        <HeaderTemplate>                      
                 </HeaderTemplate>
                    <ItemTemplate>
                        <div class="uk-width-1-3">
                      <h3><%# Eval("item_name") %> </h3>
                      <i><%# Eval("item_description") %> </i><br />
                      <strong>Category: <%# Eval("category_name") %> </strong>
                      <img src="/pictures/<%# Eval("item_picture") %>" />
                      
                       </div>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
    </asp:Repeater>
                     </div> 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" SelectCommand="SELECT DISTINCT(item.item_id), item_name, item_description, item_picture, category_name, joke_description
FROM item, item_category, joke, section_select, site_content, site_structure
 WHERE fk_section_select = section_number 
 AND fk_item_id = item_id 
 AND category_id = item.fk_category_id AND site_content.content_id = site_structure.fk_site_content
 AND joke.fk_category_id = category_id;"></asp:SqlDataSource>




    <div class="uk-container">  
    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">

         <HeaderTemplate>                      
                 </HeaderTemplate>
                    <ItemTemplate>
                        <div class="uk-width-1-3">
                      <h3><%# Eval("item_name") %> </h3>
                      <i><%# Eval("item_description") %> </i><br />
                      <strong>Category: <%# Eval("category_name") %> </strong>
                      <img src="/pictures/<%# Eval("item_picture") %>" />
                      
                       </div>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
    </asp:Repeater>
         </div> 

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" SelectCommand="SELECT item_name, item_description, item_picture, category_name FROM item, item_category, site_content, site_structure WHERE
fk_site_content = content_id 
AND site_content.fk_category_id = category_id 
AND category_id = item.fk_category_id;"></asp:SqlDataSource>

    <div class="jokehigh">

   
    <div class="uk-container newcon">  
    <h2>Joke</h2>

    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
          <HeaderTemplate>                
            </HeaderTemplate>
                    <ItemTemplate>
                        <div class="uk-width-1-2">
                      <img src="/pictures/<%# Eval("joke_img") %>" />
                      <p><%# Eval("joke_description") %> </p>
                       </div>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>

    </asp:Repeater>
 

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" SelectCommand="SELECT DISTINCT(joke_description), joke_img FROM joke, item_category, item, section_select, site_content, site_structure WHERE joke.fk_category_id = category_id 
and category_id = item.fk_category_id
and joke.fk_category_id = item.fk_category_id
and fk_item_id = item_id
and section_number = site_content.fk_section_select
and site_content.content_id = site_structure.fk_site_content;"></asp:SqlDataSource>


    <br />

    <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource5">
          <HeaderTemplate>                
            </HeaderTemplate>
                    <ItemTemplate>
                        <div class="uk-width-1-2">
                      <img src="/pictures/<%# Eval("joke_img") %>" />
                      <p><%# Eval("joke_description") %> </p>
                       </div>
                    </ItemTemplate>
                    <FooterTemplate>
                </FooterTemplate>

    </asp:Repeater>
     </div>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" SelectCommand="SELECT DISTINCT(joke_description), joke_img
FROM item_category, joke, site_content, site_structure
 WHERE 
 joke.fk_category_id = category_id
 AND site_content.fk_category_id = category_id
 AND site_content.content_id = site_structure.fk_site_content;"></asp:SqlDataSource>

    
      <div class="uk-container newcon">  
          <h2>Highlighted</h2>
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
         <HeaderTemplate>                      
                 </HeaderTemplate>
                    <ItemTemplate>
                        <div class="uk-width-1-2">
                      <h3><%# Eval("item_name") %> </h3>
                      <i><%# Eval("item_description") %> </i>
                      <img src="/pictures/<%# Eval("item_picture") %>" />
                       </div>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>

    </asp:Repeater>
          </div>

       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cms_dbConnectionString %>" SelectCommand="SELECT DISTINCT(item_name), item_description, item_picture, section_number FROM item, section_select WHERE section_number = 5 AND fk_item_id = item_id;"></asp:SqlDataSource>


    </div>

</asp:Content>
