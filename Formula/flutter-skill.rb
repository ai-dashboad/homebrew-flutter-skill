class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.8.0/flutter-skill-macos-arm64"
      sha256 "5c465a02e1b9e89793bb0afb468264b46d7a7c2aa18bffe171e4838c74cb4d63"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.8.0/flutter-skill-macos-x64"
      sha256 "5db45233cc93a7e6ce278710f26648d7f24d946d219cae9d5d07d6b331e0f531"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.8.0/flutter-skill-linux-x64"
    sha256 "872dbfae0b868ceb7108781b229b988b2d7b1eb026e28d63818563d0ffd7e243"
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
