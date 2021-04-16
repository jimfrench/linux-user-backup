#!/bin/bash
cd "$1"
echo $1

mv backup-current-stdout.log backup-previous-stdout.log
mv backup-current-stderr.log backup-previous-stderr.log
mv backup-current.tar.gz backup-previous.tar.gz

{ { {

tar -cvpzf backup-current.tar.gz --exclude-from=backup-exclusions --exclude-caches /

echo "backup completed"

} 3>&- | tee -a backup-current-stdout.log >&3 3>&-
exit "${PIPESTATUS[0]}"
} 2>&1 | tee -a backup-current-stderr.log >&2 3>&-
} 3>&1
exit "${PIPESTATUS[0]}"
