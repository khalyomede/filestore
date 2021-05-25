module test

import filestore { Disk }
import os

fn before_each() {
	if os.exists("misc/example.txt") && os.is_file("misc/example.txt") {
		os.rm("misc/example.txt") or {
			panic(err)
		}
	}
}

fn test_set_store_correct_content() {
	before_each()

	misc := Disk{
		folder: "misc"
	}

	misc.set("example.txt", "foo") or {
		panic(err)
	}

	actual := os.read_file("misc/example.txt") or {
		panic(err)
	}

	assert actual == "foo"
}

fn test_set_erase_any_previous_content() {
	before_each()

	misc := Disk{ folder: "misc" }

	os.write_file("misc/example.txt", "foo") or {
		panic(err)
	}

	misc.set("example.txt", "bar") or {
		panic(err)
	}

	actual := os.read_file("misc/example.txt") or {
		panic(err)
	}

	assert actual == "bar"
}
