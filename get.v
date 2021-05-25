module filestore

import os

pub fn (disk Disk) get(path string) ?string {
	file_path := os.join_path(disk.folder, path)

	return os.read_file(file_path)
}
