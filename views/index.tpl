<!doctype>
<html ng-app="uxlunch">
  <head>
    <link rel="stylesheet" href="../static/css/reset.css" />
    <link rel="stylesheet" href="../static/css/styles.css" />
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">   
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
                            <li>Teaching students about good nutrition prepares them to stay healthier in life.</li>
                        </ul>

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
                            <input type="text" name="firstName" id="firstName" placeholder="First Name" />
                            <label for="middleInitial">MI</label>
                            <input type="text" name="middleInitial" id="middleInitial"  placeholder="MI"/>
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
                        <div class="buttongroup">
                            <button class="tertiarybutton" ng-click="addChild()">+Child</button>
                            <button ng-click="changeSection(1)" class="secondarybutton">Previous</button>
                            <button ng-click="changeSection(3)" class="floatright primarybutton">Next</button>
                        </div>
                    </div>
                </div>
                <div class="step-3" ng-show="currentStep === 3">
                    <div>
                        <h2>Do you currently participate in any other government program?</h2>

                        <div class="checkboxOption">
                            <input type="checkbox" name="govt_type" value="SNAP"
                            id="snap_type" ng-model="program.snap"
                                           ng-change="uncheckNone()">
                            <label for="snap_type">SNAP</label><br>
                        </div>

                        <div class="checkboxOption">
                            <input type="checkbox" name="govt_type" value="TANF"
                            id="tanf_type" ng-model="program.tanf"
                                           ng-change="uncheckNone()">
                            <label for="tanf_type">TANF</label><br>
                        </div>

                        <div class="checkboxOption">
                            <input type="checkbox" name="govt_type"
                            value="FDPIR" id="fdpir_type"
                                          ng-model="program.fdpir"
                                          ng-change="uncheckNone()">
                            <label for="fdpir_type">FDPIR</label>
                        </div>

                        <div class="checkboxOption">
                            <input type="checkbox" name="govt_type" value="NONE"
                            id="none_type" ng-model="program.none"
                                           ng-change="resetProgram()">
                            <label for="none">none</label>
                        </div>

                        <div class="alternative" ng-show="hasProgram()">
                            <h3>Do you know your case number?</h3>
                            <input type="radio" name="hasCase" value=true
                            id="hasCase" ng-model="program.hasCaseNumber">
                            <input type="radio" name="hasCase" value=false
                            id="noCase" ng-model="program.hasCaseNumber">
                            <div ng-show="hasCaseNumber()">
                                <label class="small" for="caseNumber">
                                    Case Number
                                </label>
                                <input type="text" name="caseNumber" id="caseNumber" ng-model="program.caseNumber" />
                            </div>
                        </div>

                        <div class="buttongroup">
                            <button ng-click="changeSection(2)" class="secondarybutton">Previous</button>
                            <button ng-click="changeSection(4)" class="primarybutton floatright">Next</button>
                        </div>
                    </div>
                </div>
                <div class="step-4" ng-show="currentStep === 4">
                    <div>
                        <h2>How many people are in your household?</h2>
                        <input type="number" placeholder="0" />
                        <div class="buttongroup">
                            <button ng-click="changeSection(3)" class="secondarybutton">Previous</button>
                            <button ng-click="changeSection(5)" class="primarybutton floatright">Next</button>
                        </div>
                    </div>
                </div>
                <div class="step-5" ng-show="currentStep === 5">
                    <div>
                        <h2>Does your child earn income?</h2>
                        <input type="radio" name="childIncome" value="1" />Yes
                        <input type="radio" name="childIncome" value="0" />No
                        <p>Please include the total income earned by all child household members.</p>
                        <div class="dollarSign">$<input type="number" placeholder="00.00" name="childAmount" /></div>

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
                        <h2>Step 4: Income Information</h2>
                        <p>
                            List each non-child, those who were not listed in 
                            Step 2, even if they did not make money. If they 
                            have multiple sources of income, please add each
                            source of income.
                        </p>

                        <section name="incomeContainer">
                            <section name="adults">
                                <div class="" ng-repeat="adult in workingAdults">
                                    {[{ adult.information.firstName }]} {[{ adult.information.lastName }]}
                                    <a href="#" ng-click="editAdult(adult)">Edit</a>
                                </div>
                                <div class="nameArea">
                                    <input type="text" name="firstName" placeholder="First name" ng-model="currentAdult.information.firstName" />
                                    <input type="text" name="lastName" placeholder="Last name" ng-model="currentAdult.information.lastName" />
                                </div>
                            </section>
                            <div class="sourcesArea">
                                <section name="sources">
                                        <i class="fa fa-minus-circle"></i>
                                            <a href="#" ng-click="clearCurrentAdult()">Remove</a>
                                        <div class="sourceDropdown">
                                        <div class="" ng-repeat="incomeSource in currentAdult.incomeSources">
                                            From {[{ incomeSource.source.name }]}... {[{ incomeSource.amount | currency }]}
                                        </div>

                                        <div class="">
                                            <select name="incomeSource" id="incomeSource" ng-options="source.name for source in incomeSources track by source.id" ng-model="currentAdult.information.income.source"></select>
                                        </div>
                                        </div>
                                            <input type="number" name="income" id="income" ng-model="currentAdult.information.income.amount" placeholder="$ (Amount)" />
                                            <input type="radio" name="frequency" />

                                        <div clas="">
                                        <div class="">
                                            <i class="fa fa-plus-circle"></i>
                                            <a href="#" ng-click="saveIncomeSource()">Add</a>
                                        </div>
                            </div>
                                </section>
                            </div>
                            <button ng-click="addWorkingAdult()" class="tertiarybutton">+ Add person</button>
                        </section>

                        <button ng-click="changeSection(5)" class="secondarybutton">Previous</button>
                        <button ng-click="changeSection(7)" class="primarybutton floatright">Next</button>
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

                    <div class="notification"><i class="fa fa-info"></i> If you are homeless, you can add a previous, family or friend's, or your shelter's address.</div>

                    <div class="streetaddressfield addressfield">
                    Street Address<br>
                    <input type="text" name="street_address" placeholder="Street Address">
                    </div>
                    <div class="aptfield addressfield">
                    Apt. #<br>
                    <input type="text" name="apt_num" placeholder="Apt. #"><br>
                    </div>
                    <div class="cityfield addressfield">
                    City<br>
                    <input type="text" name="city" placeholder="City"><br>
                    </div>
                    <div class="statefield addressfield">
                    State<br>
                    <input type="text" name="state" placeholder="State"><br>
                    </div>
                    <div class="zipcodefield addressfield">
                    Zip Code<br>
                    <input type="text" name="zip_code" placeholder="Zip Code"><br>
                    </div>
                    <div class="emailfield addressfield">
                    Email Address<br>
                    <input type="text" name="email" placeholder="Email Address"><br>
                    </div>
                    <div class="phonenumberfield addressfield">
                    Phone Number<br>
                    <input type="text" name="phone" placeholder="Phone Number"><br>
                    </div>
                    <div class="firstnamefield addressfield">
                    Your First Name<br>
                    <input type="text" name="firstname" placeholder="Your First Name"><br>
                    </div>
                    <div class="middleinitialfield addressfield">
                    MI<br>                    
                    <input type="text" name="middleinitial" placeholder="MI"><br>
                    </div>
                    <div class="lastnamefield addressfield">
                    Last Name<br>
                    <input type="text" name="lastname" placeholder="Last Name"><br>
                    </div>
                    <br><br>
                    <div class="initialsfield addressfield">
                    Enter your initials to e-sign<br>
                    <input type="text" name="initials" placeholder="Initials for E-Sign">
                    </div>
                    <br>
                    <div class="buttongroup">
                        <button ng-click="changeSection(3)" class="secondarybutton">Previous</button>
                        <button class="primarybutton floatright">Submit</button>
                    </div>
                </div>
            </div>
            </div>
        </form>
    </div>
    <script src="../static/js/angular.min.js"></script>
    <script src="../static/js/app.js"></script>
  </body>
</html>
