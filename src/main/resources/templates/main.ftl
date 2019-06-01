<#import "parts/login.ftl" as l>
<#import "parts/common.ftl" as c>

<@c.page>
<div>
    <@l.logout />
</div>
<br/>
<div>Список сообщений</div>
<form method="get" action="/main">
    <input type="text" name="filter" placeholder="filter" value="${filter}">
    <button type="submit">Filter</button>
</form>
<br/>
<div>
    <form method="post">
        <input type="text" name="text" placeholder="введіть повідомлення">
        <input type="text" name="tag" placeholder="введіть тег">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit">Додати</button>
    </form>
</div>
<div>
    <#list messages as message>
        <div>
            <b>${message.id}}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <strong>${message.authorName}</strong>
        </div>
    <#else>
        No mesages
    </#list>
</div>
</@c.page>