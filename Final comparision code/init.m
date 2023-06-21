clc;
clear;
list = {'Reference Girl phoneme','Reference Boy phoneme'};
[indx,tf] = listdlg('ListString',list);

Phoneme_List = {'a','ba','cha','da','e','ga','ha','i','ja','ka','la','laa','ma','na','o','pa','ra','sha','sa','ta','tha','u','va','ya','au','dha'};

[indx1,tf1] = listdlg('PromptString','Select a Phoneme:',...
                           'SelectionMode','single',...
                           'ListString',Phoneme_List);
pause(2)
                                     
h = msgbox({['Select Reference Child Phoneme = ',Phoneme_List{indx1}]});
 
pause(2)

PD_CP_SLM_Normal;

h = msgbox({['Select Articulated Child Phoneme = ',Phoneme_List{indx1}]});

pause(2)

PD_CP_SLM;

pause(2)

partial_threshold = 300;

if pitch_freq_FO_reference == pitch_freq_FO
    
    [q, fs] = audioread('excellent.mp3');
    sound(q,fs);
    
elseif pitch_freq_FO_reference > pitch_freq_FO
    
       diff_freq = pitch_freq_FO_reference - pitch_freq_FO;
    
      if diff_freq <= partial_threshold
        
         [q1, fs1] = audioread('Partially correct.mp3');
         sound(q1,fs1);
      else
         [q2, fs2] = audioread('try again.mp3');
         sound(q2,fs2);
      end 
else
      [q2, fs2] = audioread('try again.mp3');
      sound(q2,fs2);
end
      
       
% if indx == 1
%     
%     if (pitch_freq_FO > ref_Min_Val_girl) && (pitch_freq_FO < ref_Max_Val_girl)
%         
%         uiwait(msgbox('Selected phoneme shows nearly good results'));
% 
%     else
%         
%         uiwait(msgbox('Selected phoneme needs to be improved'));
%     end
%     
% else
%     if (pitch_freq_FO > ref_Min_Val_Boy) && (pitch_freq_FO < ref_Max_Val_Boy)
%         
%         uiwait(msgbox('Selected phoneme shows nearly good results'));
% 
%     else
%         
%         uiwait(msgbox('Selected phoneme needs to be improved'));
%     end
% end


