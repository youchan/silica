require "thor"
require "fileutils"
require "git"
require_relative "webpack_installer"

module Silica
  class Cli < Thor
    option :webpack, type: :boolean
    desc 'new', 'create new project'

    def new(name)
      puts "Creating new project '#{name}'"

      Dir.exist?(name) or FileUtils.mkdir_p(name)

      template_dir = Dir.new(__dir__+'/../../template/project')

      Dir.chdir(name) do |name|
        if options[:webpack]
          WebpackInstaller.new.install
        end
        template_dir.each do |file|
          next if file == '..'
          puts "Creating #{file}"
          FileUtils.cp_r(template_dir.path + "/" + file, ".")
        end
        Git.init
      end

      puts "Project '#{name}' created"
    end
  end
end
