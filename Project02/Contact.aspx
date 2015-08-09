<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Project02.Contact" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link rel="icon" type="image/ico" href="favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" media="screen" href="css/superfish.css" type="text/css" />
<link rel="stylesheet" media="screen" href="css/stylesheet.css" type="text/css" />
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Droid+Serif:regular,italic,bold,bolditalic" type="text/css" />
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
<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery("#contactForm").validate();
    });
</script>
    <title>Contact</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="panel" style="display: none;">
  <p># You can add any kind of announcement or updates happening on your website</p>
</div>
<a id="notification" class="btn-slide" href="#">&darr;</a>
<div id="container_wrapper">
  <div id="header">
    <div id="header-top">
      <div id="logo"><a href="Default.aspx"><img src="images/logo.png" alt="The Gaming House" title="The Gaming House"/></a></div>
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
      <!--<form method="get" id="searchform" action="#" name="searchform">
        <input type="text" class='rounded text_input' value="" name="s" id="s" />
        <input type="submit" class="button ie6fix" id="searchsubmit" value="&rarr;" />
      </form>-->
    </div>
    
  </div>
  <div id="outer-wrapper">
    <div id="content-wrapper">
      <div id="inner-content">
        <div id="entry">
          <div id="respond" class="contact">
            <h1>Feel free to mail us</h1>
            <form action="#" id="contactForm" method="post" name="contactForm">
              <p>
                <label for="contactName">Name<span class="star">*</span></label>
                <asp:TextBox ID="contactName" runat="server" class="required requiredField" ></asp:TextBox>
               
              </p>
              <p>
                <label for="email">Email<span class="star">*</span></label>
               <asp:TextBox ID="email" runat="server" class="required requiredField email" ></asp:TextBox>
                
              </p>
              <p>
                <label for="eurl">Website</label>
                 <asp:TextBox ID="eurl" runat="server" class="url" ></asp:TextBox>
               
              </p>
              <p>
                <label for="commentsText">Message<span class="star">*</span></label>
                <asp:TextBox ID="commentsText" runat="server" TextMode="MultiLine" rows="20" cols="30" class="required requiredField" ></asp:TextBox>
                
              </p>
              <p>
                <input type="hidden" name="submitted" id="submitted" value="true" />
              </p>
              
            </form>
            <div class="clear">
                <p class="submit">
                    <button class="btn" type="submit" style="margin:10px 0 0 435px;">
                        Submit
                    </button>
                </p>
              </div>
          </div>
        </div>
      </div>
      <div class="clear"></div>
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
<!--<div align=center>CSC2024 Owen Farnan 40044296<a href='#'></a></div>
-->    </form>
</body>
<script src="js/Popup/js/classie.js" type="text/javascript"></script>
<script src="js/Popup/js/modalEffects.js" type="text/javascript"></script>
</html>