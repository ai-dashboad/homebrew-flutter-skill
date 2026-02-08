class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.6.1/flutter-skill-macos-arm64"
      sha256 "abf5342282fad59451451587d87d884b7d51703b1f787073f8cf94799605a91f"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.6.1/flutter-skill-macos-x64"
      sha256 "15899f5995e8ae2dc6a05f10df0f46889f4feb82b15c4bd458c217b04947b234"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.6.1/flutter-skill-linux-x64"
    sha256 "3fc9ac6d15ac15c9911fb622974cfc511a44dcad74a6a914e06041a81d975898"
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
