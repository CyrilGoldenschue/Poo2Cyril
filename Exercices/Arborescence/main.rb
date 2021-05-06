def findAllFilePathsStartingWith(starts,path)
    arrayList = []

    #puts Dir.glob("#{path}/**/#{starts}*.*")

    #p Dir.exist?(starts)

    Dir.each_child("#{path}/") { |x|
        newpath = "#{path}/#{x}"
        if(File.directory?(newpath))
            arrayList.concat(findAllFilePathsStartingWith(starts, newpath))
        else
            if(x.include?(starts))
                arrayList.push(newpath)
            end
        end
    }

     return arrayList
end

def findAllFilePathsOfDepthStartingWith(fromDepth,toDepth,starts,path)


end

p "Part 1"
puts findAllFilePathsStartingWith("read", "data")

p "Part 2"
