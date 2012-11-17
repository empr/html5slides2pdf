require 'open-uri'
require 'nokogiri'
require 'html5slides2pdf/version'

class Html5slides2pdfError < StandardError; end

class Html5slides2pdf
  attr_accessor :work_dir, :output, :options

  DEFAULT_OPTIONS = [
    '--page-size A4',
    '--orientation landscape',
    '--margin-top 0',
    '--margin-left 0',
    '--margin-right 0',
    '--margin-bottom 0'
  ]

  def initialize(output='_slide.pdf', work_dir='./work', options=nil)
    @output = output
    @work_dir = work_dir
    @options = options || DEFAULT_OPTIONS
  end

  def convert(url)
    doc = Nokogiri::HTML(open(url))
    unless slide?(doc)
      raise Html5slides2pdfError, 'not html5slides'
    end
    Dir.mkdir(@work_dir) unless File.exists?(@work_dir)
    htmls = make_html_per_page(doc)
    make_pdf(doc, htmls)
  end

  def slide?(doc)
    section_tag = doc.at('section')
    article_tag = doc.at('article')
    slides_js = doc.search('script').any? {|e|
      e[:src] && File.basename(e[:src]) == 'slides.js'
    }
    (section_tag && article_tag && slides_js) ? true : false
  end

  def make_html_per_page(doc)
    files = []
    doc.search('article').each_with_index {|article, i|
      html = template % {:article => article}
      filename = '%s/%s.html' % [@work_dir, i]
      open(filename, 'w') {|f| f.write(html) }
      files << filename
    }
    files
  end

  def template
    css = load_css.gsub(/%/, '%%')
    <<-EOS
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<style>
#{css}
</style>
</head>
<body>
%<article>s
</body>
</html>
    EOS
  end

  def load_css
    path = File.join(File.dirname(File.expand_path(__FILE__)), 'styles.css')
    File.readlines(path).reject {|line|
      line.index('letter-spacing')
    }.join
  end

  def make_pdf(doc, htmls)
    cmd = 'wkhtmltopdf %s %s %s' % [@options.join(' '),
                                    htmls.join(' '),
                                    @output]
    system cmd
  end
end

