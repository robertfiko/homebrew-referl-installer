class Referl < Formula
      desc "A 'hello-world' kind of dummy installer."
      homepage "https://github.com/robertfiko/homebrew-referl"
      url "https://github.com/robertfiko/referl/archive/0.3.tar.gz"
      #license
      sha256 "185d082716d0073ef582359ee6115ba1b02225caadfcfb6fa59b8b185e46d3ae"
    
      bottle :unneeded
    
      def install
        puts "Hello \n There \n I will \ Install"
        system "g++", "main.cpp -o referl"
        bin.install "referl"
      end
    
      test do
        #system "#{bin}/referl", "--version"
        system "#{bin}/referl"
      end
    end
    