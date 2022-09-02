%% 单个nc文件转为多个tif文件
%以青藏高原提供的降雨nc文件为例。

clc;
clear;
%% 读取NC文件
%datadir = 'D:\Elife\风园-硕士\002 研一下 春\000 碳量论文\003 数据查询\辐射-TPDC-中国区域融合日照时数的高分辨率（10km）地表太阳辐射数据集（1983-2017）\GWRHXG_Rs1.nc'; %指定批量数据所在的文件夹
%filelist = dir([datadir,'*.nc']); %列出所有满足指定类型的文件
ncFilePath=['pre_2015_2017.nc'];  %如果文件就在文件夹里，直接这步，确认一下路径添加就行 
%% 显示结构
ncdisp(ncFilePath);%显示nc文件的所有结构，以便了解需要获取的数据的变量名称等信息
%% 读取变量值。根据上一步的结构写变量名称。
lon=ncread(ncFilePath,'lon');%读取经度变量
lat=ncread(ncFilePath,'lat');%读取纬度变量
time=ncread(ncFilePath,'time');%读取时间变量
%month=ncread(ncFilePath,'month');%读取时间变量
tmp=ncread(ncFilePath,'pre');%从显示nc文件结构的步骤可以看到数据的变量名称是pre

k=0;
for y=2015:2017%从15-17按年份循环
    for j=1:12
        k=k+1;
    tmp1=tmp(:,:,k);
    data=flipud(tmp1');
    %tmp3=fliplr(tmp2');
    %data=rot90(tmp3,3);
    %data=fliplr(tmp4');
    %data=tmp3; %有些文件需要翻转
    data(data<0)=NaN;%负值去掉
    R = georasterref('RasterSize', size(data),'Latlim', [double(min(lat)) double(max(lat))], 'Lonlim', [double(min(lon)) double(max(lon))]);%地理栅格数据参考对象(类) 
    filename1=['TMP',num2str(y),'_',num2str(j),'.tif'];%文件名
    geotiffwrite(filename1,data,R);%输出栅格内容（文件名，数据，栅格格式）
    end
end



