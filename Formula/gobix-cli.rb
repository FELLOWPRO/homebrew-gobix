class GobixCli < Formula
  desc "Gobix CLI for DMS documents, health checks, and API automation"
  homepage "https://dev.gobix.de/cli"
  version "0.1.1"
  revision 2
  license "MIT"

  if Hardware::CPU.arm?
    url "https://dev.gobix.de/downloads/gobix-macos-arm64"
    sha256 "295b3399c7785a9b62597aa5e8e83ccfd6af23a038e8ef100c5a3612abddf03b"
  else
    url "https://dev.gobix.de/downloads/gobix-macos-x64"
    sha256 "edf7e24ca07ef041f64f994697dc7392faa70c870808ec58d888b58fe626c806"
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
