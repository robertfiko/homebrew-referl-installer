class Referl < Formula
      desc "A 'hello-world' kind of dummy installer."
      homepage "https://github.com/robertfiko/homebrew-referl"
      url "https://github.com/robertfiko/referl/archive/0.4.tar.gz"
      sha256 "fd1b1957e9f3037fb79efa17dea83eae3b043ebd56767c37b95886a7201c849b"
      #license
    
      bottle :unneeded
    
      def install
        system "g++", "main.cpp", "-o", "referl"
        bin.install "referl"
      end
    
      test do
        #system "#{bin}/referl", "--version"
        system "#{bin}/referl"
      end
    end
    
