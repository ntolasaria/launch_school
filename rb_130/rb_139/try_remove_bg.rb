require 'remove_bg'
require 'find'

RemoveBg.configure do |config|
  config.api_key = "HKatcbz5Gh7kfg1yn6T6qBcX"
end


Find.find('.') do |filename|
  next if filename.match(/\/.+\//)
  if filename.match(/\.jpe?g\z/)
    p filename
    result = RemoveBg.from_file("#{filename}")
    result.save("processed/#{filename.gsub(/jpe?g\z/, 'png')}")
  end
end

# result = RemoveBg.from_file("IMG_2646.jpeg")
# result.save("processed/IMG_2646.jpeg")
