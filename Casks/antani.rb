cask "antani" do
  version "0.6.0"
  sha256 "27600f64cf46c2856e3ea3966097d6a46c387648314ae8208bc63316ab8ac371"

  # url is rewritten in full by .github/workflows/bump-tap.yml in the main
  # AntanI repo, using the real asset URL from the published GitHub Release
  # (Tauri's exact dmg filename isn't guessed/templated here).
  url "https://github.com/skixmix/AntanI/releases/download/v0.6.0/AntanI_0.6.0_universal.dmg"
  name "AntanI"
  desc "Minimal macOS orchestrator for CLI coding agents, terminals, and an embedded VS Code"
  homepage "https://github.com/skixmix/AntanI"

  depends_on formula: "code-server"

  app "AntanI.app"

  postflight do
    system_command "xattr", args: ["-cr", "#{appdir}/AntanI.app"], sudo: false
  end

  caveats <<~EOS
    AntanI is unsigned, so macOS can't reliably remember per-folder file
    access grants (e.g. Documents) for the terminals it spawns and may
    prompt repeatedly. To avoid this, grant it Full Disk Access:

      System Settings > Privacy & Security > Full Disk Access > add AntanI
  EOS
end
