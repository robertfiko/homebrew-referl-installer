class Referl < Formula
      desc "Refactoring brought to Erlang"
      homepage "http://plc.inf.elte.hu/erlang/index.html"
      url "http://plc.inf.elte.hu/erlang/dl/refactorerl-0.9.20.08_v2.zip"
      sha256 "52f0778c42f7c48490f93b07a435cb3f8c3573810765b6255145e6972edc0cea"
      #version
      #license
    
      depends_on "erlang"
      depends_on "gcc" => "4.9"
      depends_on "yaws" => "1.89"
      depends_on "graphviz" => "2.0"
    
      def install
        #find yaws path
        #/usr/local/Cellar/yaws/2.0.8/lib/yaws-2.0.8/ebin
        yaws_version = (`yaws --version`).split(' ')[-1]
        yaws_path = "/usr/local/Cellar/yaws/" + yaws_version + "/lib/yaws-" + yaws_version + "/ebin"
        puts "Looking for YAWS path on: " + yaws_path
        if (! File.directory?(yaws_path))
          abort("Error! - yaws path not found")  
        end

        system "bin/referl", "-build", "tool", "-yaws_path", yaws_path


        bin.install "/usr/local/Cellar/referl/2/bin/referl" 
      end
    
      test do
        #system "#{bin}/referl", "--version"
        #system "#{bin}/referl"
      end
    end