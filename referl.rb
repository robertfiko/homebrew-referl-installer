class Referl < Formula
      desc "A 'hello-world' kind of dummy installer."
      homepage "https://github.com/robertfiko/homebrew-referl"
      url "https://github.com/robertfiko/referl/archive/0.5.tar.gz"
      sha256 "e5fae2d72d868d85662d4485334b60d0bf28f15eb845a99a22c883b2a2bd4426"
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
    
