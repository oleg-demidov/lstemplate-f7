(function($) {
    "use strict";

    $.widget( "f7.f7Recaptcha", $.livestreet.lsComponent, {
        /**
         * Дефолтные опции
         */
        options: {
            sitekey:null,     
            callback:null,
            // Селекторы
            selectors: {
                
                
            },

            params: {}
        },
        id:null,

        /**
         * Конструктор
         *
         * @constructor
         * @private
         */
        _create: function () { 
            this._super();
            
            this.id = grecaptcha.render(
                this.element.get(0),
                {
                    sitekey:    this.option('sitekey'),
                    callback:   this.recaptcha_call.bind(this)
                }
            );
            
        },
        recaptcha_call:function(){
            this.option('callback')();
        },
        execute:function(){
            grecaptcha.execute(this.id);
        }
    });
})(jQuery);