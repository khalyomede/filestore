module filestore

import os

pub fn (disk Disk) set(path string, content string) ? {
	file_path := os.join_path(disk.folder, path)

	os.write_file(file_path, content) ?
}
