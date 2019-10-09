class WebpackInstaller
  def initialize
    require "erb"
    require "thor"
    require "oj"
    require "opal-webpack-loader"
    require "opal-webpack-loader/installer_cli"
  end

  def install
    OpalWebpackLoader::Installer::CLI.start(["flat"])
  end
end
