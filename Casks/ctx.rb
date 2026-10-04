cask "ctx" do
  version "5.0.30"
  sha256 "08442f147f4298323201d78716a70ccfeb993608b9b9a6c1f772b312d8086e9b"

  url "https://github.com/opsbit-io/ctx/releases/download/v#{version}/CTX.app.zip"
  name "CTX"
  desc "Native cloud and Kubernetes context manager"
  homepage "https://github.com/opsbit-io/ctx"

  deprecate! date: "2026-10-04", because: "moved to opsbit-io/tap/ctx (brew uninstall --cask ctx; brew install --cask opsbit-io/tap/ctx)"

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
