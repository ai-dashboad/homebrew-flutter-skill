class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.7.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.7.8/flutter-skill-macos-arm64"
      sha256 "ed8c47b27874cdd05949fbbeb4aba462cf9dd8d4ca73b110e16c2ae0f2538b8f"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.7.8/flutter-skill-macos-x64"
      sha256 "e1664cb5cb1a7ef633870eafabb9f862b932edcc6c479c38c2fb41928aec68c1"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.7.8/flutter-skill-linux-x64"
    sha256 "0a480b52e7b2ad0b6cbdf5a400f94c51e6ae1002f154cf30bbb22690b10c440a"
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
