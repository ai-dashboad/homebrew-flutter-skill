class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.8.2/flutter-skill-macos-arm64"
      sha256 "61fada7068f16a40ea0cb9b2a201fac0ea4ea9a886ee0d788d30d307f493fb9a"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.8.2/flutter-skill-macos-x64"
      sha256 "7a607fa98d514febb11f94dfc5b4114bbe4150c33c604be24a870372fd23a08f"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.8.2/flutter-skill-linux-x64"
    sha256 "837fe0ca8bdb4f0da15f989b0ba06b73b08d6da17ed567c91dbb4f709c73130f"
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
