<#import "parts/login.ftl" as l>
<#import "parts/common.ftl" as c>

<@c.page>
Login page
${message?ifExists}
<br/>
<@l.login "/login" false/>
</@c.page>