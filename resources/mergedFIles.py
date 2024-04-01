#purely for updating the approvedFiles list.
# Can ingore during the competions 

filenames = ['approvedGIFFiles.txt', 'approvedJPEGFiles.txt', 'approvedJPGFIles.txt', 'approvedPNGFiles.txt', 'approvedTXTFiles.txt']
with open('approvedFiles.txt', 'w') as outfile:
    for fname in filenames:
        print('Merging ' + fname + ' into approvedFiles.txt')
        with open(fname, 'rb') as infile:
            for line in infile:
                outfile.write(line.decode('utf-8', errors='ignore'))