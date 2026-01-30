class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.2.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.2.16/flutter-skill-macos-arm64"
      sha256 "209d95a2d4b2eee5de36089450a6addd52a79e503ae231dc5a3d11721b9cde05"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.2.16/flutter-skill-macos-x64"
      sha256 "8fd65432926a30e379d7066023a52640b873e99b53b6a2ef86c38e5dd610e112"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.2.16/flutter-skill-linux-x64"
    sha256 "8584b908db83a09d54990bdf8da635fc8033cf62f78e764eb096960d4ad5b7f6"
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
