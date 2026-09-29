function signalInfo = info(signalIdentifier)
%INFO Return information about a BEND-1D signal.
%
%   signalInfo = info("TF001")
%   signalInfo = info("Percolation")
%   signalInfo = info("TF001_Percolation")
%
% The search is not case-sensitive. Spaces, underscores, and hyphens
% are ignored.

    if nargin < 1 || isempty(signalIdentifier)
        error("BEND1D:MissingSignalIdentifier", ...
            "Provide a signal ID or signal name.");
    end

    T = catalog;

    query = normalizeText(signalIdentifier);

    normalizedID = normalizeText(T.ID);
    normalizedName = normalizeText(T.Name);
    normalizedFullName = normalizedID + normalizedName;

    matches = ...
        normalizedID == query | ...
        normalizedName == query | ...
        normalizedFullName == query;

    index = find(matches);

    if isempty(index)
        error("BEND1D:UnknownSignal", ...
            "No signal was found for '%s'.", ...
            string(signalIdentifier));
    end

    if numel(index) > 1
        matchingIDs = strjoin(T.ID(index),", ");

        error("BEND1D:AmbiguousSignalName", ...
            ["The name '%s' corresponds to multiple signals: %s. " ...
             "Please use a TF identifier."], ...
            string(signalIdentifier),matchingIDs);
    end

    signalInfo = T(index,:);
end


function output = normalizeText(input)
%NORMALIZETEXT Normalize IDs and names for matching.

    output = upper(string(input));
    output = regexprep(output,"[\s_-]","");
end