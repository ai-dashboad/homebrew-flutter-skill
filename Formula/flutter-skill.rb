class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.6.2/flutter-skill-macos-arm64"
      sha256 "dd38d0119aa36a3eddfcb7c3352af9a123900788bde6c785406e0259fdf12b1e"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.6.2/flutter-skill-macos-x64"
      sha256 "abce2f119dad19f1bd1293fab63747c5d94015d020c42de778524c56bbf79d5e"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.6.2/flutter-skill-linux-x64"
    sha256 "e4269f1e36812ca400201b6e0cf18178b9209bb382252f591001dadaf7d31c88"
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
