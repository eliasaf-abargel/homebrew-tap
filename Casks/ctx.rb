cask "ctx" do
  version "5.0.28"
  sha256 "6b7430ec0ceef6783f47c68fe1d8612c913bd51e1770613de29216cda74fad14"

  url "https://github.com/eliasaf-abargel/CTX/releases/download/v#{version}/CTX.app.zip"
  name "CTX"
  desc "Native cloud and Kubernetes context manager"
  homepage "https://github.com/eliasaf-abargel/CTX"

  depends_on macos: :sonoma

  app "CTX.app"

  zap trash: [
    "~/.ctx",
    "~/Library/Preferences/dev.eliasafa.CTX.plist",
    "~/Library/Caches/dev.eliasafa.CTX",
  ]
end
