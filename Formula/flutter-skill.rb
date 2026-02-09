class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.7.1/flutter-skill-macos-arm64"
      sha256 "5e0ff3c52794c56108db18c345f8864a9d74ecb623aefaa692f22f51ebaf70b1"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.7.1/flutter-skill-macos-x64"
      sha256 "fc43227ef4c2eb61a818261c4b79a1f652c40924091fed4421ec0cc6abf3c201"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.7.1/flutter-skill-linux-x64"
    sha256 "5a5fa04b312737f4aca3fc3838a9a4d24b140ac9979360f98468b7ef618dc303"
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
