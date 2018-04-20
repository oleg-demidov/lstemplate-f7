/**
 * Инициализации модулей
 *
 * @license   GNU General Public License, version 2
 * @copyright 2013 OOO "ЛС-СОФТ" {@link http://livestreetcms.com}
 * @author    Denis Shakhov <denis.shakhov@gmail.com>
 */

var app;

jQuery(document).ready(function($){
    // Хук начала инициализации javascript-составляющих шаблона
    ls.hook.run('ls_template_init_start',[],window);

    var routes = ls.registry.get('routes');
    
    var loadScripts = function(e,page){
        var scripts = $(page.pageEl).find('script');
        $.each(scripts, function(i,script){
            $.getScript($(script).attr('src'));
        })
        eval($('#eval_script').text())
    }
    
    $.each(routes, function(i,route){
        route.once = {
            pageInit:loadScripts
        }
    })
    
    var options = Object.assign(ls.registry.get('app'), {routes:routes});
    
    console.log(options)

    app = new Framework7(options);
    
            
    var mainView = app.views.create('.view-main', ls.registry.get('view'));   
    
    mainView.router.on('routeChange', function(newRoute, previousRoute, router){
        
        
        console.log(router)

    }); 
    
            
    ls.hook.run('ls_template_init_end',[],window);
});

function onloadrecaptcha() {
    
    $('.js-auth-registration-form').f7Auth({
        with_recaptcha:true,
        sitekey:ls.registry.get('recaptcha.sitekey')
    }).parsley();    
  
}