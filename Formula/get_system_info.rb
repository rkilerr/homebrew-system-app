class GetSystemInfo < Formula
  desc "get system about your system"
  homepage "https://github.com/rkilerr/system-app"
  version "0.1"


  url "https://github.com/rkilerr/system-app/archive/main.zip", :using => :curl

  def install
    bin.install "bin/get_system_info"
  end
end
