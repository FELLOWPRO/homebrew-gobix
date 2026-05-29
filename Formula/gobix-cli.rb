class GobixCli < Formula
  desc "Gobix CLI for DMS documents, health checks, and API automation"
  homepage "https://dev.gobix.de/cli"
  version "0.1.1"
  revision 6
  license "MIT"

  if Hardware::CPU.arm?
    url "https://dev.gobix.de/downloads/gobix-macos-arm64"
    sha256 "f76e956c59745d7655afb55e78e4406661ec1ab87f3b6b33a516688410491871"
  else
    url "https://dev.gobix.de/downloads/gobix-macos-x64"
    sha256 "9cf59eb368211ca2263c710991b174c4d399e1348c2310333ee10b543cc806a8"
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
