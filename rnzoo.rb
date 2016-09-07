require "formula"

class Rnzoo < Formula
  desc "useful tool for EC2."
  homepage 'https://github.com/reiki4040/rnzoo'
  version "0.4.0"

  if OS.mac?
    url "https://github.com/reiki4040/rnzoo/releases/download/v" + version + "/rnzoo-" + version + "-darwin-amd64.zip"
    sha256 'b2fdf0a1ddc3e2348cdcc59e0d34e995b4c67197b0486427507bdfd65d3d5eab'
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
