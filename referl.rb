class Referl < Formula
      desc "A 'hello-world' kind of dummy installer."
      homepage "https://github.com/robertfiko/homebrew-referl"
      url "https://github.com/robertfiko/referl/archive/0.3.tar.gz"
      #license
      sha256 "cica"
    
      bottle :unneeded
    
      def install
        system "g++", "main.cpp -o referl"
        bin.install "referl"
      end
    
      test do
        #system "#{bin}/referl", "--version"
        system "#{bin}/referl"
      end
    end
    
