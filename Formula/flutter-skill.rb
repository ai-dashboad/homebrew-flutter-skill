class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.4.2/flutter-skill-macos-arm64"
      sha256 "7d98791e10ec017e2c5285eee80edadb25c80588e8983b8413726ffc1cd206d5"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.4.2/flutter-skill-macos-x64"
      sha256 "b75abeb1912ca66070c5ab88975156452bfafe34ea7d3d2efa963ef273c3211d"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.4.2/flutter-skill-linux-x64"
    sha256 "8b9c6d6d44ed0561849f8dde952b9d6c6cbf82c01409c22bcc53ed93815812bb"
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
