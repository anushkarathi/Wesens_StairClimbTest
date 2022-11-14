%location of the sct data 
directory = uigetdir;
alldata = dir(directory + "/*.csv");
dates=NaT(length(alldata),1); 
i=1; 

alldata_cell=struct2cell(alldata);
alldata_names=alldata_cell(1,:); 

%loading raw data into MATLAB
sct_first_data=readtable([alldata(1).folder '\' char(alldata_names{1})]);

% MICRO SEC SINCE so %1,000,000


%finding the index of right, left, and lumbar of sct

sct_first_right_index = find(string(sct_first_data.Properties.VariableNames) == "RightFoot");
sct_first_left_index= find(string(sct_first_data.Properties.VariableNames) == "LeftFoot");
sct_first_lum_index=find(string(sct_first_data.Properties.VariableNames) == "Lumbar"); 


%seperating the x,y,z of the accelerometer and gyro for right foot
sct_first_right_x_accel=table2array(sct_first_data(:,sct_first_right_index-3)); 
sct_first_right_y_accel=table2array(sct_first_data(:,sct_first_right_index-2)); 
sct_first_right_z_accel=table2array(sct_first_data(:,sct_first_right_index-1)); 

sct_first_right_x_gyro=table2array(sct_first_data(:,sct_first_right_index)); 
sct_first_right_y_gyro=table2array(sct_first_data(:,sct_first_right_index+1)); 
sct_first_right_z_gyro=table2array(sct_first_data(:,sct_first_right_index+2)); 



%seperating the x,y,z of the accelerometer and gyro for left foot 
sct_first_left_x_accel=table2array(sct_first_data(:,sct_first_left_index-3)); 
sct_first_left_y_accel=table2array(sct_first_data(:,sct_first_left_index-2)); 
sct_first_left_z_accel=table2array(sct_first_data(:,sct_first_left_index-1)); 

sct_first_left_x_gyro=table2array(sct_first_data(:,sct_first_left_index)); 
sct_first_left_y_gyro=table2array(sct_first_data(:,sct_first_left_index+1)); 
sct_first_left_z_gyro=table2array(sct_first_data(:,sct_first_left_index+2)); 


%seperating the x,y,z of the accelerometer and gyro for lumbar
sct_first_lum_x_accel=table2array(sct_first_data(:,sct_first_lum_index-3)); 
sct_first_lum_y_accel=table2array(sct_first_data(:,sct_first_lum_index-2)); 
sct_first_lum_z_accel=table2array(sct_first_data(:,sct_first_lum_index-1)); 

first_lum_accel= [sct_first_lum_x_accel,sct_first_lum_y_accel,sct_first_lum_z_accel];

sct_first_lum_x_gyro=table2array(sct_first_data(:,sct_first_lum_index)); 
sct_first_lum_y_gyro=table2array(sct_first_data(:,sct_first_lum_index+1)); 
sct_first_lum_z_gyro=table2array(sct_first_data(:,sct_first_lum_index+2)); 

first_lum_gyro= [sct_first_lum_x_gyro,sct_first_lum_y_gyro,sct_first_lum_z_gyro];

sct_first_lum_x_mag=table2array(sct_first_data(:,sct_first_lum_index+3)); 
sct_first_lum_y_mag=table2array(sct_first_data(:,sct_first_lum_index+4)); 
sct_first_lum_z_mag=table2array(sct_first_data(:,sct_first_lum_index+5)); 

first_lum_mag= [sct_first_lum_x_mag,sct_first_lum_y_mag,sct_first_lum_z_mag];


%time for the diff data 
time_first=table2array(sct_first_data(:,1));
time_first=((time_first(:,1)-time_first(3,1))/1000000);


figure
subplot(7,1,1)
    plot(time_first(:,1),sct_first_right_x_accel(:,1),'k-','Linewidth',2);
    hold on 
    plot(time_first(:,1),sct_first_right_y_accel(:,1),'m-','Linewidth',2);
    hold on 
    plot(time_first(:,1),sct_first_right_z_accel(:,1),'r-', 'Linewidth',2);
    title('Right Foot acceleration')
    axis([0 45 -100 60])
    legend('x accel', 'y accel', 'z accel')

subplot(7,1,2)
    plot(time_first(:,1),sct_first_right_x_gyro(:,1),'b-', 'Linewidth',2);
    hold on 
    plot(time_first(:,1),sct_first_right_y_gyro(:,1),'Color','#D95319', 'Linewidth',2);
    hold on
    plot(time_first(:,1),sct_first_right_z_gyro(:,1),'c-', 'Linewidth',2);
    title('Right Foot gyroscope')
    axis([0 45 -10 10])
    legend('x gyro', 'y gyro', 'z gyro')

subplot(7,1,3)
    plot(time_first(:,1),sct_first_left_x_accel(:,1),'k-','Linewidth',2);
    hold on 
    plot(time_first(:,1),sct_first_left_y_accel(:,1),'m-','Linewidth',2);
    hold on 
    plot(time_first(:,1),sct_first_left_z_accel(:,1),'r-', 'Linewidth',2);
    title('Left Foot acceleration')
    axis([0 45 -100 60])

subplot(7,1,4)
    plot(time_first(:,1),sct_first_left_x_gyro(:,1),'b-', 'Linewidth',2);
    hold on 
    plot(time_first(:,1),sct_first_left_y_gyro(:,1),'Color','#D95319', 'Linewidth',2);
    hold on
    plot(time_first(:,1),sct_first_left_z_gyro(:,1),'c-', 'Linewidth',2);
    title('Left Foot gyroscope')
    axis([0 45 -10 10])

subplot(7,1,5)
    plot(time_first(:,1),sct_first_lum_x_accel(:,1),'k-','Linewidth',2);
    hold on 
    plot(time_first(:,1),sct_first_lum_y_accel(:,1),'m-','Linewidth',2);
    hold on 
    plot(time_first(:,1),sct_first_lum_z_accel(:,1),'r-', 'Linewidth',2);
    title('Lumbar acceleration')
    axis([0 27 -15 15])

subplot(7,1,6)
    plot(time_first(:,1),sct_first_lum_x_gyro(:,1),'b-', 'Linewidth',2);
    hold on 
    plot(time_first(:,1),sct_first_lum_y_gyro(:,1),'Color','#D95319', 'Linewidth',2);
    hold on
    plot(time_first(:,1),sct_first_lum_z_gyro(:,1),'c-', 'Linewidth',2);
    title('Lumbar gyroscope')
    axis([0 27 -10 10])


subplot(7,1,7)
fuse = ahrsfilter('SampleRate',128);
q_first = fuse(first_lum_accel(3:end,:),first_lum_gyro(3:end,:),first_lum_mag(3:end,:));
    plot(time_first(3:end,1),abs((180/pi)*eulerd(q_first,'ZYX','frame')), 'Linewidth',1.5);

title('Orientation Estimate')
legend('z-axis', 'y-axis', 'x-axis')
ylabel('Rotation (degrees)')
