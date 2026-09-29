%% Complete BEND-1D Toolbox and Category Test
%
% This script performs two groups of tests.
%
% A. Core and regression tests from testAllSignals.m
%
%   1. Verifies that catalog.m returns a valid table.
%   2. Verifies the required catalog variables.
%   3. Verifies the Category 1 IDs and names.
%   4. Tests all Category 1 signals.
%   5. Verifies the recommended sample size.
%   6. Compares generate.m with direct SignalBank.m output.
%   7. Tests nondefault signal parameters.
%   8. Tests information retrieval through info.m.
%   9. Tests linear and decibel SNR normalization.
%  10. Tests invalid and unknown signal handling.
%
% B. Selected-category tests from testSignalCategory.m
%
%   1. Confirms that every returned catalog row belongs to the selected
%      category.
%   2. Generates every signal in the selected category.
%   3. Verifies that x and f are numeric N-by-1 column vectors.
%   4. Verifies that x and f contain only real and finite values.
%   5. Verifies that the sampling grid is strictly increasing from 0 to 1.
%   6. Verifies that every generated signal is nonconstant.
%   7. Verifies that ID, name, and category metadata agree with catalog.m.
%
% Passing these tests confirms software structure, connectivity, output
% validity, and metadata consistency. It does not independently prove that
% every signal has the intended scientific morphology.

%% Clear Cached Functions

clear SignalBank generate catalog listSignals info normalizeSNR
rehash

%% Project Locations

projectRoot = ...
    "/Users/hvimalajeewa2/Documents/UNL_Documents/Projects/bend1d";

toolboxFolder = fullfile(projectRoot,"toolbox");
testsFolder = fullfile(projectRoot,"tests");

coreTestFile = fullfile( ...
    testsFolder,"testAllSignals.m");

categoryTestFile = fullfile( ...
    testsFolder,"testSignalCategory.m");

assert(isfolder(toolboxFolder), ...
    "Toolbox folder not found: %s",toolboxFolder);

assert(isfolder(testsFolder), ...
    "Tests folder not found: %s",testsFolder);

assert(isfile(coreTestFile), ...
    "Core test file not found: %s",coreTestFile);

assert(isfile(categoryTestFile), ...
    "Category test file not found: %s",categoryTestFile);

addpath(toolboxFolder);

%% Select the Category
%
% Enter an integer from 1 through 10.

categoryNumber = 5;

validateattributes(categoryNumber,{'numeric'}, ...
    {'scalar','integer','>=',1,'<=',10}, ...
    mfilename,'categoryNumber');

setenv( ...
    "BEND1D_TEST_CATEGORY", ...
    string(categoryNumber));

%% Display the Selected Category

categorySignals = listSignals(categoryNumber);

if isempty(categorySignals)
    error("BEND1D:EmptyCategory", ...
        "Category %d contains no registered signals.", ...
        categoryNumber);
end

fprintf("\nBEND-1D Complete Test\n");
fprintf("=====================\n");
fprintf("Selected category: %d\n",categoryNumber);
fprintf("Signals in category: %d\n\n", ...
    height(categorySignals));

disp(categorySignals(:, ...
    ["ID","Name","Category","RecommendedN"]));

%% Run the Core Toolbox Tests

fprintf("\nRunning Core Toolbox and Category 1 Tests\n");
fprintf("==========================================\n");

coreResults = runtests(coreTestFile);

%% Run the Selected-Category Tests

fprintf("\nRunning Category %d Tests\n",categoryNumber);
fprintf("===========================\n");

categoryResults = runtests(categoryTestFile);

%% Display Core Test Results

fprintf("\nCore Toolbox Test Results\n");
fprintf("=========================\n");

disp(table(coreResults));

%% Display Selected-Category Results

fprintf("\nCategory %d Test Results\n",categoryNumber);
fprintf("=========================\n");

disp(table(categoryResults));

%% Calculate Core Test Summary

corePassed = sum([coreResults.Passed]);
coreFailed = sum([coreResults.Failed]);
coreIncomplete = sum([coreResults.Incomplete]);

fprintf("\nCore Toolbox Test Summary\n");
fprintf("=========================\n");
fprintf("Total:      %d\n",numel(coreResults));
fprintf("Passed:     %d\n",corePassed);
fprintf("Failed:     %d\n",coreFailed);
fprintf("Incomplete: %d\n",coreIncomplete);

%% Calculate Selected-Category Summary

categoryPassed = sum([categoryResults.Passed]);
categoryFailed = sum([categoryResults.Failed]);
categoryIncomplete = ...
    sum([categoryResults.Incomplete]);

fprintf("\nCategory %d Test Summary\n",categoryNumber);
fprintf("========================\n");
fprintf("Total:      %d\n",numel(categoryResults));
fprintf("Passed:     %d\n",categoryPassed);
fprintf("Failed:     %d\n",categoryFailed);
fprintf("Incomplete: %d\n",categoryIncomplete);

%% Calculate the Overall Summary

allResults = [
    coreResults(:)
    categoryResults(:)
];

totalPassed = sum([allResults.Passed]);
totalFailed = sum([allResults.Failed]);
totalIncomplete = sum([allResults.Incomplete]);

fprintf("\nOverall BEND-1D Test Summary\n");
fprintf("============================\n");
fprintf("Total tests: %d\n",numel(allResults));
fprintf("Passed:      %d\n",totalPassed);
fprintf("Failed:      %d\n",totalFailed);
fprintf("Incomplete:  %d\n",totalIncomplete);

%% Interpret the Results

if all([allResults.Passed])

    fprintf( ...
        "\nAll core toolbox and Category %d tests passed.\n", ...
        categoryNumber);

    fprintf( "Every tested signal can be generated and returns valid outputs with catalog-consistent metadata.\n");

else

    fprintf(2, ...
        "\nOne or more BEND-1D tests failed.\n");

    failedResults = allResults( ...
        [allResults.Failed] | ...
        [allResults.Incomplete]);

    fprintf(2, ...
        ["Review the results below for missing implementations, " ...
         "runtime errors, invalid outputs, metadata inconsistencies, " ...
         "or failed utility-function tests.\n\n"]);

    disp(table(failedResults));
end