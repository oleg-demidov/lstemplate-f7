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
        console.log('loadScripts')
        var scripts = $(page.pageEl).find('script');
        $.each(scripts, function(i,script){
            $.getScript($(script).attr('src'));
        })
        eval($('#eval_script').text())
    }
    
//    $.each(routes, function(i,route){
//        route.on = {
//            pageInit:nloadScripts
//        }
//    })
    
    var options = Object.assign(ls.registry.get('app'), {routes:routes});
    
    console.log(options)

    app = new Framework7(options);
    
    var options = Object.assign(ls.registry.get('view'), {
        on:{
            pageInit:loadScripts,
            /*
             * 
             * Костыль для отмены подгрузки страницы после инициализации
             */
            /*routerAjaxStart:function(xhr, opt){
                xhr.addEventListener("loadstart", function(e){
                    var urlpar =  e.target.requestUrl.substr(0, e.target.requestUrl.indexOf('?')-1);
                    console.log(window.location.pathname , urlpar)
                    if(window.location.pathname === urlpar){                        
                        e.target.abort();
                        e.target.onload()
                        return false;
                    }
                }, false);
            }*/
        }
    });
            
    var mainView = app.views.create('.view-main', ls.registry.get('view'));
        
//    mainView.router.on('routerAjaxStart', function(xhr){
////        var urlpar = '/' + xhr.requestUrl.substr(0, xhr.requestUrl.indexOf('?'));
//        console.log(window.location.pathname, xhr.requestUrl)
//        if(window.location.pathname === urlpar){
//            mainView.router.off('routerAjaxStart');
//            return false;
//        }
//    });
   
    
    mainView.router.on('routeChange', function(newRoute, previousRoute, router){
        
        //router.xhr.abort();
        
        console.log(router)
//        console.log(window.location.pathname);
//        console.log(previousRoute);
//        console.log(newRoute);
//        newRoute = previousRoute;
        //xhr.abort(500);
    }); 
    
            
    ls.hook.run('ls_template_init_end',[],window);
});

function onloadrecaptcha() {
    console.log('onloadrecaptcha')
    
    $('.js-auth-registration-form').f7Auth({
        with_recaptcha:true,
        sitekey:ls.registry.get('recaptcha.sitekey')
    });
    /*$('.js-auth-registration-form button[type="submit"]').f7Recaptcha({
        sitekey:ls.registry.get('recaptcha.sitekey'),
        onsubmit:function(){ $('.js-auth-registration-form').submit(); }
    });    */
}