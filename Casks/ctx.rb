cask "ctx" do
  version "5.0.28"
  sha256 "6b7430ec0ceef6783f47c68fe1d8612c913bd51e1770613de29216cda74fad14"

  url "https://github.com/eliasaf-abargel/CTX/releases/download/v#{version}/CTX.app.zip"
  name "CTX"
  desc "Native cloud and Kubernetes context manager"
  homepage "https://github.com/eliasaf-abargel/CTX"

  depends_on macos: :sonoma

  app "CTX.app"

  # CTX is signed ad-hoc, with no Apple Developer identity behind it, so the
  # quarantine flag Homebrew sets on every download makes Gatekeeper refuse to
  # open it - "the developer cannot be verified". Clearing it here keeps the
  # install to one command; the manual download instructions say to run the same
  # xattr by hand, and the repository script has always done it too.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/CTX.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/.ctx",
    "~/Library/Preferences/dev.eliasafa.CTX.plist",
    "~/Library/Caches/dev.eliasafa.CTX",
  ]
end
