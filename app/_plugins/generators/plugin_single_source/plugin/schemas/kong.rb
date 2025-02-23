# frozen_string_literal: true

require 'json'

module PluginSingleSource
  module Plugin
    module Schemas
      class Kong < Base
        SCHEMAS_PATH = 'app/_src/.repos/kong-plugins/schemas/'

        def file_path
          @file_path ||= File.join(
            SCHEMAS_PATH,
            plugin_folder,
            "#{release_version}.json"
          )
        end

        def release_version
          version.split('.').first(2).join('.').concat('.x')
        end

        private

        def plugin_folder
          if plugin_name == 'serverless-functions'
            'pre-function'
          else
            plugin_name
          end
        end
      end
    end
  end
end
