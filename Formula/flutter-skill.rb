class FlutterSkill < Formula
  desc "MCP Server for Flutter app automation - AI Agent control for Flutter apps"
  homepage "https://github.com/ai-dashboad/flutter-skill"
  version "0.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.5.5/flutter-skill-macos-arm64"
      sha256 "f70cd0552fc35c66f647aff86dd04c5f3536bf6997b5843b84ae59b86ff708f0"
    end
    on_intel do
      url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.5.5/flutter-skill-macos-x64"
      sha256 "e4e4a86374cf9197860f16c3f4840bf312e8507295f4293d8160943eb54bdd17"
    end
  end

  on_linux do
    url "https://github.com/ai-dashboad/flutter-skill/releases/download/v0.5.5/flutter-skill-linux-x64"
    sha256 "7b24f55f8f5cd73952fc08697973151e23a2dbede4a13b0e94a51083d3f43ca4"
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
