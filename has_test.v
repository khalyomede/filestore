module test

import filestorage { Disk }
import os

fn before_each() {
	file_path := "misc/example2.txt"

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

fn test_has_returns_true_if_file_exists() {
	before_each()

	misc := Disk{ folder: "misc" }

	os.write_file("misc/example2.txt", "foo") or {
		panic(err)
	}

	assert misc.has("example.txt")
}

fn test_has_returns_false_if_file_does_not_exists() {
	before_each()

	misc := Disk{ folder: "misc" }

	assert !misc.has("example2.txt")
}

fn test_has_returns_false_if_file_is_a_folder() {
	before_each()

	misc := Disk{ folder: "misc" }

	os.mkdir("misc/example2.txt") or {
		panic(err)
	}

	assert !misc.has("example2.txt")
}
