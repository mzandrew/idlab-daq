#!/bin/csh -f


# Combine DST4 outputs

### Setup ###
set exp = "XX"
set input = "eXXrun0*"
#############

set list_dst4 = "dst4/exp"$exp"/"$input"p00.dst4"

foreach f ($list_dst4)
#echo $f

set output = `echo $f | cut -dp -f1-2`".dst4"
echo "Output = "$output

if ( -f $output ) then
echo "File "$output" exists..."
echo "terminate"
exit
endif

set combine = "combine.C"
echo "void combine(){" > $combine
echo 'TChain* chain_run = new TChain("RunTree");' >>! $combine
echo 'TChain* chain_evt = new TChain("EventTree");' >>! $combine
echo 'TChain* chain_ptn = new TChain("PhotonTree");' >>! $combine
echo 'TChain* chain_cnt = new TChain("CounterTree");' >>! $combine

set flist_dst4 = `echo $f | cut -dp -f1-2`"p*.dst4"
set flag = 0

foreach flist ($flist_dst4)

if ($flag == 0) then
echo 'chain_run -> Add("'$flist'");' >>! $combine
endif

echo 'chain_evt -> Add("'$flist'");' >>! $combine
echo 'chain_ptn -> Add("'$flist'");' >>! $combine
echo 'chain_cnt -> Add("'$flist'");' >>! $combine

@ flag += 1

end

echo "TTree* tree_run = new TTree;" >>! $combine
echo 'tree_run = chain_run->CopyTree("");' >>! $combine
echo "TTree* tree_evt = new TTree;" >>! $combine
echo 'tree_evt = chain_evt->CopyTree("");' >>! $combine
echo "TTree* tree_ptn = new TTree;" >>! $combine
echo 'tree_ptn = chain_ptn->CopyTree("");' >>! $combine
echo "TTree* tree_cnt = new TTree;" >>! $combine
echo 'tree_cnt = chain_cnt->CopyTree("");' >>! $combine

echo 'TFile* rootf = new TFile("'$output'", "RECREATE");' >>! $combine
echo "tree_run -> Write();" >>! $combine
echo "tree_evt -> Write();" >>! $combine
echo "tree_ptn -> Write();" >>! $combine
echo "tree_cnt -> Write();" >>! $combine
echo "rootf -> Close();" >>! $combine
echo 'gROOT -> ProcessLine(".q");' >>! $combine
echo "}" >>! $combine

root -l $combine
rm $combine

end
