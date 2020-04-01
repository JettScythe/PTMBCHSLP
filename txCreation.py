import argparse

parser = argparse.ArgumentParser(description='Send tokens to specified simpleledger addresses')
parser.add_argument('tokenid', help='tokenid that you want to send')
parser.add_argument('wallet_path', help='location of the wallet file')
parser.add_argument('program_path', help='location of Electron Cash SLP Edition')
args = parser.parse_args()
        
with open("finFilt.txt") as f:
    lines = [line.strip() for line in f.readlines()]
        
def chunks(lst, n): 
    # Yield successive n-sized chunks from lst.
    for i in range(0, len(lst), n): 
        yield lst[i:i + n]
        
for chunk in list(chunks(lines, 18)):
    formatted = map(lambda addr: "[\\\"" + addr + "\\\",1]", chunk)
    addydata = "[" + (','.join(formatted)) + "]" 
    print(args.program_path + " paytomany_slp " + args.tokenid + " \"" + addydata + "\" -w " + args.wallet_path)

# Special thanks and credit to Nick Ryan & @Blockparty_sh
