%% Build the BEND-1D MATLAB Toolbox
%
% This script:
%
%   1. Validates the project structure.
%   2. Runs the complete test suite for Categories 1--10.
%   3. Stops if any test fails or is incomplete.
%   4. Configures the toolbox metadata.
%   5. Builds BEND-1D_1.0.0.mltbx.
%   6. Verifies that the toolbox file was created.

clear
clc

%% Project Configuration

projectRoot = ...
    "/Users/hvimalajeewa2/Documents/UNL_Documents/Projects/bend1d";

toolboxFolder = fullfile(projectRoot,"toolbox");
testsFolder = fullfile(projectRoot,"tests");
testFile = fullfile(testsFolder,"testSignalCategory.m");
buildFolder = fullfile(projectRoot,"build");

gettingStartedFile = fullfile( ...
    toolboxFolder,"GettingStarted.m");

outputFile = fullfile( ...
    buildFolder,"BEND-1D_1.0.0.mltbx");

%% Verify the Project Structure

requiredToolboxFiles = [
    "SignalBank.m"
    "generate.m"
    "catalog.m"
    "listSignals.m"
    "info.m"
    "normalizeSNR.m"
    "GettingStarted.m"
];

assert(isfolder(projectRoot), ...
    "Project folder not found: %s",projectRoot);

assert(isfolder(toolboxFolder), ...
    "Toolbox folder not found: %s",toolboxFolder);

assert(isfolder(testsFolder), ...
    "Tests folder not found: %s",testsFolder);

assert(isfile(testFile), ...
    "Test file not found: %s",testFile);

for k = 1:numel(requiredToolboxFiles)

    requiredFile = fullfile( ...
        toolboxFolder,requiredToolboxFiles(k));

    assert(isfile(requiredFile), ...
        "Required toolbox file not found: %s",requiredFile);
end

if ~isfolder(buildFolder)
    mkdir(buildFolder);
end

addpath(toolboxFolder);

clear SignalBank generate catalog listSignals info normalizeSNR
rehash

%% Run Tests for All Ten Categories

fprintf("\nBEND-1D Prepackaging Tests\n");
fprintf("==========================\n");

allResults = [];

for categoryNumber = 1:10

    fprintf("\nTesting Category %d\n",categoryNumber);
    fprintf("-------------------\n");

    setenv( ...
        "BEND1D_TEST_CATEGORY", ...
        string(categoryNumber));

    categoryResults = runtests(testFile);

    allResults = [
        allResults
        categoryResults(:) %#ok<AGROW>
    ];

    categoryPassed = sum([categoryResults.Passed]);
    categoryFailed = sum([categoryResults.Failed]);
    categoryIncomplete = ...
        sum([categoryResults.Incomplete]);

    fprintf("\nCategory %d summary:\n",categoryNumber);
    fprintf("  Passed:     %d\n",categoryPassed);
    fprintf("  Failed:     %d\n",categoryFailed);
    fprintf("  Incomplete: %d\n",categoryIncomplete);
end

%% Summarize All Tests

totalPassed = sum([allResults.Passed]);
totalFailed = sum([allResults.Failed]);
totalIncomplete = sum([allResults.Incomplete]);

fprintf("\nComplete Prepackaging Test Summary\n");
fprintf("==================================\n");
fprintf("Total tests: %d\n",numel(allResults));
fprintf("Passed:      %d\n",totalPassed);
fprintf("Failed:      %d\n",totalFailed);
fprintf("Incomplete:  %d\n",totalIncomplete);

if ~all([allResults.Passed])

    failedResults = allResults( ...
        [allResults.Failed] | ...
        [allResults.Incomplete]);

    fprintf(2, ...
        "\nThe toolbox was not built because tests failed.\n\n");

    disp(table(failedResults));

    error("BEND1D:PrepackagingTestFailure", ...
        ["BEND-1D packaging stopped because one or more " ...
         "tests failed or were incomplete."]);
end

fprintf("\nAll prepackaging tests passed.\n");

%% Configure the Toolbox
%
% This UUID identifies BEND-1D across future versions.
% Do not change it when releasing versions 1.0.1, 1.1.0, and so forth.

toolboxIdentifier = ...
    "7c11a4e6-4387-4f16-9c80-6aa312a7db25";

opts = matlab.addons.toolbox.ToolboxOptions( ...
    toolboxFolder,toolboxIdentifier);

opts.ToolboxName = "BEND-1D";
opts.ToolboxVersion = "1.0.0";

opts.Summary = ...
    "A morphology-balanced library of 230 one-dimensional benchmark signals.";

opts.Description = ...
    "BEND-1D provides 230 reproducible one-dimensional test signals " + ...
    "organized into ten morphology-based categories for evaluating " + ...
    "denoising, smoothing, feature extraction, and signal-processing " + ...
    "methods. The toolbox includes signal generation, catalog search, " + ...
    "metadata retrieval, and centered-power SNR normalization.";

opts.AuthorName = "Dixon Vimalajeewa";
opts.AuthorCompany = "University of Nebraska-Lincoln";

% Add your preferred public email address, if desired.
opts.AuthorEmail = "";

%% Files and Installation Path
%
% Package the contents of the toolbox folder only. The tests and build
% files remain in the repository but are not installed with the toolbox.

opts.ToolboxFiles = toolboxFolder;
opts.ToolboxMatlabPath = {toolboxFolder};

opts.ToolboxGettingStartedGuide = ...
    gettingStartedFile;

opts.OutputFile = outputFile;

%% Compatibility

opts.MinimumMatlabRelease = "R2026a";
opts.MaximumMatlabRelease = "";

opts.SupportedPlatforms.Win64 = true;
opts.SupportedPlatforms.Mac = true;
opts.SupportedPlatforms.Glnxa64 = true;
opts.SupportedPlatforms.MatlabOnline = true;

%% Build the Toolbox

fprintf("\nBuilding BEND-1D toolbox...\n");

matlab.addons.toolbox.packageToolbox(opts);

%% Verify the Output

assert(isfile(outputFile), ...
    "The toolbox file was not created: %s",outputFile);

fileInformation = dir(outputFile);

fprintf("\nBEND-1D toolbox built successfully.\n");
fprintf("Output file: %s\n",outputFile);
fprintf("File size:   %.2f MB\n", ...
    fileInformation.bytes/(1024^2));