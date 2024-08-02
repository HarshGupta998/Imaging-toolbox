% Pixel wise velocity maps
% Script to compute phase velocity from experimental velocityfield data
% Author: Manish Bhatt
% Date: 08 May 2019
% Reference: Shear Wave Spectroscopy for In Vivo Quantification
% of Human Soft Tissues Visco-Elasticity, IEEE-TMI, 2009
%segmentation
clear speed SWSmap
 ROI_z=[600 800];%[554 619];
 ROI_x=[20 60];

% imagesc(B_mode_compound(:,:,5)); colorbar;
% displayROIarea( B_mode_compound(:,:,5), ROI_z, ROI_x, 1 );

% Fourier transform for frequency spectrum:
NFFTt = 200;            % length of fft % can be made equal to size(VelocityField_avg,1);
param.PRF = 4000;       % PRF needs to be set as per your data 
param.x = VF.param.x;   % x-axis locations

f = param.PRF/2*linspace(0,1,(NFFTt+1)/2); % frequency vector: frequencies at which SWS to be estimated

tic
for freqloc =2:64  % index of frequencies in frequence vector at which SWS to be estimated
freq=f(freqloc);
clear distance xx linearphase phase1 n speed Transnum
hwp=34;             %  how many pts (trans.) for averaging in x direction (34points=1cm)

pixelz=1; pixelx=1;

for zz=ROI_z(1):ROI_z(end)
        VelocityField_avg= squeeze((VelocityField(zz,:,:)))';
        
        for xroi=ROI_x(1):ROI_x(end)  
             for xx=1:hwp
                Transnum=xx+xroi;                        % as per desired ROI
                S = [(VelocityField_avg(:,Transnum))];   % signal as seen at the above x-location
                Y = fft(S, NFFTt);
                P2 = (Y/NFFTt);
                P1b = P2(1:ceil(NFFTt/2)); 
                P1b(2:end-1) = 2*P1b(2:end-1);
                phase1(xx)=angle(P1b(freqloc));  
                % computation of Phase Velocity :
                distance(xx)=  param.x(Transnum)*1e-3; 
                w=2*pi*freq;
             end

            linearphase=(unwrap(-phase1));
            warning ('off','all');                  % To avoid unnecessary display of warning
            % linear regression :
            p=LinearFitMethod(distance,linearphase,1);
            slope=p(1);     
            c(freqloc)= w/slope ;   % c=w*(x2-x1)/(phi2-phi1)=w/tan(theta); where tan(theta) is the slope of phi vs x curve.
            datafit=p(1)*distance+p(2);


            for k=1:hwp
                SS_tot= sum((linearphase-mean(linearphase)).^2);
                SS_res=sum((linearphase-datafit).^2);
                Rsquared(freqloc)=1-SS_res/SS_tot;
            end
           
        %[~,I]=max(Rsquared);
        %if Rsquared(I)>0.80
        if Rsquared(freqloc)>0.80
        speed(pixelz,xroi-ROI_x(1)+1)=c(freqloc);
        else
        speed(pixelz,xroi-ROI_x(1)+1)=0;
        end
        end  
    
pixelz=pixelz+1;
end
   SWSmap(:,:,freqloc)=speed;
end
toc 

figure; imagesc(speed); colorbar; xlabel('Lateral'); ylabel('Depth'); 
title(['SWS map of visco2 at freq(Hz)=' , num2str(freq)]); caxis([0 4]); 

median(speed(:));
mean(nonzeros(speed(:)))

%% Visualisation in time and freequency domain

% for k=1:1:30
%     imagesc(VelocityField(:,:,k))
%     title([num2str(k)])
%     pause(0.2)    
% end
%% Frequency domain plot of avg velocity field:

% figure; plot(f,abs(P1b),'o-')
% xlabel('SW freq in Hz')
% ylabel('amplitude')
