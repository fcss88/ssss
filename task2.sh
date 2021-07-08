# script backup moodleDB
# ACAB

# var for mysql status check
mysqlstatus=`systemctl status mysql | grep running`

if [[ ${#mysqlstatus} == 0 ]];
then
	echo "MySQL stopped!"
	exit 1
else
	echo "Lets try to do backup:"
fi

# var for filename
currdatatime=`date +%Y%m%d_%H%M`
# create dump sql-file
mysqldump --force -u $1 -p$2 moodle > /home/backup/backup_$currdatatime.sql
# create arch 
gzip -f /home/backup/*.sql
# delete archives older than 10 days 
find /home/backup/ -type f -mtime +10 -name "*.gz" -execdir rm -f {} \;
