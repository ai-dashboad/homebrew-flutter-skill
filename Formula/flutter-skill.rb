class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.9.23"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.9.23/flutter-skill-macos-arm64"
      sha256 "7e5e80d7748ebcfed6257d5bc324bf0c6da0c728a6e5f8569699293c7e87d0c2"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.9.23/flutter-skill-macos-x64"
      sha256 "f2e3b34a90cdfcf11a8fb158fdaa286bfb0851d6d804141f8128cdfaf4bbb987"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.9.23/flutter-skill-linux-x64"
    sha256 "8fde1cb65a593342ae95a7e5fef17eeb4aeeabf1a4f86948f4f2d650d6ee8866"
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
