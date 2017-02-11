class Rnzoo < Formula
  desc "useful tool for EC2."
  homepage "https://github.com/reiki4040/rnzoo"
  version "0.4.1"

  if OS.mac?
    url "https://github.com/reiki4040/rnzoo/releases/download/v" + version + "/rnzoo-v" + version + "-darwin-amd64.tar.gz"
    sha256 "ae6d03019357c30fa087fe75ebcaaf2275cfab108afcc8dae4fc0a880ad9e9e2"
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
