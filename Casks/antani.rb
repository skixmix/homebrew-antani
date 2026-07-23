cask "antani" do
  version "1.0.0"
  sha256 "0a73c1cf4c6b7383e917d020a822f8a83bbf0c29e8bb115fc4cec9fb28198a0b"

  # url is rewritten in full by .github/workflows/bump-tap.yml in the main
  # AntanI repo, using the real asset URL from the published GitHub Release
  # (Tauri's exact dmg filename isn't guessed/templated here).
  url "https://github.com/skixmix/AntanI/releases/download/v1.0.0/AntanI_1.0.0_universal.dmg"
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
