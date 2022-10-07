----------------------------------------------------------------------------------------------------------
Production Process
----------------------------------------------------------------------------------------------------------

When the unix command in command.txt is run:
balances.sh iterates through the REV addresses in 20220719-REV-addresses_All.txt
For each REV address it looks up the balance on mainnet (if up) as of the time of running the balances.sh script.
This was run on 20221006 to produce the snapshot file 20221006-revbalances.txt in this directory.
This file contains all Rev Balances as at 20221006 for each address that existed in the input file.
The input file contains all Rev Addresses as of 20220719, plus some later missing addresses found before 20220731.
These addresses were therefore those identified in the final RPC Snapshot.

Note on running the command in command.txt be sure to change the date to today's date to avoid corrupting the output in 20221006-revbalances.txt

The data file produced has been run independently by three different people, on three different machines.
A cross-check was performed to assure we all got the same results.

Personal addresses were then checked to ensure the expected accuracy appears to have been achieved.

----------------------------------------------------------------------------------------------------------
WORKING DIR should be ignored for results checking
----------------------------------------------------------------------------------------------------------
WorkingDir had been tidied up. The files in Processed split the original file into batches of a thousand.
This was due to some testing problems encountered in earlier attempts.

However, these were overcome and the WorkingDir was not used to produce the final results.
It has been tidied up and left, purely in case the curious want to look through.

It should not be considered as part of the production process of the output file 20221006-RevBalances.txt, as it was not used in this files production.
