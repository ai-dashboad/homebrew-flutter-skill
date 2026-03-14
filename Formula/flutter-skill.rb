class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.9.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.9.12/flutter-skill-macos-arm64"
      sha256 "7787350dd27ff697c5cc7d8f3db448e4281173a27b4de6d9f9bd57ce36a09340"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.9.12/flutter-skill-macos-x64"
      sha256 "7708e9f288c4bb053332742f0b2a84a7d28711734c466cfbbfc2bd24b6d70998"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.9.12/flutter-skill-linux-x64"
    sha256 "1df267deca2a40e85f7dee20f13c10af9b99c45607a45d009558bfaac292c853"
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
