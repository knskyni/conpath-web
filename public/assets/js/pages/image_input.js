'use strict';

// Class definition
var KTImageInputDemo = function () {
    // Private functions
    var initDemos = function () {
        // Example 1
        var avatar1 = new KTImageInput('icon');
    }

    return {
        // public functions
        init: function() {
            initDemos();
        }
    };
}();

KTUtil.ready(function() {
    KTImageInputDemo.init();
});
