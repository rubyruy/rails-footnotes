require "#{File.dirname(__FILE__)}/abstract_note"

module Footnotes
  module Notes
    class ViewNote < AbstractNote
      def initialize(controller)
        @controller = controller
        @template = controller.instance_variable_get('@template')
      end

      def self.to_sym
        :view
      end

      def row
        :edit
      end

      def title
        'View'
      end

      def link
        escape(Footnotes::Filter.prefix + template_file_name)
      end

      def valid?
        template_path && prefix? && @template.respond_to?(:finder)
      end

      protected

        def template_base_path(path)
          @template.send(:template_file_from_name,path)
        end

        def template_path
          @template.first_render
        end

        def template_file_name
          template_base_path(template_path).full_path
        end
    end
  end
end