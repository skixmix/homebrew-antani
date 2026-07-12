cask "antani" do
  version "0.5.0"
  sha256 "99fbeccc36e516fb8653392797bab0f6e9dd227f1316aa875da8a3a4d7f6ee67"

  # url is rewritten in full by .github/workflows/bump-tap.yml in the main
  # AntanI repo, using the real asset URL from the published GitHub Release
  # (Tauri's exact dmg filename isn't guessed/templated here).
  url "https://github.com/skixmix/AntanI/releases/download/v0.5.0/AntanI_0.5.0_universal.dmg"
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
