# typed: false
# frozen_string_literal: true

class ListmonkCli < Formula
  desc "CLI for Listmonk campaigns, lists, subscribers, templates, and transactional emails."
  homepage "https://github.com/antoniolg/listmonk-cli"
  url "https://github.com/antoniolg/listmonk-cli/releases/download/v0.1.0/listmonk-cli_0.1.0.tar.gz"
  sha256 "b807a38652dbd4c04eeb2b7881b5920d7a59b458a8fc535af311af9229abcbe5"
  version "0.1.0"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"dist/index.js"
    (bin/"listmonk").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/index.js" "$@"
    EOS
  end

  test do
    system "#{bin}/listmonk", "--help"
  end
end
