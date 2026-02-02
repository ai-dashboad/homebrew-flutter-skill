class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.4.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.4.9/flutter-skill-macos-arm64"
      sha256 "88134709909468633b25bf88d5bcae1dd34368d4391c4634d852a8052f3c9ee5"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.4.9/flutter-skill-macos-x64"
      sha256 "0b058ee47d901e2d9b9958b79fead3bf8213690331c1fdda7eecc0206423d031"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.4.9/flutter-skill-linux-x64"
    sha256 "f53bb7012d31120ebfcec6a93f1ea30e8d4b0bb9b7cc6dc99086a73afcb95a2f"
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
