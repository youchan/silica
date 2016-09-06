require 'hyalite'
#require 'menilite'

class AppView
  include Hyalite::Component
  include Hyalite::Component::ShortHand

  def render
    h2(nil, 'Welcome!!!')
  end
end
Hyalite.render(Hyalite.create_element(AppView), $document['.content'])
