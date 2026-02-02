class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.4.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.4.6/flutter-skill-macos-arm64"
      sha256 "330bf4eff258baba7dde71b7cbe7d2d3beb3778b25e6ebe44dcdfd41af7b8fce"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.4.6/flutter-skill-macos-x64"
      sha256 "30b20c3bd1ed73d54f47138a12b08bc5d94bb147a85e488e3e1da6b7c0864cf1"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.4.6/flutter-skill-linux-x64"
    sha256 "3bbaafcd349bcd4b35eb5f1196fb37971b4bf774f5a25822ae179c8deafadfe6"
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
