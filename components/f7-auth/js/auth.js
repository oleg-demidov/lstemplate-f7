
(function($) {
    "use strict";

    $.widget( "f7.f7Auth", $.livestreet.lsComponent, {
        /**
         * Дефолтные опции
         */
        options: {
            
            // Ссылки
            urls: {
                // Вставка файла
                insert: aRouter.ajax + 'media/submit-insert/',
                // Вставка фотосета
                photoset: aRouter.ajax + 'media/submit-create-photoset',
                // Загрузка файла по ссылке
                url_upload: aRouter.ajax + 'media/upload-link/',
                // Вставка файла по ссылке
                url_insert: aRouter.ajax + 'media/upload-insert/'
            },

            // Селекторы
            selectors: {
                
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

            console.log('f7auth')
        }
    });
})(jQuery);

