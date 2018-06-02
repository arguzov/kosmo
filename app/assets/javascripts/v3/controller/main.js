//=require v3/common
'use strict';
var app, libs = {};

app = {
    /*** Init Function ***/
    init: function () {
        app.variables();
    },
    /*** Variables ***/
    variables: function () {
        /*** app ***/
        app.document = $(document);
        app.window = $(window);
        app.body = $('body');
    }
};

libs = {
    /*** Init Function ***/
    init: function () {
        libs.variables();
        libs.attachEvents();
    },
    /*** Variables ***/
    variables: function () {
        libs.owlCarousel = $('.owl-carousel');
    },
    attachEvents() {
        var owlData = [];
        owlData['banner'] = {
            autoplay: true,
            autoplayTimeout: 3000,
            smartSpeed: 400,
            items: 1,
            loop: false,
            nav: false,
            navText: [],
            dots: true
        };

        app.document.ready(function () {
            if (libs.owlCarousel !== undefined && libs.owlCarousel.length) {
                libs.owlCarousel.each(function () {
                    var carousel = $(this);
                    if (owlData[carousel.data('name')] != undefined)
                        carousel.owlCarousel(owlData[carousel.data('name')]);
                    else
                        carousel.owlCarousel();
                });
            }
        });
    }
};

$(function () {
    app.init();
    libs.init();
});