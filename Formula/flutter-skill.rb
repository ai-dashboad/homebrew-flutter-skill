class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.9.29"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.9.29/flutter-skill-macos-arm64"
      sha256 "ca45b76c5439bb77b48f55e3fdcb24decb476835b848781b59d66a9f985647b5"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.9.29/flutter-skill-macos-x64"
      sha256 "c9e79091bfe60fc7352b9cfcee4a89bfe0062a3ff6b2a830569c64bd22774c7e"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.9.29/flutter-skill-linux-x64"
    sha256 "e82b776bcf3458814d3f74bb47db592e9fec253f079c6522259e6f75b9b21df6"
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
