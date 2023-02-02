% List the bad channels here
bad_chans = ['EEG008'];
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
Montages.Name = 'BipolarLFPsauto';
Montages.Type = 'text';
Montages.Matrix = montage.tra;
Montages.DispNames = montage.labelnew';
Montages.ChanNames = montage.labelold';

% Provide a name for your montage
montage_name = 'Bipolar_LFPs';

save(['montage_', montage_name, '_', device_name],'Montages')