cask "antani" do
  version "0.9.0"
  sha256 "5ae5a72b84aee21cabc627129b225fc67d9b0be373b0b2b6428567ea1ccf63ea"

  # url is rewritten in full by .github/workflows/bump-tap.yml in the main
  # AntanI repo, using the real asset URL from the published GitHub Release
  # (Tauri's exact dmg filename isn't guessed/templated here).
  url "https://github.com/skixmix/AntanI/releases/download/v0.9.0/AntanI_0.9.0_universal.dmg"
  name "AntanI"
  desc "Minimal macOS orchestrator for CLI coding agents, terminals, and an embedded VS Code"
  homepage "https://github.com/skixmix/AntanI"

  depends_on formula: "code-server"

  app "AntanI.app"

  postflight do
    system_command "xattr", args: ["-cr", "#{appdir}/AntanI.app"], sudo: false
  end

  caveats <<~EOS
    AntanI is self-signed. On first launch, if macOS blocks it,
    open it once via right click > Open.
  EOS
end
