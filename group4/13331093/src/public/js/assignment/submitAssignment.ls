window.onload = -> 
    #实例化编辑器
    #建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    #把内容绑定到input中
    $ '#submit' .click ->
        content = UE.getEditor 'editor' .getContent!
        $ '#submit_input' .val content
    url = document.URL.split "="
    aid = url[1]
    if aid
        $.get "/myassignment/?aid="+aid, (result) ->
            console.log result['assignment']["content"]
            # 追加内容
            UE.getEditor 'editor' .setContent result['assignment']["content"], true
            # 获得焦点
            UE.getEditor 'editor' .focus!
    


