class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.4.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.4.5/flutter-skill-macos-arm64"
      sha256 "ac81815eb739507ad2716f0971884b9e66fd4607de83f5b8614ee6646b529fc3"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.4.5/flutter-skill-macos-x64"
      sha256 "845a7cfed61220fbc5abf7faf2d9001868fd620cddf2f878ece04c15e9935348"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.4.5/flutter-skill-linux-x64"
    sha256 "557bae54067cce519f8b3bea2afd686a03c0083ecdfb8ab381cd358fe6483f8e"
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
