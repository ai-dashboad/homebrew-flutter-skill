class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.8.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.8.8/flutter-skill-macos-arm64"
      sha256 "46f81a4c3cc5184fe8faa5bd288e46daa9a49391c7ecd74f8449b9f8a01b92fb"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.8.8/flutter-skill-macos-x64"
      sha256 "0453b4df83a644cca75ce1f313725964aa1f017dc7c553e67f29cdd85095b60e"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.8.8/flutter-skill-linux-x64"
    sha256 "63a46d03cbc54c816cfd6b7e05783fb1b3af6530414f7fc096821ab26e55c4c4"
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
