# Homebrew formula for the Nanny CLI.
#
# This file lives at homebrew/nannyd.rb in the nanny repo for source tracking.
# For the tap to work, copy it to the Formula/ directory of the
# nanny-run/homebrew-tap GitHub repository:
#
#   https://github.com/nanny-run/homebrew-tap/blob/main/Formula/nannyd.rb
#
# After tagging v0.1.0, update the sha256 values using:
#   curl -fsSL <url> | shasum -a 256

class Nannyd < Formula
  desc "Execution boundary for autonomous AI agents"
  homepage "https://nanny.run"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nanny-run/nanny/releases/download/v#{version}/nanny-macos-arm64.tar.gz"
      sha256 "3e12dad9519173e79e9d18b9329adecdea1149ccfe12b08f8139f03792d05ddf"
    end

    on_intel do
      url "https://github.com/nanny-run/nanny/releases/download/v#{version}/nanny-macos-x86_64.tar.gz"
      sha256 "17e2242bbfeaffea9760d45693dfcd9f37460ec10eced8399187634846d671b9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nanny-run/nanny/releases/download/v#{version}/nanny-linux-x86_64.tar.gz"
      sha256 "a4635e6da387ba393092311da06d47d6d67ec348121a7137db8c26e46abe6412"
    end
  end

  def install
    bin.install "nanny"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nanny --version")
  end
end
