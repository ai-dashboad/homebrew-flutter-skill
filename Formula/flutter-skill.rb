class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.7.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.7.4/flutter-skill-macos-arm64"
      sha256 "d120e8eb92fefbb17ba562c8b8ae5c9955a609d7db1926c0068bd6a1983c4618"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.7.4/flutter-skill-macos-x64"
      sha256 "eb58eed51c28a6037e15a0fad73f8e14ec0a9a9b50d06cbf10e157989ef8bb8b"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.7.4/flutter-skill-linux-x64"
    sha256 "86a40072eebd195ca36876c2fa51f0d2e2f4d26bb5ba85b94ce9abc5c58dc9cd"
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
