require 'rubygems'
require 'wirble'
require 'awesome_print'
require 'hirb'
require 'bond'
require 'what_methods'
require 'interactive_editor'

Wirble.init
Wirble.colorize

def ls
  %x{ls}.split "\n"
end

def reload(filename)
  $".delete(filename+".rb")
  require(filename)
end

def cls
  $stdout << `clear`
end

def eod
  $stdout << `tput ed`
end

$: << Dir.pwd
$: << Dir.pwd.rstrip + '/lib'


IRB.conf[:PROMPT_MODE] = :DEFAULT

Bond.start

if defined? Rails 
  IRB.conf[:IRB_RC] = Proc.new do
    logger = Logger.new(STDOUT)
    ActiveRecord::Base.logger = logger
    ActiveResource::Base.logger = logger
  end
end

if IRB.version.include?('DietRB')
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
end
