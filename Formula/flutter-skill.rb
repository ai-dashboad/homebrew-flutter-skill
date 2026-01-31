class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.2.26"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.2.26/flutter-skill-macos-arm64"
      sha256 "476f7fa6ea372e92d33c56847e846d2d9b784ac1e278cdae8ebc75da46b3f4c7"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.2.26/flutter-skill-macos-x64"
      sha256 "e87ed18c7374ef298e19e2f79a22e6a3ee65eca02ee59e1a6f7981ad58fe470c"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.2.26/flutter-skill-linux-x64"
    sha256 "147efdb0bdd6be9f1f0b8e35499345c817342b1827b02b7f5bcc32f81de93e45"
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
