# encoding: UTF-8

include CSKit::Volumes::ScienceHealth

module CSKit
  module ScienceHealth
    class Splitter

      include Enumerable
      attr_reader :input_file

      def initialize(input_file)
        @input_file = input_file
      end

      def each
        cur_page = Page.new('vii', []) # starting page is vi (in preface)
        cur_line = nil
        cur_lines = []
        new_paragraph = true

        File.open(input_file).each_line do |line|
          if line.strip.empty?
            new_paragraph = true
          else
            if is_flyout?(line)
              cur_page.lines.last.flyout_text = line.strip
            else
              page, line, text = split_line(line)

              if page && cur_page.number != page
                yield cur_page
                cur_page = Page.new(page, [])
              end

              # this is for certain glossary entries that don't begin
              # with a newline, namely CHURCH. and ERROR.
              if text.strip =~ /\A[A-Z ]{3,}\.\s/
                new_paragraph = true
              end

              cur_page.lines << Line.new(text.rstrip, nil, new_paragraph)
              cur_line = line if line

              new_paragraph = false
            end
          end
        end

        yield cur_page, cur_lines
      end

      alias :each_page :each

      private

      def is_flyout?(line)
        # if a line has more than 14 spaces at the beginning, it's a flyout
        @flyout_spaces ||= ' ' * 14
        line[0..13] == @flyout_spaces
      end

      def split_line(line)
        page_line = line[0..7].strip.split(":")
        page_line = [nil, nil] if page_line == []
        page_line + [line[8..-1]]
      end

    end
  end
end
