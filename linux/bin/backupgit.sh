#!/bin/bash 

PATH=/opt/bin:/opt/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

projects_dir=/s0/repos
backup_base_dir=/mnt/ds213/repos/backup 

# For some reason, the file system wouldn't be monted after the linkstation is rebooted
# So, try to mount the file system firstly
test -d ${backup_base_dir} || mount -a
 
# If the target directory still doesn't exist, create one.
test -d ${backup_base_dir} || mkdir -p ${backup_base_dir} 

# Log file
log_file=~/backupgit.log
# Reset the log file
: > ${log_file}

today=$(date +%Y%m%d)
#yesterday=$(date -D "%s" -d $(( $(/bin/date +%s ) - 86400 ))  +%Y%m%d)
yesterday=$(date -d "yesterday"  +%Y%m%d)

pushd $projects_dir 

git_status=0

echo "[Create git bundles]" >> ${log_file}
###for d in `find $projects_dir -type d -name \*.git`; do 
###Exclude Calibre
for d in `find $projects_dir -type d -name \*.git -not -path "*ebooks*"`; do 
	cd $d 
	repo=${d##*/}
	repo=${repo%.*}_${today} 
	bundle=${backup_base_dir}/${repo}.bundle
	if [ -e ${bundle} ];
	then
	    echo " ${bundle} already exists! Skip backing up ${repo}" >> ${log_file} 2>&1
	else
	    echo " Back up ${repo}" >> ${log_file} 2>&1
            echo "  cd $PWD" >> ${log_file} 2>&1
	    echo "  git bundle create ${backup_base_dir}/${repo}.bundle --all" >> ${log_file} 2>&1
            echo "  " >> ${log_file} 2>&1
	    git bundle create ${backup_base_dir}/${repo}.bundle --all >> ${log_file} 2>&1
	    if [ $? -ne 0 ]; then
		git_status = $? 
		echo "  $* failed with exit code $?" >> ${log_file}
	    fi
	fi
done 
popd 


# Remove the old backups (only keep two days backup)
if [ ${git_status} -eq 0 ]; then
	echo " " >> ${log_file}
	echo "[Remove bundles older than 2 days]" >> ${log_file}
        find $backup_base_dir -name "*.bundle" -mtime +1 -exec echo "  rm -f {}" >> ${log_file} \;	
	find $backup_base_dir -name "*.bundle" -mtime +1 -exec rm -f {} >> ${log_file} 2>&1 \;
	
	echo " " >> ${log_file}
fi

# Send the log to my email box
#mail_inp=~/mailbody.txt
# Reset the mail content firstly
#: > ${mail_inp}
# Compose the email, mail-header.txt is expected in the HOME of root
#cat ~/mail-header.txt > ${mail_inp}
#cat ${log_file} >> ${mail_inp}
# send the email using ssmtp
#ssmtp dongwg@hotmail.com < ${mail_inp}
 
#
