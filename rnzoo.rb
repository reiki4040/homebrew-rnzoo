require "formula"

class Rnzoo < Formula
  desc "useful tool for EC2."
  homepage 'https://github.com/reiki4040/rnzoo'
  version "0.3.2"

  if OS.mac?
    url "https://github.com/reiki4040/rnzoo/releases/download/v" + version + "/rnzoo-" + version + "-darwin-amd64.zip"
    sha256 'bc87dc44771df84d4043285c3d988d0123a4d64a16d16c1b9fb9f658f0f35841'
  end

  def install
    bin.install 'rnzoo'
  end

  # show message after installation.
  def caveats
    msg = <<-EOF.undent
    # rnzoo need AWS access key for working.
    # Please set key/secret to AWS credentials (~/.aws/credentials)

    [default]
    aws_access_key_id=your_key_id
    aws_secret_access_key=your_secret

    # or environment variable for AWS connection.
    # (~/.bashrc, ~/.zshrc or other.)

    export AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY
    export AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_ACCESS_KEY

    # you can set default aws region.

    rnzoo init

EOF
  end
end
