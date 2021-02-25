$('.chkbx').click(function(){
    var text = "";
    $('.chkbx:checked').each(function(){
        text += $(this).val()+',';
    });
    text = text.substring(0,text.length-1);
    
    $('#textbx').val(text);
});