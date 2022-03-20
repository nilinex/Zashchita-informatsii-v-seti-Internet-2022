HASH=$1
find -type f | while read FILE
do
	FILEHASH=$(sha1sum $FILE)
	FILEHASH=${FILEHASH%% *}
	#echo "$FILE sha1sum: $FILEHASH"
	if [[ "$FILEHASH" = "$1" ]]
	then
		echo "File found: $FILE"
		break
	fi
done
