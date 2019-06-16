<#import "parts/login.ftl" as l>
<#import "parts/common.ftl" as c>

<@c.page>
<div class="mb-1">Add new user</div>
${message?ifExists}
<@l.login "/registration" true />
</@c.page>
