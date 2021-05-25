# filestorage

Multiple functions on file disk for V.

## Summary

- [About](#about)
- [Features](#features)
- [Installation](#installation)
- [Examples](#examples)
- [Test](#test)

## About

I create this library to easily manipulate files on the disk.

## Features

- Defines "disks" to save files in a specific folder
- Provides functions to
  - save content in file (erase previous content)
  - append content in file
  - delete files
  - check if a file exists
  - get the content of a file

## Installation

```v
v install khalyomede.filestorage
```

## Examples

- [1. Put content in a file](#1-put-content-in-a-file)
- [2. Append content to a file](#2-append-content-to-a-file)
- [3. Check if a file exists](#3-check-if-a-file-exists)
- [4. Get the path of a file](#4-get-the-path-of-a-file)
- [5. Delete a file](#5-delete-a-file)

### 1. Put content in a file

In this example, we will erase the content of a file by another.

```v
import khalyomede.filestorage { Disk }

fn main() {
  logs := Disk{ folder: "logs" }

  logs.set("app.log", "[DBUG] user accessed home page") or {
    panic(err)
  }
}
```

Note that if the file does not exists, this creates it.

### 2. Append content to a file

In this example, we will add a content to a file that already has some content.

```v
import khalyomede.filestorage { Disk }
import os

fn main() {
  os.write_file("logs/app.log", "[DBUG] user accessed home page") or {
    panic(err)
  }

  logs := Disk{ folder: "logs" }

  logs.add("app.log", "[INFO] user logged with email example@host.com") or {
    panic(err)
  }
}
```

### 3. Check if a file exists

In this example, we will check that a file exists in its disk.

```v
import khalyomede.filestorage { Disk }

fn main() {
  logs := Disk{ folder: "logs" }

  assert logs.has("app-2021-05-25.log") == false
}
```

### 4. Get the path of a file

In this example, we will get the path of a file with its disk folder.

```v
import khalyomede.filestorage { Disk }

fn main() {
  logs := Disk{ folder: "logs" }

  assert logs.get_path("app.log") == "logs/app.log"
}
```

### 5. Delete a file

In this example, we will delete a file from our disk.

```v
import khalyomede.filestorage { Disk }

fn main() {
  logs := Disk{ folder: "logs" }

  logs.delete("app-2021-05-25.log") or {
    panic(err)
  }
}
```

## Test

```v
v test .
```
