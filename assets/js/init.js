/**
 * Инициализации модулей
 *
 * @license   GNU General Public License, version 2
 * @copyright 2013 OOO "ЛС-СОФТ" {@link http://livestreetcms.com}
 * @author    Denis Shakhov <denis.shakhov@gmail.com>
 */

jQuery(document).ready(function($){
    // Хук начала инициализации javascript-составляющих шаблона
    ls.hook.run('ls_template_init_start',[],window);

    var options = Object.assign(ls.registry.get('app'), {routes:ls.registry.get('routes')});

    var app = new Framework7(options);
        
    var mainView = app.views.create('.view-main', ls.registry.get('view'));
    
    mainView.router.on('routeChange', function(xhr){
        console.log(mainView.router);
        //xhr.abort(500);
        //return false;
    }); 
            
    ls.hook.run('ls_template_init_end',[],window);
});