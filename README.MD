# README

## File renamer for multiple copies of same MP3 file in same path

### Explained

ren.rb needs to be in a parent folder to the location where the MP3 files are.

-	C:\folder\folder2\file(1).mp3 - 1.5mb
-	C:\folder\folder2\file(2).mp3 - 3mb
-	C:\folder\folder2\file(3).mp3 - 2mb

Our goal here is a single copy named "file.mp3"

In this case, place 'ren.rb' in C:\folder\

Run from command line, 

```
c:\folder> ruby ren.rb
```

This script will locate all files in C:\folder\ and its subfolders which have a filename ending in (number).mp3

It will then find the largest copy among those files

(from the example above, file(2).mp3 would be chosen)

and rename it to

file.mp3

If file.mp3 already exists and has a larger file size, no action is taken

The last step is to delete any remaining copies of file(x).mp3

Test this out on a tiny sample of your files before launching, this was designed to work against my special case, yours may not behave the same way. Good luck!