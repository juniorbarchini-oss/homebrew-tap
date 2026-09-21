cask "smarttimearchive" do
  version "2.0.0"
  sha256 "645cc6da794c4f1b88d1fe6cbe92d5d5964874ae34cec08fb718acafb0ddaef9"

  url "https://github.com/juniorbarchini-oss/smarttimearchive-app/releases/download/v#{version}/SmartTimeArchive-#{version}.pkg"
  name "SmartTimeArchive"
  desc "Archive the history of a Time Machine (APFS) backup disk as plain folders"
  homepage "https://github.com/juniorbarchini-oss/smarttimearchive-app"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  pkg "SmartTimeArchive-#{version}.pkg"

  uninstall pkgutil: "com.juniorbarchini.smarttimearchive",
            delete:  [
              "/Applications/SmartTimeArchive.app",
              "/usr/local/bin/sta",
              "/usr/local/lib/smarttimearchive",
            ]

  zap trash: "~/Library/Caches/sta"

  caveats <<~EOS
    The engine runs as administrator, so the installer asks for your password and installs it
    owned by root in /usr/local/lib/smarttimearchive. Open SmartTimeArchive from Applications,
    or type: sta
  EOS
end
