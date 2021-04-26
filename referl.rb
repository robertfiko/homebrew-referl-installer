class Referl < Formula
  desc "Refactoring brought to Erlang"
  homepage "http://plc.inf.elte.hu/erlang/index.html"
  url "http://plc.inf.elte.hu/erlang/dl/refactorerl-0.9.20.08_v2.zip"
  sha256 "52f0778c42f7c48490f93b07a435cb3f8c3573810765b6255145e6972edc0cea"
  #version #TODO
  #license #TODO
  #TODO MK PATH MANUAL man.mkpath

  depends_on "erlang"
  depends_on "gcc" => "4.9"
  depends_on "yaws" => "1.89"
  depends_on "graphviz" => "2.0"

  def install
    runner_script = 'referl_start'
    brew_prefix = '/usr/local/' #TODO Erre kell lennie jobbnak mert ez változhat 
    #brew_prefix = opt_prefix
    puts brew_prefix
    yaws_version = (`yaws --version`).split(' ')[-1]
    yaws_path = brew_prefix + "Cellar/yaws/" + yaws_version + "/lib/yaws-" + yaws_version + "/ebin"
    puts "Looking for YAWS path on: " + yaws_path
    if (! File.directory?(yaws_path))
      ofail("Error! - yaws path not found")  
    end

    #puts Dir["lib/*"]
    #puts Dir["lib/*"].length


    #TODO Ezt kilehet szervezni resouceba
    out_file = File.new("bin/" + runner_script, "w")
    out_file.puts("#\!\/bin\/bash")
    out_file.puts("echo \"Cica\"")
    out_file.puts("`/usr/local/Cellar/referl/2/bin/bin/referl -base /usr/local/Cellar/referl/2/bin/`")
    out_file.puts("echo \"Mica\"")
    out_file.close

    puts `pwd`

    #! KÉRDÉS : Az fontos e h 'referl' legyen a neve az indító eszköznek?



    #prefix.install "bin/"+runner_script
    #prefix.install_symlink "bin/"+runner_script

    system "bin/referl", "-build", "tool", "-yaws_path", yaws_path
    #system "sleep","60"

    bin_install = Dir["bin/*"]
    str_install = Array.new
    bin_install.each { |x| str_install.push(String.new(x)) }
    str_install.each { |x| puts x }
    str_install.delete("bin/referl")
    str_install.delete("bin/referl_start")

    puts "================"

    str_install.each { |x| puts x }


    
    
    bin.install str_install
    bin.install "bin/referl" => "referl_boot"
    lib.install Dir["lib/*"] 
    prefix.install "refactorerl.boot"
    prefix.install "sys.config"

    #bin.write_exec_script (libexec/"referl_start")
    bin.install "bin/referl_start" => "referl"
    #bin.install_symlink "bin/referl_start"
    


  end

  test do
    #system "#{bin}/referl", "--version"
    #system "#{bin}/referl"
  end
end

#bin/referl -base /usr/local/Cellar/referl/2/bin
