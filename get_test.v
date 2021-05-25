module test

import filestorage { Disk }
import os

fn before_each() {
	file_path := "misc/example3.txt"

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

fn test_get_returns_correct_content() {
	before_each()

	misc := Disk{ folder: "misc" }

	os.write_file("misc/example3.txt", "foo") or {
		panic(err)
	}

	actual := misc.get("example3.txt") or {
		panic(err)
	}

	assert actual == "foo"
}

fn test_get_returns_nothing_if_file_does_not_exists() {
	before_each()

	misc := Disk{ folder: "misc" }

	actual := misc.get("example3.txt") or { "" }

	assert actual == ""
}

fn test_get_returns_nothing_if_file_not_a_file() {
	before_each()

	misc := Disk{ folder: "misc" }

	os.mkdir("misc/example3.txt") or {
		panic(err)
	}

	actual := misc.get("example3.txt") or { "" }

	assert actual == ""
}
