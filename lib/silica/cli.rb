require 'thor'
require 'fileutils'
require 'git'

module Silica
  class Cli < Thor
    desc 'new', 'create new project'

    def new(name)
      puts "Create new project '#{name}'"

      FileUtils.mkdir name
      dir = Dir.new(__dir__+'/../../template/project')
      dir.each do |file|
        FileUtils.cp_r(dir.path + '/' + file, name)
      end

      FileUtils.cd name

      Git.init
    end
  end
end
