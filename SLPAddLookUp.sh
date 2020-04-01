#!/bin/bash
# Workflow on collecting simpleledger addresses for PTMBCHSLP
# JettScythe.xyz 2019/2020

# Collect all balances and addresses for specified token. Format and save into specific document. 
curl -X GET "https://rest.bitcoin.com/v2/slp/balancesForToken/xxTokenIdGoesHerexx" -H "accept: */*" | json_pp > Document.txt

# Alternatively, collect all SLP addresses. Format & save into Document
curl -X GET https://slpdb.fountainhead.cash/q/ewogICJ2IjogMywKICAicSI6IHsKICAgICJkYiI6IFsiZyJdLAogICAgImFnZ3JlZ2F0ZSI6IFsKICAgICAgewogICAgICAgICIkbWF0Y2giOiB7CiAgICAgICAgfQogICAgICB9LAogICAgICB7CiAgICAgICAgIiR1bndpbmQiOiAiJGdyYXBoVHhuLm91dHB1dHMiCiAgICAgIH0sCiAgICAgIHsKICAgICAgICAiJHByb2plY3QiOiB7CiAgICAgICAgICAiZ3JhcGhUeG4ub3V0cHV0cy5hZGRyZXNzIjogMQogICAgICAgIH0KICAgICAgfSwKICAgICAgewogICAgICAgICIkZ3JvdXAiOiB7CiAgICAgICAgICAiX2lkIjogIiRncmFwaFR4bi5vdXRwdXRzLmFkZHJlc3MiCiAgICAgICAgfQogICAgICB9CiAgICBdLAogICAgImxpbWl0IjogOTk5OTk5OTk5OTk5CiAgfQp9 -H "accept: */*" | json_pp > ~/Documents/PTMSLPBCH/test.txt 


# Collect *only* simpleledger addresses
# grep 'simpleledger:' Document.txt > filteredDoc.txt
sed -n -i -e  '/simpleledger:/p' Document.txt && sed -i 's/      "slpAddress" : "//g' Document.txt && sed -i 's/",//g' Document.txt

# If you're collecting lists of addresses from multiple token ID's you're going to want to check for duplicates
sort -o Document.txt Document.txt && uniq Document.txt
