<%@page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>实验室</title>
    <script type="text/javascript" src="${cacheUrl}/assets/applyproject/js/jquery-1.12.0.min.js"></script>
    <link rel="stylesheet" href="${cacheUrl}/assets/applyproject/css/jquery.popup.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="${cacheUrl}/assets/applyproject/css/style.css">
</head>

<body>
    <form method="post" enctype=" multipart/form-data">
        <div class="cter_Left">
            <h4>选择实验室</h4>
            <select id="select_Lab" style="width:130px;height:1.6em;">
            </select>
            <button id="search_lab">查询</button>
        </div>
        <div class="cter_Right">
            <h4>所申请实验名称</h4>
            <input type="text" name="name_Lab">
        </div>
        <div class="cter_Left">
            <h4> 开始时间</h4>
            <input type="datetime-local" name="startTime">
        </div>
        <div class="cter_Right">
            <h4>结束时间</h4>
            <input type="datetime-local" name="endTime">
        </div>
        <div class="cter_Left">
            <h4> 学分</h4>
            <input type="text" name="score">
            <h4> 上传资料</h4>
            <input type="file" name="upload_Info" value=" ">
        </div>
        <div class="cter_Right">
            <h4>容量</h4>
            <input type="number" name="storage">
            <h4> 添加设备</h4>
            <input type="text" name="Device">
            <button id="add_Device" class="lal js__p_start">添加设备</button>
        </div>
        <div style="float:left; width:100%;height:20px;"></div>
        <br>
        <br>
        <h4 style=" float:left; margin-left:10%;margin-top:5px;padding-top:50px;">备注：</h4>
        <textarea name="remarks" style="position: relative; width:50%;height:150px;left:1%;"></textarea>
    </form>
    <div style="width:50%;text-align:center;">
        <h3>所申请的设备</h3>
        <table id="table_1" class="date_table" border='1' cellspacing="0" cellpadding="0" style="margin:0 auto;">
            <tr>
                <th width="200">名称</th>
                <th width="200">数量</th>
            </tr>
            <tr>
                <td>3D打印机</td>
                <td>200</td>
            </tr>
        </table>
    </div>
    <div class="popup js__popup js__slide_top">
        <a href="#" class="p_close js__p_close" title="关闭">
            <span></span><span></span>
        </a>
        <div class="p_content">
            <p>添加设备</p>
            <div id="add_Btn">+</div>
            <div id="apply_Device">
                <ul>
                </ul>
            </div>
        </div>
    </div>
    <script>
    $(function() {
        $(".js__p_start, .js__p_another_start").simplePopup();
    });
    </script>
    <script>
    var Lab_Num=0;
    function addLab(name) {
    	Lab_Num++;
        var addDom = "<option value='" + Lab_Num + "'>" + name + "</option>";
        $("#select_Lab").append(addDom);
    }
    $("#add_Btn").click(function() {
        addDevice();
    })

    function addApplyDevice(name, number) {
        var addDom = " <tr><td>" + name + "</td><td>" + number + "</td></tr>"
        $("#table_1").append(addDom);
    }

    function addDevice() {
        var addDom = "<li><select><option></option></select><span> 余量: </span><input type=\"text\" name=\"rest_1\"><span> 数目: </span><input type=\"text\" name=\"apply_1\"></li>"
        $("#apply_Device ul").append(addDom);
    }

    addApplyDevice("原子对撞机", 200);
    addLab("GIS工程试验中心")
    </script>
    <script type="text/javascript" src="${cacheUrl}/assets/applyproject/js/jquery.popup.js"></script>
</body>

</html>
