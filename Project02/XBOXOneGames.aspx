<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XBOXOneGames.aspx.cs" Inherits="Project02.XBOXOneGames" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>XBOXOneGames</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" media="screen" href="css/superfish.css" type="text/css" />
    <link rel="stylesheet" media="screen" href="css/stylesheet.css" type="text/css" />
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Droid+Serif:regular,italic,bold,bolditalic"
        type="text/css" />
    <script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
    <script src="js/hoverIntent.js" type="text/javascript"></script>
    <script src="js/superfish.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/custom.js"></script>
    <script type="text/javascript" src="js/jquery.animate-shadow.js"></script>
    <script type='text/javascript' src='js/jquery.cycle.all.min.js'></script>
    <script type='text/javascript' src='nivo-slider/jquery.nivo.slider.pack.js'></script>
    <link rel="stylesheet" media="screen" href="nivo-slider/nivo-slider.css" type="text/css" />
   
    <script type="text/javascript">
        //featured slider
        jQuery('#featured_slider').cycle({
            fx: 'scrollHorz',
            speed: 800,
            timeout: 0,
            easing: 'easeInOutQuint',
            next: '#featured_slider_next',
            prev: '#featured_slider_prev'
        });
    </script>
    <link href="js/Popup/css/component.css" rel="stylesheet" type="text/css" />
    <link href="js/Popup/css/default.css" rel="stylesheet" type="text/css" />
    <script src="js/Popup/js/modernizr.custom.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
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
                        <li class="current_page_item"><a href="XBOXOneGames.aspx">XBOX One Games</a></li>
                        <li><a href="contact.aspx">Contact</a></li>
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
                                        <td align="center">
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
                                         <td align="left" valign="top">
                                            <a class="md-close close"></a>
                                        </td>
                                        <td>
                                            <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" CssClass="logbutpop"
                                                Style="margin-left:92px;"  />
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
                        <div id="post-top">
                            <h3 id="post-title">
                                XBOX One Game Reviews 2014</h3>
                            <div class="pclist">
                                <div id="featured">
                                    <h4 id="featured-title">
                                        <span>Featured</span></h4>
                                    <div id="featured_slider" runat="server" style="position: relative; overflow: hidden;">
                                    </div>
                                    <div class="nav_controls">
                                        <div id="featured_slider_prev">
                                            <a href="#">‹‹ Previous</a></div>
                                        <div id="featured_slider_next">
                                            <a href="#">Next ››</a></div>
                                    </div>
                                    <div class="clear">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div id="footer">
            <span id="Scroll"><a href="#">&uarr;</a></span>
            <div id="footer_inner">
                <div class="clear">
                </div>
                <div class="footer_bottom">
                    <p>
                        &copy; Copyright 2014. All rights reserved.</p>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
<script src="js/Popup/js/classie.js" type="text/javascript"></script>
<script src="js/Popup/js/modalEffects.js" type="text/javascript"></script>
</html>
