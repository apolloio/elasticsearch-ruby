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
          # @option arguments [String] :datafeed_id The ID of the datafeed to start
          # @option arguments [String] :start The start time from where the datafeed should begin
          # @option arguments [String] :end The end time when the datafeed should stop. When not set, the datafeed continues in real time
          # @option arguments [Time] :timeout Controls the time to wait until a datafeed has started. Default to 20 seconds

          # @option arguments [Hash] :body The start datafeed parameters
          #
          # @see http://www.elastic.co/guide/en/elasticsearch/reference/current/ml-start-datafeed.html
          #
          def start_datafeed(arguments = {})
            raise ArgumentError, "Required argument 'datafeed_id' missing" unless arguments[:datafeed_id]

            arguments = arguments.clone

            _datafeed_id = arguments.delete(:datafeed_id)

            method = Elasticsearch::API::HTTP_POST
            path   = "_ml/datafeeds/#{Elasticsearch::API::Utils.__listify(_datafeed_id)}/_start"
            params = Elasticsearch::API::Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

            body = arguments[:body]
            perform_request(method, path, params, body).body
          end

          # Register this action with its valid params when the module is loaded.
          #
          # @since 6.2.0
          ParamsRegistry.register(:start_datafeed, [
            :start,
            :end,
            :timeout
          ].freeze)
      end
    end
    end
  end
end
