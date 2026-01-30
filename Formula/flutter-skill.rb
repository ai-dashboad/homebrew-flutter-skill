class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.2.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.2.15/flutter-skill-macos-arm64"
      sha256 "1254548a3b0b14d9c4a0ddf205259a179b6f7e3d8afb9e68fc82697c5c5d85eb"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.2.15/flutter-skill-macos-x64"
      sha256 "23cad15c1247fffe160a685c20ecb0e395610307036b3ab565f95d7a41480184"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.2.15/flutter-skill-linux-x64"
    sha256 "fc5d90af7898d13cda2ff912b1b92493cdc66f6b1e95f9ab5d144dc39225bf4a"
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
