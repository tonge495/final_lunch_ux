var app = angular.module('uxlunch', []);

app.config(['$interpolateProvider', function($interpolateProvider) {
    // This is because within certain templating engines, such as Bottle, the
    // `{{ }}` are reserved for the framework's templating engine. This changes
    // Angular's default `{{ }}` to be `{[{ }]}`.
    $interpolateProvider.startSymbol('{[{').endSymbol('}]}');
}]).controller('FormController', ['$scope', function ($scope) {
    /**
     * Defaults
     */
    $scope.isInitialPage = function() {
        return $scope.currentStep <= 0;
    };

    // which language the user should use (default: '')
    // TODO please change this back to null or ''
    var selectedLanguage = 'english';

    // number of pages to go through
    var numberOfSteps = 10;

    // which languages the user should be able to select from
    // TODO get the list of languages
    var languageOptions = [
        { "id": 1, "name": "English", "value": "English", "abbreviation": "en" },
        { "id": 2, "name": "Chinese", "value": "", "abbreviation": "cn" },
        { "id": 2, "name": "Spanish", "value": "", "abbreviation": "es" }
    ];

    // These are the key value pairs of income sources
    var incomeSources = [
        { "id": 0, "name": "- Choose a source -" },
        { "id": 1, "name": "Earnings from work" },
        { "id": 2, "name": "Public Assistance" },
        { "id": 3, "name": "Child Support" },
        { "id": 4, "name": "Alimony" },
        { "id": 5, "name": "Pensions/Retirement" },
        { "id": 6, "name": "(Other income)" }
    ];

    // dictates which step we're in. This can be defaulted to a certain step
    // for debugging.
    var currentStep = 0;

    /**
     * Returns an object containing income information. This is useful for
     * resetting the income whenever a user discards the existing income.
     */
    var newIncome = function() {
        return {
            source: incomeSources.find(function(source) {
                return source.id === 0;
            }),
            amount: null,
            frequency: null
        };
    };


    /**
     * Returns an object that is a representation of the active adult for the
     * section "Income Information".
     */
    var newAdult = function() {
        return {
            incomeSources: [],
            information: {
                income: newIncome(),
                firstName: null,
                lastName: null
            }
        };
    };

    var newChild = function() {
        return {
            firstName: null,
            lastName: null,
            middleInitial: null,
            statuses: {}
        };
    };


    $scope.selectedLanguage = selectedLanguage;
    $scope.numberOfSteps = numberOfSteps;
    $scope.currentStep = currentStep;
    $scope.languageOptions = languageOptions;

    $scope.incomeSources = incomeSources;

    $scope.workingAdults = [];
    $scope.currentAdult = newAdult();

    $scope.children = [];
    $scope.currentChild = newChild();

    /**
     * Changes the currentStep, allowing us to paginate through sections.
     * @param {Number} newSectionNumber - the page we should go to
     */
    $scope.changeSection = function(newSectionNumber) {
        $scope.currentStep = newSectionNumber;
    };


    // TODO refactor?
    $scope.setLanguage = function() {
        if ($scope.selectedLanguage && $scope.selectedLanguage.id) {
            $scope.selectedLanguage = $scope.selectedLanguage.id;
            $scope.changeSection(1);
        }
    };

    $scope.hasSelectedLanguage = function() {
        // return to see if it's NOT null or NOT undefined
        return !!($scope.selectedLanguage);
    };


    /**
     * Adds the `currentAdult` to the list of adults. This is helpful since it
     * resets the $scope's `currentAdult`. It does not add the adult if the
     * adult already exists in $scope.workingAdults.
     */
    $scope.addWorkingAdult = function() {
        var adult = $scope.currentAdult;

        if (isValidAdult(adult) && !isExistingAdult(adult)) {
            adult.id = $scope.workingAdults.length + 1;
            $scope.workingAdults.push(adult);
            $scope.clearCurrentAdult();
        }
    };


    /**
     * Resets `$scope.currentAdult`.
     */
    $scope.clearCurrentAdult = function() {
        $scope.currentAdult = newAdult();
    };


    /**
     * Adds the `income` being set for the `currentAdult` and adds it to the
     * `currentAdult`'s incomes
     */
    $scope.saveIncomeSource = function() {
        var income = $scope.currentAdult.information.income;

        if (income.source.id !== 0) {
            income.id = $scope.currentAdult.incomeSources.length + 1;
            $scope.currentAdult.incomeSources.push(income);
            $scope.currentAdult.information.income = newIncome();
        }
    };


    /**
     * Sets the provided adult as the `currentAdult`.
     * @param {Object} adult - the selected adult
     */
    $scope.editAdult = function(adult) {
        if ($scope.removeAdult()) {
            $scope.currentAdult = adult;
            return true;
        }

        return false;
    };

    $scope.removeAdult = function(adult) {
        var indexOfAdult = $scope.workingAdults.indexOf(adult);

        if (indexOfAdult !== -1) {
            $scope.workingAdults.splice(indexOfAdult, 1);
            return true;
        }

        return false;
    };


    /**
     * Verifies to see if the given adult is already included. This is useful
     * when you are adding the adult to the list of adults. It prevents
     * duplicates with multiple income sources.
     * @param {Object} adult
     * @return {Boolean} whether or not the adult is included.
     */
    var isExistingAdult = function(adult) {
        if (!adult) return false;

        return $scope.workingAdults.some(function(worker) {
            return worker.information.firstName === adult.information.firstname &&
                worker.information.lastName === adult.information.lastName;
        });
    };


    $scope.hasProgram = function() {
        var program = $scope.program,
            hasProgram = false;

        if (!program || !Object.keys(program).length) return hasProgram;

        return Object.keys(program).some(function(key) {
            return key != 'none' && !!(program[key]);
        });
    };


    $scope.resetProgram = function() {
        var program = $scope.program;

        if (program && program.none == true) {
            for (var key in program) {
                if (key != 'none') {
                    $scope.program[key] = false;
                }
            }
        }
    };


    $scope.uncheckNone = function() {
        if ($scope.hasProgram())
            $scope.program.none = false;
    };


    $scope.hasCaseNumber = function() {
        return $scope.program && $scope.program.hasCaseNumber == 'true';
    };


    $scope.addChild = function() {
        var child = $scope.currentChild;

        if (isValidChild(child) && !isExistingChild(child)) {
            child.id = $scope.children.length + 1;
            $scope.children.push(child);
            $scope.clearCurrentChild();
        }
    };

    $scope.clearCurrentChild = function() {
        $scope.currentChild = newChild();
    };

    var isExistingChild = function(child) {
        if (!child) return false;

        return $scope.children.some(function(kid) {
            return kid.firstName === child.firstName &&
                kid.lastName === child.lastName;
        });
    };

    $scope.editChild = function(child) {
        var indexOfChild = $scope.children.indexOf(child);

        if (indexOfChild !== -1) {
            $scope.children.splice(indexOfChild, 1);
            $scope.currentChild = child;
        }
    };

    $scope.removeChild = function(child) {
        var indexOfChild = $scope.children.indexOf(child);

        if (indexOfChild !== -1) {
            $scope.children.splice(indexOfChild, 1);
            return true;
        }

        return false;
    };

    var isValidChild = function(child) {
        if (!child)
            return false;

        return child.firstName && child.lastName;
    };

    var isValidAdult = function(adult) {
        if (!adult || !adult.information)
            return false;

        return adult.information.firstName && adult.information.lastName;
    };
}]);
