class GobixCli < Formula
  desc "Gobix CLI for DMS documents, health checks, and API automation"
  homepage "https://dev.gobix.de/cli"
  version "0.1.1"
  revision 3
  license "MIT"

  if Hardware::CPU.arm?
    url "https://dev.gobix.de/downloads/gobix-macos-arm64"
    sha256 "c019bfc41364559de76c2a93793dd984dcc2510f1b34bfa58a2c626a2978fa82"
  else
    url "https://dev.gobix.de/downloads/gobix-macos-x64"
    sha256 "5837dd5eb39119d4fcf53e87ca57cb9bb88a1c3f65166a8251132305723d1b57"
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
