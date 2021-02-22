class Referk < Formula
      desc "A 'hello-world' kind of dummy installer."
      homepage "https://github.com/robertfiko/homebrew-referl"
      url "https://github.com/robertfiko/homebrew-referl/releases/download/0.1/referl-0.1.tar.gz"
      #license
      sha256 "7d98bb7779bd8036dc3d08f77ebb6b313b78d629e5ccbe1e17839c93f09866e7"
    
      bottle :unneeded
    
      def install
        bin.install "referl"
      end
    
      test do
        #system "#{bin}/referl", "--version"
        system "#{bin}/referl"
      end
    end
    