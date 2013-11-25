function gpsa_status_investigate_all(varargin)

% checks = {'hasRawMRI', 'hasMPRageFile', 'hasCortexLabels',...
%     'hasMRIMEGCoreg', 'hasBEM', 'hasBEMfif', 'hasAverageCortex',...
%     'hasMNEForwardModel', 'hasCortexMat', 'hasCortexRecon',...
%     'hasOrganizedMRI', 'hasCortexSourceSpace', 'hasMEGScan',...
%     'hasMarkedBads', 'hasEOGProjection', 'preppedMRIMEGCoreg',...
%     'extractedMEGEvents', 'processedBehaviorals', 'hasSubjectROIs',...
%     'hasAverageROIs', 'hasMNICoordinateFile', 'hasActSTC',...
%     'hasSomeGrangerResults', 'hasGroupedEvents', 'hasAveMEEGFile',...
%     'hasAveMEEGCovFile', 'hasMNEInverseModel', 'hasSTCMNE',...
%     'hasSTCAct', 'hasSTCMNEActAveProj', 'hasSTCMNEActStudyAve',...
%     'hasSTCMNEAct'};

if(nargin == 1)
    state = varargin{1};
else
    state = gpsa_get;
end

study = gpsa_parameter(state, state.study);
state.subject = study.subjects;
state.condition = study.conditions;
checks = {'hasRawMRI', 'hasMPRageFile', 'hasOrganizedMRI',...
    'hasCortexRecon', 'hasCortexLabels', 'hasCortexSourceSpace',...
    'preppedMRIMEGCoreg', 'hasBEM', 'hasBEMfif', 'hasCortexMat',...
    'hasAverageCortex', 'hasMEGScan', 'hasMarkedBads',...
    'hasEOGProjection', 'hasMRIMEGCoreg', 'extractedMEGEvents',...
    'hasGroupedEvents', 'processedBehaviorals', 'hasMEGScansFiltered',...
    'hasMEGEvoked', 'hasAveMEEGFile', 'hasAveMEEGCovFile',...
    'hasMNEForwardModel', 'hasMNEInverseModel', 'hasSTCAct',...
    'hasSTCActAveProj', 'hasSTCActStudyAve', 'hasSubjectROIs',...
    'hasAverageROIs', 'hasMNICoordinateFile', 'hasSomeGrangerResults'};
gpsa_status_investigate(state, checks);

end % function