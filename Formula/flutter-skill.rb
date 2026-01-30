class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.2.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.2.18/flutter-skill-macos-arm64"
      sha256 "a97b2744ee5c6b3b407f984bcb9a63d1f1edd0e3f4ac7bc287f4992907999c4f"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.2.18/flutter-skill-macos-x64"
      sha256 "ea8dd6818cf7bd279d2eaffc6427e0721631556aaa7bf9ab9d4e7f347a37dcec"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.2.18/flutter-skill-linux-x64"
    sha256 "63dfbbf346eae34398dddb972f84a6c4e85984eccda16c2d20789f672e8213ec"
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
