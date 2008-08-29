require "#{File.dirname(__FILE__)}/view_note"

module Footnotes
  module Notes
    class LayoutNote < ViewNote
      def self.to_sym
        :layout
      end

      def title
        'Layout'
      end

      def link
        escape(Footnotes::Filter.prefix + layout_file_name)
      end

      def valid?
        @controller.active_layout && prefix?
      end

      protected
        def layout_file_name
          template_base_path(@controller.active_layout).full_path
        end
    end
  end
end