##批量区域统计
#处理的是00、05、10、15的数据

i=2000
outpath=r"D:\weitu\gisdata\CO2_diver\co2_LU\LU.gdb\disxLU_"
while i<2018:
    inraster="disx_"+str(i)+"sum_.tif"
    out_table=outpath+str(i)
    arcpy.sa.ZonalStatisticsAsTable("China_disx","code",inraster,out_table,"DATA","MEAN")
    i=i+5

