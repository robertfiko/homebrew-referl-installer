# typed: false
# frozen_string_literal: false

# Refactoring software for Erlang language by ELTE and Ericson
class Referl < Formula
  desc "Refactoring software for Erlang language by ELTE and Ericson"
  homepage "https://plc.inf.elte.hu/erlang/index.html"
  url "http://plc.inf.elte.hu/erlang/dl/fixes24.zip"
  version "0.9.20.24"
  sha256 "25789ae7cbff8749e8537c8984530905e9de58a2e75b499d51c42111cf822814"
  license "LGPL-3.0-only" # SPDX Representation for: GNU Lesser General Public License v3.0 only

  depends_on "erlang"
  depends_on "gcc" => "4.9.1"
  depends_on "graphviz" => "2.47.1"
  depends_on "yaws" => "2.0.9"

  # Creating exec script
  def create_exec_script
    out_file = File.new("bin/#{runner_script}", "w")
    out_file.puts("#\!\/bin\/bash")
    out_file.puts("#{String.new(HOMEBREW_PREFIX)}/Cellar/referl/+#{version}/bin/referl_boot -base #{String.new(HOMEBREW_PREFIX)}/Cellar/referl/#{version}/ $@")
    out_file.close
  end

  def yaws_detect
    yaws_version = `yaws --version`.split[-1]
    yaws_path = "#{String.new(HOMEBREW_PREFIX)}/Cellar/yaws/#{yaws_version}/lib/yaws-#{yaws_version}/ebin"
    ohai "Looking for YAWS path on: #{yaws_path}"
    if File.directory?(yaws_path)
      ohai "Yaws found!"
    else
      odie("Error! - yaws path not found, you may need to install one manually")
    end
    yaws_path
  end

  def installpaths
    install_paths = []
    Dir["bin/*"].each { |x| install_paths.push(String.new(x)) }
    install_paths.delete("bin/referl")
    install_paths.delete("bin/#{runner_script}")
    install_paths
  end

  def instal_referl
    install_paths = installpaths

    # Installing
    bin.install install_paths
    bin.install "bin/referl" => "referl_boot" # Rename referl to avoid conflicts with symlink
    lib.install Dir["lib/*"]
    prefix.install "refactorerl.boot"
    prefix.install "sys.config"

    bin.install "bin/referl_exec" => "referl" # Symlink will be pointed to this script, due to rename
  end

  def install
    yaws_path = yaws_detect
    create_exec_script

    system "bin/referl", "-build", "tool", "-yaws_path", yaws_path
    instal_referl
  end

  test do
    assert_true(false)
    # Fobb esetek: elindul, args, -yaws, -db, -name, doksiban tobb
  end
end
