/**
 * Created by torans on 17/7/11.
 */

//固定边栏
$(window).scroll(function(event){
    var height = $(document).scrollTop();
    if (height>=180){
        $('#side-bar').addClass('fixed')
    } else {
        $('#side-bar').removeClass('fixed')
    }
});