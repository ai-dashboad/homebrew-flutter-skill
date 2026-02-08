class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.7.0/flutter-skill-macos-arm64"
      sha256 "174037642e9316e609f320646a616aaf739e0e5b936ccd64c5ef03cf2344a85a"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.7.0/flutter-skill-macos-x64"
      sha256 "1884f12643ed69b84606ca69c050b38defa0b14d75cf04a412da73e1ce7a64f7"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.7.0/flutter-skill-linux-x64"
    sha256 "0e3c75e45259ea753ac53c79740e9e0ac8bfbe8b51e8168481b4b09425fb2c2b"
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
