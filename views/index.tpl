<!doctype>
<html ng-app="uxlunch">
  <head>
    <link rel="stylesheet" href="../static/css/reset.css" />
    <link rel="stylesheet" href="../static/css/styles.css" />
    <meta http-equiv="content-type" content="text-html; charset=utf-8">
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
  </head>
  <body ng-controller="FormController as formController"
        ng-class="{landingPage: isInitialPage()}">
    <div class="content">
        <div class="landing" ng-show="currentStep === 0" ng-model="selectedLanguage">
            <h1 class="subtitle">Welcome to the</h1>
            <h1 class="title">National Lunch Program</h1>
            <h1 class="subtitle">Registration Page</h1>
            <div class="center languageOptions">
                <p>Please select your language:</p>
                <div class="radio">
                    <input type="radio" name="languageIcon" id="english"/>
                    <label for="english">English</label>
                </div>
                <div class="radio">
                    <input type="radio" name="languageIcon" id="spanish" />
                    <label for="spanish">Español</label>
                </div>
                <div class="radio">
                    <input type="radio" name="languageIcon" id="chinese" />
                    <label for="chinese">中文</label>
                </div>
                <div class="radio">
                    <input type="radio" name="languageIcon" id="french" />
                    <label for="frence">Français</label>
                </div>
                <div class="radio">
                    <input type="radio" name="languageIcon" id="other" />
                    <label for="other">Other</label>
                </div>
                 <div class="buttongroup">
                    <button ng-click="changeSection(1)" class="primarybutton enterButton">Enter Here</button>
                </div>
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
                    <section class="childrenSummary">
                        <div ng-repeat="child in children">
                            {[{ child.firstName }]} {[{ child.lastName }]}
                            <a href="#" ng-click="editChild(child)">Edit</a>
                            <a href="#" ng-click="removeChild(child)">Remove</a>
                        </div>
                    </section>
                    <h2>What is your child's information?</h2>
                    <div>
                        <div class="childName">
                            <div class="firstnamefield childfield">
                                <label for="firstName">First name</label>
                                <input type="text" name="firstName"
                                id="firstName" placeholder="First Name"
                                ng-model="currentChild.firstName"/>
                            </div>
                            <div class="middleinitialfield childfield">
                                <label for="middleInitial">MI</label>
                                <input type="text" name="middleInitial"
                                id="middleInitial"  placeholder="MI"
                                ng-model="currentChild.middleInitial"/>
                            </div>
                            <div class="lastnamefield childfield">
                                <label for="lastName">Last Name</label>
                                <input type="text" name="lastName" id="lastname"
                                placeholder="Last Name"
                                ng-model="currentChild.lastName" />
                            </div>
                        </div>

                        <div class="childType">
                            <p>Check all that apply:</p>
                            <div class="studentIcon checkbox">
                                <img src="../icons/student.png" class="student">
                                <input type="checkbox" name="student"
                                id="student"
                                ng-model="currentChild.statuses.student" />
                                <label for="student">Student</label>
                            </div>
                            <div class="fosterIcon checkbox">
                                <img src="../icons/foster.png" class="foster">
                                <input type="checkbox" name="foster" id="foster"
                                ng-model="currentChild.statuses.foster" />
                                <label for="foster">Foster</label>
                            </div>
                            <div class="studentIcon checkbox">
                                <img src="../icons/migrant.png" class="migrant">
                                <input type="checkbox" name="migrant"
                                id="migrant"
                                ng-model="currentChild.statuses.migrant" />
                                <label for="migrant">Migrant</label>
                            </div>
                            <div class="studentIcon checkbox">
                                <img src="../icons/homeless.png" class="homeless">
                                <input type="checkbox" name="homeless"
                                id="homeless"
                                ng-model="currentChild.statuses.homeless" />
                                <label for="homeless">Homeless</label>
                            </div>
                            <div class="studentIcon checkbox">
                                <img src="../icons/runaway.png" class="runaway">
                                <input type="checkbox" name="runaway"
                                id="runaway"
                                ng-model"currentChild.statuses.runaway" />
                                <label for="runaway">Runaway</label>
                            </div>
                        </div>
                            <button class="tertiarybutton" ng-click="addChild()">+Child</button>
                        <div class="buttongroup">
                            <button ng-click="changeSection(1)" class="secondarybutton">Previous</button>
                            <button ng-click="changeSection(3)" class="floatright primarybutton">Next</button>
                        </div>
                    </div>
                </div>
                <div class="step-3" ng-show="currentStep === 3">
                    <div>
                        <h2>Do you currently participate in any other government program?</h2>

                        <div class="checkboxOption checkbox">
                            <input type="checkbox" name="govt_type" value="SNAP"
                            id="snap_type" ng-model="program.snap"
                                           ng-change="uncheckNone()">
                            <label for="snap_type">SNAP</label><br>
                        </div>

                        <div class="checkboxOption checkbox">
                            <input type="checkbox" name="govt_type" value="TANF"
                            id="tanf_type" ng-model="program.tanf"
                                           ng-change="uncheckNone()">
                            <label for="tanf_type">TANF</label><br>
                        </div>

                        <div class="checkboxOption checkbox">
                            <input type="checkbox" name="govt_type"
                            value="FDPIR" id="fdpir_type"
                                          ng-model="program.fdpir"
                                          ng-change="uncheckNone()">
                            <label for="fdpir_type">FDPIR</label>
                        </div>

                        <div class="checkboxOption checkbox">
                            <input type="checkbox" name="govt_type" value="NONE"
                            id="none_type" ng-model="program.none"
                                           ng-change="resetProgram()">
                            <label for="none_type">None</label>
                        </div>

                        <div class="alternative" ng-show="hasProgram()">
                            <h3>Do you know your case number?</h3>
                            <div class="radio">
                                <input type="radio" name="hasCase" value="true"
                                id="hasCase" ng-model="program.hasCaseNumber">
                                <label for="hasCase">Yes</label>
                            </div>
                            <div class="radio">
                                <input type="radio" name="noCase" value="false"
                                id="noCase" ng-model="program.hasCaseNumber">
                                <label for="noCase">No</label>
                            </div>
                            <div ng-show="hasCaseNumber()" class="casenumberfield">
                                <label class="small" for="caseNumber">
                                    Case Number
                                </label>
                                <input type="text" name="caseNumber" id="caseNumber" ng-model="program.caseNumber" placeholder="Case Number" />
                            </div>
                            <div ng-show="program.hasCaseNumber == 'false'" class="small">
                                <p>
                                    Please contact xxx-xxx-xxxx to receive your case
                                    number.
                                </p>
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
                        <label for="householdNumber">Number of People</label><br>
                        <input type="number" min="1" placeholder="(0)"
                        name="householdNumber" ng-model="householdSize" />
                        <div class="buttongroup">
                            <button ng-click="changeSection(3)" class="secondarybutton">Previous</button>
                            <button ng-click="changeSection(5)" class="primarybutton floatright">Next</button>
                        </div>
                    </div>
                </div>
                <div class="step-5" ng-show="currentStep === 5">
                    <div>
                        <h2>Do your children earn income?</h2>
                        <div class="radio">
                            <input type="radio" ng-model="childrenDetails.haveIncome"
                            name="childIncome" id="hasChildIncome" value="1" />
                            <label for="hasChildIncome">Yes</label>
                        </div>
                        <div class="radio">
                            <input type="radio" ng-model="childrenDetails.haveIncome"
                            name="childIncome" id="noChildIncome" value="0" />
                            <label for="noChildIncome">No</label>
                        </div>

                        <section ng-show="childrenDetails.haveIncome == 1">
                            <div class="notification">
                                <img src="../icons/Apple.png" class="appleIcon">
                                <p>
                                    Please include the total income earned by all child household members.
                                </p>
                            </div>
                            <label for="childAmount">Income for all children</label>
                            <input type="number" placeholder="$(00.00)"
                            name="childAmount" ng-model="childrenDetails.amount"/>

                            <p>Frequency</p>
                            <div class="radio">
                                <img src="../icons/income-icons/hourly.png" class="hourly">
                                <input type="radio" name="childIncome"
                                id="hourlyChildIncome" value="1"
                                ng-model="childrenDetails.frequency" />
                                <label for="hourlyChildIncome">Hourly</label>
                            </div>
                            <div class="radio">
                                <img src="../icons/income-icons/weekly.png" class="weekly">
                                <input type="radio" name="childIncome"
                                id="weeklyChildIncome" value="2"
                                ng-model="childrenDetails.frequency" />
                                <label for="weeklyChildIncome">Weekly</label>
                            </div>
                            <div class="radio">
                                <img src="../icons/income-icons/biweekly.png" class="biweekly">
                                <input type="radio" name="childIncome"
                                id="biweeklyChildIncome" value="3"
                                ng-model="childrenDetails.frequency" />
                                <label for="biweeklyChildIncome">Bi-Weekly</label>
                            </div>
                            <div class="radio">
                                <img src="../icons/income-icons/monthly.png" class="monthly">
                                <input type="radio" name="childIncome"
                                id="monthlyChildIncome" value="4"
                                ng-model="childrenDetails.frequency" />
                                <label for="monthlyChildIncome">Monthly</label>
                            </div>
                            <div class="radio">
                                <img src="../icons/income-icons/bimonthly.png" class="bimonthly">
                                <input type="radio" name="childIncome"
                                id="bimonthlyChildIncome" value="5"
                                ng-model="childrenDetails.frequency" />
                                <label for="bimonthlyChildIncome">Bi-Monthly</label>
                            </div>
                            <div class="radio">
                                <img src="../icons/income-icons/annual.png" class="annual">
                                <input type="radio" name="childIncome"
                                id="annualChildIncome" value="6"
                                ng-model="childrenDetails.frequency" />
                                <label for="annualChildIncome">Annual</label>
                            </div>
                        </section>
                        <div class="buttongroup">
                            <button ng-click="changeSection(4)" class="secondarybutton">Previous</button>
                            <button ng-click="changeSection(6)" class="primarybutton floatright">Next</button>
                        </div>
                    </div>
                </div>
                <div class="step-6" ng-show="currentStep === 6">
                    <div>
                        <h2>What is your income information?</h2>
                        <div class="notification"><img src="../icons/Apple.png" class="appleIcon">
                            <p>List each non-child, those who were not listed in Step 2, even if they did not make money. If they have multiple sources of income, please add each source.</p>
                        </div>

                        <section name="incomeContainer">
                            <section name="adults">
                                <div class="adultResults">
                                <div ng-repeat="adult in workingAdults" class="adultName">
                                    {[{ adult.information.firstName }]} {[{ adult.information.lastName }]}
                                    <a href="#" ng-click="editAdult(adult)"><i class="fa fa-pencil-square-o"></i></a>
                                    <a href="#"
                                        ng-click="removeAdult(adult)"><i class="fa fa-minus-circle"></i></a>
                                </div>
                                </div>
                                <div class="">
                                    <div class="incomefirstnamefield namefield">
                                    <label for="firstName">First Name</label><br>
                                    <input type="text" name="firstName" placeholder="First name" ng-model="currentAdult.information.firstName" />
                                    </div>
                                    <div class="incomelastnamefield namefield">
                                    <label for="lastName">Last Name</label><br>
                                    <input type="text" name="lastName" placeholder="Last name" ng-model="currentAdult.information.lastName" />
                                    </div>
                                </div>
                            </section>
                            <div class="sourcesArea">
                                <div class="minusSourceLink">
                                    <a href="#" ng-click="clearCurrentAdult()"><i class="fa fa-minus-circle"></i></a>
                                </div>
                                <section name="sources">
                                        <div class="sourceResults" ng-repeat="incomeSource in currentAdult.incomeSources">
                                            Income from {[{ incomeSource.source.name }]}... {[{ incomeSource.amount | currency }]}
                                        </div>

                                        <div class="sourceDropdown">
                                            <select name="incomeSource" id="incomeSource" ng-options="source.name for source in incomeSources track by source.id" ng-model="currentAdult.information.income.source"></select>
                                        </div>
                                        <div class="amountField">
                                            <input type="number" name="income" id="income" ng-model="currentAdult.information.income.amount" placeholder="$(00.00)" />
                                        </div>
                                        <div class="frequency">
                                            <div class="radio">
                                                <input type="radio" name="adultIncome"
                                                id="hourlyAdultIncome" value="1"
                                                ng-model="currentAdult.information.income.frequency" />
                                                <label for="hourlyAdultIncome">Hourly</label>
                                            </div>
                                            <div class="radio">
                                                <input type="radio" name="adultIncome"
                                                id="weeklyAdultIncome" value="2"
                                                ng-model="currentAdult.information.income.frequency" />
                                                <label for="weeklyAdultIncome">Weekly</label>
                                            </div>
                                            <div class="radio">
                                                <input type="radio" name="adultIncome"
                                                id="biweeklyAdultIncome" value="3"
                                                ng-model="currentAdult.information.income.frequency" />
                                                <label for="biweeklyAdultIncome">Bi-Weekly</label>
                                            </div>
                                            <div class="radio">
                                                <input type="radio" name="adultIncome"
                                                id="monthlyAdultIncome" value="4"
                                                ng-model="currentAdult.information.income.frequency" />
                                                <label for="monthlyAdultIncome">Monthly</label>
                                            </div>
                                            <div class="radio">
                                                <input type="radio" name="adultIncome"
                                                id="bimonthlyAdultIncome" value="5"
                                                ng-model="currentAdult.information.income.frequency" />
                                                <label for="bimonthlyAdultIncome">Bi-Monthly</label>
                                            </div>
                                            <div class="radio">
                                                <input type="radio" name="adultIncome"
                                                id="annualAdultIncome" value="6"
                                                ng-model="currentAdult.information.income.frequency" />
                                                <label for="annualAdultIncome">Annual</label>
                                            </div>
                                        </div>
                                </section>
                                <div class="plusSourceLink">
                                    <a href="#" ng-click="saveIncomeSource()"><i class="fa fa-plus-circle"></i></a>
                                </div>
                            </div>
                            <button ng-click="addWorkingAdult()" class="tertiarybutton addPersonButton">+ Add person</button>
                        </section>
                        <div class="buttongroup">
                        <button ng-click="changeSection(5)" class="secondarybutton">Previous</button>
                        <button ng-click="changeSection(7)" class="primarybutton floatright">Next</button>
                        </div>
                    </div>
                </div>
                <div class="step-7" ng-show="currentStep === 7">
                    <div>
                        <h2>What are the last four digits of the Social Security Number of the primary wage earner or other adult household member?</h2><br>

                        XXX-XX-<input type="text" name="ssn"><br><br>
                        <div class="radio">
                        <input type="checkbox" name="no_ssn" value="NULL" checked>
                        <label for="no_ssn">No SSN</label>
                        </div>
                        <div class="buttongroup">
                            <button ng-click="changeSection(6)" class="secondarybutton">Previous</button>
                            <button ng-click="changeSection(8)" class="primarybutton floatright">Next</button>
                        </div>
                    </div>
                </div>
                <div class="step-8" ng-show="currentStep === 8">
                    <h2>What is your contact information?</h2>

                    <div class="notification"><img src="../icons/Apple.png" class="appleIcon"> <p>If you are homeless, you can add a previous, family or friend's, or your shelter's address.</p></div>
                    <div class="firstnamefield addressfield">
                        <label for="firstname">Your First Name</label>
                        <input type="text" name="firstname" placeholder="Your
                        First Name" ng-model="user.firstName"><br>
                    </div>
                    <div class="middleinitialfield addressfield">
                        <label for="middleInitial">MI</label>
                        <input type="text" name="middleinitial" placeholder="MI"
                        ng-model="user.middleInitial"><br>
                    </div>
                    <div class="lastnamefield addressfield">
                        <label for="lastname">Last Name</label>
                        <input type="text" name="lastname" placeholder="Last
                        Name" ng-model="user.lastName"><br>
                    </div>
                    <div class="streetaddressfield addressfield">
                        <label for="street_address">Street Address</label>
                        <input type="text" name="street_address"
                        placeholder="Street Address"
                        ng-model="user.address.street">
                    </div>
                    <div class="aptfield addressfield">
                        <label for="apt_num">Apt. #</label>
                        <input type="text" name="apt_num" placeholder="Apt. #"
                        ng-model="user.address.apartment"><br>
                    </div>
                    <div class="cityfield addressfield">
                        <label for="city">City</label>
                        <input type="text" name="city" placeholder="City"
                        ng-model="user.address.city"><br>
                    </div>
                    <div class="statefield addressfield">
                        <label for="state">State</label>
                        <input type="text" name="state" placeholder="State"
                        ng-model="user.address.state"><br>
                    </div>
                    <div class="zipcodefield addressfield">
                        <label for="zip_code">Zip Code</label>
                        <input type="text" name="zip_code" placeholder="Zip
                        Code" ng-model="user.address.zipCode"><br>
                    </div>
                    <div class="emailfield addressfield">
                        <label for="email">Email Address</label>
                        <input type="text" name="email" placeholder="Email
                        Address" ng-model="user.email"><br>
                    </div>
                    <div class="phonenumberfield addressfield">
                    <label for="phone">Phone Number</label>
                    <input type="text" name="phone" placeholder="Phone Number"
                    ng-model="user.phoneNumber"><br>
                    </div>
                    <br><br>
                    <div class="initialsfield addressfield">
                        Enter your initials to e-sign<br>
                        <input type="text" name="initials" placeholder="Initials
                        for E-Sign" ng-model="user.initials">
                    </div>
                    <br>
                    <div class="buttongroup">
                        <button ng-click="changeSection(3)" class="secondarybutton">Previous</button>
                        <button class="primarybutton floatright"
                        ng-click="postForm()">Submit</button>
                    </div>
                </div>
                <div class="step-9" ng-show="currentStep === 9">
                    <div class="finalPage">
                    <h1>All done!</h1>
                    <p>Thank you for signing up for the Federal School Lunch program!</p>
                    <p>Your confirmation number is:</p>
                    <p class="confNumber">1234567</p>
                    <p>You will receive a confirmation email shortly.</p>
                 <div class="buttongroup">
                    <button class="primarybutton reviewButton">Review Submission</button>
                </div>
                    <p>Time to eat!  You may close this window.</p>
                </div>
            </div>
            </div>
        </form>
    </div>
    <script src="../static/js/angular.min.js"></script>
    <script src="../static/js/app.js"></script>
  </body>
</html>
