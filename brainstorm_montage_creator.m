% List the bad channels here
bad_chans = ['EEG008,EEG033,EEG034,EEG001,EEG003']; %THERE SHOULD BE NO SPACE AFTER OR BEFORE THE ','
% bad_chans = ['EEG008']; %THERE SHOULD BE NO SPACE AFTER OR BEFORE THE ','
% Based on the system the patient had run either abbot or medtronic
device_name = 'medtronic';

switch device_name
    case 'medtronic'
        montage = rev_medtronic_montage_wo_badchans(bad_chans);
        
    case 'abbot'
        montage = rev_abbot_montage_wo_badchans(bad_chans);
        
end

% Reformat the montage for Brainstorm
Montages = struct();
Montages.Type = 'text';
Montages.Matrix = montage.tra;
Montages.DispNames = montage.labelnew';
Montages.ChanNames = montage.labelold';

% Provide a name for your montage
montage_name = 'S01_Bipolar_LFPs';
Montages.Name = [montage_name, '_', device_name]; % This is the name shown in Brainstorm

save(['montage_', montage_name, '_', device_name],'Montages')