
(function($) {
    "use strict";

    $.widget( "f7.f7Auth", $.livestreet.lsComponent, {
        /**
         * Дефолтные опции
         */
        options: {
            submit:null,
            with_recaptcha:false,
            sitekey:null,
            // Ссылки
            urls: {
                // Вставка файла
                submit: aRouter.auth + 'ajax-login',
                
            },

            // Селекторы
            selectors: {
                submit:'button[type="submit"]',
                rbutton:'.js-recaptcha-button'
                
            },

            params: {}
        },

        /**
         * Конструктор
         *
         * @constructor
         * @private
         */
        _create: function () {
            this._super();
            
            if(!this.option('with_recaptcha')){
                this._on(this.element, { submit:"submit" });
            }else{
                this._on(this.element, { submit:"recaptchaExecute" });
                this.elements.rbutton.f7Recaptcha({
                    sitekey:    this.option('sitekey'),
                    callback:   this.submit.bind(this)
                });
            }
        },
        recaptchaExecute:function(){
            this.elements.rbutton.f7Recaptcha('execute');
            return false;
        },
        submit:function(){ ;
            
            this._trigger('onsubmit', null, { context: this });
            
            var data = [];
            this.element.serializeArray().forEach( function(el){
                data[el.name] =  el.value;
            })
            
            this._load('submit', data, function(r){
                console.log(r);
            })
            console.log(data);
            return false;
        }
    });
})(jQuery);

