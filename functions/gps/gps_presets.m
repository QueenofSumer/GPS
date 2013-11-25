function preset = gps_presets(name)
% Returns preset variables.
%
% Author: A. Conrad Nied (anied@cs.washington.edu)
%
% Changelog:
% 2013-11-24 Automatically generated to format GPS by user anied

switch lower(name)
    case {'gpsnum', 'gpsfig', 'menu figure'}
        preset = 6750000;    case {'gpsanum', 'gpsafig', 'analysis figure'}
        preset = 6754000;
    case {'gpsenum', 'gpsefig', 'edit figure'}
        preset = 6753000;
    case {'gpsrnum', 'gpsrfig', 'region figure'}
        preset = 6752000;
    case {'gpspnum', 'gpspfig', 'plotting figure'}
        preset = 6757000;
    case {'dir', 'directory'}
        preset = '/homes/gws/anied/MGH/GPS';
    case {'functions', 'functiondir', 'fdir'}
        preset = '/homes/gws/anied/MGH/GPS/functions';
    case {'parameters', 'parameterdir', 'pdir'}
        preset = '/homes/gws/anied/MGH/GPS/parameters';
    case {'images', 'imagedir', 'idir'}
        preset = '/homes/gws/anied/MGH/GPS/images';
    case {'study'}
        preset = 'SampleStudy';
    case {'stages'}
        preset = {'util', 'mri', 'meg', 'mne', 'plv', 'granger'};
end % switch

end % function
