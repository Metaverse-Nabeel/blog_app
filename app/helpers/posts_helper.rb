module PostsHelper
    def render_text_section(post)
      content_tag(:div, class: 'text') do
      concat content_tag(:p, "Comments: #{post.CommentsCounter.nil? ? 0 : post.CommentsCounter}",
                         class: 'comment-text')
      concat content_tag(:p, "Likes: #{post.LikesCounter.nil? ? 0 : post.LikesCounter}")
    end
    end

  def render_comments_section(post)
    content_tag(:ul, class: 'ul-comments-box') do
      concat content_tag(:h4, 'Section for Comments:', class: 'section-comments')

      if post.comments.blank?
        concat content_tag(:li, 'no comments for the moment')
      else
        post.recent_comments.each do |comment|
          concat content_tag(:li, "Username: #{comment.Text.blank? ? 'no comments for the moment' : comment.Text}")
        end
      end
    end
  end
end
