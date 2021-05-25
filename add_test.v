module test

import filestorage { Disk }
import os

fn before_each() {
	file_path := "misc/example4.txt"

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

fn test_add_append_content() {
	before_each()

	misc := Disk{ folder: "misc" }

	os.write_file("misc/example4.txt", "foo") or {
		panic(err)
	}

	misc.add("example4.txt", "bar") or {
		panic(err)
	}

	actual := os.read_file("misc/example4.txt") or {
		panic(err)
	}

	assert actual == "foobar"
}

fn test_add_apend_content_to_empty_file() {
	before_each()

	misc := Disk{ folder: "misc" }

	os.write_file("misc/example4.txt", "") or {
		panic(err)
	}

	misc.add("example4.txt", "foo") or {
		panic(err)
	}

	actual := os.read_file("misc/example4.txt") or {
		panic(err)
	}

	assert actual == "foo"
}

fn test_add_does_not_append_if_folder() {
	before_each()

	misc := Disk{ folder: "misc" }

	os.mkdir("misc/example4.txt") or {
		panic(err)
	}

	mut result := ""

	misc.add("example4.txt", "foo") or {
		result = "not added"
	}

	assert result == "not added"
}

fn test_add_creates_file_if_not_exists() {
	before_each()

	misc := Disk{ folder: "misc" }

	misc.add("example4.txt", "foo") or {
		panic(err)
	}

	actual := os.read_file("misc/example4.txt") or {
		panic(err)
	}

	assert actual == "foo"
}
