class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.4.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.4.7/flutter-skill-macos-arm64"
      sha256 "fd15cf9169272c164fd50653069138eef78e9ff580ede52770b9e3777eb1f075"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.4.7/flutter-skill-macos-x64"
      sha256 "6b912943709506a874eeda093d3cd9a73ae85f0546d5aabe2f980b29d3d9e64e"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.4.7/flutter-skill-linux-x64"
    sha256 "ad80f4e8eddcea684af28ef2aab53c1f5e79cff75dd6d18d8ff13ccf68f239f1"
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
