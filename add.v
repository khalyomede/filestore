module filestorage

import os

pub fn (disk Disk) add(path string, content string) ? {
	file_path := os.join_path(disk.folder, path)

	if os.exists(file_path) {
		mut file := os.open_append(file_path) ?

		bytes := file.write_string(content) ?

		file.close()

		if content.len > bytes {
			return error('written $bytes, but content len is ' + content.len.str())
		}
	} else {
		println("file does not exist, creating it")

		os.write_file(file_path, content) ?
	}
}
