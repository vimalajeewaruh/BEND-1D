function tests = testAllSignals
%TESTALLSIGNALS Unit tests for the BEND-1D MATLAB toolbox.
%
% Run with:
%
%   results = runtests("tests");
%   table(results)
%
% The current version tests the 16 Category 1 signals.

    tests = functiontests(localfunctions);
end


function setupOnce(testCase)
%SETUPONCE Add the toolbox folder to the MATLAB path.

    testFolder = fileparts(mfilename("fullpath"));
    projectRoot = fileparts(testFolder);
    toolboxFolder = fullfile(projectRoot,"toolbox");

    if ~isfolder(toolboxFolder)
        error("BEND1D:MissingToolboxFolder", ...
            "The toolbox folder was not found: %s", ...
            toolboxFolder);
    end

    testCase.TestData.OriginalPath = path;
    testCase.TestData.ToolboxFolder = toolboxFolder;

    addpath(toolboxFolder);

    % Clear persistent catalog information so that the current
    % catalog.m file is loaded.
    clear catalog
end


function teardownOnce(testCase)
%TEARDOWNONCE Restore the original MATLAB path.

    path(testCase.TestData.OriginalPath);
end


function testCatalogExists(testCase)
% Verify that catalog returns a nonempty table.

    T = catalog;

    verifyClass(testCase,T,"table");
    verifyNotEmpty(testCase,T);
end


function testCatalogVariables(testCase)
% Verify that the catalog contains the required columns.

    T = catalog;

    requiredVariables = [
        "ID"
        "Name"
        "Category"
        "RecommendedN"
    ];

    actualVariables = string(T.Properties.VariableNames);

    for k = 1:numel(requiredVariables)
        verifyTrue( ...
            testCase, ...
            any(actualVariables == requiredVariables(k)), ...
            "Missing catalog variable: " + requiredVariables(k));
    end
end


function testCategory1SignalCount(testCase)
% Category 1 must contain exactly 16 signals.

    T1 = listSignals(1);

    verifyEqual(testCase,height(T1),16);
end


function testCategory1Identifiers(testCase)
% Verify the complete sequence TF001--TF016.

    T1 = listSignals(1);

    expectedIDs = compose("TF%03d",(1:16).');

    verifyEqual(testCase,T1.ID,expectedIDs);
end


function testCategory1Names(testCase)
% Verify the expected Category 1 signal names.

    T1 = listSignals(1);

    expectedNames = [
        "Percolation"
        "Planck"
        "StickSlip"
        "RingDown"
        "DiffusionBand"
        "Fano"
        "BouncingBall"
        "ImpactSpring"
        "QuantumBarrier"
        "AvoidedCrossing"
        "Morse"
        "BZPulse"
        "ActionPotential"
        "ECGBeat"
        "VanHove"
        "MarketCrash"
    ];

    verifyEqual(testCase,T1.Name,expectedNames);
end


function testEveryCategory1Signal(testCase)
% Generate and validate every Category 1 signal.

    T1 = listSignals(1);

    for k = 1:height(T1)

        signalID = T1.ID(k);
        N = T1.RecommendedN(k);

        [x,f,meta] = generate(signalID,N);

        % Verify output dimensions.
        verifySize( ...
            testCase,x,[N,1], ...
            "Incorrect x dimension for " + signalID);

        verifySize( ...
            testCase,f,[N,1], ...
            "Incorrect signal dimension for " + signalID);

        % Verify numeric output.
        verifyTrue( ...
            testCase,isnumeric(x), ...
            "x is not numeric for " + signalID);

        verifyTrue( ...
            testCase,isnumeric(f), ...
            "f is not numeric for " + signalID);

        % Verify real and finite values.
        verifyTrue( ...
            testCase,isreal(x), ...
            "x is not real for " + signalID);

        verifyTrue( ...
            testCase,isreal(f), ...
            "Signal contains complex values for " + signalID);

        verifyTrue( ...
            testCase,all(isfinite(x)), ...
            "x contains nonfinite values for " + signalID);

        verifyTrue( ...
            testCase,all(isfinite(f)), ...
            "Signal contains nonfinite values for " + signalID);

        % Verify the unit-interval sampling grid.
        verifyEqual( ...
            testCase,x(1),0, ...
            "AbsTol",1e-12, ...
            "Incorrect left endpoint for " + signalID);

        verifyEqual( ...
            testCase,x(end),1, ...
            "AbsTol",1e-12, ...
            "Incorrect right endpoint for " + signalID);

        verifyTrue( ...
            testCase,all(diff(x) > 0), ...
            "Sampling grid is not strictly increasing for " + signalID);

        % Verify signal variation.
        verifyGreaterThan( ...
            testCase,max(f)-min(f),0, ...
            "Signal is constant for " + signalID);

        % Verify metadata.
        verifyTrue( ...
            testCase,isstruct(meta), ...
            "Metadata is not a structure for " + signalID);

        verifyTrue( ...
            testCase,isfield(meta,"ID"), ...
            "Metadata ID is missing for " + signalID);

        verifyTrue( ...
            testCase,isfield(meta,"Name"), ...
            "Metadata name is missing for " + signalID);

        verifyTrue( ...
            testCase,isfield(meta,"Category"), ...
            "Metadata category is missing for " + signalID);

        verifyEqual( ...
            testCase,string(meta.ID),signalID, ...
            "Incorrect metadata ID for " + signalID);

        verifyEqual( ...
            testCase,string(meta.Name),T1.Name(k), ...
            "Incorrect metadata name for " + signalID);

        verifyEqual( ...
            testCase,double(meta.Category),1, ...
            "Incorrect metadata category for " + signalID);
    end
end


function testGenerateUsesRecommendedSampleSize(testCase)
% Calling generate without N should use the catalog value.

    T = catalog;
    row = T(T.ID == "TF001",:);

    [x,f] = generate("TF001");

    verifySize(testCase,x,[row.RecommendedN,1]);
    verifySize(testCase,f,[row.RecommendedN,1]);
end


function testGenerateAndDirectCallAgree(testCase)
% generate.m and bend1d.m should produce identical results.

    N = 1024;

    [x1,f1,meta1] = generate("TF001",N);
    [x2,f2,meta2] = SignalBank("TF001",N);

    verifyEqual(testCase,x1,x2);
    verifyEqual(testCase,f1,f2);
    verifyEqual(testCase,string(meta1.ID),string(meta2.ID));
end


function testNondefaultParameters(testCase)
% Test nondefault Percolation parameters.

    N = 512;
    pc = 0.42;
    beta = 0.50;

    [x,f,meta] = generate( ...
        "TF001",N,pc,beta);

    expected = max(x-pc,0).^beta;

    verifyEqual(testCase,f,expected, ...
        "AbsTol",1e-14);

    verifyEqual(testCase,meta.Parameters.pc,pc);
    verifyEqual(testCase,meta.Parameters.beta,beta);
end


function testInformationByID(testCase)
% Test information retrieval using a TF identifier.

    signalInformation = info("TF001");

    verifyEqual(testCase,height(signalInformation),1);
    verifyEqual(testCase,signalInformation.ID,"TF001");
    verifyEqual(testCase,signalInformation.Name,"Percolation");
    verifyEqual(testCase,signalInformation.Category,1);
end


function testInformationByName(testCase)
% Test information retrieval using a signal name.

    informationByID = info("TF002");
    informationByName = info("Planck");

    verifyEqual(testCase,informationByID,informationByName);
end


function testInformationNormalizedName(testCase)
% Spaces, underscores, hyphens, and case should be ignored.

    information1 = info("TF001_Percolation");
    information2 = info("tf001-percolation");
    information3 = info("TF001 Percolation");

    verifyEqual(testCase,information1,information2);
    verifyEqual(testCase,information1,information3);
end


function testLinearSNRNormalization(testCase)
% Verify normalization using a linear SNR.

    [~,f] = generate("TF001",1024);

    sigma = 0.20;
    targetSNR = 5;

    [fScaled,details] = normalizeSNR( ...
        f,sigma,targetSNR);

    centered = fScaled-mean(fScaled(:));
    power = mean(centered(:).^2);
    achievedSNR = power/sigma^2;

    verifyEqual( ...
        testCase,achievedSNR,targetSNR, ...
        "RelTol",1e-12);

    verifyEqual( ...
        testCase,mean(fScaled(:)),mean(f(:)), ...
        "AbsTol",1e-12);

    verifyEqual( ...
        testCase,details.AchievedSNRLinear,targetSNR, ...
        "RelTol",1e-12);
end


function testDecibelSNRNormalization(testCase)
% Verify normalization using an SNR specified in decibels.

    [~,f] = generate("TF002",1024);

    sigma = 0.20;
    targetSNRdB = 7;

    [~,details] = normalizeSNR( ...
        f,sigma,targetSNRdB,"dB");

    verifyEqual( ...
        testCase,details.AchievedSNRdB,targetSNRdB, ...
        "AbsTol",1e-10);
end


function testUnknownSignalError(testCase)
% An unknown signal identifier should produce the expected error.

    verifyError( ...
        testCase, ...
        @() generate("TF999",1024), ...
        "BEND1D:UnknownSignal");
end


function testUnknownInformationError(testCase)
% Requesting information for an unknown signal should fail.

    verifyError( ...
        testCase, ...
        @() info("UnknownSignal"), ...
        "BEND1D:UnknownSignal");
end