/**
 * Created by HXY on 2016/5/30.
 */

var totalnum=0;
$(function () {

    var methods = {
        init: function(options) {
            var o = $.extend({
                items: 1,
                itemsOnPage: 1,
                pages: 0,
                displayedPages: 5,
                edges: 2,
                currentPage: 0,
                hrefTextPrefix: '#page-',
                hrefTextSuffix: '',
                prevText: 'Prev',
                nextText: 'Next',
                ellipseText: '&hellip;',
                ellipsePageSet: true,
                cssStyle: 'light-theme',
                listStyle: '',
                labelMap: [],
                selectOnClick: true,
                nextAtFront: false,
                invertPageOrder: false,
                useStartEdge : true,
                useEndEdge : true,
                onPageClick: function(pageNumber, event) {
                    // Callback triggered when a page is clicked
                    // Page number is given as an optional parameter
                },
                onInit: function() {
                    // Callback triggered immediately after initialization
                }
            }, options || {});

            var self = this;

            o.pages = o.pages ? o.pages : Math.ceil(o.items / o.itemsOnPage) ? Math.ceil(o.items / o.itemsOnPage) : 1;
            if (o.currentPage)
                o.currentPage = o.currentPage - 1;
            else
                o.currentPage = !o.invertPageOrder ? 0 : o.pages - 1;
            o.halfDisplayed = o.displayedPages / 2;

            this.each(function() {
                self.addClass(o.cssStyle + ' simple-pagination').data('pagination', o);
                methods._draw.call(self);
            });

            o.onInit();

            return this;
        },

        selectPage: function(page) {
            methods._selectPage.call(this, page - 1);
            return this;
        },

        prevPage: function() {
            var o = this.data('pagination');
            if (!o.invertPageOrder) {
                if (o.currentPage > 0) {
                    methods._selectPage.call(this, o.currentPage - 1);
                }
            } else {
                if (o.currentPage < o.pages - 1) {
                    methods._selectPage.call(this, o.currentPage + 1);
                }
            }
            return this;
        },

        nextPage: function() {
            var o = this.data('pagination');
            if (!o.invertPageOrder) {
                if (o.currentPage < o.pages - 1) {
                    methods._selectPage.call(this, o.currentPage + 1);
                }
            } else {
                if (o.currentPage > 0) {
                    methods._selectPage.call(this, o.currentPage - 1);
                }
            }
            return this;
        },

        getPagesCount: function() {
            return this.data('pagination').pages;
        },

        setPagesCount: function(count) {
            this.data('pagination').pages = count;
        },

        getCurrentPage: function () {
            return this.data('pagination').currentPage + 1;
        },

        destroy: function(){
            this.empty();
            return this;
        },

        drawPage: function (page) {
            var o = this.data('pagination');
            o.currentPage = page - 1;
            this.data('pagination', o);
            methods._draw.call(this);
            return this;
        },

        redraw: function(){
            methods._draw.call(this);
            return this;
        },

        disable: function(){
            var o = this.data('pagination');
            o.disabled = true;
            this.data('pagination', o);
            methods._draw.call(this);
            return this;
        },

        enable: function(){
            var o = this.data('pagination');
            o.disabled = false;
            this.data('pagination', o);
            methods._draw.call(this);
            return this;
        },

        updateItems: function (newItems) {
            var o = this.data('pagination');
            o.items = newItems;
            o.pages = methods._getPages(o);
            this.data('pagination', o);
            methods._draw.call(this);
        },

        updateItemsOnPage: function (itemsOnPage) {
            var o = this.data('pagination');
            o.itemsOnPage = itemsOnPage;
            o.pages = methods._getPages(o);
            this.data('pagination', o);
            methods._selectPage.call(this, 0);
            return this;
        },

        getItemsOnPage: function() {
            return this.data('pagination').itemsOnPage;
        },

        _draw: function() {
            var	o = this.data('pagination'),
                interval = methods._getInterval(o),
                i,
                tagName;

            methods.destroy.call(this);

            tagName = (typeof this.prop === 'function') ? this.prop('tagName') : this.attr('tagName');

            var $panel = tagName === 'UL' ? this : $('<ul' + (o.listStyle ? ' class="' + o.listStyle + '"' : '') + '></ul>').appendTo(this);

            // Generate Prev link
            if (o.prevText) {
                methods._appendItem.call(this, !o.invertPageOrder ? o.currentPage - 1 : o.currentPage + 1, {text: o.prevText, classes: 'prev'});
            }

            // Generate Next link (if option set for at front)
            if (o.nextText && o.nextAtFront) {
                methods._appendItem.call(this, !o.invertPageOrder ? o.currentPage + 1 : o.currentPage - 1, {text: o.nextText, classes: 'next'});
            }

            // Generate start edges
            if (!o.invertPageOrder) {
                if (interval.start > 0 && o.edges > 0) {
                    if(o.useStartEdge) {
                        var end = Math.min(o.edges, interval.start);
                        for (i = 0; i < end; i++) {
                            methods._appendItem.call(this, i);
                        }
                    }
                    if (o.edges < interval.start && (interval.start - o.edges != 1)) {
                        $panel.append('<li class="disabled"><span class="ellipse">' + o.ellipseText + '</span></li>');
                    } else if (interval.start - o.edges == 1) {
                        methods._appendItem.call(this, o.edges);
                    }
                }
            } else {
                if (interval.end < o.pages && o.edges > 0) {
                    if(o.useStartEdge) {
                        var begin = Math.max(o.pages - o.edges, interval.end);
                        for (i = o.pages - 1; i >= begin; i--) {
                            methods._appendItem.call(this, i);
                        }
                    }

                    if (o.pages - o.edges > interval.end && (o.pages - o.edges - interval.end != 1)) {
                        $panel.append('<li class="disabled"><span class="ellipse">' + o.ellipseText + '</span></li>');
                    } else if (o.pages - o.edges - interval.end == 1) {
                        methods._appendItem.call(this, interval.end);
                    }
                }
            }

            // Generate interval links
            if (!o.invertPageOrder) {
                for (i = interval.start; i < interval.end; i++) {
                    methods._appendItem.call(this, i);
                }
            } else {
                for (i = interval.end - 1; i >= interval.start; i--) {
                    methods._appendItem.call(this, i);
                }
            }

            // Generate end edges
            if (!o.invertPageOrder) {
                if (interval.end < o.pages && o.edges > 0) {
                    if (o.pages - o.edges > interval.end && (o.pages - o.edges - interval.end != 1)) {
                        $panel.append('<li class="disabled"><span class="ellipse">' + o.ellipseText + '</span></li>');
                    } else if (o.pages - o.edges - interval.end == 1) {
                        methods._appendItem.call(this, interval.end);
                    }
                    if(o.useEndEdge) {
                        var begin = Math.max(o.pages - o.edges, interval.end);
                        for (i = begin; i < o.pages; i++) {
                            methods._appendItem.call(this, i);
                        }
                    }
                }
            } else {
                if (interval.start > 0 && o.edges > 0) {
                    if (o.edges < interval.start && (interval.start - o.edges != 1)) {
                        $panel.append('<li class="disabled"><span class="ellipse">' + o.ellipseText + '</span></li>');
                    } else if (interval.start - o.edges == 1) {
                        methods._appendItem.call(this, o.edges);
                    }

                    if(o.useEndEdge) {
                        var end = Math.min(o.edges, interval.start);
                        for (i = end - 1; i >= 0; i--) {
                            methods._appendItem.call(this, i);
                        }
                    }
                }
            }

            // Generate Next link (unless option is set for at front)
            if (o.nextText && !o.nextAtFront) {
                methods._appendItem.call(this, !o.invertPageOrder ? o.currentPage + 1 : o.currentPage - 1, {text: o.nextText, classes: 'next'});
            }

            if (o.ellipsePageSet && !o.disabled) {
                methods._ellipseClick.call(this, $panel);
            }

        },

        _getPages: function(o) {
            var pages = Math.ceil(o.items / o.itemsOnPage);
            return pages || 1;
        },

        _getInterval: function(o) {
            return {
                start: Math.ceil(o.currentPage > o.halfDisplayed ? Math.max(Math.min(o.currentPage - o.halfDisplayed, (o.pages - o.displayedPages)), 0) : 0),
                end: Math.ceil(o.currentPage > o.halfDisplayed ? Math.min(o.currentPage + o.halfDisplayed, o.pages) : Math.min(o.displayedPages, o.pages))
            };
        },

        _appendItem: function(pageIndex, opts) {
            var self = this, options, $link, o = self.data('pagination'), $linkWrapper = $('<li></li>'), $ul = self.find('ul');

            pageIndex = pageIndex < 0 ? 0 : (pageIndex < o.pages ? pageIndex : o.pages - 1);

            options = {
                text: pageIndex + 1,
                classes: ''
            };

            if (o.labelMap.length && o.labelMap[pageIndex]) {
                options.text = o.labelMap[pageIndex];
            }

            options = $.extend(options, opts || {});

            if (pageIndex == o.currentPage || o.disabled) {
                if (o.disabled || options.classes === 'prev' || options.classes === 'next') {
                    $linkWrapper.addClass('disabled');
                } else {
                    $linkWrapper.addClass('active');
                }
                $link = $('<span class="current">' + (options.text) + '</span>');
            } else {
                $link = $('<a href="' + o.hrefTextPrefix + (pageIndex + 1) + o.hrefTextSuffix + '" class="page-link">' + (options.text) + '</a>');
                $link.click(function(event){
                    return methods._selectPage.call(self, pageIndex, event);
                });
            }

            if (options.classes) {
                $link.addClass(options.classes);
            }

            $linkWrapper.append($link);

            if ($ul.length) {
                $ul.append($linkWrapper);
            } else {
                self.append($linkWrapper);
            }
        },

        _selectPage: function(pageIndex, event) {
            var o = this.data('pagination');
            o.currentPage = pageIndex;
            if (o.selectOnClick) {
                methods._draw.call(this);
            }
            return o.onPageClick(pageIndex + 1, event);
        },


        _ellipseClick: function($panel) {
            var self = this,
                o = this.data('pagination'),
                $ellip = $panel.find('.ellipse');
            $ellip.addClass('clickable').parent().removeClass('disabled');
            $ellip.click(function(event) {
                if (!o.disable) {
                    var $this = $(this),
                        val = (parseInt($this.parent().prev().text(), 10) || 0) + 1;
                    $this
                        .html('<input type="number" min="1" max="' + o.pages + '" step="1" value="' + val + '">')
                        .find('input')
                        .focus()
                        .click(function(event) {
                            // prevent input number arrows from bubbling a click event on $ellip
                            event.stopPropagation();
                        })
                        .keyup(function(event) {
                            var val = $(this).val();
                            if (event.which === 13 && val !== '') {
                                // enter to accept
                                if ((val>0)&&(val<=o.pages))
                                    methods._selectPage.call(self, val - 1);
                            } else if (event.which === 27) {
                                // escape to cancel
                                $ellip.empty().html(o.ellipseText);
                            }
                        })
                        .bind('blur', function(event) {
                            var val = $(this).val();
                            if (val !== '') {
                                methods._selectPage.call(self, val - 1);
                            }
                            $ellip.empty().html(o.ellipseText);
                            return false;
                        });
                }
                return false;
            });
        }

    };

    $.fn.pagination = function(method) {

        // Method calling logic
        if (methods[method] && method.charAt(0) != '_') {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' +  method + ' does not exist on jQuery.pagination');
        }

    };


    //选择特定的按钮
    $(".project-info-select li a,.project-state-select li a,.dropdown-menu span.label").on('click', function () {
        $(this).parents(".dropdown-menu").prev(".dropdown-toggle").find(".select-name").text($(this).text());
    });


    $("#btn-search").on('click', function () {

        //获取查询条件
        var project_info = $(".project-info .select-name").text();
        var query_input = $(".project-info-input").val();
        var project_state = $(".project-state .select-name").text();

        //alert(project_info + "---" + project_state);

        var id, name, state;

        if (project_info == "项目编号") {
            id = query_input;
        } else if (project_info == "主题") {
            name = query_input;
        } else {
            id = null;
            name = null;
        }

        if (project_state == "提交") {
            state = 0;
        } else if (project_state == "已通过") {
            state = 1;
        } else if (project_state == "拒绝") {
            state = 2;
        } else if (project_state == "已完成") {
            state = 3;
        } else {
            state = null;
        }

        //根据项目编号(id),申请人(teacherName),主题(name),状态(state)进行综合查询
        getPageDataAndParse(0, id, name, state);
        $("#result_area").pagination({
            items: totalnum,
            itemsOnPage: 8,
            cssStyle: 'light-theme',
            onPageClick: function(pageNumber, event){
                getPageDataAndParse(pageNumber,id, name, state)
            }
        });

    });
});

function getData(url, data, callback) {
    $.ajax({
        method: 'POST',
        url: url,
        data: data,
        success: function (response) {
            showMsg("服务器发生错误,操作失败!", 1);
            callback(response);
        },
        error: function () {
            showMsg("服务器发生错误,操作失败!", 1);
        },
        dataType: "json"//预期服务器返回数据类型
    });
};


function getPageDataAndParse(page,id, name, state) {
    if (page < 0) return;
    //从服务器获取数据并显示
    getData("/teacher/queryproject",
        {
            "page": page,
            "id": id,
            "name": name,
            "state": state
        },
        function (data) {
            totalnum=data.totalRecords;
            //移除非表头栏的所有条目
            $(".project-info-table tr:not(:first)").remove();

            //遍历json数据，将数据显示出来
            $.each(data.data, function (index, item) {
                var node = "<tr>"
                    + "<td id='project_id'>" + item.id + "</td>"
                    + "<td>" + item.name + "</td>";
                if (item.state == 0) {
                    node += "<td>" + "提交" + "</td>";
                } else if (item.state == 1) {
                    node += "<td>" + "已通过" + "</td>";
                } else if (item.state == 2) {
                    node += "<td>" + "已拒绝" + "</td>";
                } else if (item.state == 3) {
                    node += "<td>" + "已完成" + "</td>";
                }
                var chose_num=item.capacity-item.leftCapacity;
                    node+= "<td>" + chose_num+"/"+item.capacity+ "</td>";
                        if(item.state==0) {
                            node+="<td>" + new Date(item.submitTime).Format("yyyy-MM-dd hh:mm:ss") + "</td>"
                        }else {
                            node+="<td>" + new Date(item.passTime).Format("yyyy-MM-dd hh:mm:ss") + "</td>"
                        }
                    + "<td>";
                node += "</td>"
                    + "<td><button type='button' class='btn btn-primary btn-sm show-project-btn'"
                    + ">查看详情"
                    + "</button>";
                if(item.state==0){
                    node +="<button type='button' style='margin-left: 20px' class='btn btn-success btn-sm upfile-btn'"
                        + ">上传文件"
                        + "</button>"
                        + "</td>";
                }
                node+= "</tr>";
                $(".project-info-table").append(node);
            });


            //按钮事件绑定

            $(".show-project-btn").on('click', function () {
                // 获取id值
                var id = $(this).parent().siblings().eq(0).text();
                getData("/teacher/queryById", {id: id}, function (data) {
                    $("#submitTime").text(new Date(data.submitTime).Format("yyyy-MM-dd hh:mm:ss"));
                    $("#labName").text(data.labId);
                    $("#credit").text(data.credit);
                    $("#teacherName").text(data.teaId);
                    $("#startTime").text(new Date(data.startTime).Format("yyyy-MM-dd hh:mm:ss"));
                    $("#endTime").text(new Date(data.endTime).Format("yyyy-MM-dd hh:mm:ss"));
                    $("#passTime").text(new Date(data.passTime).Format("yyyy-MM-dd hh:mm:ss"));
                    $("#files").text("");
                    $("#files").append("<a href='<%=request.getSession().getContextPath("/")%>/upload/P1605009/index.jsp'>资料下载</a>")
                    $("#show-project-modal-dialog").modal('show');
                });

            });
            
            $(".get-stu-info").on('click', function () {
                // 获取id值
                var id = $(this).parent().siblings().eq(0).text();
                $.ajax({
                    method: 'POST',
                    url: "/teacher/showstudentdetail",
                    data: {id: id},
                    success: function (response) {
                        if(response=="success")
                        window.location.href="/teacher/Studentdetail";
                    },
                    error: function () {
                        showMsg("服务器发生错误,操作失败!", 1);
                    }
                });
            });
            $(".upfile-btn").on('click', function () {
                // 获取id值
                var id = $(this).parent().siblings().eq(0).text();
                $("#fileup-modal-dialog").modal('show');

            });

        })
}
