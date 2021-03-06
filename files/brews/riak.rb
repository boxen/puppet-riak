require 'formula'

class Riak < Formula
  homepage 'http://wiki.basho.com/Riak.html'

  url 'http://downloads.basho.com.s3-website-us-east-1.amazonaws.com/riak/1.2/1.2.1/osx/10.4/riak-1.2.1-osx-x86_64.tar.gz'
  version '1.2.1-x86_64-boxen1'
  sha256 'aa7a99c8cd280a1529b97d690a1faaa0fb05211a87b077cf4f19cb0921cb492b'

  skip_clean 'libexec'

  option '32-bit'

  def install
    libexec.install Dir['*']

    # The scripts don't dereference symlinks correctly.
    # Help them find stuff in libexec. - @adamv
    inreplace Dir["#{libexec}/bin/*"] do |s|
      s.change_make_var! "RUNNER_SCRIPT_DIR", "#{libexec}/bin"
    end

    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
