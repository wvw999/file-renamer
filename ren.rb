listing = Dir.glob '**/*'
hash = {}
listing.each do |check|
	if check =~ / \([0-9]\).mp3/
		check2 = [check.sub(/ \([^A-Za-z]\).mp3/, '')]
		if hash[check2]
			hash[check2] << [check, File.size(check)]
		else
			hash[check2] = [[check, File.size(check)]]
		end
	end
end

hash.each do |key,val|
	if val.length > 1
		keep = []
		track = 0
		val.each do |look|
			if look[1] >= track
				keep = look
				track = look[1]
			end
		end
		renam = keep[0].gsub(/ \([0-9]\).mp3/, ".mp3")
	  if File.file?(renam)
	  	if File.size(renam) < keep[1]
	  		File.delete(renam)
	  		File.rename(keep[0], renam)
				hash[key].delete(keep)
	  	end
		else
  		File.rename(keep[0], renam)
			hash[key].delete(keep)
		end
	else
		hash.delete(key)
	end
end

hash.each do |key,val|
	if val.length > 1
		val.each do |remove|
			File.delete(remove[0])
		end
	end
end
