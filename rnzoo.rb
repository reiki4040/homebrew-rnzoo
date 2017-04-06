class Rnzoo < Formula
  desc "useful tool for EC2."
  homepage "https://github.com/reiki4040/rnzoo"
  version "0.5.0"
  normal_sha256 = "b26d023a2f4db4a73a40a6e8651bcf8ff7501b6259dd20e86c471e6553b3a0bb"
  devel_version = "0.5.0-dev6"
  devel_sha256 = "62e46f2a2ff0f3fb72dee99719c466a0a2f6fac423a6ecd27e40781dabb4a175"

  if OS.mac?
    url "https://github.com/reiki4040/rnzoo/releases/download/" + version + "/rnzoo-" + version + "-darwin-amd64.tar.gz"
    sha256 normal_sha256
  end

  devel do
    url "https://github.com/reiki4040/rnzoo/releases/download/" + devel_version + "/rnzoo-" + devel_version + "-darwin-amd64.tar.gz"
    version devel_version
    sha256 devel_sha256
  end

  def install
    bin.install "rnzoo"
  end

  # show message after installation.
  def caveats
    <<-EOF.undent
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

  # test
  test do
    # nothing
  end
end
