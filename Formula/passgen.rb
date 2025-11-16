class Passgen < Formula
  desc "Cryptographically secure password generator"
  homepage "https://github.com/iambugra/passgen"
  url "https://github.com/iambugra/passgen/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "660f9e732f869f4dfdc94da9ba91f2413cbd57e368408b2714d59eba8b3e41c4"
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
