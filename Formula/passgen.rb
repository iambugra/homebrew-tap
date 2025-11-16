class Passgen < Formula
  desc "Cryptographically secure password generator"
  homepage "https://github.com/iambugra/passgen"
  url "https://github.com/iambugra/passgen/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = shell_output("#{bin}/passgen -length=10")
    assert_equal 10, output.strip.length
  end
end