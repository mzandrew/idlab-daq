diff cleaned_result_file.txt sorted_pattern.txt > diff.txt
echo "**************************************"
echo ""
line=`wc -l "diff.txt"`
number=`expr match "$line" '\([0-9]*\)'`
if [[ "$number" != "0" ]]
then echo "TEST FAILED!"
else echo "TEST PASSED!"
fi
echo "**************************************"
echo ""
echo ""
