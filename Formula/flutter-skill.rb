class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.9.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.9.18/flutter-skill-macos-arm64"
      sha256 "6496570264571996e0f50942e4a13d505499d4f2946f6bfe43db1d4a45786510"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.9.18/flutter-skill-macos-x64"
      sha256 "de21ad0b86666a0b0b2614d7787e605a0fee96588c888dc9cb08c7fc06ffa0f8"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.9.18/flutter-skill-linux-x64"
    sha256 "6d75d1a5f6caf1bc2c84d1e420e3d09ba3381d7f914729890fc21db931237efb"
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
