# A sample Guardfile
# More info at https://github.com/guard/guard#readme
# 
group :development do
  guard :minitest do
    watch(%r{^test/(.+)\.rb$})
  end

  watch(%r{^.+\.rb$}) do |m|
    puts `clear && ruby #{m[0]} 2>&1` unless m[0] =~ /^test/
  end
end
