<!doctype>
<html ng-app="uxlunch">
  <head>
    <link rel="stylesheet" href="/static/css/reset.css" />
    <link rel="stylesheet" href="/static/css/styles.css" />
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
  </head>
  <body>
    <div class="content" ng-controller="FormController as formController">
        <div class="landing" ng-show="currentStep === 0" ng-model="selectedLanguage">
            <h1>Welcome to the National Lunch Program</h1>
            <div class="center">
            <label for="languageSelection">Pick a language</label>
            <select name="languageSelection" id="languageSelection" ng-options="language.name for language in languageOptions track by language.id" ng-model="selectedLanguage" ng-change="setLanguage()"></select>
        </div>
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

                        <h3>Why should my student sign up?</h3>
                        <ul>
                        <li>Qualified students get access to a balanced, nutritious lunch that includes whole grains, fruits, vegetables and milk</li>
                        <li>Better food means better grades! Well balanced nutrition improves academic performance and concentration.</li>
                        <li>Teaching students about good nutrition prepares them to stay healthier in life.</li></ul>

                        <h3>Schools and programs benefit too</h3>
                        <ul>
                        <li>Having students sign up means cash reimbursements for schools</li>
                        <li>Funds wellness policies to help schools address obesity problems and promote physical activity</li>
                        </ul>
                        <div class="buttongroup">
                        <button ng-click="changeSection(0)" class="secondarybutton">Previous</button>
                        <button ng-click="changeSection(2)" class="primarybutton floatright">Register Online</button>
                        <button class="tertiarybutton floatright marginright">Print PDF</button>
                        </div>
                    </div>
                </div>
                <div class="step-2" ng-show="currentStep === 2">
                    <h2>What is your child's information?</h2>
                    <div>
                        <div class="childName">
                            <label for="firstName">First name</label>
                            <input type="text" name="firstName" id="firstName" />
                            <label for="middleInitial">MI</label>
                            <input type="text" name="middleInitial" id="middleInitial" />
                            <label for="lastName">Last Name</label>
                            <input type="text" name="lastName" id="lastname" />
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
                        <div class="buttongroup">
                        <button class="tertiarybutton">+Child</button>
                        <button ng-click="changeSection(1)" class="secondarybutton">Previous</button>
                        <button ng-click="changeSection(3)" class="floatright primarybutton">Next</button>                        
                        </div>
                    </div>
                </div>
                <div class="step-3" ng-show="currentStep === 3">
                    <div>
                        <h2>Do you currently participate in any other government program?</h2>

                        <input type="checkbox" name="govt_type" value="SNAP"> SNAP<br>
                        <input type="checkbox" name="govt_type" value="TANF" checked> TANF<br>
                        <input type="checkbox" name="govt_type" value="FDPIR" checked> FDPIR<br>
                        <input type="checkbox" name="govt_type" value="NONE" checked> NONE<br>
                        <div class="buttongroup">
                        <button ng-click="changeSection(2)" class="secondarybutton">Previous</button>
                        <button ng-click="changeSection(4)" class="primarybutton floatright">Next</button>
                        </div>
                    </div>
                </div>
                <div class="step-4" ng-show="currentStep === 4">
                    <div>
                        <h2>How many people are in your household?</h2>
                        <input type="number" placeholder="# of people" />
                        <div class="buttongroup">                        
                        <button ng-click="changeSection(3)" class="secondarybutton">Previous</button>
                        <button ng-click="changeSection(5)" class="primarybutton floatright">Next</button>
                        </div>
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
                        <div class="buttongroup">
                        <button ng-click="changeSection(4)" class="secondarybutton">Previous</button>
                        <button ng-click="changeSection(6)" class="primarybutton floatright">Next</button>
                        </div>
                    </div>
                </div>
                <div class="step-6" ng-show="currentStep === 6">
                    <div>
                        <h2>What is your income information?</h2>
                        <p>Each person who makes money must be listed.  If they have multiple sources of income, please add each source of income next to
                        their name.</p>

                        <button class="tertiarybutton">Source -</button>
                        <p>Source:</p>
                        <select>
                            <option>Source 1</option>
                            <option>Source 2</option>
                        </select>
                        <p>Amount:</p>
                        $<input type="number" placeholder="Amount" name="childAmount" />
                        <button class="tertiarybutton">Source +</button>

                        <p>Frequency</p>
                        <input type="radio" name="childIncome" value="1" />Hourly
                        <input type="radio" name="childIncome" value="2" />Weekly
                        <input type="radio" name="childIncome" value="3" />Bi-Weekly
                        <input type="radio" name="childIncome" value="4" />Monthly
                        <input type="radio" name="childIncome" value="5" />Bi-Monthly
                        <input type="radio" name="childIncome" value="6" />Annual
                        <div class="buttongroup">
                        <button class="tertiarybutton">+ Person</button>
                        <button ng-click="changeSection(5)" class="secondarybutton">Previous</button>
                        <button ng-click="changeSection(7)" class="primarybutton floatright">Next</button>
                        </div>
                    </div>
                </div>
                <div class="step-7" ng-show="currentStep === 7">
                    <div>
                        <h2>What are the last four digits of the Social Security Number of the primary wage earner or other adult household member?</h2><br>

                        XXX-XX-<input type="text" name="ssn"><br><br>

                        <input type="checkbox" name="no_ssn" value="NULL" checked> No SSN<br>
                        <div class="buttongroup">
                        <button ng-click="changeSection(6)" class="secondarybutton">Previous</button>
                        <button ng-click="changeSection(8)" class="primarybutton floatright">Next</button>
                        </div>
                    </div>
                </div>
                <div class="step-8" ng-show="currentStep === 8">
                    <h2>What is your contact information?</h2>

                    If you are homeless, you can add a previous, family or friend's, or your shelter's address.<br><br>

                    <div class="streetaddressfield">
                    Street Address<br>
                    <input type="text" name="street_address">
                    </div>
                    <div class="aptfield">                    
                    Apt. #<br>
                    <input type="text" name="apt_num"><br>
                    </div>
                    <div class="cityfield">                    
                    City<br>
                    <input type="text" name="city"><br>
                    </div>
                    <div class="statefield">                    
                    State<br>
                    <input type="text" name="state"><br>
                    </div>
                    <div class="zipcodefield">                    
                    Zip Code<br>
                    <input type="text" name="zip_code"><br>
                    </div>
                    <div class="emailfield">                    
                    Email Address<br>
                    <input type="text" name="email"><br>
                    </div>
                    <div class="phonenumberfield">                    
                    Phone Number<br>
                    <input type="text" name="phone"><br>
                    </div>
                    <div class="firstnamefield">
                    Your First Name<br>
                    <input type="text" name="firstname"><br>
                    MI<br>
                    </div>
                    <div class="middleinitialfield">                    
                    <input type="text" name="middleinitial"><br>
                    Last Name<br>
                    </div>
                    <div class="lastnamefield">                    
                    <input type="text" name="lastname"><br>
                    </div>
                    <br><br>
                    Enter your initials to e-sign<br>
                    <input type="text" name="initials"><br>
                        <div class="buttongroup">                    
                    <button ng-click="changeSection(3)" class="secondarybutton">Previous</button>
                    <button class="primarybutton floatright">Submit</button>
                    </div>
                </div>
            </div>
            </div>
        </form>
    </div>
    <script src="/static/js/angular.min.js"></script>
    <script src="/static/js/app.js"></script>
  </body>
</html>
