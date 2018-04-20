
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
                register: aRouter.auth + 'ajax-register',
                
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
        submit:function(response){ ;
            
            this._trigger('onsubmit', null, { context: this });            
            
            this._submit('register', this.element, function(r){
                console.log(r);
            }, { params:{ captcha:response } });
            return false;
        }
    });
})(jQuery);

