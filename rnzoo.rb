class Rnzoo < Formula
  desc "Useful tool for EC2"
  homepage "https://github.com/reiki4040/rnzoo"
  version "0.5.0"
  normal_sha256 = "b26d023a2f4db4a73a40a6e8651bcf8ff7501b6259dd20e86c471e6553b3a0bb"
  devel_version = "0.6.0-dev2"
  devel_sha256 = "cac73dd4199943d94300dbde5a2236c28941f23006f62774f327fa904d590085"

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
    <<~EOS
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

    EOS
  end

  # test
  test do
    # dummy https://github.com/rcmdnk/homebrew-file/blob/master/brew-file.rb#L23
    system "brew", "file", "help"
  end
end
