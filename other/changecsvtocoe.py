import csv
csvFile = open("undergroundprice.CSV", "r") 
txtfile = open("price.txt","w")
reader = csv.reader(csvFile)
result = []
for item in reader:
    for pp in item:
        pp = int(pp)
        pp = hex(pp)
        pp = str(pp)
        pp = pp[2]
        txtfile.write(pp)
        txtfile.write(',\r')
csvFile.close() 
txtfile.close()
print(result)
