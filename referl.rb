# typed: false
# frozen_string_literal: false

# Bringing RefactorErl, a refactoring tool for Erlang to Homebrew
class Referl < Formula
  desc "Refactoring brought to Erlang"
  homepage "https://plc.inf.elte.hu/erlang/index.html"
  url "https://plc.inf.elte.hu/erlang/dl/refactorerl-0.9.20.08_v2.zip"
  version "0.9.20.08"
  sha256 "52f0778c42f7c48490f93b07a435cb3f8c3573810765b6255145e6972edc0cea"
  license "LGPL-3.0-only" # SPDX Representation for: GNU Lesser General Public License v3.0 only

  depends_on "erlang"
  depends_on "gcc" => "4.9"
  depends_on "graphviz" => "2.0"
  depends_on "yaws" => "1.89"

  def install
    # Variables
    runner_script = "referl_exec"

    # Yaws detect
    yaws_version = `yaws --version`.split[-1]
    yaws_path = "#{String.new(HOMEBREW_PREFIX)}/Cellar/yaws/#{yaws_version}/lib/yaws-#{yaws_version}/ebin"
    ohai "Looking for YAWS path on: #{yaws_path}"
    if File.directory?(yaws_path)
      ohai "Yaws found!"
    else
      odie("Error! - yaws path not found, you may need to install one manually")
    end

    # Creating exec script
    out_file = File.new("bin/" + runner_script, "w")
    out_file.puts("#\!\/bin\/bash")
    out_file.puts(String.new(HOMEBREW_PREFIX) + "/Cellar/referl/"+version+"/bin/referl_boot -base " + String.new(HOMEBREW_PREFIX) + "/Cellar/referl/"+version+"/ $@")
    out_file.close

    # Installing referl
    system "bin/referl", "-build", "tool", "-yaws_path", yaws_path

    # Getting install paths, and excluding the 'referl' start and 'referl_exec' exec script
    install_paths = []
    Dir["bin/*"].each { |x| install_paths.push(String.new(x)) }
    install_paths.delete("bin/referl")
    install_paths.delete("bin/"+runner_script)

    # Installing binaries
    bin.install install_paths
    bin.install "bin/referl" => "referl_boot" # Rename referl to avoid conflicts with symlink
    lib.install Dir["lib/*"] 
    prefix.install "refactorerl.boot"
    prefix.install "sys.config"

    bin.install "bin/"+runner_script => "referl" # Symlink will be pointed to this script, due to rename
    
  end

  test do
    assert_true(false)
    # ########### Test will come later ############
    # Főbb esetek: elindul, args, -yaws, -db, -name, doksiban több
  end
end
