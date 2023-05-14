#Customization for Scribe

##
# Colorization, without colorization gem
##
class String
  # TODO change this to 'information' 'error' 'success' instead of colors
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
  def blue;           "\e[34m#{self}\e[0m" end
  def magenta;        "\e[35m#{self}\e[0m" end
  def cyan;           "\e[36m#{self}\e[0m" end
  def bold;           "\e[1m#{self}\e[22m" end
  def blink;          "\e[5m#{self}\e[25m" end
end
