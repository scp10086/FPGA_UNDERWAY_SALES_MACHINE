import csv
csvFile = open("undergroundprice.CSV", "r") 
txtfile = open("price.txt","w")
reader = csv.reader(csvFile)
result = []
for item in reader:
    for pp in item:
        txtfile.write(pp)
        txtfile.write(',\r')
csvFile.close() 
txtfile.close()
print(result)