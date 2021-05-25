module filestorage

import os

pub fn (disk Disk) delete(path string) ? {
	file_path := os.join_path(disk.folder, path)

	if !os.is_file(file_path) {
		return error('file $file_path is not a file')
	}

	os.rm(file_path) ?
}
