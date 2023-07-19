module UsersHelper
    def render_text_user_section(_user, post)
    content_tag(:div, class: 'text') do
      concat content_tag(:p, "Comments: #{post.CommentsCounter.nil? ? 0 : post.CommentsCounter}",
                         class: 'comment-text')
      concat content_tag(:p, "Likes: #{post.LikesCounter.nil? ? 0 : post.LikesCounter}")
      end
    end
end
