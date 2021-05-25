module filestore

import os

pub fn (disk Disk) has(path string) bool {
	file_path := os.join_path(disk.folder, path)

	return os.exists(file_path) && os.is_file(file_path)
}
