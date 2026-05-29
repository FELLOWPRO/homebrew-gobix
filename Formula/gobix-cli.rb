class GobixCli < Formula
  desc "Gobix CLI for DMS documents, health checks, and API automation"
  homepage "https://dev.gobix.de/cli"
  version "0.1.1"
  revision 5
  license "MIT"

  if Hardware::CPU.arm?
    url "https://dev.gobix.de/downloads/gobix-macos-arm64"
    sha256 "69d09f6c397bd463139148ee7e6679b972c8b2ec07fa872e993563a68fb12cd8"
  else
    url "https://dev.gobix.de/downloads/gobix-macos-x64"
    sha256 "38d5ef47bfd82810a4830b027f490ed294f2d7fec9ff60b077ff39309d79c174"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "gobix-macos-arm64" => "gobix"
    else
      bin.install "gobix-macos-x64" => "gobix"
    end
    bin.install_symlink bin/"gobix" => "gobix-cli"
  end

  test do
    assert_match "Gobix CLI", shell_output("#{bin}/gobix --help")
    assert_match "Gobix CLI", shell_output("#{bin}/gobix-cli --help")
    assert_match "gobix connector setup", shell_output("#{bin}/gobix --help")
  end
end
