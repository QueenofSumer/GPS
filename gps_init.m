function gps_init()
% Initializes GPS directories on a new computer
%
% Author: A. Conrad Nied (anied@cs.washington.edu)
%
% Changelog:
% 2013-11-22 Created
% 2013-11-24 Finished

% Confirm
files = dir();
if(sum(strcmp({files.name},'parameters')))
    answer = questdlg('This will reset GPS, are you sure?');
    if(~strcmp(answer, 'Yes'))
        return
    end
end

% Get some information
user = getenv('USER');
gpsdir = pwd;
date = datestr(now, 'YYYY-mm-DD');

% Citation tag
citation = sprintf('%% Author: A. Conrad Nied (anied@cs.washington.edu)\n%%\n%% Changelog:\n%% %s Automatically generated to format GPS by user %s\n', date, user);

% Change the directory pointing program
fid = fopen('functions/gps/gps_dir.m');
fprintf(fid, 'function direc = gps_dir\n');
fprintf(fid, '%% Returns just the main GPS directory\n');
fprintf(fid, citation);
fprintf(fid, '\ndirec = ''%s/'';', pwd);
fprintf(fid, '\n\nend\n');
fclose(fid);

% Preset Program
fid = fopen('functions/gps/gps_presets.m');
fprintf(fid, 'function preset = gps_presets(name)\n');
fprintf(fid, '%% Returns preset variables.\n');
fprintf(fid, citation);
fprintf(fid, 'switch lower(name)\n');
fprintf(fid, '    case {''gpsnum'', ''gpsfig'', ''menu figure''}\n');
fprintf(fid, '        preset = 6750000;');
fprintf(fid, '    case {''gpsanum'', ''gpsafig'', ''analysis figure''}\n');
fprintf(fid, '        preset = 6754000;\n');
fprintf(fid, '    case {''gpsenum'', ''gpsefig'', ''edit figure''}\n');
fprintf(fid, '        preset = 6753000;\n');
fprintf(fid, '    case {''gpsrnum'', ''gpsrfig'', ''region figure''}\n');
fprintf(fid, '        preset = 6752000;\n');
fprintf(fid, '    case {''gpspnum'', ''gpspfig'', ''plotting figure''}\n');
fprintf(fid, '        preset = 6757000;\n');
fprintf(fid, '    case {''dir'', ''directory''}\n');
fprintf(fid, '        preset = ''%s'';\n', gpsdir);
fprintf(fid, '    case {''functions'', ''functiondir'', ''fdir''}\n');
fprintf(fid, '        preset = ''%s/functions'';\n', gpsdir);
fprintf(fid, '    case {''parameters'', ''parameterdir'', ''pdir''}\n');
fprintf(fid, '        preset = ''%s/parameters'';\n', gpsdir);
fprintf(fid, '    case {''images'', ''imagedir'', ''idir''}\n');
fprintf(fid, '        preset = ''%s/images'';\n', gpsdir);
fprintf(fid, '    case {''study''}\n');
fprintf(fid, '        preset = ''SampleStudy'';\n');
fprintf(fid, '    case {''stages''}\n');
fprintf(fid, '        preset = {''util'', ''mri'', ''meg'', ''mne'', ''plv'', ''granger''};\n');
fprintf(fid, 'end %% switch\n');
fprintf(fid, '\nend %% function\n');
fclose(fid);

% Erase the parameters directory with everything but the sample study
parameters = dir('parameters');
for i = 1:length(parameters)
    folderName = parameters(i).name;
    switch folderName
        case {'.', '..'}
        case 'SampleStudy'
            % Do nothing
        case 'GPS'
            % reset userstudies.mat
            save('parameters/GPS/userstudies.mat', '');
        otherwise
            rmdir(['parameters/' folderName], 's')
    end % switch on the folder name
end % for all parameter folders

% Clear images and logs folder
files = dir('images');
for i_file = 1:length(files)
    filename = files(i_file).name;
    if(filename(1) ~= '.')
        if(files(i_file).isdir)
            rmdir(['images/' filename], 's');
        else
            delete(['images/' filename]);
        end
    end
end
delete('logs/*');


end % function