<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrator.aspx.cs"
    Inherits="Project02.Administrator" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link rel="stylesheet" media="screen" href="css/superfish.css" type="text/css" />
    <link rel="stylesheet" media="screen" href="css/stylesheet.css" type="text/css" />
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Droid+Serif:regular,italic,bold,bolditalic"
        type="text/css" />
    <script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
    <script src="js/hoverIntent.js" type="text/javascript"></script>
    <script src="js/superfish.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/custom.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/jquery.animate-shadow.js"></script>
    <link href="js/Popup/css/component.css" rel="stylesheet" type="text/css" />
    <link href="js/Popup/css/default.css" rel="stylesheet" type="text/css" />
    <script src="js/Popup/js/modernizr.custom.js" type="text/javascript"></script>
    <title>All Article</title>
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <div id="panel" style="display: none;">
        <p>
            # You can add any kind of announcement or updates happening on your website</p>
    </div>
    <a id="notification" class="btn-slide" href="#">&darr;</a>
    <div id="container_wrapper">
        <div id="header">
            <div id="header-top">
                <div id="logo">
                    <a href="Default.aspx"><img src="images/logo.png" alt="The Gaming House" title="The Gaming House"/></a></div>
                <div class="nav-container">
                    <ul id="menu">
                        <li><a href="Default.aspx">Home</a></li>
                        <li><a href="PCGames.aspx">PC Games</a></li>
                        <li><a href="PS4Games.aspx">PS4 Games</a></li>
                        <li><a href="XBOXOneGames.aspx">XBOX One Games</a></li>
                        <li class="current_page_item"><a href="contact.aspx">Contact</a></li>
                        <li runat="server" id="anchorAdmin" visible="false"><a href="Administrator.aspx">Admin</a></li>
                        <li runat="server" id="anchorEditor" visible="false"><a href="AllArticles.aspx">Editor</a></li>
                        <li><a href="#" class="md-trigger" data-modal="modal-1" runat="server" id="AnchorLogin">
                            Login</a>
                            <asp:LinkButton ID="LinkLogout" runat="server" Visible="false" OnClick="LinkLogout_Click">Logout</asp:LinkButton>
                        </li>
                    </ul>
                    <div class="md-modal md-effect-1" id="modal-1">
                        <div class="md-content">
                            <h3>
                                Login</h3>
                            <div class="chanpassMain">
                                <table cellpadding="0" cellspacing="0" border="0" class="chanpasslgn">
                                    <tr>
                                        <td align="center" width="180">
                                            <label>
                                                Username</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtUsername" runat="server" CssClass="chapasinp"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <label>
                                                Password</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="chapasinp"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" CssClass="logbutpop"
                                                Style="margin-left:92px;" />
                                            <a runat="server" id="BtnSignUp" href="SignUp.aspx" Class="logbutpop">SignUp</a>
                                         </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                     <div class="md-overlay">
                    </div>
                </div>
            </div>
        </div>
         <div id="outer-wrapper">
            <div id="content-wrapper">
                <div id="inner-content">
                    <div id="entry">
                        <h1>
                            All Article</h1><br clear="all" />
                        <form action="#" id="contactForm" method="post" name="articleForm">
                        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
                        </telerik:RadAjaxLoadingPanel>
                        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <telerik:RadGrid ID="grdArticles" runat="server" AllowPaging="True" AllowSorting="True"
                                        AutoGenerateColumns="false" PageSize="15" AllowFilteringByColumn="true" EnableViewState="true"
                                        OnPageIndexChanged="grdArticles_PageIndexChanged" OnPageSizeChanged="grdArticles_PageSizeChanged"
                                        OnSortCommand="grdArticles_SortCommand" OnItemCommand="grdArticles_ItemCommand"
                                        Width="100%">
                                        <GroupingSettings CaseSensitive="false" />
                                        <MasterTableView AutoGenerateColumns="false" AllowFilteringByColumn="True" ShowFooter="True"
                                            TableLayout="Auto">
                                            <Columns>
                                                <telerik:GridTemplateColumn AllowFiltering="false">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <HeaderTemplate>
                                                        No.</HeaderTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <ItemTemplate>
                                                        <%#Container.DataSetIndex+1%>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                 <telerik:GridBoundColumn DataField="Username" EmptyDataText="N/A" HeaderStyle-HorizontalAlign="Left"
                                                    HeaderText="Username" ItemStyle-HorizontalAlign="Left" ShowFilterIcon="false"
                                                    UniqueName="Username" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridTemplateColumn AllowFiltering="false">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <HeaderTemplate>
                                                        Image</HeaderTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <ItemTemplate>
                                                        <asp:Image ID="ArticleImg" runat="server" ImageUrl='<%#Eval("ImgPath") %>' Height="50px"
                                                            Width="50px" />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="Title" EmptyDataText="N/A" HeaderStyle-HorizontalAlign="Left"
                                                    HeaderText="Title" ItemStyle-HorizontalAlign="Left" ShowFilterIcon="false" UniqueName="championShip"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Description" EmptyDataText="N/A" HeaderStyle-HorizontalAlign="Left"
                                                    HeaderText="Description" ItemStyle-HorizontalAlign="Left" ShowFilterIcon="false"
                                                    UniqueName="className" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridTemplateColumn AllowFiltering="false">
                                                    <ItemStyle HorizontalAlign="Center" Width="20px" />
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="btnEdit" ImageUrl="~/images/approve.png" Height="20px" Width="20px"
                                                            CommandName="Ed" CommandArgument='<%# Bind("ID")%>' OnClientClick="function{return true;}" 
                                                             runat="server" />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn AllowFiltering="false">
                                                    <ItemStyle HorizontalAlign="Center" Width="20px" />
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="btnDelete" ImageUrl="~/images/no.png" Height="20px" Width="20px"
                                                            CommandName="Del" CommandArgument='<%# Eval("ID")+","+Eval("ImgPath") %>' runat="server" OnClientClick="return confirm('Do you want to reject article..?');" />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                            </Columns>
                                            <PagerStyle AlwaysVisible="true" />
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </telerik:RadAjaxPanel>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer"> <span id="Scroll"><a href="#">&uarr;</a></span>
    <div id="footer_inner">
      <div class="clear"></div>
      <div class="footer_bottom">
        <p>&copy; Copyright 2014. All rights reserved.</p>
      </div>
    </div>
  </div>
        
    </div>
    </form>
</body>
<script src="js/Popup/js/classie.js" type="text/javascript"></script>
<script src="js/Popup/js/modalEffects.js" type="text/javascript"></script>
</html>
