class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.5.0/flutter-skill-macos-arm64"
      sha256 "2f7307298e6999697935dd0b199cdf4eb940e8350020605a051c19639c513f18"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.5.0/flutter-skill-macos-x64"
      sha256 "ef2c17d7efecfff2f85d8532527454a28c35ed2ce281d488aad04885ef4140fe"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.5.0/flutter-skill-linux-x64"
    sha256 "25052cd9b803cabcbd35003c1dd1a39d32e72e959e2dea147357bcbd7718a031"
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
