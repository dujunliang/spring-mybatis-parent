    /**
     * Created by dujunliang on 16/12/15.
     */
    $.extend({

        showResult: function (result) {
            var type, text;
            var layout = 'top';
            var modal = false;
            type = result['msgType'];
            if (result['success']) {
                text = '操作成功';
            } else {
                text = result['msg'];
            }
            noty({
                text: text,
                type: type,
                layout: layout,
                timeout: 2000,
                modal: modal

            });
        },
        confirm: function (msg, callback, options) {
            var type = 'confirm';
            noty({
                text: msg,
                type: type,
                layout: 'top',
                timeout: 2000,
                modal: true,
                buttons: (type != "confirm") ? false : [{
                    addClass: "btn btn-primary",
                    text: "Ok",
                    onClick: function (c) {
                        c.close();

                        if (typeof callback === 'function') {
                            callback(true);
                        }
                        //noty({force: true, text: 'You clicked "Ok" button', type: "success", layout: layout})
                    }
                }, {
                    addClass: "btn btn-danger", text: "Cancel", onClick: function (c) {
                        c.close();

                        if (typeof callback === 'function') {
                            callback(false);
                        }
                        //noty({force: true, text: 'You clicked "Cancel" button', type: "error", layout: layout})
                    }
                }]

            });

        },
        formValidator: function (form) {
            var $validator = $(form).data('bootstrapValidator');
            if (!$validator) {
                return false;
            }
            var isValid = $validator.validate().isValid();
            if (!isValid) {
                $('.has-error:first :input').focus();
            }
            return isValid;
        }


    });

    $.fn.select2Remote = function (options) {
        var opts = $.extend({}, $.fn.select2Remote.defaults, options);
        return this.select2({
            ajax: {
                url: opts.url,
                type: opts.type,
                data: opts.data,
                delay: opts.delay,
                cache: opts.cache,
                dataType: opts.dataType,
                processResults: opts.processResults
            },
            escapeMarkup: opts.escapeMarkup,
            templateResult: opts.templateResult,
            templateSelection: opts.templateSelection
        });
    };

    String.prototype.format = function(args) {
        var result = this;
        if (arguments.length > 0) {
            if (arguments.length == 1 && typeof (args) == "object") {
                for (var key in args) {
                    if(args[key]!=undefined){
                        var reg = new RegExp("({" + key + "})", "g");
                        result = result.replace(reg, args[key]);
                    }
                }
            }
            else {
                for (var i = 0; i < arguments.length; i++) {
                    if (arguments[i] != undefined) {
                        //var reg = new RegExp("({[" + i + "]})", "g");//这个在索引大于9时会有问题，谢谢何以笙箫的指出
                        var reg= new RegExp("({)" + i + "(})", "g");
                        result = result.replace(reg, arguments[i]);
                    }
                }
            }
        }
        return result;
    };



    $.fn.select2Remote.defaults = {
        url: '',
        delay: 1000,
        cache: true,
        type: 'post',
        dataType: 'json',
        data: function (params) {
            return {
                'codeType': $(this).attr('data-codeType') || '',
                'keyword': params && params.term ? '%' + params.term + '%' : '',
                'pageNumber': params.page || 0,
                'pageSize': 10
            };
        },
        processResults: function (data, params) {

            var results = [];
            $.each(data.data, function (index, obj) {
                var text = obj.text;
                if (text && text.length > 0) {

                } else {
                    text = obj.description;
                }
                results.push({id: obj.id, text: text});
            });

            return {
                results: results,
                pagination: {
                    // more: false
                    more: (params.page || 0) * 10 < (data['recordsTotal'] || 10)
                }
            };
        },
        escapeMarkup: function (markup) {   // Let custom formatter work
            return markup;
        },
        templateResult: function (repo) {
            return repo.text;
        },
        templateSelection: function (repo) {
            // return repo.id || repo.text;
            return repo.text;
        }
    };



