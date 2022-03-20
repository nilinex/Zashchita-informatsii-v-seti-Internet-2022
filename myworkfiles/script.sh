SYSAME=$(hostname)
LOGDIR=$1
cd $LOGDIR
ARCH=0
if (($#!=0))
then
	if [$2=='-z']
	then
		ARCH=1
	fi
fi
wevtutil el | while read FILELOG
do
	FILELOG="${FILELOG%$'\r'}"
	echo $FILELOG
	SAFENAME="${FILELOG// /_}"
	SAFENAME="${SAFENAME//\//-}"
	wevtutil epl $FILELOG "{SYSAME}_${SAFENAME}.evtx"
done
if (($ARCH!=0))
then
        tar -czvf ${SYSAME}_logs.tgz ${LOGDIR}/*.evtx
fi
