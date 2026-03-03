# frozen_string_literal: true

# This file lives in the pyratzlabs/homebrew-ocls tap repository at
# Formula/ocls.rb.  It is kept here as the authoritative source and
# automatically pushed to that repo by the CI pipeline on every tag.
#
# To update manually after cutting a new release:
#
#   VERSION=v0.2.0
#   URL="https://gitlab.com/pyratzlabs/software/Openclaw_Security_Tooling_CLI\
# /-/archive/${VERSION}/Openclaw_Security_Tooling_CLI-${VERSION}.tar.gz"
#   SHA256=$(curl -sL "$URL" | shasum -a 256 | cut -d' ' -f1)
#   # Then replace the url and sha256 lines below with the new values.

class Ocls < Formula
  desc "Security scanner for agentic AI framework installations"
  homepage "https://gitlab.com/pyratzlabs/software/Openclaw_Security_Tooling_CLI"
  url "https://gitlab.com/pyratzlabs/software/Openclaw_Security_Tooling_CLI/-/archive/v0.1.0/Openclaw_Security_Tooling_CLI-v0.1.0.tar.gz"
  sha256 "c9931fbf211bf667f22d1e460004b3312c13495317073ee1738f536aaa2a3e95"
  license "MIT"

  head "https://gitlab.com/pyratzlabs/software/Openclaw_Security_Tooling_CLI.git",
       branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Binary must report the correct version.
    assert_match version.to_s, shell_output("#{bin}/ocls --version")

    # A non-existent path must exit 2 (scan error) with a clear message.
    output = shell_output("#{bin}/ocls --path /nonexistent/__ocls_test__ 2>&1", 2)
    assert_match "error", output.downcase
  end
end
