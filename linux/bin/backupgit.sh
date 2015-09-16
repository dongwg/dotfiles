#!/bin/bash 

# Backup git repositories on ls-chlffe

PATH=/opt/bin:/opt/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

projects_dir=/mnt/disk1/share/repos
backup_base_dir=/mnt/disk1/ds213_share/repos/backup 

test -d ${backup_base_dir} || mkdir -p ${backup_base_dir} 

# Log file
log_file=~/backupgit.log
# Reset the log file
: > ${log_file}

pushd $projects_dir 

git_status=0

for d in `find $projects_dir -type d -name \*.git`; do 
	cd $d 
	repo=${d##*/}
	repo=${repo%.*}_$(date +%Y%m%d) 
        echo "cd $PWD" >> ${log_file} 2>&1
	echo "git bundle create ${backup_base_dir}/${repo}.bundle --all" >> ${log_file} 2>&1
	git bundle create ${backup_base_dir}/${repo}.bundle --all >> ${log_file} 2>&1
	if [ $? -ne 0 ]; then
		git_status = $? 
		echo "$* failed with exit code $?" >> ${log_file}
	fi
done 
popd 

# Remove the old backups (only keep two days backup)
if [ ${git_status} -eq 0 ]; then
	rm -rf ${backup_base_dir}/CalibreLibrary.bundle
	find /mnt/disk1/ds213_share/repos/backup/ -name "*.bundle" -mtime +1 -exec rm -f {} >> ${log_file} 2>&1 \;
	
	cp ${backup_base_dir}/CalibreLibrary_$(date +%Y%m%d).bundle ${backup_base_dir}/CalibreLibrary.bundle
fi
 
#
