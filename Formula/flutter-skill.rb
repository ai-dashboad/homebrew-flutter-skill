class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.5.3/flutter-skill-macos-arm64"
      sha256 "a4b8c4bf8238f05bd2e781bf9af66d37206acbcd51e1637e4ce1b1dcb1bf3930"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.5.3/flutter-skill-macos-x64"
      sha256 "b2bd7b3ce0dcca703c5c31b4f46289c231c74009d2523f4dac6b15fc6602056c"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.5.3/flutter-skill-linux-x64"
    sha256 "1d5fd55bb4ec148a0b19714fc8239ec8a8e97eead790fc98f7f569ce6fdfb081"
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
