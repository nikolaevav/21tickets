class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def title(page_title)
    content_for(:title) { page_title }
  end

  def keywords(page_keywords)
    content_for(:keywords) { page_keywords }
  end

  def description(page_description)
    content_for(:description) { page_description }
  end

  def author(page_author)
    content_for(:author) { page_author }
  end

  def preview(page_preview)
    content_for(:preview) { page_preview }
  end

  def yield_or_default(section, default = '')
    content_for?(section) ? content_for(section) : default
  end
end
