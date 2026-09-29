function T = listSignals(category)
%LISTSIGNALS List the available BEND-1D signals.

    T = catalog;

    if nargin >= 1 && ~isempty(category)
        T = T(T.Category == category,:);
    end
end