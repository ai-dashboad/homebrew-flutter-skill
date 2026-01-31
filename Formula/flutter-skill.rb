class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.2.25"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.2.25/flutter-skill-macos-arm64"
      sha256 "f8c5a789c3a9a3018001603d1d72255c99fd91e3a7414ed37daf4bc0e16a588c"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.2.25/flutter-skill-macos-x64"
      sha256 "23a72c5fb765666fbafcf9e449b39f46579c4a3890a6cbade3488437b0904616"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.2.25/flutter-skill-linux-x64"
    sha256 "ace78a6b3d4b2c386543f5dc65041282e151b5fec9eebbd041b27b8ed37e4293"
  end

  def install
    bin.install Dir["flutter-skill-*"].first => "flutter-skill"
  end

  def caveats
    <<~EOS
      flutter-skill is now installed as a native binary for instant startup!

      MCP Configuration (add to ~/.claude/settings.json):
        {
          "mcpServers": {
            "flutter-skill": {
              "command": "flutter-skill",
              "args": ["server"]
            }
          }
        }

      CLI Usage:
        flutter-skill launch /path/to/flutter/project
        flutter-skill inspect
        flutter-skill act tap "button_key"
    EOS
  end

  test do
    system "#{bin}/flutter-skill", "server", "--help"
  end
end
