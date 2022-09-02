##批量出表格
#处理的是00、05、10、15的数据

i=2000
outpath=r"D:\weitu\gisdata\CO2_diver\co2_LU\excel"
while i<2018:
    in_table="disxLU_"+str(i)
    out_excel=outpath+"\\disxLU_"+str(i)+".xls"
    arcpy.TableToExcel_conversion(in_table,out_excel)
    i=i+5
print("done.")