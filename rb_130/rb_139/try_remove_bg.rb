require 'remove_bg'

RemoveBg.configure do |config|
  config.api_key = "Y6PYk92zftGzy25c8i6LyqAa"
end
result = RemoveBg.from_file("PTP_image.jpeg")
result.save("processed/PTP_image.jpeg")
