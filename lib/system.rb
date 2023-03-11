module System
  text =  "OS is not supported in this version."

  if RUBY_PLATFORM.include? "darwin"
    require_relative "./mac"
    puts "Mac version is under development"
  else
    puts "This" + text
  end

end
