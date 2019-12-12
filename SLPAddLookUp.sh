#!/bin/bash
# Workflow on collecting simpleledger addresses for PTMBCHSLP
# JettScythe.xyz 2019/2020

# Collect all balances and addresses for specified token. Format and save into specific document. 
curl -X GET "https://rest.bitcoin.com/v2/slp/balancesForToken/xxTokenIdGoesHerexx" -H "accept: */*" | json_pp > Document.txt

# Collect *only* simpleledger addresses
# grep 'simpleledger:' Document.txt > filteredDoc.txt
sed -n -i -e  '/simpleledger:/p' Document.txt && sed -i 's/      "slpAddress" : "//g' Document.txt && sed -i 's/",//g' Document.txt

# If you're collecting lists of addresses from multiple token ID's you're going to want to check for duplicates
sort -o Document.txt Document.txt && uniq Document.txt
