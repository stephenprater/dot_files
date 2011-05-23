require 'irb/completion'
require 'irb/ext/save-history'

require 'wirble'
require 'hirb'
require 'bond'
require 'what_methods'
require 'interactive_editor'

Wirble.init
Wirble.colorize

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:AUTO_IDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:PROMPT_MODE] = :DEFAULT

def pc x
  x.each_with_index.inject("") { |memo,(e,i)| memo << "#{'%03d' % i}:#{e}\n"; memo}
end

$: << '.'
$: << './lib'
