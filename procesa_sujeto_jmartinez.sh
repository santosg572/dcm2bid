#!/bin/bash

sujeto="Suj"$1

dcm2bids_scaffold -o $sujeto
cd $sujeto


wget -O dcm_qa_nih-master.zip https://github.com/neurolabusc/dcm_qa_nih/archive/refs/heads/master.zip

unzip dcm_qa_nih-master.zip -d sourcedata/

mv sourcedata/dcm_qa_nih-master sourcedata/dcm_qa_nih

cp ../dcm2bids_config.json code/.


dcm2bids -d sourcedata/dcm_qa_nih/In/ -p ID${1} -c code/dcm2bids_config.json --auto_extract_entities





