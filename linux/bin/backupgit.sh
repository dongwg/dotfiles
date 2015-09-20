#!/bin/bash 

PATH=/opt/bin:/opt/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

projects_dir=/mnt/disk1/share/repos
backup_base_dir=/mnt/disk1/ds213_share/repos/backup 

# For some reason, the file system wouldn't be monted after the linkstation is rebooted
# So, try to mount the file system firstly
test -d ${backup_base_dir} || mount -a
 
# If the target directory still doesn't exist, create one.
test -d ${backup_base_dir} || mkdir -p ${backup_base_dir} 

# Log file
log_file=~/backupgit.log
# Reset the log file
: > ${log_file}

pushd $projects_dir 

git_status=0

echo "[Create git bundles]" >> ${log_file}
for d in `find $projects_dir -type d -name \*.git`; do 
	cd $d 
	repo=${d##*/}
	repo=${repo%.*}_$(date +%Y%m%d) 
        echo "  cd $PWD" >> ${log_file} 2>&1
	echo "  git bundle create ${backup_base_dir}/${repo}.bundle --all" >> ${log_file} 2>&1
        echo "  " >> ${log_file} 2>&1
	git bundle create ${backup_base_dir}/${repo}.bundle --all >> ${log_file} 2>&1
	if [ $? -ne 0 ]; then
		git_status = $? 
		echo "  $* failed with exit code $?" >> ${log_file}
	fi
done 
popd 


# Remove the old backups (only keep two days backup)
if [ ${git_status} -eq 0 ]; then
	echo " " >> ${log_file}
	echo "[Remove bundles older than 2 days]" >> ${log_file}
        find /mnt/disk1/ds213_share/repos/backup/ -name "*.bundle" -mtime +1 -exec echo "  rm -f {}" >> ${log_file} \;	
	find /mnt/disk1/ds213_share/repos/backup/ -name "*.bundle" -mtime +1 -exec rm -f {} >> ${log_file} 2>&1 \;
	
	echo " " >> ${log_file}
	echo "[Update the default CalibreLibrary.bundle]" >> ${log_file}
        echo "  Use ${backup_base_dir}/CalibreLibrary_$(date +%Y%m%d).bundle" >> ${log_file}
	rm -rf ${backup_base_dir}/CalibreLibrary.bundle
	cp ${backup_base_dir}/CalibreLibrary_$(date +%Y%m%d).bundle ${backup_base_dir}/CalibreLibrary.bundle
fi

# Send the log to my email box
mail_inp=~/mailbody.txt
# Reset the mail content firstly
: > ${mail_inp}
# Compose the email, mail-header.txt is expected in the HOME of root
cat ~/mail-header.txt > ${mail_inp}
cat ${log_file} >> ${mail_inp}
# send the email using ssmtp
ssmtp dongwg@hotmail.com < ${mail_inp}
 
#
