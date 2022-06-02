% win_size=500;
% 
% datalength=length(data);
% datalength=500;
% 
% datastep=1000;
% 

%Program Variables
%------------------
write_data=0;
corr_avg_correction=1;
corr_thresh=.75;
tic
chanstart=1;
chanstop=16;
y_lim_min= -.00015;
y_lim_max= .00015;

c_lim_min= .6;
c_lim_max= 1;

use_loaded_file= 1;
use_cormag= 0;
use_zero_lag= 1;

% - Analysis Options
TimeStart= 1; %In Seconds
TimeEnd= 20;
%0; %In seconds
RecFreq= 24414.0625; %Taken from TDT files
TimeStep= .005;%time in s
TimeWindow= .005;%time in s

%VIDEO OPTIONS
use_video= 0;
HW_video=1;
TDT_HW=0;
NN_HW=1;
FPS= 20;
VideoQuality= 70;

%HISTOGRAM OPTION
calculate_histo=0;


% Gen 3 Chan Map		
% 1	1D	400
% 2	2D	400
% 3	3D	400
% 4	4D	400
% 5	4C	400
% 6	3C	400
% 7	2C	400
% 8	1C	400
% 9	Cont 1	1
% 10	Cont 2	1
% 11	1B	400
% 12	2B	400
% 13	3B	400
% 14	4B	400
% 15	4A	400
% 16	3A	400
% 17	2A	400
% 18	EMG	160000
% 19	1A	400
% 20	PCB Cont 1	2
% 21	PCB Cont 2	2

if TDT_HW==1
    load('cdata.mat');
elseif NN_HW==1
    load('cdata_nn.mat');
end

NN_CH1 =[55 125];
NN_CH16 =[88 135];
NN_CH2 =[123 145];
NN_CH15 =[160 155];
NN_CH3 =[194 165];
NN_CH14 =[228 175];
NN_CH4 =[263 182];
NN_CH13 =[296 125];
NN_CH5 =[333 115];
NN_CH12 =[366 105];
NN_CH6 =[400 95];
NN_CH11 =[436 85];
NN_CH7 =[470 75];
NN_CH10 =[506 65];
NN_CH8 =[541 55];
NN_CH9 =[576 45];

EMG_Con_Loc=[140 134];
Con1_Con_Loc=[187 136];
C1_Con_Loc=[229 138];
C2_Con_Loc=[276 140];
C3_Con_Loc=[320 142];
C4_Con_Loc=[366 144];
D4_Con_Loc=[411 142];
D3_Con_Loc=[456 140];
D2_Con_Loc=[502 138];
D1_Con_Loc=[547 136];
A1_Con_Loc=[547 200];
A2_Con_Loc=[502 202];
A3_Con_Loc=[456 204];
A4_Con_Loc=[411 206];
B4_Con_Loc=[366 208];
B3_Con_Loc=[320 206];
B2_Con_Loc=[276 204];
B1_Con_Loc=[229 202];
Con2_Con_Loc=[187 200];

A1_Loc=[714 135];
A2_Loc=[716 180];
A3_Loc=[718 225];
A4_Loc=[720 272];
B1_Loc=[900 135];
B2_Loc=[902 180];
B3_Loc=[904 225];
B4_Loc=[906 272];
C1_Loc=[1090 135];
C2_Loc=[1092 180];
C3_Loc=[1094 225];
C4_Loc=[1096 272];
D1_Loc=[1278 135];
D2_Loc=[1290 180];
D3_Loc=[1282 225];
D4_Loc=[1284 272];
Con1_Loc=[996 63];
Con2_Loc=[996 84];
EMG_Loc=[996 25];

draw_nn_device{1}=NN_CH1;
draw_nn_device{2}=NN_CH2;
draw_nn_device{3}=NN_CH3;
draw_nn_device{4}=NN_CH4;
draw_nn_device{5}=NN_CH5;
draw_nn_device{6}=NN_CH6;
draw_nn_device{7}=NN_CH7;
draw_nn_device{8}=NN_CH8;
draw_nn_device{9}=NN_CH9;
draw_nn_device{10}=NN_CH10;
draw_nn_device{11}=NN_CH11;
draw_nn_device{12}=NN_CH12;
draw_nn_device{13}=NN_CH13;
draw_nn_device{14}=NN_CH14;
draw_nn_device{15}=NN_CH15;
draw_nn_device{16}=NN_CH16;


draw_chan_device{1}=D1_Loc;
draw_chan_device{2}=D2_Loc;
draw_chan_device{3}=D3_Loc;
draw_chan_device{4}=D4_Loc;
draw_chan_device{5}=C4_Loc;
draw_chan_device{6}=C3_Loc;
draw_chan_device{7}=C2_Loc;
draw_chan_device{8}=C1_Loc;
draw_chan_device{9}=Con1_Loc;
draw_chan_device{10}=Con2_Loc;
draw_chan_device{11}=B1_Loc;
draw_chan_device{12}=B2_Loc;
draw_chan_device{13}=B3_Loc;
draw_chan_device{14}=B4_Loc;
draw_chan_device{15}=A4_Loc;
draw_chan_device{16}=A3_Loc;
draw_chan_device{17}=A2_Loc;
draw_chan_device{18}=EMG_Loc;
draw_chan_device{19}=A1_Loc;

draw_chan_connector{1}=D1_Con_Loc;
draw_chan_connector{2}=D2_Con_Loc;
draw_chan_connector{3}=D3_Con_Loc;
draw_chan_connector{4}=D4_Con_Loc;
draw_chan_connector{5}=C4_Con_Loc;
draw_chan_connector{6}=C3_Con_Loc;
draw_chan_connector{7}=C2_Con_Loc;
draw_chan_connector{8}=C1_Con_Loc;
draw_chan_connector{9}=Con1_Con_Loc;
draw_chan_connector{10}=Con2_Con_Loc;
draw_chan_connector{11}=B1_Con_Loc;
draw_chan_connector{12}=B2_Con_Loc;
draw_chan_connector{13}=B3_Con_Loc;
draw_chan_connector{14}=B4_Con_Loc;
draw_chan_connector{15}=A4_Con_Loc;
draw_chan_connector{16}=A3_Con_Loc;
draw_chan_connector{17}=A2_Con_Loc;
draw_chan_connector{18}=EMG_Con_Loc;
draw_chan_connector{19}=A1_Con_Loc;

CMap=jet(50);

histo_data=zeros(1,chanstop);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if use_loaded_file==1
    TotalChans=21;
    %Reading Data
    [file,path] = uigetfile('*.bin');
    loadfile=sprintf('%s%s',path,file);
    VideoName=file(1:end-4);
    fileID=fopen(loadfile);
    Data=fread(fileID,inf,'float');
    filelength=length(Data);
    clear Data;
    TestData = multibandread(loadfile,[1 (filelength/TotalChans) TotalChans], 'float', 0, 'bip', 'ieee-le');
    fclose(fileID);
    Data(:,:)=TestData(1,:,1:21);
    Data=Data';
    clear TestData
else
    if use_video == 1
        VideoName='TestVideo';
    end
    Data=MergedData;
end

%Test=Data;
%Data=gpuArray(Data);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Variables - MAIN LIST

% - Reading Data Options
TotalChans=21; %Total channels in the data file




tracker=1;
%Calculate RecFreq adjusted start/stop data locations
time_start=round(TimeStart*RecFreq);
if time_start==0
    time_start=1;
end
time_end=round(TimeEnd*RecFreq);
time_step=round(TimeStep*RecFreq);
time_window=round(TimeWindow*RecFreq);

if use_video==1
    %frame_tracker=1;
    test_vid=VideoWriter(VideoName);
    test_vid.Quality=VideoQuality;
    test_vid.FrameRate=FPS;
    open(test_vid);
% VIDEO LOOP
    framefig=figure('Position',[100 0 1000 1000]);
    hold all
    set(gca, 'nextplot','replacechildren', 'Visible','off');
end
if HW_video==1
    %frame_tracker=1;
    HW_VideoName=sprintf('HW_%s',VideoName);
    test_vid=VideoWriter(HW_VideoName);
    test_vid.Quality=VideoQuality;
    test_vid.FrameRate=FPS;
    open(test_vid);
% VIDEO LOOP
end
tracker=1;
testvector=time_start:time_step:time_end;
i_length=length(chanstart:1:chanstop)+1;

window_frame_data=zeros(length(testvector),i_length,i_length);
%data_corrs=zeros(i_length,i_length);
%data_lags=zeros(i_length,i_length);
if corr_avg_correction == 1
    Data_Template=Data((chanstart:chanstop),(time_start:time_end));
end
framefig=figure('Position',[50 50 1500 900]);
for curtime=time_start:time_step:time_end
    percent_complete=100*((curtime-time_start)/(time_end-time_start));
    sprintf('%s%% Complete',num2str(percent_complete))
    for i = chanstart:chanstop
        data_A=Data(i,(curtime-time_window):(curtime+time_window));
        for j=chanstart:chanstop
            data_B=Data(j,(curtime-time_window):(curtime+time_window));
            if use_zero_lag==0
                [acor,lag]=xcorr(data_A,data_B,'coeff');
                if use_cormag == 1
                    acor = abs(acor);
                end
                [data_corrs(i,j),lagloc]=max(acor);
                data_lags(i,j)=lag(lagloc);
                color_min=min(lag);
                color_max=max(lag);
            else
                [acor,lag]=xcorr(data_A,data_B,0,'coeff');
                if use_cormag == 1
                    acor = abs(acor);
                end
                data_corrs(i,j)=acor;
                data_lags(i,j)=lag;
                if use_video==1
                    color_min=min(lag);
                    color_max=max(lag);
                end
            end
        end
    end
    data_corrs(chanstart:chanstop+1,end+1)=1;
    data_corrs(end,chanstart:chanstop+1)=1;
    
    data_lags(chanstart:chanstop+1,end)=1;
    data_lags(end+1,chanstart:chanstop+1)=1;
    
    if use_video == 1
        subplot(5,1,1)
        title_str=sprintf('t=%ss                                                                                                                                                                                                     t=%ss',num2str((curtime-time_window)/RecFreq),num2str((curtime+time_window)/RecFreq));
        plot(Data((chanstart:chanstop),(curtime-time_window):(curtime+time_window))');
        ylim([y_lim_min y_lim_max]);
        title(title_str);
        subplot(5,1,2:3)
        surf(data_corrs);
        view(0,90);
        xlim([chanstart chanstop+1]);
        ylim([chanstart chanstop+1]);
        axis on, colormap(gca,jet);
        colorbar;
        caxis([c_lim_min c_lim_max]);
        subplot(5,1,4:5)
        surf(data_lags);
        view(0,90);
        xlim([1 21]);
        ylim([1 21]);
        axis on, colormap(gca,jet);
        colorbar;
        caxis([color_min color_max])
        %frame=getframe(framefig);
        frame=getframe(gcf);
        writeVideo(test_vid,frame);
        window_frame_data(tracker,:,:)=data_corrs;

    else
        window_frame_data(tracker,:,:)=data_corrs;
        tracker=tracker+1;
        
    end
    %this code only works for when channels are from 1 to 21 (hard-coded
    %for now for quick algorithm testing
    if calculate_histo==1
            corr_track=1;
            scan_list=1:chanstop;
            for group_index=1:chanstop
                grouped_corrs{1,group_index}=find(data_corrs(group_index,1:chanstop) >= corr_thresh );          
            end
        
            for cor_index=1:chanstop
                    %check_value=scan_list(1);
                    %check_value=scan_list(cor_index);
                    cor_locs=find(data_corrs(cor_index,1:chanstop) >= corr_thresh );


                    if isempty(cor_locs)
                        cor_locs=cor_index;
                        histo_data(1,1)=histo_data(1,1)+1;
                    else
                       if cor_index > 1
                           already_exists=0;
                           for check_unique=1:(cor_index-1)
                                unique_check=setdiff(grouped_corrs{1,check_unique},cor_locs);
                                if isempty(unique_check)==0
                                    already_exists=1;
                                end
                           end
                           if already_exists == 0
                               histo_data(1,length(cor_locs))=histo_data(1,length(cor_locs))+1; 
                           end
                       else
                           histo_data(1,length(cor_locs))=histo_data(1,length(cor_locs))+1; 
                       end
                    end
            end
    end
    
    
    if corr_avg_correction == 1
        
           % Select the figure and clear it
        set(0, 'CurrentFigure', framefig);
        clf reset;
        hold off
        subplot(5,1,1:2)
        if TDT_HW==1
            imshow(cdata)
        end
        if NN_HW==1
            imshow(cdata_NN)
        end
        hold all
        corr_track=1;
        scan_list=1:chanstop;
        %Find groups
        

        for cor_index=1:chanstop
                %check_value=scan_list(1);
                %check_value=scan_list(cor_index);
                cor_locs=find(data_corrs(cor_index,1:chanstop) >= corr_thresh );
                cor_values=data_corrs(cor_locs,cor_locs);
                
                
                if isempty(cor_locs)
                    cor_locs=cor_index;
                    histo_data(1,1)=histo_data(1,1)+1;
                else
                   histo_data(1,length(cor_locs))=histo_data(1,length(cor_locs))+1; 
                end
                        if length(cor_locs)==1
                            if (curtime+time_step) < time_end
                                mean_vect=zeros(1,length((Data_Template(cor_locs,((curtime-time_start)+1):((curtime-time_start)+time_step)))));
                            else
                                mean_vect=zeros(1,length(Data_Template(cor_locs,((curtime-time_start)+1):end)));
                            end
                            %sum(mean_vect)
                        else
                            if (curtime+time_step) < time_end
                                mean_vect=mean(Data_Template(cor_locs,((curtime-time_start)+1):((curtime-time_start)+time_step)));
                            else
                                mean_vect=mean(Data_Template(cor_locs,((curtime-time_start)+1):end));
                            end
                            %sum(mean_vect)
                            if HW_video==1
                                
                               %# make sure the image doesn't disappear if we plot something else
                               hold all
                               if TDT_HW==1
                                   if cor_index < chanstop
                                        for write_loc=1:length(cor_locs)
                                            if cor_locs(write_loc) < chanstop
                                                cor_mag=data_corrs(cor_index,cor_locs(write_loc));
                                                color_value=round((cor_mag-.5918)/.0082);
                                                plot([draw_chan_device{cor_index}(1,1),draw_chan_device{cor_locs(write_loc)}(1,1)],[draw_chan_device{cor_index}(1,2),draw_chan_device{cor_locs(write_loc)}(1,2)],'Color',CMap(color_value,:),'LineWidth',2);
                                                plot([draw_chan_connector{cor_index}(1,1),draw_chan_connector{cor_locs(write_loc)}(1,1)],[draw_chan_connector{cor_index}(1,2),draw_chan_connector{cor_locs(write_loc)}(1,2)],'Color',CMap(color_value,:),'LineWidth',2);
                                            end
                                        end
                                   end
                               elseif NN_HW==1
                                   if cor_index <= chanstop
                                        for write_loc=1:length(cor_locs)
                                            if cor_locs(write_loc) < chanstop
                                                cor_mag=data_corrs(cor_index,cor_locs(write_loc));
                                                color_value=round((cor_mag-.5918)/.0082);
                                                plot([draw_nn_device{cor_index}(1,1),draw_nn_device{cor_locs(write_loc)}(1,1)],[draw_nn_device{cor_index}(1,2),draw_nn_device{cor_locs(write_loc)}(1,2)],'Color',CMap(color_value,:),'LineWidth',2);
                                            end
                                        end
                                   end                                   
                               end
                            %# plot the points.
                            %# Note that depending on the definition of the points,
                            %# you may have to swap x and y
                            end
                        end
                        if (curtime+time_step) < time_end
                            Data_Corrected(cor_index,((curtime-time_start)+1):((curtime-time_start)+time_step))=Data_Template(cor_index,((curtime-time_start)+1):((curtime-time_start)+time_step))-mean_vect;
                        else
                            Data_Corrected(cor_index,((curtime-time_start)+1):length(Data_Template(1,:)))=Data_Template(cor_index,((curtime-time_start)+1):end)-mean_vect;
                        end
                        
%                         figure(1)
%                         subplot(3,1,1)
%                         hold all
%                         plot(Data_Template(cor_locs,((curtime-time_start)+1):((curtime-time_start)+time_step))')
%                         subplot(3,1,2)
%                         plot(mean_vect)
%                         subplot(3,1,3)
%                         plot(Data_Template(cor_index,((curtime-time_start)+1):((curtime-time_start)+time_step)))
%                         hold all
%                         plot(Data_Template(cor_index,((curtime-time_start)+1):((curtime-time_start)+time_step))-mean_vect)
% %                         grouped_corrs{1,corr_track}=cor_locs;
% %                         %scan_list(cor_locs)=[];
% %                         corr_track=corr_track+1;
%                     close(1)

            
        end
        if HW_video==1
            subplot(5,1,3:4)
            surf(data_corrs);
            view(0,90);
            xlim([chanstart chanstop+1]);
            ylim([chanstart chanstop+1]);
            axis on, colormap(gca,jet);
            colorbar;
            caxis([c_lim_min c_lim_max]);
            subplot(5,1,5)
            plot(Data((1:19),(curtime-time_window):(curtime+time_window))');
            frame=getframe(framefig);
            writeVideo(test_vid,frame);  
        end
        
        
%         for group_index=1:length(grouped_corrs)
%             group=grouped_corrs{1,grouped_index};
%             group_average=Data_Corrected(group,((curtime-time_start)+1):((curtime-time_start)+time_step));
%             
%         end
    end
    
    clear data_corrs data_lags
    %Testing Stationarity
%     for i=1:20
%         test=Data(i,(curtime-time_window):(curtime+time_window));
%         dataavg(i,tracker)=mean(test);
%         datastd(i,tracker)=std(test);
%     end
%     tracker=tracker+1;

    
end
%close(framefig)
if use_video == 1
    close
    close(test_vid);
end
if HW_video==1
    close(test_vid);
end
if write_data==1
    %Perpare data to be written
    %Insert filtered data back into original data structure
    for data_step=chanstart:chanstop
       Data(data_step,time_start:time_end)=Data_Corrected(data_step,:); 
    end
    
    %Re-orient Data structure back to what it was when imported.
    Data=Data';
    
    %Generate new filename
    CorrFilename_raw=file(1:end-4);
    CorrFilename=sprintf('%s_CorrFixed.bin',CorrFilename_raw);
    %Write data to file
    multibandwrite(Data,CorrFilename,'bip', 'precision','float32','machfmt','ieee-le');

end
% clearvars -except testdata dataavg datastd
beep
toc
