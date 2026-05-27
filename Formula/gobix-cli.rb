class GobixCli < Formula
  desc "Gobix CLI for DMS documents, health checks, and API automation"
  homepage "https://dev.gobix.de/cli"
  version "0.1.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://dev.gobix.de/downloads/gobix-macos-arm64"
    sha256 "d322af63b9ee04fae3ee4611df2c21f47799ab1330defa56ec15b00183535289"
  else
    url "https://dev.gobix.de/downloads/gobix-macos-x64"
    sha256 "e4f95d6c86a5424cd2f54218b4942c2d2dd1f17046771f3c9df32abc81ea9a2f"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "gobix-macos-arm64" => "gobix"
    else
      bin.install "gobix-macos-x64" => "gobix"
    end
  end

  test do
    assert_match "Gobix CLI", shell_output("#{bin}/gobix --help")
  end
end
