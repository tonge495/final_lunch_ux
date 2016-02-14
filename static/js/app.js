var app = angular.module('uxlunch', []);

app.config(['$interpolateProvider', function($interpolateProvider) {
    $interpolateProvider.startSymbol('{[{').endSymbol('}]}');

}]).controller('FormController', ['$scope', function ($scope) {
    // Initialize the default values here
    // Please adjust this to the number of sections that can be going on.
    $scope.selectedLanguage = undefined;
    $scope.numberOfSteps = 5;
    $scope.currentStep = 0;
    $scope.languageOptions = [
        { "id": 1, "name": "English" },
        { "id": 2, "name": "Spanish" },
    ];

    $scope.changeSection = function (newSectionNumber) {
        $scope.currentStep = newSectionNumber;
    };

    $scope.setLanguage = function() {
        if ($scope.selectedLanguage && $scope.selectedLanguage.id) {
            $scope.selectedLanguage = $scope.selectedLanguage.id;
            $scope.changeSection(1);
        }
    }

    $scope.hasSelectedLanguage = function() {
        // return to see if it's NOT null or NOT undefined
        return !!($scope.selectedLanguage);
    };
}]);
