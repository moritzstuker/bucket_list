# frozen_string_literal: true

require 'application_system_test_case'

class IdeaCommentsTest < ApplicationSystemTestCase
  test 'adding a Comment to an Idea' do
    idea = Idea.new title: 'Commented idea'
    idea.save
    visit(idea_path(idea))
    fill_in('Add a comment', with: 'This idea has been commented')
    click_on('Post', match: :first)
    assert_equal idea_path(idea), page.current_path
  end
end
