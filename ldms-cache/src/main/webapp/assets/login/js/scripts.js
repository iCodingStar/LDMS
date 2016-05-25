
jQuery(document).ready(function() {
	
    /*
        Fullscreen background
    */
<<<<<<< HEAD
    // $.backstretch("${cacheUrl}/assets/login/img/backgrounds/1.jpg");
=======
>>>>>>> 29034534c8eb69d099f41bf09f110a2978e12398
    
    /*
        Form validation
    */
    $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
    	$(this).removeClass('input-error');
    });
    
    $('.login-form').on('submit', function(e) {
    	
    	$(this).find('input[type="text"], input[type="password"], textarea').each(function(){
    		if( $(this).val() == "" ) {
    			e.preventDefault();
    			$(this).addClass('input-error');
    		}
    		else {
    			$(this).removeClass('input-error');
    		}
    	});
    	
    });
    
    
});
