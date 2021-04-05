RUBY_WEBSITE = 'https://rubygems.org/gems/'.freeze

MENU = [
  'Install this Gem',
  'Uninstall this Gem',
  'Read ri documentation if available',
  'go to this Gem website'
].freeze

next_gem = "\nh to go the next gem"
previous_gem = "\nl to go to the previous gem"
table = "\nt to view the results in table form again"
quit = "\nq to exit the program"
search = "\ns to search again"
MENU_FOOTER_OPTIONS = "Enter#{next_gem}#{previous_gem}#{table}#{quit}#{search}".freeze
