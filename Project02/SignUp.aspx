<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Project02.SignUp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link rel="icon" type="image/ico" href="favicon.ico" />
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
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/jquery.animate-shadow.js"></script>
    <link href="js/Popup/css/component.css" rel="stylesheet" type="text/css" />
    <link href="js/Popup/css/default.css" rel="stylesheet" type="text/css" />
    <script src="js/Popup/js/modernizr.custom.js" type="text/javascript"></script>
    <style type="text/css">
    	#respond.contact label {
			color: #555555;
			display: block;
			float: left;
			font-weight: bold;
			padding: 7px 0 0;
			width: 200px;
		}
		td{vertical-align:top;}
    </style>
    <title>New Article</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
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
                                        <td align="left" valign="top">
                                            <a class="md-close close"></a>
                                        </td>
                                        <td>
                                            <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" CssClass="logbutpop"
                                                Style="margin-left:92px;"  />
                                            <asp:Button ID="BtnSignup" runat="server" Text="Signup" />
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
                        <div id="respond" class="contact">
                            <h1>
                                SignUp</h1>
                            <form action="#" id="contactForm" method="post" name="articleForm">
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td width="200" align="left" valign="top">
                                        <label>
                                            Username (Must be EmalD)</label>
                                    </td>
                                    <td align="left" valign="top">
                                        <asp:TextBox ID="txtNewUsername" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Insert Username" ForeColor="Red" ControlToValidate="txtNewUsername" ValidationGroup="1"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ErrorMessage="* Invalid EmalID" ValidationGroup="1" 
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtNewUsername"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
  								<tr><td height="13px">&nbsp;</td></tr>
                                 <tr>
                                    <td align="left" valign="top">
                                        <label>
                                            Display Name</label>
                                    </td>
                                    <td align="left" valign="top">
                                        <asp:TextBox ID="txtDspName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Insert display name" ForeColor="Red" ControlToValidate="txtDspName" ValidationGroup="1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr><td height="13px">&nbsp;</td></tr>
                                <tr>
                                    <td align="left" valign="top">
                                        <label>
                                            Password</label>
                                    </td>
                                    <td align="left" valign="top">
                                        <asp:TextBox ID="txtNewPassword" TextMode="Password" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Insert password" ForeColor="Red" ControlToValidate="txtNewPassword" ValidationGroup="1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr><td height="13px">&nbsp;</td></tr>
                                <tr>
                                    <td align="left" valign="top">
                                        <label>
                                           Retype Password</label>
                                           
                                    </td>
                                    <td align="left" valign="top">
                                        <asp:TextBox ID="txtRePassword" TextMode="Password" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* retype password" ForeColor="Red" ControlToValidate="txtDspName" ValidationGroup="1"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password mismatch" ControlToValidate="txtRePassword" ControlToCompare="txtNewPassword" ValidationGroup="1"></asp:CompareValidator>
                                    </td>
                                </tr>
                                
                                <tr><td height="20">&nbsp;</td><td>&nbsp;</td></tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BtnSubmit" />
                                            </Triggers>
                                            <ContentTemplate>
                                                <asp:Button ID="BtnSubmit" ValidationGroup="1" runat="server" class="btn" Text="Create Account"
                                                    OnClick="BtnSubmit_Click" style="margin-left:201px;" />
                                                <asp:Button runat="server" ID="BtnCancel" OnClick="BtnCancel_Click" Text="Cancel" class="btn"  />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                            </form>
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
