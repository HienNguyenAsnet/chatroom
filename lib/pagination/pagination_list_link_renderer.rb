class PaginationListLinkRenderer < WillPaginate::ActionView::LinkRenderer

  def to_html
    links = @options[:page_links] ? windowed_links : []

    # links.push(page_link_or_span(@collection.previous_page, 'prev_page', @options[:previous_label]))
    # links.push(page_link_or_span(@collection.next_page, 'next_page', @options[:next_label]))
    links.unshift(page_link_or_span(@collection.previous_page, 'pagination-previous', 'Previous'))
    links.push(page_link_or_span(@collection.next_page, 'pagination-next', 'Next'))

    html = links.join(@options[:separator]).html_safe
    @options[:container] ? @template.content_tag(:ul, html, class: 'pagination', role: 'navigation',  "aria-label": 'Pagination') : html
  end

protected

  def windowed_links
    windowed_page_numbers.map { |n| page_link_or_span(n, (n == current_page ? 'current' : nil)) }
  end

  def page_link_or_span(page, span_class, text = nil)
    text ||= page.to_s
    if page && page != current_page
      page_link(page, text, :class => span_class)
    else
      page_span(page, text, :class => span_class)
    end
  end

  def page_link(page, text, attributes = {})
    @template.content_tag(:li, @template.link_to(text, url(page)), attributes)
  end

  def page_span(page, text, attributes = {})
    attributes[:class] = attributes[:class].to_s + ' disabled' if page.nil?

    @template.content_tag(:li, @template.content_tag(:span, text), attributes)
  end

end