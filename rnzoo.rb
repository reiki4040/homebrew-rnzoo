require "formula"

HOMEBREW_RNZOO_VERSION="0.2.0"
class Rnzoo < Formula
  homepage 'https://github.com/reiki4040/rnzoo'

  if OS.mac?
    url "https://github.com/reiki4040/rnzoo/releases/download/#{HOMEBREW_RNZOO_VERSION}/rnzoo-#{HOMEBREW_RNZOO_VERSION}-darwin-amd64.zip"
    sha1 '203853d469537d925d90a25bdb9112e7e395b0ec'
  end

  version=HOMEBREW_RNZOO_VERSION

  depends_on 'peco'
  
  def install
    # rnssh, ec2list, ltsv_pipe
    bin.install Dir['bin/*']
  end
 
  # show message after installation.
  def caveats
    msg = <<-EOF.undent
    # rnzoo need AWS access key for working.
    # Please set environment variable for AWS connection.
    # (~/.bashrc, ~/.zshrc or other.)

    export AWS_ACCESS_KEY_ID="YOUR AWS ACCESS KEY"
    export AWS_SECRET_ACCESS_KEY="YOUR AWS SECRET ACCESS KEY"
    
    # Option: you can set default aws region.

    export AWS_REGION="ap-northeast-1"

EOF
  end
end
