var app = angular.module('uxlunch', []);

app.config(['$interpolateProvider', function($interpolateProvider) {
    $interpolateProvider.startSymbol('{[{').endSymbol('}]}');

}]).controller('FormController', function () {
    this.visibleSection = 1;
});
