<#import "parts/login.ftl" as l>
<#import "parts/common.ftl" as c>

<@c.page>
Add new user
<br/>
<br/>
${message}
<@l.login "/registration" />
</@c.page>
