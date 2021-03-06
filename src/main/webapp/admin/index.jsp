<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.lantern.AdminServlet" %>
<%@ page import="org.lantern.data.Dao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>
Lantern Controller Admin
</title>
</head>

<body>
<h1>Lantern Controller Admin</h1>

<form method="POST" action="/admin/post/test">

<input type="submit" name="test" value="test admin interface" />
<%= AdminServlet.getCsrfTag() %>
</form>

<br/>
<br/>

<h2>Pause/unpause invites</h2>
<form method="POST" action="/admin/post/setInvitesPaused">

<% Dao dao = new Dao();
if (dao.areInvitesPaused()) {
%>
Invites are paused.  <button type="submit" name="paused" value="false">Unpause invites</button>
<% } else { %>
Invites are unpaused.  <button type="submit" name="paused" value="true">Pause invites</button><br/>
<% } %>
<%= AdminServlet.getCsrfTag() %>
</form>

<br/>
<br/>

<h2>Set max invites per proxy</h2>
<p>Set the number of invites we'll direct to a proxy before we launch a new one.</p>
<form method="POST" action="/admin/post/setMaxInvitesPerProxy">
<input type="text" name="n" value="100">
<button type="submit" name="set" value="true">Set max invites per proxy</button><br/>
<%= AdminServlet.getCsrfTag() %>
</form>

<br/>
<br/>

<h2>Promote Fallback User</h2>
<p>Promote someone so we'll run fallback proxies as them when they invite someone.</p>
<form method="POST" action="/admin/post/promoteFallbackProxyUser">
<input type="text" name="user" value="user@example.com">
<button type="submit" name="set" value="true">Promote Fallback User</button><br/>
<%= AdminServlet.getCsrfTag() %>
</form>

<br/>
<br/>

<h2>Send version update email</h2>
<p>Send an email to notify users that a new Lantern version is up for download.</p>
<p>The version number will only be used for display purposes.  The invite e-mails always point to the latest Lantern version.</p>
<p>Provide the e-mail address of a Lantern user in the "Send to" textbox if you just want to send a test email.</p>
<p>If you really want to email everyone, enter "<b>EVERYONE, AND I MEAN IT!</b>" in the "Send to" textbox.</p>
<form method="POST" action="/admin/post/sendUpdateEmail">
Version: <input type="text" name="version" value="v1.0.0-beta7">
Send to: <input type="text" name="to" value="test@getlantern.org">
<button type="submit" name="set" value="true">Send version update email</button><br/>
<%= AdminServlet.getCsrfTag() %>
</form>

<h2>Invite to new trust network</h2>
<p>Invite users to new trust network and send an email to notify them that they need to upgrade Lantern.</p>
<p>Provide the e-mail address of the inviter for the newly generated Invites.</p>
<form method="POST" action="/admin/post/inviteToNewTrustNetwork">
Inviter: <input type="text" name="inviter" value="afisk@getlantern.org">
<br/>
<br/>
Invitees:
<br/>
<textarea rows="12" cols="80" name="invitees">
euccastro@yahoo.com
</textarea>
<br/>
<input type="checkbox" name="friend" value="add">Add as a friend too<br/>
<br/>
<button type="submit" name="set" value="true">Invite to new trust network</button><br/>
<%= AdminServlet.getCsrfTag() %>
</form>
<br/>
<br/>
</body>
</html>
