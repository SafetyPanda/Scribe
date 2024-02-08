#Customization for Scribe

##
# Colorization, without colorization gem
##
class String
  # TODO change this to 'information' 'error' 'success' instead of colors
  def error;            "\e[31m#{self}\e[0m" end
  def success;          "\e[32m#{self}\e[0m" end
  def info;             "\e[34m#{self}\e[0m" end
  def prompt;           "\e[36m#{self}\e[0m" end
  def bold;             "\e[1m#{self}\e[22m" end
end
