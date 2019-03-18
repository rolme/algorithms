# You left your computer unlocked and your friend decided to troll you by copying a lot of your files to random spots all over your file system.
#
# Even worse, she saved the duplicate files with random, embarrassing names ("this_is_like_a_digital_wedgie.txt" was clever, I'll give her that).
#
# Write a method that returns an array of all the duplicate files. We'll check them by hand before actually deleting them, since programmatically deleting files is really scary. To help us confirm that two files are actually duplicates, return an array of arrays ↴ where:
#
# the first item is the duplicate file
# the second item is the original file
# For example:
#
#   [['/tmp/parker_is_dumb.mpg', '/home/parker/secret_puppy_dance.mpg'],
#  ['/home/trololol.mov', '/etc/apache2/httpd.conf']]
# You can assume each file was only duplicated once.
require 'digest'

def duplicates(arg)
  files = map_files(arg)

  found_duplicates = []
  files.keys.each do |md5|
    if files[md5].length > 1
      if File.ctime(files[md5][0]) < File.ctime(files[md5][1])
        found_duplicates << [files[md5][0], files[md5][1]]
      else
        found_duplicates << [files[md5][1], files[md5][0]]
      end
    end
  end
  found_duplicates
end

def map_files(arg, files={})
  # write the body of your function here
  dirs      = []
  Dir.chdir(arg)
  path      = Dir.pwd()
  filenames = Dir.entries('.')

  # List entries and determine if dir or file
  filenames.each do |filename|
    fullpath_file = "#{path}/#{filename}"
    next if ['.', '..'].include? filename
    if File.file? fullpath_file
      encode = Digest::MD5.file(fullpath_file).hexdigest
      files[encode] ||= []
      files[encode] << "#{fullpath_file}"
    elsif File.directory? fullpath_file
      files = map_files("#{fullpath_file}", files)
    end
  end

  files
end

# run your function through some test cases here
# remember: debugging is half the battle!
puts duplicates('.')
