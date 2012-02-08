require 'rubygems' rescue nil

require 'wirble'
require 'hirb'
require 'ap'


# load wirble
Wirble.init
Wirble.colorize

colors = Wirble::Colorize.colors.merge({
  :object_class => :purple,
  :symbol => :purple,
  :symbol_prefix => :purple
})
Wirble::Colorize.colors = colors

# load hirb
Hirb::View.enable

IRB.conf[:AUTO_INDENT] = true

# load railsrc if it exists
railsrc_path = File.expand_path('~/.railsrc')
if (ENV['RAILS_ENV'] || defined? Rails) && File.exist?(railsrc_path)
  begin
    load railsrc_path
    puts "> ~/.railsrc loaded <"
  rescue Exception
    warn "Could not load: #{ railsrc_path }" # because of $!.message
  end
end

puts "> all systems are go wirble/hirb/ap/sql/routes <"