class GobixCli < Formula
  desc "Gobix CLI for DMS documents, health checks, and API automation"
  homepage "https://dev.gobix.de/cli"
  version "0.1.1"
  revision 4
  license "MIT"

  if Hardware::CPU.arm?
    url "https://dev.gobix.de/downloads/gobix-macos-arm64"
    sha256 "41781c2fa519943c13ae195fc66bbd555c7ac7e2979d3c04b10f7068e1c032d6"
  else
    url "https://dev.gobix.de/downloads/gobix-macos-x64"
    sha256 "e5a2c0806a4519b23d4f3697a09b23cb6704b86c3a815b731972deae63170ede"
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
