jQuery(function($){
    
    $('#settings a.backgroundChanger').each(function(){
        $(this).css('background',$(this).attr('href'));
    });
    $('#settings a.backgroundChanger').unbind('click').click(function(){
        $('#settings a.backgroundChanger').removeClass('active'); 
        $(this).addClass('active'); 
        $('#sidebar img').each(function(){
            $(this).attr('src', $(this).attr('src').replace('/dark/','/')  );
        });
        if($(this).hasClass('dark')){
            $('body').addClass('dark'); 
            $('#sidebar').attr('class','black'); 
        }else{
            $('body').removeClass('dark'); 
            $('#sidebar').attr('class','grey'); 
        }
        var link = $(this).attr('href'); 
        $('body').css('background',link);
        return false;
    });
    
    
    $('#settings a.blocChanger').unbind('click').click(function(){
        $('#settings a.blocChanger').removeClass('active'); 
        $(this).addClass('active'); 
        $('#content').attr('class',$(this).attr('href')); 
        return false;
    });
    
    
    $('#settings a.sidebarChanger').unbind('click').click(function(){
        $('#settings a.sidebarChanger').removeClass('active'); 
        $(this).addClass('active'); 
        $('#sidebar').attr('class',$(this).attr('href')); 
        if($(this).attr('href')=='white'){
            $('#sidebar img').each(function(){
                $(this).attr('src', $(this).attr('src').replace('/menu/','/menu/dark/')  );
            }); 
        }else{
            $('#sidebar img').each(function(){
                $(this).attr('src', $(this).attr('src').replace('/dark/','/')  );
            });
        }
        return false;
    });
    
    
    
    
    
    
    
    
    $('#settings').css('marginRight',-150);
    var toggled = false; 
    $('#settings a.settingbutton').click(function(){
        if(toggled){
            $('#settings').animate({marginRight:-$('#settings').width()},500);
        }else{
            $('#settings').animate({marginRight:0},500);
        }
        toggled = !toggled; 
        return false
    });
    
}); 