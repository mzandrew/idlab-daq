diff cleaned_trigger_result.dat software_simulation_result.txt > diff.dat
echo "**************************************"
echo ""
line=`wc -l "diff.dat"`
number=`expr match "$line" '\([0-9]*\)'`
if [[ "$number" != "0" ]]
then echo "TEST FAILED!"
else echo "TEST PASSED!"
fi
echo "**************************************"
echo ""
echo ""
