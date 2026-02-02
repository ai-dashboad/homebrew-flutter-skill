class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.5.1/flutter-skill-macos-arm64"
      sha256 "585816f361bdccbad16dce4160e6cdd9a33b4f35b5dc40ec0085f228e229e3a1"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.5.1/flutter-skill-macos-x64"
      sha256 "7ced988e2002c65df854a623900f07371ae778606d3f198f1c2d082fd7c60d2f"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.5.1/flutter-skill-linux-x64"
    sha256 "f2c7873e2e971d298da55d72a0969cbc201eeafd46e2a96c7dbc8e5e9f485050"
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
