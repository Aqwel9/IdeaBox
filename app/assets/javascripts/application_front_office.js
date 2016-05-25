// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
// require jquery.turbolinks
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales
// require turbolinks
//= require mdl/material
//= require materialize-sprockets
//= require axel/script
//= require nested_form_fields
//= require jquery.minicolors
//= require onepage/jquery.onepage-scroll



$(document).ready(function(){

    // Content SIZE
    $('#min-size-content').css("min-height", $(window).height());
    $( window ).resize(function() {
        $('#min-size-content').css("min-height", $(window).height());
    });

    $('.add_nested_fields_link').click(function(){
        $('.collapsible-body').css('display','none');
    });

    $('#idea-content').bind("DOMNodeInserted", function(){

        $('.collapsible').collapsible({});

        $textareas = $('.collapsible').find('.textarea')

        $textareas.each(function (i) {
            if(!($(this).prev().hasClass("wysihtml5-toolbar"))){
                $(this).wysihtml5({
                    toolbar: {
                        image: false
                    }
                });
            }
        });


    });

    //start WYSIWYG
    var $textarea = $('.textarea').first();
    if ($textarea.prev().is('ul')) {
    } else {

        $textarea.wysihtml5({
            toolbar: {
                image: false
            }
        });

    }

    $('input[type=text].minicolors').minicolors();

    if($('#one-page').length > 0){
        $("#one-page").onepage_scroll({
            sectionContainer: ".show-idea-panel",
            easing: "ease",
            animationTime: 750,
            pagination: true,
            updateURL: false
        });
    }


})
