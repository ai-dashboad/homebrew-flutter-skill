class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.8.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.8.9/flutter-skill-macos-arm64"
      sha256 "e3c12a05d70a3a27cea8ee683535229fdd74517dbb6b5a89041be6868e5281fa"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.8.9/flutter-skill-macos-x64"
      sha256 "fdf7e493d7c4df9f47e1a7cbe269c6f0cb04c4c86f716ce2e871b270f2884c32"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.8.9/flutter-skill-linux-x64"
    sha256 "4a78f62f98e7f7476b0f192c02507e6122c11fe9199ec185d0e04e7ee877c0b1"
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
