class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.7.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.7.7/flutter-skill-macos-arm64"
      sha256 "91445d9314e5afc2306994e12d01020ab2ea2955313dd6ecd13b2cdea939bb6f"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.7.7/flutter-skill-macos-x64"
      sha256 "c630c7c8d73ed134364c8c94c39f3e959c6798b480253eb3b0d1196f5e2c52ff"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.7.7/flutter-skill-linux-x64"
    sha256 "4e5f2334873c6ef86c514d1bfaa18a4f7140583c2c25bedb8c2df15e4684795e"
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
