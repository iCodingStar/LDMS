<%--
  User: star
  Date: 2016/5/22
  Time: 1:19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员主页</title>

</head>
<body>
<div id="content" class="white" style="margin-left: 15%;padding: 0px;width: 1000px">
    <%--<div style="width: 1000px height: 67px;">--%>
        <%--<h1 style="width: 200px;float:left;"><img src="${cacheUrl}/assets/notify/posts.png" alt=""> 公告管理</h1>--%>
        <%--<div class="work">--%>
            <%--<div action="#" class="search-work">--%>
                <%--<input type="text" value="" name="q" class="text">--%>
            <%--</div>--%>
            <%--<div action="#" class="workbutton">--%>
                <%--<img src="${cacheUrl}/assets/notify/search.png" alt="">--%>
            <%--</div>--%>
            <%--<div action="#" class="workbutton">--%>
                <%--<a href=""><img src="${cacheUrl}/assets/notify/add.png" alt=""></a>--%>
            <%--</div>--%>
            <%--<div action="#" class="workbutton">--%>
                <%--<img src="${cacheUrl}/assets/notify/trash-shredder.png" alt="">--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <div class="bloc" style="margin-left: 1%;padding: 0px;width: 800px">
        <div class="title">
            已发布公告
            <a href="#" class="toggle"></a><a href="" class="toggle"></a></div>
        <div class="content">
            <table>
                <thead>
                <tr>
                    <th><input type="checkbox" class="checkall"></th>
                    <th>标题</th>
                    <th>内容</th>
                    <th>时间</th>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="checkbox"></td>
                    <td><a href="#">关于软工大实习申请的通知</a></td>
                    <td>https://cug.cn</td>
                    <td>2016.05.17</td>
                    <td class="actions"><a href="#" title="Edit this content"><img src="${cacheUrl}/assets/notify/edit.png" alt=""></a><a href="#" title="Delete this content"><img src="${cacheUrl}/assets/notify/delete.png" alt=""></a></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td><a href="#">关于软工大实习申请的通知</a></td>
                    <td>https://cug.cn</td>
                    <td>2016.05.17</td>
                    <td class="actions"><a href="#" title="Edit this content"><img src="${cacheUrl}/assets/notify/edit.png" alt=""></a><a href="#" title="Delete this content"><img src="${cacheUrl}/assets/notify/delete.png" alt=""></a></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td><a href="#">关于软工大实习申请的通知</a></td>
                    <td>https://cug.cn</td>
                    <td>2016.05.17</td>
                    <td class="actions"><a href="#" title="Edit this content"><img src="${cacheUrl}/assets/notify/edit.png" alt=""></a><a href="#" title="Delete this content"><img src="${cacheUrl}/assets/notify/delete.png" alt=""></a></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td><a href="#">关于软工大实习申请的通知</a></td>
                    <td>https://cug.cn</td>
                    <td>2016.05.17</td>
                    <td class="actions"><a href="#" title="Edit this content"><img src="${cacheUrl}/assets/notify/edit.png" alt=""></a><a href="#" title="Delete this content"><img src="${cacheUrl}/assets/notify/delete.png" alt=""></a></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td><a href="#">关于软工大实习申请的通知</a></td>
                    <td>https://cug.cn</td>
                    <td>2016.05.17</td>
                    <td class="actions"><a href="#" title="Edit this content"><img src="${cacheUrl}/assets/notify/edit.png" alt=""></a><a href="#" title="Delete this content"><img src="${cacheUrl}/assets/notify/delete.png" alt=""></a></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td><a href="#">关于软工大实习申请的通知</a></td>
                    <td>https://cug.cn</td>
                    <td>2016.05.17</td>
                    <td class="actions"><a href="#" title="Edit this content"><img src="${cacheUrl}/assets/notify/edit.png" alt=""></a><a href="#" title="Delete this content"><img src="${cacheUrl}/assets/notify/delete.png" alt=""></a></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td><a href="#">关于软工大实习申请的通知</a></td>
                    <td>https://cug.cn</td>
                    <td>2016.05.17</td>
                    <td class="actions"><a href="#" title="Edit this content"><img src="${cacheUrl}/assets/notify/edit.png" alt=""></a><a href="#" title="Delete this content"><img src="${cacheUrl}/assets/notify/delete.png" alt=""></a></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td><a href="#">关于软工大实习申请的通知</a></td>
                    <td>https://cug.cn</td>
                    <td>2016.05.17</td>
                    <td class="actions"><a href="#" title="Edit this content"><img src="${cacheUrl}/assets/notify/edit.png" alt=""></a><a href="#" title="Delete this content"><img src="${cacheUrl}/assets/notify/delete.png" alt=""></a></td>
                </tr>

                </tbody>
            </table>
            <div class="left input">
                <div class="selector" id="uniform-tableaction"><span>Action</span><div class="selector" id="uniform-tableaction"><span>Action</span><select name="action" id="tableaction" style="opacity: 0;">
                    <option value="">Action</option>
                    <option value="delete">Delete</option>
                </select></div></div>
            </div>
            <div class="pagination">
                <a href="#" class="prev">«</a>
                <a href="#">1</a>
                <a href="#" class="current">2</a>
                ...
                <a href="#">21</a>
                <a href="#">22</a>
                <a href="#" class="next">»</a>
            </div>
        </div>
    </div>


</div>
</body>
</html>
