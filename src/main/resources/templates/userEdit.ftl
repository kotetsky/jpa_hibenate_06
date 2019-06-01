<#import "parts/common.ftl" as c>

<@c.page>
    <br/>
    User editor
    <br/><div></div>
    <form action="/user" method="post" >
        <input type="text" name="username" value="${user.username}">
        <br/><br><div></div>
        <#list roles as role>
            <div>
                <label>
                    <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked","")}>${role}
                </label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <br/>
        <button type="submit">Save</button>
    </form>

</@c.page>