<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Project02.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link rel="icon" type="image/ico" href="favicon.ico" />
    <title>The Gaming House</title>
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
    //<![CDATA[
    $(window).load(function () {
        $('#slider').nivoSlider({
            effect: 'slideInLeft', // Specify sets like: 'fold,fade,sliceDown'
            slices: 10,
            boxCols: 10, // For box animations
            boxRows: 5, // For box animations
            animSpeed: 1000, // Slide transition speed
            pauseTime: 4500, // How long each slide will show
            startSlide: 0, // Set starting Slide (0 index)
            directionNav: true, // Next & Prev navigation
            directionNavHide: true, // Only show on hover
            controlNav: true, // 1,2,3... navigation
            controlNavThumbs: true, // Use thumbnails for Control Nav
            controlNavThumbsFromRel: true, // Use image rel for thumbs
            pauseOnHover: true, // Stop animation while hovering
        });
    });
    //]]>
    </script>
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
                <div id="logo"><a href="Default.aspx"><img src="images/logo.png" alt="The Gaming House" title="The Gaming House"/></a></div>
                <div class="nav-container">
                    <ul id="menu">
                        <li class="current_page_item"><a href="Default.aspx">Home</a></li>
                        <li><a href="PCGames.aspx">PC Games</a></li>
                        <li><a href="PS4Games.aspx">PS4 Games</a></li>
                        <li><a href="XBOXOneGames.aspx">XBOX One Games</a></li>
                        <li><a href="contact.aspx">Contact</a></li>
                        <li runat="server" id="anchorAdmin" visible="false"><a href="Administrator.aspx">Admin</a></li>
                        <li runat="server" id="anchorEditor" visible="false"><a href="AllArticles.aspx">Editor</a>
                            <%-- <ul>
                    <li class="sub"><a href="AllArticles.aspx">All Articles</a></li>
                    <li class="sub"><a href="NewArticle.aspx">New Article</a></li>
                </ul>--%>
                        </li>
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
                                        <td align="left" valign="middle" width="180">
                                            <label>
                                                User Name:</label>
                                        </td>
                                        <td align="left" valign="top">
                                            <asp:TextBox ID="txtUsername" runat="server" CssClass="chapasinp"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="middle" width="180">
                                            <label>
                                                Password</label>
                                        </td>
                                        <td align="left" valign="top">
                                            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="chapasinp"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="top">
                                            <a class="md-close close"></a>
                                        </td>
                                        <td align="left" valign="top">
                                            <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" CssClass="logbutpop"
                                                Style="margin-left:92px;" />
                                                <a runat="server" id="BtnSignup" href="SignUp.aspx" Class="logbutpop">SignUp</a>
                                            
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
            <div id="slider-wrapper">
                <div id="slider" class="nivoSlider">
                    <a href="PCGames.aspx">
                        <%--<img src="nivo-slider/PCGames.jpg" alt="" rel="nivo-slider/PCGames_thumb.jpg" />--%></a>
                    <a href="PS4Games.aspx">
                        <img src="nivo-slider/PS4Games.jpg" alt="" rel="nivo-slider/PS4Games_thumb.jpg" /></a>
                    <a href="XBOXOneGames.aspx">
                        <img src="nivo-slider/XBOXGames.jpg" alt="" rel="nivo-slider/XBOXGames_thumb.jpg" /></a>
                    <a href="#">
                        <img src="nivo-slider/apple.jpg" alt="" rel="nivo-slider/apple_thumb.jpg" /></a>
                    <a href="#">
                        <img src="nivo-slider/movie.jpg" alt="" rel="nivo-slider/movie_thumb.jpg" /></a>
                    <img src="nivo-slider/money.jpg" alt="" rel="nivo-slider/money_thumb.jpg" />
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="clear">
            </div>
            <div id="featured">
                <h4 id="featured-title">
                    <span>Featured</span></h4>
                <div id="featured_slider" runat="server" style="position: relative; overflow: hidden;" >                                          
                    
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
    <div id="footer">
        <span id="Scroll"><a href="#">&uarr;</a></span>
        <div id="footer_inner">
            <div class="clear">
            </div>
            <div class="footer_bottom">
                <p>
                    &copy; Copyright Owen Farnan 2015. All rights reserved.</p>
            </div>
        </div>
    </div>
    </div>
    <!--<div align=center>CSC2024 Owen Farnan 40044296 </div>-->
    </form>
</body>
<script src="js/Popup/js/classie.js" type="text/javascript"></script>
<script src="js/Popup/js/modalEffects.js" type="text/javascript"></script>
</html>
