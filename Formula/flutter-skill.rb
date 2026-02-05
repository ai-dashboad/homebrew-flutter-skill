class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.5.4/flutter-skill-macos-arm64"
      sha256 "53a3ffe252cf6db593e12c194bcacdf82a6451a44fb7be3dfef7d8c445602273"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.5.4/flutter-skill-macos-x64"
      sha256 "ac9e372415a7b0d11858e4df8f6ad373a13937fafae013a55394e3fc68d944ef"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.5.4/flutter-skill-linux-x64"
    sha256 "ced24fc38bef3dcca4dc8e3bb69cf1e4b7a485128a05bcf1799a73c070bbf207"
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
