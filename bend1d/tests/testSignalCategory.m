function tests = testSignalCategory
%TESTSIGNALCATEGORY Test all signals in a selected BEND-1D category.
%
% Before running, set:
%
%   setenv("BEND1D_TEST_CATEGORY","3")
%
% Then run:
%
%   results = runtests("tests/testSignalCategory.m");

    tests = functiontests(localfunctions);
end


function setupOnce(testCase)

    testFolder = fileparts(mfilename("fullpath"));
    projectRoot = fileparts(testFolder);
    toolboxFolder = fullfile(projectRoot,"toolbox");

    addpath(toolboxFolder);

    categoryText = getenv("BEND1D_TEST_CATEGORY");

    if strlength(categoryText) == 0
        error("BEND1D:MissingTestCategory", ...
            ["Specify the category before running the test using:" ...
             newline ...
             'setenv("BEND1D_TEST_CATEGORY","1")']);
    end

    categoryNumber = str2double(categoryText);

    if isnan(categoryNumber) || ...
            categoryNumber < 1 || ...
            categoryNumber ~= floor(categoryNumber)

        error("BEND1D:InvalidTestCategory", ...
            "The category must be a positive integer.");
    end

    T = listSignals(categoryNumber);

    if isempty(T)
        error("BEND1D:EmptyCategory", ...
            "No signals are registered in Category %d.", ...
            categoryNumber);
    end

    testCase.TestData.CategoryNumber = categoryNumber;
    testCase.TestData.Catalog = T;

    fprintf("\nTesting Category %d: %d signals\n", ...
        categoryNumber,height(T));
end


function testCatalogCategory(testCase)

    categoryNumber = testCase.TestData.CategoryNumber;
    T = testCase.TestData.Catalog;

    verifyNotEmpty(testCase,T);

    verifyTrue( ...
        testCase, ...
        all(T.Category == categoryNumber), ...
        "The filtered catalog contains an incorrect category.");
end


function testEverySignalInCategory(testCase)

    T = testCase.TestData.Catalog;

    for k = 1:height(T)

        signalID = T.ID(k);
        signalName = T.Name(k);
        N = T.RecommendedN(k);

        fprintf("Testing %s: %s\n",signalID,signalName);

        [x,f,meta] = generate(signalID,N);

        verifySize(testCase,x,[N,1], ...
            "Incorrect x dimension for " + signalID);

        verifySize(testCase,f,[N,1], ...
            "Incorrect signal dimension for " + signalID);

        verifyTrue(testCase,isnumeric(x), ...
            "x is not numeric for " + signalID);

        verifyTrue(testCase,isnumeric(f), ...
            "f is not numeric for " + signalID);

        verifyTrue(testCase,isreal(x), ...
            "x is not real for " + signalID);

        verifyTrue(testCase,isreal(f), ...
            "Signal is not real for " + signalID);

        verifyTrue(testCase,all(isfinite(x(:))), ...
            "x contains nonfinite values for " + signalID);

        verifyTrue(testCase,all(isfinite(f(:))), ...
            "Signal contains nonfinite values for " + signalID);

        verifyEqual(testCase,x(1),0, ...
            "AbsTol",1e-12, ...
            "Incorrect left endpoint for " + signalID);

        verifyEqual(testCase,x(end),1, ...
            "AbsTol",1e-12, ...
            "Incorrect right endpoint for " + signalID);

        verifyTrue(testCase,all(diff(x) > 0), ...
            "x is not strictly increasing for " + signalID);

        verifyGreaterThan( ...
            testCase,max(f(:))-min(f(:)),0, ...
            "Signal is constant for " + signalID);

        verifyTrue(testCase,isstruct(meta), ...
            "Metadata is not a structure for " + signalID);

        verifyEqual( ...
            testCase,string(meta.ID),signalID, ...
            "Incorrect metadata ID for " + signalID);

        verifyEqual( ...
            testCase,string(meta.Name),signalName, ...
            "Incorrect metadata name for " + signalID);

        verifyEqual( ...
            testCase, ...
            double(meta.Category), ...
            double(T.Category(k)), ...
            "Incorrect metadata category for " + signalID);
    end
end