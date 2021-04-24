class Referl < Formula
      desc "Refactoring brought to Erlang"
      homepage "http://plc.inf.elte.hu/erlang/index.html"
      url "http://plc.inf.elte.hu/erlang/dl/refactorerl-0.9.20.08_v2.zip"
      sha256 "52f0778c42f7c48490f93b07a435cb3f8c3573810765b6255145e6972edc0cea"
      #version #TODO !!!
      #license #TODO !!!
      #TODO MK PATH MANUAL man.mkpath
      #TODO -with and -without tagek
    
      depends_on "erlang"
      depends_on "gcc" => "4.9"
      depends_on "yaws" => "1.89"
      depends_on "graphviz" => "2.0"
    
      def install
        yaws_version = (`yaws --version`).split(' ')[-1]
        #? Ez a path így rendben van?
        yaws_path = "/usr/local/Cellar/yaws/" + yaws_version + "/lib/yaws-" + yaws_version + "/ebin"
        puts "Looking for YAWS path on: " + yaws_path
        if (! File.directory?(yaws_path))
          abort("Error! - yaws path not found")  
        end


        install_path = `pwd`
        puts install_path
        puts "======\n"
        puts #{HOMEBREW_PREFIX}
        brew_preifx = `brew --prefix`
        puts brew_preifxref

        #TODO ezt egy outsourceként megvalósítani
        out_file = File.new("bin/referls", "w")
        out_file.puts("#\!\/bin\/bash") #{HOMEBREW_PREFIX} #! prefix - próbáld ezt
        out_file.puts("`/usr/local/Cellar/referl/2/bin/bin/referl-boot -base /usr/local/Cellar/referl/2/bin/`")
        out_file.close

        content = `cat bin/referls`
        puts content
        
        system "bin/referl", "-build", "tool", "-yaws_path", yaws_path
       
        prefix.install "bin"
        lib.install "lib" #? lib.install
        prefix.install "refactorerl.boot"
        prefix.install "sys.config"

        bin.install_symlink "bin/referls"
      end
    
      test do
        #system "#{bin}/referl", "--version"
        #system "#{bin}/referl"
      end
    end




    #! _____________ NOTES _____________ !#
    #bin/referl -base /usr/local/Cellar/referl/2/bin


            #ln_s "/usr/local/Cellar/referl/2/bin/bin/referl", "/usr/bin/referl", :force => true
        #inreplace "referl", "referl", "referl-boot"
