module test

import filestore { Disk }

fn test_get_path_returns_correct_path() {
	misc := Disk{ folder: "misc" }

	assert misc.get_path("example.txt") == "misc/example.txt"
}
