class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.8.1/flutter-skill-macos-arm64"
      sha256 "33776eca0da4f278266e6882c558912cfe5269b2b6d52b5a3bbaa289bf201e2c"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.8.1/flutter-skill-macos-x64"
      sha256 "e118967d9731de1d7d4df982695547cd415dc74565c5e2dd31445acdf1505397"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.8.1/flutter-skill-linux-x64"
    sha256 "daab74d4530d51a8095deb57ceb8d3574f30fd79a7d1bd878c21bf9c0fa92336"
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
