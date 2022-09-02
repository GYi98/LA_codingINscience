##批量栅格相加
#并输出相加的栅格。
#处理的是00、05、10、15的数据

import arcpy
from arcpy.sa import *
arcpy.CheckOutExtension("spatial")
arcpy.gp.overwriteOutput=1
#custom
num=2000
while num <2018:
    arcpy.env.workspace=r"D:\weitu\gisdata\CO2_diver\co2_LU\01_data\\" +str(num)+ "_check" 
    outpath=r'D:\weitu\gisdata\CO2_diver\co2_LU\01_data\disx_'+str(num)
    #注意路径符号。有时候需要加r，有时候需要两个斜杆
    outfilename="SUM_";n=12;
    Sum=0
    files=arcpy.ListRasters()
    for file in files:
        Sum=Sum+Raster(file)
    (Sum).save(outpath+outfilename)
    num+=5 #只能五年五年运算