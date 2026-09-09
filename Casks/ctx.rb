cask "ctx" do
  version "5.0.28"
  sha256 "6b7430ec0ceef6783f47c68fe1d8612c913bd51e1770613de29216cda74fad14"

  url "https://github.com/eliasaf-abargel/CTX/releases/download/v#{version}/CTX.app.zip"
  name "CTX"
  desc "Native cloud and Kubernetes context manager"
  homepage "https://github.com/eliasaf-abargel/CTX"

  depends_on macos: :sonoma

  # CTX is signed ad-hoc, with no Apple Developer identity behind it, so the
  # quarantine flag Homebrew puts on every download makes Gatekeeper refuse to
  # open it - "the developer cannot be verified". Cleared here, while the app is
  # still staged: quarantine is applied when the download is unpacked and simply
  # travels with the bundle when it moves, so there is nothing left to clear
  # afterwards. The manual download instructions run the same xattr by hand.
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-r", "-d", "com.apple.quarantine", "CTX.app"],
        chdir:        ".",
        must_succeed: false
  end

  app "CTX.app"

  zap trash: [
    "~/.ctx",
    "~/Library/Preferences/dev.eliasafa.CTX.plist",
    "~/Library/Caches/dev.eliasafa.CTX",
  ]
end
