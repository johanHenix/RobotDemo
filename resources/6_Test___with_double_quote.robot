# Automation priority: null
# Test case importance: Low
*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_6_SETUP}	Get Variable Value	${TEST 6 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_6_SETUP is not None	${__TEST_6_SETUP}

Test Teardown
	${__TEST_6_TEARDOWN}	Get Variable Value	${TEST 6 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_6_TEARDOWN is not None	${__TEST_6_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Test " with double quote
	[Setup]	Test Setup

	Given I am connected
	When I click on "logout"
	Then I am disconnected

	[Teardown]	Test Teardown