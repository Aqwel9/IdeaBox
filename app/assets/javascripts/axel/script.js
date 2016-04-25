/*------------------------------------------
|   FRAMEWORKS CSS - JS
*------------------------------------------*/

var ready = function(){

    // disabled button - prevent tab-enter
    $('[disabled]').on('keydown', function(e){
        e.preventDefault();
    });

    /*===========================================
    MODAL
    ===========================================*/

    // create background-modal and show modal on click(button)
    $('[modal-id]').on('click', function(){
        $modal = $('#'+$(this).attr('modal-id'));
        $modalBack = $('<div class="modal-background"/>');

        $('body').append($modalBack);
        $($modal).detach().appendTo($modalBack);

        $modalBack.fadeIn('slow');
        $modal.fadeIn('slow');
    });

    $('[modal-button]').on('click', function(){
        $action = $(this).attr('modal-button');
        if($action == "closed")
            closeModal($(this).parents('.modal-background'));
    });

    // remove background-modal and hide modal on click(background-modal)
    $('body').on('click','.modal-background',function(){
        $modal = $(this).find('.modal');
        if($modal.attr('modal-closed') == "outside"){
            closeModal($(this));
        }
    });

    function closeModal($modalBackground){
        $modalBackground.fadeOut('slow', function(){
            $modal = $modalBackground.find('.modal');
            $modal.hide();
            $($modal).detach().appendTo('body');
            $modalBackground.remove();
        });
    };

    $('.modal').on('click', function(e){
        e.stopPropagation();
    });

    /*===========================================
    NOTICES / ALERTS
    ===========================================*/

    $('.icon-close-notice').click(function(){
        $parent = $(this).parent();
        $parent.fadeOut( "slow", function() {
                $parent.remove();
        });
    });
}

$(document).ready(ready);
$(document).on('page:load', ready);
