class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.3.1/flutter-skill-macos-arm64"
      sha256 "845553594feacdf08d6d282dca8ee25da56afd78c69f0b4819bc88a369d6e5e6"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.3.1/flutter-skill-macos-x64"
      sha256 "189be3ccbbb69f0e49f76da84f81417a7bc20c3fd9284c39330ddb074e761741"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.3.1/flutter-skill-linux-x64"
    sha256 "c008f41030b9aa72a2840d0bba711585157dcf9d3e03c421977ced6230274f42"
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
