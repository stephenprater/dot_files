require 'rubygems'
require 'wirble'
require 'irb/completion'

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
