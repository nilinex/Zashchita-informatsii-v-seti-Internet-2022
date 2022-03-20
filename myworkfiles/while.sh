while ls | grep -q pdf
do
	echo -n 'there is a file with pdf in its name here:'
	pwd
	cd ..
done
