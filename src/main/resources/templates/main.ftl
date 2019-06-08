<#import "parts/login.ftl" as l>
<#import "parts/common.ftl" as c>

<@c.page>
<div>
    <@l.logout />
    <span><a href="/user">Users</a></span>
</div>
<br/>
<div>Список сообщений</div>
<form method="get" action="/main">
    <input type="text" name="filter" placeholder="filter" value="${filter?ifExists}">
    <button type="submit">Filter</button>
</form>
<br/>
<div>
    <form method="post" enctype="multipart/form-data">
        <input type="text" name="text" placeholder="введіть повідомлення">
        <input type="text" name="tag" placeholder="введіть тег">
        <input type="file" name="file">
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
            <div>
                <#if message.filename??>
                    <img src="/img/${message.filename}">
                </#if>
            </div>
        </div>
    <#else>
        No mesages
    </#list>
</div>
</@c.page>