
[wavFileName,path] = uigetfile('*.*');
[y,Fs] = audioread([path wavFileName]);
sound(y,Fs)
% [y,Fs]=audioread('slm.ba.1.wav');
zeros2=zeros(1:(512-length(y)));
zeros3=zeros(1:(1512-length(y)));
max_value=max(abs(y));
y=y/max_value;
t=(1/Fs:1/Fs:(length(y)/Fs))*1000;
subplot(2,1,2);plot(t,y);
title('Phoneme articulated by Disabled child using SLM');
y=[y zeros2];
yy=[y zeros3];
dfty=abs(fft(y));
dftyy=abs(fft(yy));
dfty1=dfty(1:length(dfty)/2);
dftyy1=dftyy(1:length(dftyy)/2);
tt=linspace(1/Fs,Fs/2,length(dftyy1));
dftylog=log10(dfty);
dftyylog=log10(dftyy);
dftylog1=dftylog(1:length(dftylog)/2);
dftyylog1=dftyylog(1:length(dftyylog)/2);
yy=10*dftylog1;
yyy=10*dftyylog1;
% subplot(4,1,2);
% plot(tt,yyy);
% xlabel('Log Magnitude Spectrum');
real_ceps=abs(ifft(dftylog));
real_ceps=real_ceps(1:length(real_ceps)/2);
t=(1/Fs:1/Fs:(length(y)/Fs))*1000;
t=(t(1:length(t)/2));
% subplot(4,1,3);
% plot(t,real_ceps);
% ylim([0.00001   0.01])
% xlabel('Cepstrum graph');
real_ceps_pitch=real_ceps(16:length(real_ceps));
max1=max(real_ceps_pitch);
for uu=1:length(real_ceps_pitch)
  real_ceps_pitch(uu);
    if(real_ceps_pitch(uu)==max1)
      sample_no=uu;
    end 
  end
  pitch_period_To=(16+sample_no)*(1/Fs);
  pitch_freq_FO=1/pitch_period_To;
  xlabel(['Articulation disorder child Pitch frequency: ' num2str(pitch_freq_FO) 'Hz' ]);
%  subplot(4,1,4);
%  plot([1:100], pitch_freq_FO);
%  xlabel('Pitch Frequency SLM');