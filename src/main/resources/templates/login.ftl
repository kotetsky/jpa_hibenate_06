<#import "parts/login.ftl" as l>
<#import "parts/common.ftl" as c>

<@c.page>
Login page
<br/>
<@l.login "/login" />
<a href="/registration">Registration</a>
</@c.page>