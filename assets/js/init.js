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
        route.on = {
            pageInit:loadScripts
        }
    })
    
    var options = Object.assign(ls.registry.get('app'), {routes:routes});

    app = new Framework7(options);
            
    var mainView = app.views.create('.view-main', ls.registry.get('view'));
    
    $(window).bind('statechange', function(event) {
        //var state = History.getState();
        console.log('back');
        //History.log('History.stateChange: ' + $.param(state.data) + ' ' + state.url, event);
        // check state object here and control the display of articles or UI elements
        // eg if state.data.page === 1 then hide all pages except for page 1
        event.preventDefault();
        return false;
    });
    
    mainView.router.on('routeChange', function(xhr){
       // history.pushState({}, "", mainView.router.url);
        console.log(mainView.router);
        //xhr.abort(500);
        //return false;
    }); 
    
    $(window).on('popstate', function(e){
        //var path = 
        console.log(e)
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