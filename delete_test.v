module test

import filestore { Disk }
import os

fn before_each() {
	file_path := "misc/example5.txt"

	if os.exists(file_path) {
		if os.is_file(file_path) {
			os.rm(file_path) or {
				panic(err)
			}
		} else {
			os.rmdir(file_path) or {
				panic(err)
			}
		}
	}
}

fn test_delete_removes_the_file() {
	before_each()

	misc := Disk{ folder: "misc" }

	os.write_file("misc/example5.txt", "") or {
		panic(err)
	}

	misc.delete("example5.txt") or {
		panic(err)
	}

	assert !os.exists("misc/example5.txt")
}

fn test_delete_returns_error_if_no_file() {
	before_each()

	misc := Disk{ folder: "misc" }

	mut result := ""

	misc.delete("example5.txt") or {
		result = "no file found"
	}

	assert result == "no file found"
}

fn test_delete_returns_error_if_file_is_folder() {
	before_each()

	misc := Disk{ folder: "misc" }

	mut result := ""

	os.mkdir("misc/example5.txt") or {
		panic(err)
	}

	misc.delete("example5.txt") or {
		result = "file is not a file"
	}

	assert result == "file is not a file"
}
