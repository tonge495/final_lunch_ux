<!doctype>
<html ng-app="uxlunch">
  <head>
    <link rel="stylesheet" href="/static/css/reset.css" />
  </head>
  <body>
    <div class="content" ng-controller="FormController as formController">
        <div class="landing" ng-show="currentStep === 0" ng-model="selectedLanguage">
            <h1>Welcome to the National Lunch Program</h1>
            <label for="languageSelection">Pick a language</label>
            <select name="languageSelection" id="languageSelection" ng-options="language.name for language in languageOptions track by language.id" ng-model="selectedLanguage" ng-change="setLanguage()"></select>
        </div>

        <form name="registration" id="registration">
            <div class="navigation" ng-hide="!languageSelection">
                <label for="languageSelection">Language: </label>
                <select name="languageSelection" id="mainLanguageSelection" ng-options="language.name for language in languageOptions track by language.id" ng-model="selectedLanguage" ng-change="setLanguage()"></select>
            </div>

            <div class="the-real-form" ng-show="hasSelectedLanguage()">
                <div class="step-1" ng-show="currentStep === 1">
                    <div>
                        <h2>Program Benefits</h1>

                        <h3>How it works</h2>

                        <ul>
                        <li>The US Department of Agriculture (USDA) provides schools with funding for low-cost, healthy meals</li>
                        <li>Schools must prove that meals meet federal nutrition standards</li>
                        <li>Funds may be used to cover food, administration, and staffing costs</li>
                        <li>Participating schools can also receive donated commodity food from the USDA</li>
                        </ul>

                        <h2>Why should my student sign up?</h2>
                        <ul>
                        <li>Qualified students get access to a balanced, nutritious lunch that includes whole grains, fruits, vegetables and milk</li>
                        <li>Better food means better grades! Well balanced nutrition improves academic performance and concentration.</li>
                        <li>Teaching students about good nutrition prepares them to stay healthier in life.</li></ul>

                        <h2>Schools and programs benefit too</h2>
                        <ul>
                        <li>Having students sign up means cash reimbursements for schools</li>
                        <li>Funds wellness policies to help schools address obesity problems and promote physical activity</li>


                        <button ng-click="changeSection(0)">Previous</button>
                        <button>Print PDFs</button>
                        <button ng-click="changeSection(2)">Register Online</button>
                    </div>
                </div>
                <div class="step-2" ng-show="currentStep === 2">
                    <h2>What is your child's information?</h2>
                    <div>
                        <div class="childName">
                            <label for="firstName">First name</label>
                            <input type="text" name="firstName" id="firstName" placeholder="First Name" />
                            <label for="middleInitial">MI</label>
                            <input type="text" name="middleInitial" id="middleInitial" placeholder="MI" />
                            <label for="lastName">Last Name</label>
                            <input type="text" name="lastName" id="lastname" placeholder="Last Name" />
                        </div>

                        <div class="childType">
                            <p>Check all that apply:</p>
                            <div class="studentIcon">
                                <input type="checkbox" name="student" id="student" />Student
                            </div>
                            <div class="fosterIcon">
                                <input type="checkbox" name="foster" id="foster" />Foster
                            </div>
                            <div class="studentIcon">
                                <input type="checkbox" name="migrant" id="migrant" />Migrant
                            </div>
                            <div class="studentIcon">
                                <input type="checkbox" name="homeless" id="homeless" />Homeless
                            </div>
                            <div class="studentIcon">
                                <input type="checkbox" name="runaway" id="runaway" />Runaway
                            </div>
                        </div>

                        <button>+Child</button>
                        <button ng-click="changeSection(1)">Previous</button>
                        <button ng-click="changeSection(3)">Next</button>
                    </div>
                </div>
                <div class="step-3" ng-show="currentStep === 3">
                    <div>
                        <h2>Do you currently participate in any other government program?</h2>

                        <input type="checkbox" name="govt_type" value="SNAP"> SNAP<br>
                        <input type="checkbox" name="govt_type" value="TANF" checked> TANF<br>
                        <input type="checkbox" name="govt_type" value="FDPIR" checked> FDPIR<br>
                        <input type="checkbox" name="govt_type" value="NONE" checked> NONE<br>


                        <button ng-click="changeSection(2)">Previous</button>
                        <button ng-click="changeSection(4)">Next</button>
                    </div>
                </div>
                <div class="step-4" ng-show="currentStep === 4">
                    <div>
                        <h2>How many people are in your household?</h2>
                        <input type="number" placeholder="# of people" />
                        <button ng-click="changeSection(3)">Previous</button>
                        <button ng-click="changeSection(5)">Next</button>
                    </div>
                </div>
                <div class="step-5" ng-show="currentStep === 5">
                    <div>
                        <h2>Does your child earn income?</h2>
                        <p>Please include the total income earned by all child household members.</p>
                        <input type="radio" name="childIncome" value="1" />Yes
                        <input type="radio" name="childIncome" value="0" />No

                        <p>Amount:</p>
                        $<input type="number" placeholder="Amount" name="childAmount" />

                        <p>Frequency</p>
                        <input type="radio" name="childIncome" value="1" />Hourly
                        <input type="radio" name="childIncome" value="2" />Weekly
                        <input type="radio" name="childIncome" value="3" />Bi-Weekly
                        <input type="radio" name="childIncome" value="4" />Monthly
                        <input type="radio" name="childIncome" value="5" />Bi-Monthly
                        <input type="radio" name="childIncome" value="6" />Annual

                        <button ng-click="changeSection(4)">Previous</button>
                        <button ng-click="changeSection(6)">Next</button>
                    </div>
                </div>
                <div class="step-6" ng-show="currentStep === 6">
                    <div>
                        <h2>What is your income information?</h2>
                        <p>Each person who makes money must be listed.  If they have multiple sources of income, please add each source of income next to
                        their name.</p>

                        <button>Source -</button>
                        <p>Source:</p>
                        <select>
                            <option>Source 1</option>
                            <option>Source 2</option>
                        </select>
                        <p>Amount:</p>
                        $<input type="number" placeholder="Amount" name="childAmount" />
                        <button>Source +</button>

                        <p>Frequency</p>
                        <input type="radio" name="childIncome" value="1" />Hourly
                        <input type="radio" name="childIncome" value="2" />Weekly
                        <input type="radio" name="childIncome" value="3" />Bi-Weekly
                        <input type="radio" name="childIncome" value="4" />Monthly
                        <input type="radio" name="childIncome" value="5" />Bi-Monthly
                        <input type="radio" name="childIncome" value="6" />Annual

                        <button>+ Person</button>
                        <button ng-click="changeSection(5)">Previous</button>
                        <button ng-click="changeSection(7)">Next</button>
                    </div>
                </div>
                <div class="step-7" ng-show="currentStep === 7">
                    <div>
                        <h2>What are the last four digits of the Social Security Number of the primary wage earner or other adult household member?</h2><br>

                        XXX-XX-<input type="text" name="ssn"><br><br>

                        <input type="checkbox" name="no_ssn" value="NULL" checked> No SSN<br>

                        <button ng-click="changeSection(6)">Previous</button>
                        <button ng-click="changeSection(8)">Next</button>
                    </div>
                </div>
                <div class="step-8" ng-show="currentStep === 8">
                    <h2>What is your contact information?</h2>

                    If you are homeless, you can add a previous, family/friend's, or your shelter's address.<br><br>


                    Street Address<br>
                    <input type="text" name="street_address"><br>
                    Apt. #<br>
                    <input type="text" name="apt_num"><br>
                    City<br>
                    <input type="text" name="city"><br>
                    State<br>
                    <input type="text" name="state"><br>
                    Zip Code<br>
                    <input type="text" name="zip_code"><br>
                    Email Address<br>
                    <input type="text" name="email"><br>
                    Phone Number<br>
                    <input type="text" name="phone"><br>
                    Your First Name<br>
                    <input type="text" name="firstname"><br>
                    MI<br>
                    <input type="text" name="middleinitial"><br>
                    Last Name<br>
                    <input type="text" name="lastname"><br>

                    <br><br><br><br>
                    Enter your initials to e-sign<br>
                    <input type="text" name="initials"><br>
                    <button ng-click="changeSection(3)">Previous</button>
                    <button>Submit</button>
                </div>
            </div>
            </div>
        </form>
    </div>
    <script src="/static/js/angular.min.js"></script>
    <script src="/static/js/app.js"></script>
  </body>
</html>
