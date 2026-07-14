cask "antani" do
  version "0.7.2"
  sha256 "5c3b88c5e2b60e70ca437633fe9db1c8b300a9ebbe72d23510336f344ff84e23"

  # url is rewritten in full by .github/workflows/bump-tap.yml in the main
  # AntanI repo, using the real asset URL from the published GitHub Release
  # (Tauri's exact dmg filename isn't guessed/templated here).
  url "https://github.com/skixmix/AntanI/releases/download/v0.7.2/AntanI_0.7.2_universal.dmg"
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
