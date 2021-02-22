class Referl < Formula
      desc "A 'hello-world' kind of dummy installer."
      homepage "https://github.com/robertfiko/homebrew-referl"
      url "https://github.com/robertfiko/referl/archive/0.3.tar.gz"
      #license
      sha256 "260aece8c3f72a7506a0cd8473fd007b6ce5a7b1ce5f1fa61f5b4bb339c2a45b"
    
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
    