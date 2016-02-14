<!doctype>
<html ng-app="uxlunch">
  <head>
    <link rel="stylesheet" href="/static/css/reset.css" />
  </head>
  <body>
    <h1>Loren's test area</h1>
    <div class="test">
        <form name="TEYST" method="POST" action="/submit">
            <input type="text" name="KEK" placeholder="Fill me in!" />
            <button type="submit">Test me!</button>
        </form>
    </div>
    <div class="content" ng-controller="FormController as formController">
        <form name="registration" id="registration">
            <h1>We're in step {[{ formController.visibleSection }]}</h1>
            <ul name="steps">
                <li>Step 1</li>
                <li>Step 2</li>
                <li>Step 3</li>
            </ul>

            <div class="the-real-form">
                <div class="step-1">
                    <div>
                        <h2>This is step 1!</h2>
                        <button ng-click="changeSection">click!</button>
                    </div>
                </div>
                <div class="step-2">
                    <div>
                        <h2>This is step 2!</h2>
                    </div>
                </div>
                <div class="step-3">
                    <div>
                        <h2>This is step 3!</h2>
                    </div>
                </div>
                <div class="step-4">
                    <div>
                        <h2>This is step 4!</h2>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script src="/static/js/angular.min.js"></script>
    <script src="/static/js/app.js"></script>
  </body>
</html>
