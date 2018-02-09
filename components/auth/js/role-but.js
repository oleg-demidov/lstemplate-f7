$(document).ready(function(){
    var butActive = $('.fl-register-role button.ls-button--primary')
    butActive.parent().after('<input type="hidden" name="role" value="'+butActive.val()+'">')
    $('.fl-register-role button').click(function(){
        $('.fl-register-role button').removeClass('ls-button--primary');
        $(this).addClass('ls-button--primary');
        $('input[name="role"]').remove();
        $(this).parent().after('<input type="hidden" name="role" value="'+$(this).val()+'">')
    });
});