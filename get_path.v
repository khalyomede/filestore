module filestore

import os

pub fn (disk Disk) get_path(file string) string {
	return os.join_path(disk.folder, file)
}
