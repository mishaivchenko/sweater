<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
    <div>
        <@l.logout/>
        <span><a href="/user">User List</a> </span>
    </div>
    <div>
        <form method="post" enctype="multipart/form-data">
            <input type="text" name="text" placeholder="Write message">
            <input type="text" name="tag" placeholder="Write tag">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="file" name="file">
            <button type="submit">Submit</button>
        </form>
        <div>Список сообщений</div>

        <form method="get" action="/main">
            <input type="text" name="filter" value="${filter!""}">
            <button type="submit">Filter</button>
        </form>
        <#list messages as message>
        <div>
            <b>${message.id}</b>
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
            No messages
        </#list>
    </div>
</@c.page>