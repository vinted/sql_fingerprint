# frozen_string_literal: true

module SqlFingerprint
  class AbstractQuery
    class << self
      def build(query)
        query = query.downcase.chomp
        query = remove_comments(query)
        query = remove_quotes(query)
        query = remove_constants(query)
        query = remove_double_spaces(query)
        query = remove_newlines(query)
        query = remove_in_values(query)
        query = remove_offsets(query)
        query.strip
      end

      private

      def remove_comments(query)
        query
          .gsub(/(?:--|#)[^'"\r\n]*(?=[\r\n]|\Z)/, ' ')
          .gsub(%r{/\*[^!].*?\*/}m, ' ')
      end

      def remove_newlines(query)
        query.gsub(/\r\n?/, ' ')
      end

      def remove_double_spaces(query)
        query.gsub(/\s+/, ' ')
      end

      def remove_quotes(query)
        query.gsub(/\\["']/, '')
      end

      def remove_constants(query)
        query
          .gsub(/".*?"/, '?')
          .gsub(/'.*?'/, '?')
          .gsub(/\bfalse\b|\btrue\b/, '?')
          .gsub(/[0-9+-][0-9a-f.xb+-]*/, '?')
          .gsub(/\b[0-9+-][0-9a-f.xb+-]*/, '?')
          .gsub(/\bnull\b/, '?')
      end

      def remove_in_values(query)
        query.gsub(/\b(in|values?)(?:[\s,]*\([\s?,]*\))+/, '\1(?+)')
      end

      def remove_offsets(query)
        query.gsub(/\blimit \?(?:, ?\?| offset \?)?/, 'limit ?')
      end
    end
  end
end
