# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module XPack
    module API
      module MachineLearning
        module Actions
          # TODO: Description

          #
          # @option arguments [Boolean] :enabled Whether to enable upgrade_mode ML setting or not. Defaults to false.
          # @option arguments [Time] :timeout Controls the time to wait before action times out. Defaults to 30 seconds

          #
          # @see http://www.elastic.co/guide/en/elasticsearch/reference/current/ml-set-upgrade-mode.html
          #
          def set_upgrade_mode(arguments = {})
            arguments = arguments.clone

            method = Elasticsearch::API::HTTP_POST
            path   = "_ml/set_upgrade_mode"
            params = Elasticsearch::API::Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

            body = nil
            perform_request(method, path, params, body).body
          end

          # Register this action with its valid params when the module is loaded.
          #
          # @since 6.2.0
          ParamsRegistry.register(:set_upgrade_mode, [
            :enabled,
            :timeout
          ].freeze)
      end
    end
    end
  end
end
