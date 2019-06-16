<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <div class="from-group col-md-6">
        <form class="form-inline" method="get" action="/main">
            <input type="text" name="filter" class="form-control" placeholder="filter" value="${filter?ifExists}">
            <button class="btn btn-success ml-2" type="submit">Search</button>
        </form>
    </div>
</div>
<a class="btn btn-primary" data-toggle="collapse" href="#collapseAddMessage"
        role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new Message
</a>
<div class="collapse" id="collapseAddMessage">
    <div clas="form-group mt-3"
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" name="text" class="form-control" placeholder="введіть повідомлення">
            </div>
            <div class="form-group">
                <input type="text" name="tag" class="form-control" placeholder="введіть тег">
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" class="form-control" id="customFile">
                    <label class="custom-file-label" for="customFile">Coose file</label>
               </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-success ml-2" type="submit" >Add message</button>
        </form>
    </div>
</div>
<div class="card-columns">
    <#list messages as message>
            <div class="card my-3">
                <div>
                    <#if message.filename??>
                        <img class="card-img-top" src="/img/${message.filename}">
                    </#if>
                </div>
                <div class="m2">
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                </div>
                <footer class="card-footer text-muted">${message.authorName}</footer>
            </div>
    <#else>
        No mesages
    </#list>
</div>
</@c.page>