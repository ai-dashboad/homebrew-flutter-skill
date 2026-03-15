class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.9.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.9.17/flutter-skill-macos-arm64"
      sha256 "250bc8c9b5cf291b6b89939ee01889a262cdfa2b68bca34383ff786d77ae496a"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.9.17/flutter-skill-macos-x64"
      sha256 "e763e9ced8d3be0900c633b024d35413bbc9431151cc01c3286c4fe9089679e4"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.9.17/flutter-skill-linux-x64"
    sha256 "9ac2a83f34457b13de32762f6ea027f0968e8525772040a6650367ae4eab14e8"
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
