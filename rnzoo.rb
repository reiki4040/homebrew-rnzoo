class Rnzoo < Formula
  desc "useful tool for EC2."
  homepage "https://github.com/reiki4040/rnzoo"
  version "0.4.1"
  normal_sha256 = "ae6d03019357c30fa087fe75ebcaaf2275cfab108afcc8dae4fc0a880ad9e9e2"
  devel_version = "v0.5.0-dev1"
  devel_sha256 = "38b26562ea160c3c3c57bc22e88280cb8e79a8eaf73ad9d9c4ef0e158f370bde"

  if OS.mac?
    url "https://github.com/reiki4040/rnzoo/releases/download/v" + version + "/rnzoo-v" + version + "-darwin-amd64.tar.gz"
    sha256 normal_sha256
  end

  devel do
    url "https://github.com/reiki4040/rnzoo/releases/download/" + devel_version + "/rnzoo-" + devel_version + "-darwin-amd64.tar.gz"
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
